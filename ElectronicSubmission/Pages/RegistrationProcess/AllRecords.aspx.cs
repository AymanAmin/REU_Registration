using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class AllRecords : System.Web.UI.Page
    {
        List<Student> ListAllStudent = new List<Student>();
        List<Sequence> ListSequence = new List<Sequence>();
        List<Student> std_List = new List<Student>();
        List<Status> Status_List = new List<Status>();
        List<Employee> Emp_List = new List<Employee>();
        List<Nationality> Nationality_List = new List<Nationality>();

        DateTime DateToday = DateTime.Parse("10/3/2020");
        bool IsNew = true;

        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "#43b791" };
        bool callcenter_emp = false, Assigned_Flag = false,Supervisor_emp=false;

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
                startLoad();
            }

        }
        private void startLoad()
        {
            if (Session["IsNew"] != null)
            {
                IsNew = (bool)Session["IsNew"];
                New.Checked = IsNew;
                Old.Checked = !IsNew;
            }

            int GroupID = (int)SessionWrapper.LoggedUser.Group_Id;
            List<Group_Status> List_Status = db.Group_Status.Where(x => x.Group_Id == GroupID).ToList();
            Group_Status Assigned = List_Status.Where(x => x.Status_Id == 3).FirstOrDefault();
            Group_Status New_Pending = List_Status.Where(x => x.Status_Id == 1 || x.Status_Id == 2).FirstOrDefault();

            if (Assigned != null)
            {
                Assigned_Flag = true;
                if (New_Pending == null)
                    callcenter_emp = true;
            }

            if (New_Pending == null)
                Supervisor_emp = true;

            // Set TempList3 into ListAllStudent
            if(IsNew)
                ListAllStudent = std_List.Where(x => x.Student_CreationDate >= DateToday).ToList();
            else
                ListAllStudent = std_List.Where(x => x.Student_CreationDate < DateToday).ToList();

            ListAllStudent = ListAllStudent.OrderByDescending(x => x.Student_CreationDate).Distinct().ToList();

            LoadStudent();
        }

        private void LoadStudent()
        {
            try
            {
                int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
                int index = 0;
                //txtAddMeeting.Text = "<a class='btn btn-success btn-round' href='#' > </a>";

                string str = string.Empty;
                for (int i = 0; i < ListAllStudent.Count; i++)
                {
                    // select the color based on status id
                    index = (int)ListAllStudent[i].Status.Status_Code - 1;
                    if (index >= Color.Length)
                        index = 1;

                    str = "<tr>";
                    str += "<td class='txt-primary text-left'>" + FieldNames.getFieldName("ListView-Expand", "Expand") + "</td>";
                    str += "<td class='text-left'>";
                    str += "<a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";
                    str += "<a href= '../../../../Pages/RegistrationProcess/OtherInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:orange;'>&nbsp;&nbsp; <i class='icofont icofont-ui-message h5'></i>&nbsp;&nbsp;</a>";
                    //str += "<a href= '../../../../Pages/RegistrationProcess/DeleteStudent.ashx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:red;'>&nbsp;&nbsp; <i class='icofont icofont-recycle-alt h5'></i>&nbsp;&nbsp;</a>";
                    if (Assigned_Flag)
                        str += "<a href='../../../../Pages/RegistrationProcess/StudentInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "'  style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-ui-edit h5'></i>&nbsp;&nbsp;</a>";

                    str += "</td>";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        str += "<td class='text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_Ar + "</label></td>";
                        if (ListAllStudent[i].Student_Employee_Id != null) str += "<td>" + ListAllStudent[i].Employee.Employee_Name_Ar + "</td>"; else str += "<td> - </td>";
                    }
                    else
                    {
                        str += "<td class='text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_En + "</label></td>";
                        if (ListAllStudent[i].Student_Employee_Id != null) str += "<td>" + ListAllStudent[i].Employee.Employee_Name_En + "</td>"; else str += "<td> - </td>";
                    }


                    str += "<td class='text-left'>" + ListAllStudent[i].Student_Name_En + "</td>";
                    str += "<td class='text-left'>" + ListAllStudent[i].Student_Name_Ar + "</td>";
                    str += "<td class='text-left'>" + ListAllStudent[i].Student_Phone + "</td>";
                    str += "<td class='text-left'>" + ListAllStudent[i].Student_Email + "</td>";
                    str += "<td class='text-left'>" + ListAllStudent[i].Student_Address + "</td>";
                    if(SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + ListAllStudent[i].Nationality.Country_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + ListAllStudent[i].Nationality.Country_Name_En + "</td>";

                    str += "<td class='text-left'>" + ListAllStudent[i].Student_CreationDate.ToString() + "</td>";
                    str += "</tr>";

                    txtStudentListData.Controls.Add(new LiteralControl(str));
                }
                txtStudentList.Text = "";// str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }

        protected void New_CheckedChanged(object sender, EventArgs e)
        {
            Session["IsNew"] = New.Checked;
            startLoad();
        }

        protected void Old_CheckedChanged(object sender, EventArgs e)
        {
            Session["IsNew"] = New.Checked;
            startLoad();
        }
    }
}