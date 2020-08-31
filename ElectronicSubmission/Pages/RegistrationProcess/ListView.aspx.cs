using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class ListView : System.Web.UI.Page
    {
        List<Student> ListAllStudent = new List<Student>();
        List<Student> ListAllStudentStatistic = new List<Student>();
        List<Student> ListStudentWithStatus = new List<Student>();
        List<Student> ListStudentCurrent = new List<Student>();
        List<Sequence> ListSequence = new List<Sequence>();
        List<Student> std_List = new List<Student>();
        List<Status> Status_List = new List<Status>();
        List<Employee> Emp_List = new List<Employee>();
        List<Nationality> Nationality_List = new List<Nationality>();

        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "#43b791" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            db.Configuration.LazyLoadingEnabled = false;

            // Load all student Files
            std_List = db.Students.Where(x => x.Suspended != 1).ToList();

            // Load all Status
            Status_List = db.Status.ToList();

            // Load all Nationality
            Nationality_List = db.Nationalities.ToList();

            // Load all Employee
            Emp_List = db.Employees.ToList();

            if (!IsPostBack)
            {
                loadAllRecord();

                int GroupID = (int)SessionWrapper.LoggedUser.Group_Id;

                // Just for call center
                bool callcenter_emp = false;
                List<Group_Status> List_StatusL_CallCenter = db.Group_Status.Where(x => x.Group_Id == GroupID).ToList();
                Group_Status Assigned = List_StatusL_CallCenter.Where(x => x.Status_Id == 3).FirstOrDefault();
                Group_Status New_Pending = List_StatusL_CallCenter.Where(x => x.Status_Id == 1 || x.Status_Id == 2).FirstOrDefault();
                if (Assigned != null && New_Pending == null)
                    callcenter_emp = true;

                List<Group_Status> List_Status = db.Group_Status.Where(x => x.Group_Id == GroupID && x.Status_Id != 3 && x.Status_Id != 4).ToList();
                int counter = List_Status.Count;
                if (!callcenter_emp)
                    for (int i = 0; i < counter; i++)
                    {
                        List<Student> Temp_List = List_Status[i].Status.Students.Where(x => x.Suspended != 1).ToList();
                        ListStudentWithStatus.AddRange(Temp_List);
                    }

                List<Student> Student_TempList = std_List;
                for (int j = 0; j < counter; j++)
                {
                    List<Student> TempList3 = Student_TempList.Where(x => x.Student_Employee_Id == SessionWrapper.LoggedUser.Employee_Id && x.Suspended != 1 && x.Student_Status_Id == List_Status[j].Status_Id).ToList();
                    ListStudentWithStatus.AddRange(TempList3);
                }

                ListAllStudent.AddRange(ListStudentWithStatus);
                ListAllStudent = ListAllStudent.OrderByDescending(x => x.Student_CreationDate).Distinct().ToList();



                // List Sequence
                ListSequence = db.Sequences.Where(x => x.Emp_Id == SessionWrapper.LoggedUser.Employee_Id).ToList();
            }
            LoadStudent();
        }

        private void loadAllRecord()
        {
            db.Configuration.LazyLoadingEnabled = false;

            int GroupID = (int)SessionWrapper.LoggedUser.Group_Id;

            // Start if it's on his status
            List<Group_Status> List_Status = db.Group_Status.Where(x => x.Group_Id == GroupID && x.Status_Id != 3 && x.Status_Id != 4).ToList();
            for (int i = 0; i < List_Status.Count; i++)
            {
                ListStudentCurrent.AddRange(List_Status[i].Status.Students.Where(x => x.Suspended != 1).ToList());   
            }
            // Set TempList1 into ListAllStudentStatistic
            ListAllStudentStatistic.AddRange(ListStudentCurrent);
            // End if it's on his status

            // Start if he is Call cetner
            List<Student> TempList2 = std_List.Where(x => x.Student_Employee_Id == SessionWrapper.LoggedUser.Employee_Id && x.Suspended != 1).ToList();

            // Set TempList2 into ListAllStudentStatistic
            ListAllStudentStatistic.AddRange(TempList2);
            // End if he is Call cetner

            // Start if he made action on sequence table
            ListSequence = db.Sequences.Where(x => x.Emp_Id == SessionWrapper.LoggedUser.Employee_Id).ToList();
            List<Student> TempList3 = new List<Student>();
            for (int i = 0; i < ListSequence.Count; i++)
            {
                Student student = ListSequence[i].Student;
                if(student != null)
                    TempList3.Add(student);
            }
            // Set TempList3 into ListAllStudentStatistic
            ListAllStudentStatistic.AddRange(TempList3);
            // End if he made action on sequence table

            // Set Distinct ListAllStudentStatistic
            ListAllStudentStatistic = ListAllStudentStatistic.Where(x => x.Suspended != 1).Distinct().ToList();
        }

        private void LoadStudent()
        {
            try
            {
                int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
                int index = 0;
                //txtAddMeeting.Text = "<a class='btn btn-success btn-round' href='#' > </a>";


                //Start Statistic
                string total = txtFirst.Text = ListAllStudentStatistic.Count().ToString();
                string current = txtSecond.Text = ListStudentCurrent.Count.ToString(); //ListAllStudentStatistic.Count(x => x.Student_Status_Id != 14 && x.Student_Status_Id != 15).ToString();
                string approved = txtThird.Text = ListAllStudentStatistic.Where(x => x.Student_Status_Id == 14).Count().ToString();
                string rejected = txtFour.Text = ListAllStudentStatistic.Where(x => x.Student_Status_Id == 15).Count().ToString();

                txtFirstPercentage.Text = CalcPercentage(double.Parse(total), double.Parse(total)) + "%";
                txtSecondPercentage.Text = CalcPercentage(double.Parse(current), double.Parse(total)) + "%";
                txtThirdPercentage.Text = CalcPercentage(double.Parse(approved), double.Parse(total)) + "%";
                txtFourPercentage.Text = CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%";

                txtFirstPercentageCss.Text = "<div class='progress-bar bg-c-lite-green' style='width: " + CalcPercentage(double.Parse(total), double.Parse(total)) + "%'></div>";
                txtSecondPercentageCss.Text = "<div class='progress-bar bg-c-yellow' style='width: " + CalcPercentage(double.Parse(current), double.Parse(total)) + "%'></div>";
                txtThirdPercentageCss.Text = "<div class='progress-bar bg-c-green' style='width: " + CalcPercentage(double.Parse(approved), double.Parse(total)) + "%'></div>";
                txtFourPercentageCss.Text = "<div class='progress-bar bg-c-pink' style='width: " + CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%'></div>";

                //End Statistic

                string str = string.Empty;
                for (int i = 0; i < ListAllStudent.Count; i++)
                {
                    // select the color based on status id
                    index = (int)ListAllStudent[i].Status.Status_Code - 1;
                    if (index >= Color.Length)
                        index = 1;

                    str += "<tr class = 'text-left'>";
                    str += "<td class='txt-primary text-left'>" + FieldNames.getFieldName("ListView-Expand", "Expand") + "</td>";
                    str += "<td class = 'text-left'> <a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";

                    //if (ListAllStudent[i].Status.Status_Code == 4)
                    {
                        str += "<a href='../../../../Pages/RegistrationProcess/StudentInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "'  style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-ui-edit h5'></i>&nbsp;&nbsp;</a>";

                    }

                    str += "<a href='#' data-href= '../../../../Pages/RegistrationProcess/DeleteStudent.ashx?StudentID=" + ListAllStudent[i].Student_Id + "' data-toggle='modal' data-target='#confirm-delete' style='color:red;'>&nbsp;&nbsp; <i class='icofont icofont-ui-delete h5'></i>&nbsp;&nbsp;</a>";
                    str += "<a href= '../../../../Pages/RegistrationProcess/OtherInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-ui-message h5'></i>&nbsp;&nbsp;</a></td>";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        str += "<td class = 'text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_Ar + "</label></td>";
                        if (ListAllStudent[i].Student_Employee_Id != null) str += "<td>" + ListAllStudent[i].Employee.Employee_Name_Ar + "</td>"; else str += "<td> - </td>";
                    }
                    else
                    {
                        str += "<td class = 'text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_En + "</label></td>";
                        if (ListAllStudent[i].Student_Employee_Id != null) str += "<td>" + ListAllStudent[i].Employee.Employee_Name_En + "</td>"; else str += "<td> - </td>";
                    }


                    str += "<td class = 'text-left'>" + ListAllStudent[i].Student_Name_En + "</td>";
                    str += "<td class = 'text-left'>" + ListAllStudent[i].Student_Name_Ar + "</td>";
                    str += "<td class = 'text-left'>" + ListAllStudent[i].Student_Phone + "</td>";
                    str += "<td class = 'text-left'>" + ListAllStudent[i].Student_Email + "</td>";
                    str += "<td class = 'text-left'>" + ListAllStudent[i].Student_Address + "</td>";
                    str += "<td class = 'text-left'>" + ListAllStudent[i].Student_CreationDate.ToString() + "</td>";
                    str += "</tr>";


                }
                txtStudentList.Text = str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }

       
        private double CalcPercentage(double sub, double Total)
            {
            double result = 0;
            result = (sub / Total) * 100;
            return Math.Round(result, 1);
            }
    }
}