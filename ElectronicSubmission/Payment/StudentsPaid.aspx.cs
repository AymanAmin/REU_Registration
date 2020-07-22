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

        int Payment_Process_ID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (Request["Payment_Process_ID"] != null)
            {
                int.TryParse(Request["Payment_Process_ID"], out Payment_Process_ID);
                if(Payment_Process_ID != 0)
                {
                    Payment_Process payment_process = db.Payment_Process.Find(Payment_Process_ID);
                    if(payment_process != null)
                    {
                        payment_process.Payment_SMS_Result = "Done";
                        db.Entry(payment_process).State = System.Data.EntityState.Modified;
                        db.SaveChanges();
                        Response.Redirect("~/Payment/StudentsPaid.aspx");
                    }
                }                
            }

                if (!IsPostBack)
            {
                PaymentProcessList = db.Payment_Process.ToList();

                LoadStudent();
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "exportdata();", true);
                
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
                    if(PaymentProcessList[i].Payment_IsPaid == false)
                        str += "<a href= '#' style='color:red;'>&nbsp;&nbsp; <i class='icofont icofont-close-circled h5'></i>&nbsp;&nbsp;</a>";
                    else if(PaymentProcessList[i].Payment_SMS_Result == null || PaymentProcessList[i].Payment_SMS_Result == "")
                        str += "<a href= '../../../../Payment/StudentsPaid.aspx?Payment_Process_ID=" + PaymentProcessList[i].Payment_Id + "' style='color:black;'>&nbsp;&nbsp; <i class='icofont icofont-wall-clock h5'></i>&nbsp;&nbsp;</a>";
                    else
                        str += "<a href= '#' style='color:green;'>&nbsp;&nbsp; <i class='icofont icofont-check-circled h5'></i>&nbsp;&nbsp;</a>";
                    str += "</td>";
                    if (PaymentProcessList[i].Payment_IsPaid == true)
                        str += "<td class='text-left'><label class='label label-success' style='background:green !important;'>" + FieldNames.getFieldName("StudentsPaid-Paid", "Paid") + "</label></td>";
                    else
                        str += "<td class='text-left'><label class='label label-success' style='background:red !important;'>" + FieldNames.getFieldName("StudentsPaid-NotPaid", "Not Paid") + "</label></td>";

                    str += "<td class='text-left'>" + std.Student_Name_En + "</td>";
                    str += "<td class='text-left'>" + std.Student_Name_Ar + "</td>";
                    str += "<td class='text-left'>" + std.Student_Phone + "</td>";
                    str += "<td class='text-left'>" + std.Student_Email + "</td>";

                    if(SessionWrapper.LoggedUser.Language_id ==1)
                        str += "<td class='text-left'>" + std.Nationality.Country_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + std.Nationality.Country_Name_En + "</td>";

                    str += "<td class='text-left'>" + std.Student_SSN + "</td>";

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
                                TypeOfPayment = "VISA/MASTER";
                                CreationDate = VISA_MADA[VISA_MADA.Count - 1].DateCreation.ToString();

                                if(PaymentProcessList[i].Send_EntityId == "8acda4ce72e5a3df0172fb75d45d4891")
                                {
                                    TypeOfPayment = "MADA";
                                }
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