using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Payment
{
    public partial class StudentsPaid : System.Web.UI.Page
    {
        List<Payment_Process> PaymentProcessList = new List<Payment_Process>();

        List<Sequence> ListSequence = new List<Sequence>();
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "yellow" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (!IsPostBack)
            {
                PaymentProcessList = db.Payment_Process.ToList();

                LoadStudent();
            }

        }

        private void LoadStudent()
        {
            try
            {
                int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
                int index = 0;
                //txtAddMeeting.Text = "<a class='btn btn-success btn-round' href='#' > </a>";

                string str = string.Empty;
                for (int i = 0; i < PaymentProcessList.Count; i++)
                {
                    Student std = PaymentProcessList[i].Student;
                    // select the color based on status id
                    index = (int)std.Status.Status_Code - 1;
                    if (index >= Color.Length)
                        index = 1;

                    str += "<tr>";
                    str += "<td class='txt-primary text-left'>" + FieldNames.getFieldName("StudentsPaid-Expand", "Expand") + "</td>";
                    str += "<td class='text-left'>";
                    str += "<a href= '../../../../Pages/RegistrationProcess/view.aspx?StudentID=" + std.Student_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";
                    //str += "<a href= '../../../../Pages/RegistrationProcess/StudentInfo.aspx?StudentID=" + std.Student_Id + "' style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-ui-edit h5'></i>&nbsp;&nbsp;</a>";
                    //str += "<a href= '../../../../Pages/RegistrationProcess/DeleteStudent.ashx?StudentID=" + std.Student_Id + "' style='color:red;'>&nbsp;&nbsp; <i class='icofont icofont-recycle-alt h5'></i>&nbsp;&nbsp;</a>";
                    str += "</td>";
                    if (PaymentProcessList[i].Payment_IsPaid == true)
                        str += "<td class='text-left'><label class='label label-success' style='background:green !important;'>" + FieldNames.getFieldName("StudentsPaid-Paid", "Paid") + "</label></td>";
                    else
                        str += "<td class='text-left'><label class='label label-success' style='background:red !important;'>" + FieldNames.getFieldName("StudentsPaid-NotPaid", "Not Paid") + "</label></td>";

                    str += "<td class='text-left'>" + std.Student_Name_En + "</td>";
                    str += "<td class='text-left'>" + std.Student_Name_Ar + "</td>";
                    str += "<td class='text-left'>" + std.Student_Phone + "</td>";
                    str += "<td class='text-left'>" + std.Student_Email + "</td>";

                    string UUID = " - ";
                    string TypeOfPayment = " - ";
                    string SADAD = " - ";
                    string CreationDate = " - ";
                    if (PaymentProcessList[i].Payment_IsPaid == true)
                    {
                        List<Rosom_Response> rosom_response = PaymentProcessList[i].Rosom_Response.ToList();
                        if (rosom_response.Count > 0)
                        {
                            UUID = rosom_response[rosom_response.Count - 1].Rosom_Request.UUID;
                            TypeOfPayment = "SADAD";
                            SADAD = rosom_response[rosom_response.Count - 1].SADADNumber;
                            CreationDate = rosom_response[rosom_response.Count - 1].PaymentDate.ToString();
                        }
                        else
                        {
                            List<VISA_MADA> VISA_MADA = PaymentProcessList[i].VISA_MADA.ToList();
                            if (VISA_MADA.Count > 0)
                            {
                                UUID = VISA_MADA[VISA_MADA.Count - 1].UUID;
                                TypeOfPayment = "VISA/MADA";
                                CreationDate = VISA_MADA[VISA_MADA.Count - 1].DateCreation.ToString();
                            }
                        }
                    }

                    str += "<td class='text-left'>" + TypeOfPayment + "</td>";
                    str += "<td class='text-left'>" + PaymentProcessList[i].Send_Amount + "</td>";
                    str += "<td class='text-left'>" + PaymentProcessList[i].Comment + "</td>";
                    str += "<td class='text-left'>" + UUID + "</td>";
                    str += "<td class='text-left'>" + CreationDate + "</td>";

                    str += "</tr>";


                }
                txtStudentList.Text = str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/StudentsPaid.aspx"); }
        }
    }
}