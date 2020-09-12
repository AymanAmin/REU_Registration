using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.Reports
{
    public partial class StudentsInformation : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        List<Student> list_Student = new List<Student>();
        List<Status> Status_List = new List<Status>();
        List<Nationality> Nationality_List = new List<Nationality>();
        List<Student_Type> Student_Type_List = new List<Student_Type>();
        List<Specialization> Specialization_List = new List<Specialization>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            Status_List = db.Status.ToList();
            Nationality_List = db.Nationalities.ToList();
            Student_Type_List = db.Student_Type.ToList();
            Specialization_List = db.Specializations.ToList();

            db.Configuration.LazyLoadingEnabled = false;

            list_Student = db.Students.Where(x => x.Suspended != 1).ToList();
            loadData(list_Student);
        }

        public void loadData(List<Student> StudentsList)
        {
            try
            {
                string str = string.Empty;
                for (int i = 0; i < StudentsList.Count; i++)
                {
                    str = "<tr>";

                    str += "<td class='text-left'>#" + StudentsList[i].Student_Id + "</td>";
                    str += "<td class='text-left'>" + StudentsList[i].Student_SSN + "</td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + StudentsList[i].Student_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + StudentsList[i].Student_Name_En + "</td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + StudentsList[i].Nationality.Country_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + StudentsList[i].Nationality.Country_Name_En + "</td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + StudentsList[i].Specialization.Specialization_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + StudentsList[i].Specialization.Specialization_Name_En + "</td>";

                    if (StudentsList[i].Student_Specialization_2_Id !=null && SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + StudentsList[i].Specialization1.Specialization_Name_Ar + "</td>";
                    else if (StudentsList[i].Student_Specialization_2_Id != null)
                        str += "<td class='text-left'>" + StudentsList[i].Specialization1.Specialization_Name_En + "</td>";
                    else str += "<td class='text-left'>  -  </td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + StudentsList[i].Student_Type.Student_Type_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + StudentsList[i].Student_Type.Student_Type_Name_En + "</td>";

                    str += "<td class='text-left'>" + StudentsList[i].Student_Phone + "</td>";
                    str += "<td class='text-left'>" + StudentsList[i].Student_Email + "</td>";

                    str += "<td class='text-left'>" + StudentsList[i].Student_Address + "</td>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + StudentsList[i].Status.Status_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + StudentsList[i].Status.Status_Name_En + "</td>";

                    str += "<td class='text-left'>" + StudentsList[i].Student_High_School_Degree + "</td>";
                    str += "<td class='text-left'>" + StudentsList[i].Student_Capabilities_Degree + "</td>";
                    str += "<td class='text-left'>" + StudentsList[i].Student_My_Achievement_Degree + "</td>";
                    str += "<td class='text-left'>" + Total_Calc(StudentsList[i]) + "</td>";
                    str += "<td class='text-left'>" + StudentsList[i].Student_CreationDate + "</td>";

                    str += "</tr>";
                    txtStudentListData.Controls.Add(new LiteralControl(str));
                }
                txtStudentsList.Text = "";// str;
            }
            catch { Response.Redirect("~/"); }


        }


        public string Total_Calc(Student std)
        {
            string total = string.Empty;
            try
            {
                //High School
                double High_School_Percent = double.Parse(std.Specialization.High_School_Percent);
                double High_School = (double.Parse(std.Student_High_School_Degree) * High_School_Percent) / 100;

                //Capabilities
                double Capabilities_Percent = double.Parse(std.Specialization.Capabilities_Percent);
                double Capabilities = (double.Parse(std.Student_Capabilities_Degree) * Capabilities_Percent) / 100;

                //My_Achievement
                double My_Achievement_Percent = double.Parse(std.Specialization.My_Achievement_Percent);
                double My_Achievement = (double.Parse(std.Student_My_Achievement_Degree) * My_Achievement_Percent) / 100;

                //Total Calc
                string Total = (High_School + Capabilities + My_Achievement).ToString();

                int str_index = (std.Student_Total.ToString()).IndexOf('.');
                if (str_index != -1)
                    Total = (Total).Substring(0, str_index + 2) + "%";
                else
                {
                    str_index = (Total).IndexOf(',');
                    if (str_index != -1)
                        Total = (Total).Substring(0, str_index + 2) + "%";
                    else
                        Total = Total + "%";
                }

                total = Total;
            }
            catch
            {
                int str_index = (std.Student_Total.ToString()).IndexOf('.');
                if (str_index != -1)
                    total = (std.Student_Total.ToString()).Substring(0, str_index + 2) + "%";
                else
                {
                    str_index = (std.Student_Total.ToString()).IndexOf(',');
                    if (str_index != -1)
                        total = (std.Student_Total.ToString()).Substring(0, str_index + 2) + "%";
                    else
                        total = std.Student_Total + "%";
                }
            }


                return total;
        }
    }
}