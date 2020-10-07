using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission
{
    public partial class Default : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        List<Student> StudentList = new List<Student>();
        List<Sequence> SequenceList = new List<Sequence>();

        DateTime DateToday = DateTime.Parse("10/3/2020");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            StudentList = db.Students.Where(x => x.Suspended != 1 && x.Student_CreationDate >= DateToday).ToList();
            SequenceList = db.Sequences.ToList();
            Treatment_Status();
            lineChart();
        }
        private void Treatment_Status()
        {
            txtAllStudents.Text = StudentList.Count().ToString();
            txtInProgress.Text = StudentList.Where(x => x.Student_Status_Id < 14 || x.Student_Status_Id > 15).Count().ToString();
            txtSuccessfully.Text = StudentList.Where(x => x.Student_Status_Id == 14).Count().ToString();
            txtFailure.Text = StudentList.Where(x => x.Student_Status_Id == 15).Count().ToString();
            string str = FieldNames.getFieldName("Default-Update", "Update") + " : ";

            txtLastUpdateOne.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateTwo.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateThree.Text = str + DateTime.Now.ToShortTimeString();
            txtLastUpdateFour.Text = str + DateTime.Now.ToShortTimeString();
        }

        private void lineChart()
        {
            //string Status = "[";
            string StatusPie = "[";
            string Data = "[";
            //string AvgDelay = "[";

            // Replace Status_Color with delay until new step & Status_Icon with counter
            List<Status> StatusList = db.Status.ToList();
            for (int i = 0; i < StatusList.Count; i++)
            {
                StatusList[i].Status_Color = "0";
                StatusList[i].Status_Icon = "0";
            }

            List<Sequence> list_sequence = db.Sequences.Where(x => x.DateCreation >= DateToday).ToList();
            DateTime date_two = DateTime.Now;
            int student_id = 0;
            for (int i = 0; i < list_sequence.Count; i++)
            {
                Student std = list_sequence[i].Student;
                if (std.Suspended == 1)
                    continue;

                int trackEception = 0,index =0;
                try
                {
                    DateTime date_one = (DateTime)list_sequence[i].DateCreation;

                    //Check if he go to next step and then get the date... if he isn't the set Datetime.Now
                    int current_Id = list_sequence[i].Sequence_Id;
                    student_id = (int)list_sequence[i].Student_Id;
                    List<Sequence> nextDate = list_sequence.Where(x => x.Student_Id == student_id && x.Sequence_Id > current_Id).ToList();
                    if (nextDate.Count > 0)
                        date_two = (DateTime)nextDate[0].DateCreation;
                    else
                        date_two = DateTime.Now;

                    int status_id = (int)list_sequence[i].Status_Id;

                    // find the index
                    index = StatusList.FindIndex(x => x.Status_Id == status_id);
                    // Set the delay in Status_Color 
                    trackEception = 1;
                    string str = (double.Parse(StatusList[index].Status_Color) + (date_two - date_one).TotalHours).ToString();
                    StatusList[index].Status_Color = str;

                    //Increase counter in Status_Icon 
                    trackEception = 2;
                    str = (int.Parse(StatusList[index].Status_Icon) + 1).ToString();
                    StatusList[index].Status_Icon = str;
                }
                catch {
                    if(trackEception == 1)
                    {
                        StatusList[index].Status_Color = StatusList[index].Status_Color;
                        StatusList[index].Status_Icon = (int.Parse(StatusList[index].Status_Icon) + 1).ToString();
                    } else if(trackEception == 2)
                        StatusList[index].Status_Icon = (int.Parse(StatusList[index].Status_Icon) + 1).ToString();
                }
            }
            List<string> DelayList = new List<string>();
            for (int i = 0; i < StatusList.Count; i++)
            {
                try
                {
                    List<Student> students = StatusList[i].Students.ToList();
                    double delay = 0;
                    if (double.Parse(StatusList[i].Status_Icon) != 0)
                        delay = double.Parse(StatusList[i].Status_Color) / double.Parse(StatusList[i].Status_Icon);

                    if (students.Count != 0)
                    {
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            StatusPie += "' " + StatusList[i].Status_Name_Ar + " '";
                        else
                            StatusPie += "'" + StatusList[i].Status_Name_En + "'";

                        Data += students.Count.ToString();
                    }
                    DelayList.Add(delay.ToString());

                    if (i < StatusList.Count - 1)
                    {
                        if (students.Count != 0)
                        {
                            StatusPie += ",";
                            Data += ",";
                        }
                    }
                }
                catch { }
            }
            StatusPie += "]";
            Data += "]";
            List<Status> statuslist = db.Status.ToList();
            string DelayStatus = "[";
            string DelayData = "[";
            for (int i = 0; i < statuslist.Count; i++)
            {
                if (statuslist[i].Status_Code == 14 || statuslist[i].Status_Code == 15)
                    continue;

                if (SessionWrapper.LoggedUser.Language_id == 1)
                    DelayStatus += "' " + statuslist[i].Status_Name_Ar + " '";
                else
                    DelayStatus += "'" + statuslist[i].Status_Name_En + "'";

                double dalay = double.Parse(DelayList[i]);
                    DelayData += ((int)dalay).ToString();

                if (i < statuslist.Count - 1)
                {
                    DelayStatus += ",";
                    DelayData += ",";
                }
            }
            DelayStatus += "]";
            DelayData += "]";
            string Pie_Function = "Pie_Chart(" + Data + "," + StatusPie + ");";
            /* Pie Chart */
            string lineChartfun = "lineChart(" + DelayData + "," + DelayStatus + ");";

            /******************************/
            /* Request Per day Chart */
            /******************************/
            string date_str = DateTime.Now.ToShortDateString();
            DateTime date_today = DateTime.Parse(date_str);
            date_today = date_today.AddMinutes(-1);
            //int day = date_today.Day;
            //date_today = date_today.AddDays(-day + 1);
            List<DateTime> DateList = new List<DateTime>();
            for (int i = 0; i < 15; i++)
            {
                DateList.Add(date_today);
                date_today = date_today.AddDays(-1);
            }

            string Total = "[";
            string categories = "[";

            for (int i = DateList.Count - 1; i >= 0; i--)
            {
                Total += StudentList.Where(x => x.Student_CreationDate > DateList[i] && x.Student_CreationDate <= DateList[i].AddDays(1)).Count().ToString();

                string mounth = DateList[i].ToString("MMM", CultureInfo.InvariantCulture);

                if (SessionWrapper.LoggedUser.Language_id == 1)
                    mounth =  ArabicDate(mounth);

                categories += "'"+(DateList[i].Day + 1) + " / " + mounth + "'";
                if (i > 0)
                {
                    Total += ",";
                    categories += ",";
                }
            }
            Total += "]";
            categories += "]";
            string Treatment_Per_Mounth_Function = "Pie_ChartColumn(" + Total + "," + categories + ");";
            /* End Treatment Per mounth Chart */

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", Pie_Function + " " + lineChartfun + " " + Treatment_Per_Mounth_Function + " "+ SocialChart(), true);
        }

        public string SocialChart()
        {
            string Labels = "[";
            string Data = "[";
            List<Resource> List_Resource = db.Resources.ToList();

            for (int i = 0; i < List_Resource.Count; i++)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Labels += "' " + List_Resource[i].Resource_Name_Ar + " '";
                else
                    Labels += "'" + List_Resource[i].Resource_Name_En + "'";
                Data += List_Resource[i].Students.Count;
                if (i < List_Resource.Count - 1)
                {
                    Labels += ",";
                    Data += ",";
                }
            }
            Labels += "]";
            Data += "]";

            string PieChartSocial = "PieChartSocial(" + Labels + "," + Data + ");";

            return PieChartSocial;
        }



        private string ArabicDate(string DateName)
        {
            if (DateName == "Jan")
                DateName = "يناير";
            else if (DateName == "Feb")
                DateName = "فبراير";
            else if (DateName == "Mar")
                DateName = "مارس";
            else if (DateName == "Apr")
                DateName = "ابريل";
            else if (DateName == "May")
                DateName = "مايو";
            else if (DateName == "Jun")
                DateName = "يونيو";
            else if (DateName == "Jul")
                DateName = "يوليو";
            else if (DateName == "Aug")
                DateName = "أغسطس";
            else if (DateName == "Sep")
                DateName = "سبتمبر";
            else if (DateName == "Oct")
                DateName = "اكتوبر";
            else if (DateName == "Nov")
                DateName = "نوفمبر";
            else if (DateName == "Dec")
                DateName = "ديسمبر";

            return DateName;
        }
    }
}