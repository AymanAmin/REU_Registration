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
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "#43b791" };
        bool callcenter_emp = false, Assigned_Flag = false,Supervisor_emp=false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (!IsPostBack)
            {
                int GroupID = (int)SessionWrapper.LoggedUser.Group_Id;

                // Just for call center
                List<Group_Status> List_StatusL_CallCenter = db.Group_Status.Where(x => x.Group_Id == GroupID).ToList();
                Group_Status Assigned = List_StatusL_CallCenter.Where(x => x.Status_Id == 3).FirstOrDefault();
                Group_Status New_Pending = List_StatusL_CallCenter.Where(x => x.Status_Id == 1 || x.Status_Id == 2).FirstOrDefault();
                if (Assigned != null)
                {
                    Assigned_Flag = true;
                    if (New_Pending == null)
                        callcenter_emp = true;
                }

                if (New_Pending == null)
                    Supervisor_emp = true;

                // Start if he is Supervisor_emp => reset the list with all records.
                if (Supervisor_emp)
                    ListAllStudent = db.Students.Where(x => x.Suspended != 1).ToList();

                else
                {
                    // Start if it's on his status
                    List<Group_Status> List_Status = db.Group_Status.Where(x => x.Group_Id == GroupID).ToList();
                    for (int i = 0; i < List_Status.Count; i++)
                    {
                        List<Student> TempList1 = List_Status[i].Status.Students.Where(x => x.Suspended != 1).ToList();

                        // Set TempList1 into ListAllStudent
                        ListAllStudent.AddRange(TempList1);
                    }
                    // End if it's on his status

                    // Start if he is Call cetner
                    List<Student> TempList2 = db.Students.Where(x => x.Student_Employee_Id == SessionWrapper.LoggedUser.Employee_Id && x.Suspended != 1).ToList();

                    // Set TempList2 into ListAllStudent
                    ListAllStudent.AddRange(TempList2);
                    // End if he is Call cetner

                    // Start if he is Call cetner => reset the list with call center records.
                    if (callcenter_emp)
                        ListAllStudent = TempList2;

                    // Start if he made action on sequence table
                    ListSequence = db.Sequences.Where(x => x.Emp_Id == SessionWrapper.LoggedUser.Employee_Id).ToList();
                    List<Student> TempList3 = new List<Student>();
                    for (int i = 0; i < ListSequence.Count; i++)
                    {
                        Student student = ListSequence[i].Student;
                        if (student.Suspended != 1)
                            TempList3.Add(student);
                    }
                    // Set TempList3 into ListAllStudent
                    ListAllStudent.AddRange(TempList3);
                    // End if he made action on sequence table
                }

                // Set TempList3 into ListAllStudent
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


                }
                txtStudentList.Text = str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }
    }
}