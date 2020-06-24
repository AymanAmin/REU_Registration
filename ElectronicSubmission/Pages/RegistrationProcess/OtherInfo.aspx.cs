using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class OtherInfo : System.Web.UI.Page
    {
        List<Student> ListAllStudent = new List<Student>();

        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "yellow" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            ListAllStudent = db.Students.ToList();
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

                    List<Student_Other_Info> List_std_OI = ListAllStudent[i].Student_Other_Info.Where(x => x.Student_Id == ListAllStudent[i].Student_Id).ToList();
                    if (List_std_OI.Count > 0)
                        for (int k = 0; k < List_std_OI.Count; k++)
                        {
                            Student_Other_Info std_OI = List_std_OI[k];
                            str += "<tr>";
                            str += "<td class='txt-primary text-left'>" + FieldNames.getFieldName("OtherInfo-Expand", "Expand") + "</td>";
                            str += "<td class='text-center'>";
                            str += "<a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";
                            //str += "<a href= '../../../../Pages/RegistrationProcess/StudentInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-ui-edit h5'></i>&nbsp;&nbsp;</a>";
                            //str += "<a href= '../../../../Pages/RegistrationProcess/DeleteStudent.ashx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:red;'>&nbsp;&nbsp; <i class='icofont icofont-recycle-alt h5'></i>&nbsp;&nbsp;</a>";
                            str += "</td>";
                            str += "<td class='txt-primary text-left'>#" + ListAllStudent[i].Student_Id + "</td>";

                            if (SessionWrapper.LoggedUser.Language_id == 1)
                            { str += "<td class='text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_Ar + "</label></td>"; }
                            else
                            { str += "<td class='text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_En + "</label></td>"; }

                            str += "<td class='text-left'>" + ListAllStudent[i].Student_Name_En + "</td>";
                            str += "<td class='text-left'>" + ListAllStudent[i].Student_Name_Ar + "</td>";
                            str += "<td class='text-left'>" + ListAllStudent[i].Student_Phone + "</td>";
                            str += "<td class='text-left'>" + ListAllStudent[i].Student_Email + "</td>";
                            str += "<td class='text-left'>" + ListAllStudent[i].Student_SSN + "</td>";

                            str += "<td class='text-left'>" + std_OI.MessageType + "</td>";
                            str += "<td class='text-left'>" + std_OI.Message + "</td>";
                            str += "<td class='text-left'>" + std_OI.DateCreation.ToString() + "</td>";

                        }
                    else
                    {
                        str += "<tr>";
                        str += "<td class='txt-primary text-left'>" + FieldNames.getFieldName("OtherInfo-Expand", "Expand") + "</td>";
                        str += "<td class='text-center'>";
                        str += "<a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";
                        //str += "<a href= '../../../../Pages/RegistrationProcess/StudentInfo.aspx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-ui-edit h5'></i>&nbsp;&nbsp;</a>";
                        //str += "<a href= '../../../../Pages/RegistrationProcess/DeleteStudent.ashx?StudentID=" + ListAllStudent[i].Student_Id + "' style='color:red;'>&nbsp;&nbsp; <i class='icofont icofont-recycle-alt h5'></i>&nbsp;&nbsp;</a>";
                        str += "</td>";
                        str += "<td class='txt-primary text-left'>#" + ListAllStudent[i].Student_Id + "</td>";

                        if (SessionWrapper.LoggedUser.Language_id == 1)
                        { str += "<td class='text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_Ar + "</label></td>"; }
                        else
                        { str += "<td class='text-left'><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListAllStudent[i].Status.Status_Name_En + "</label></td>"; }

                        str += "<td class='text-left'>" + ListAllStudent[i].Student_Name_En + "</td>";
                        str += "<td class='text-left'>" + ListAllStudent[i].Student_Name_Ar + "</td>";
                        str += "<td class='text-left'>" + ListAllStudent[i].Student_Phone + "</td>";
                        str += "<td class='text-left'>" + ListAllStudent[i].Student_Email + "</td>";
                        str += "<td class='text-left'>" + ListAllStudent[i].Student_SSN + "</td>";

                        str += "<td class='text-center'> - </td>";
                        str += "<td class='text-center'> - </td>";
                        str += "<td class='text-center'> - </td>";
                        str += "</tr>";
                    }
                }
                txtStudentList.Text = str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }
    }
}