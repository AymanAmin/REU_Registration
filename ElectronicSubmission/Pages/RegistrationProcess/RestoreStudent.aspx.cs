using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class RestoreStudent : System.Web.UI.Page
    {
        List<Student> ListAllStudent = new List<Student>();
        List<Student> ListStudentWithStatus = new List<Student>();
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "#43b791" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if(SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (!IsPostBack)
            {
                int GroupID = (int)SessionWrapper.LoggedUser.Group_Id;

                List<Group_Status> List_Status = db.Group_Status.Where(x => x.Group_Id == GroupID && x.Status_Id != 3 && x.Status_Id != 4).ToList();

                for (int i = 0; i < List_Status.Count; i++)
                {
                    List<Student> Temp_List = List_Status[i].Status.Students.Where(x => x.Suspended == 1).ToList();
                    ListStudentWithStatus.AddRange(Temp_List);
                }
                List<Student> TempList3 = db.Students.Where(x => x.Student_Employee_Id == SessionWrapper.LoggedUser.Employee_Id && x.Suspended == 1).ToList();
                ListAllStudent = ListStudentWithStatus.Union(TempList3).ToList();
                ListAllStudent = ListAllStudent.OrderByDescending(x => x.Student_CreationDate).Distinct().ToList();

            }
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

                    str += "<tr>";
                    str += "<td class='txt-primary text-left'>" + FieldNames.getFieldName("ListView-Expand", "Expand") + "</td>";
                    str += "<td class='text-left'>";
                    //str += "<a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";
                    //str += "<a href= '../../../../Pages/RegistrationProcess/StudentInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-ui-edit h5'></i>&nbsp;&nbsp;</a>";
                    str += "<a href='#' data-href= '../../../../Pages/RegistrationProcess/DeleteStudent.ashx?StudentID=" + ListAllStudent[i].Student_Id + "' data-toggle='modal' data-target='#confirm-delete'  style='color:red;'>&nbsp;&nbsp; <i class='icofont icofont-recycle-alt h5'></i>&nbsp;&nbsp;</a></td>";
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
                    str += "<td class='text-left'>" + ListAllStudent[i].Student_CreationDate.ToString() + "</td>";
                    str += "</tr>";


                }
                txtStudentList.Text = str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }
    }
}