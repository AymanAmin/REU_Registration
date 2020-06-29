using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Payment
{
    public partial class PaymentProcess : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string Trackingkey = "", PaymentId = "";
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["Trackingkey"] != null)
            {
                if (Request["id"] != null)
                {
                    Trackingkey = Request["Trackingkey"];
                    PaymentId = Request["id"];
                    
                    Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey).FirstOrDefault();
                    if (payment != null)
                    {
                        if (payment.Payment_IsPaid == false && payment.Payment_URL_IsValid == true)
                        {
                            bool payment_result = CheckPaymentStatus(Trackingkey, payment.Send_EntityId, PaymentId);
                            if (payment_result)
                            {
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(2);", true);
                            }
                            else
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(3);", true);
                        }
                        else
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(4);", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(3);", true);
                    }
                        
                }
                else
                {
                    Trackingkey = Request["Trackingkey"];
                    Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                    if (payment != null)
                    {
                        string sever_name = Request.Url.Authority.ToString();
                        string URL = sever_name + "/Payment/PaymentProcess.aspx?Trackingkey=" + Trackingkey + "&";
                        if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                            URL = "http://" + URL;

                        Payment_Form.Action = URL;
                        render_Payment.Text = "<script src='https://oppwa.com/v1/paymentWidgets.js?checkoutId=" + payment.Result_Id + "'></script>" ;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(1);", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(4);", true);
                    }
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "DisplayDiv(4);", true);
            }

        }

        public bool CheckPaymentStatus(string Trackingkey_local,string entityId,string PaymentId_local)
        {
            bool result = false;
            try
            {
                Dictionary<string, dynamic> responseData = CheckStatusPaymentRequest(PaymentId_local, entityId);
                if (responseData["result"]["code"] == "000.100.110" || responseData["result"]["code"] == "000.100.112")
                {
                    Payment_Process PaymentProcess_update = db.Payment_Process.FirstOrDefault(x => x.Payment_Trackingkey == Trackingkey_local);
                    PaymentProcess_update.Payment_IsPaid = true;
                    PaymentProcess_update.Payment_URL_IsValid = false;
                    PaymentProcess_update.Payment_Result_Json = JsonConvert.SerializeObject(responseData, logFileModule.settings);
                    PaymentProcess_update.Payment_Date = DateTime.Now;
                    db.Entry(PaymentProcess_update).State = System.Data.EntityState.Modified;
                    db.SaveChanges();

                    

                    // Update student record to paid
                    Student std = db.Students.Find(PaymentProcess_update.Student_Id);
                    int new_Status_Id =(int) std.Student_Status_Id + 1;
                    std.Student_Status_Id = new_Status_Id;
                    db.Entry(std).State = System.Data.EntityState.Modified;
                    db.SaveChanges();

                    // isnert new Sequences record to paid
                    Sequence seq = db.Sequences.Create();
                    seq.Emp_Id = 1;
                    seq.Status_Id = new_Status_Id;
                    seq.Student_Id = std.Student_Id;
                    seq.Note = "Auto payment";
                    seq.DateCreation = DateTime.Now;
                    db.Sequences.Add(seq);
                    db.SaveChanges();


                    db.Configuration.LazyLoadingEnabled = false;
                    /* Add it to log file */
                    Student stdLogFile = db.Students.Find(std.Student_Id);
                    stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                    stdLogFile.Status = db.Status.Find(seq.Status_Id);

                    LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                    logFileModule.logfile(10, "تغير الحالة تلقائي", "Update Status Automatic", LogData);

                    Payment_Process paymentLogFile = db.Payment_Process.Find(PaymentProcess_update.Payment_Id);
                    LogData = "data:" + JsonConvert.SerializeObject(paymentLogFile, logFileModule.settings);
                    logFileModule.logfile(10, "اضافة عملية دفع", "add payment process", LogData);

                    result = true;
                }
                else
                {
                    Payment_Process PaymentProcess_update = db.Payment_Process.FirstOrDefault(x => x.Payment_Trackingkey == Trackingkey_local);
                    PaymentProcess_update.Payment_Result_Json = JsonConvert.SerializeObject(responseData, logFileModule.settings);
                    db.Entry(PaymentProcess_update).State = System.Data.EntityState.Modified;
                    db.SaveChanges();

                    /* Add it to log file */
                    db.Configuration.LazyLoadingEnabled = false;
                    Payment_Process paymentLogFile = db.Payment_Process.Find(PaymentProcess_update.Payment_Id);
                    LogData = "data:" + JsonConvert.SerializeObject(paymentLogFile, logFileModule.settings);
                    logFileModule.logfile(10, "اضافة عملية دفع", "add payment process", LogData);
                }
            }
            catch (Exception er){
                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */

                LogData = "data:" + JsonConvert.SerializeObject(er, logFileModule.settings);
                logFileModule.logfile(10, "خطأ جديد التحقق من  للدفع", "New Exception in checkPayment Status", LogData);
            }
            return result;
        }

        public Dictionary<string, dynamic> CheckStatusPaymentRequest(string PaymentId_local, string entityId)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            //string Result = "{'result':{'code':'000.200.100','description':'successfully created checkout'},'buildNumber':'8157609e6e0eada1aa110d0a82ee3af66f6009d5@2020-05-29 07:32:36 +0000','timestamp':'2020-06-02 12:24:42+0000','ndc':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02','id':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02'}";
            Dictionary<string, dynamic> responseData;

            string data = "entityId=" + entityId;
            string url = " https://oppwa.com/v1/checkouts/" + PaymentId_local + "/payment?" + data;
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "GET";
            request.Headers["Authorization"] = "Bearer OGFjZGE0Y2U3MmU1YTNkZjAxNzJmYjc0Y2ZjZTQ4ODd8NHBZOWZQc3lxeQ==";
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                Stream dataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                var s = new JavaScriptSerializer();
                responseData = s.Deserialize<Dictionary<string, dynamic>>(reader.ReadToEnd());
                reader.Close();
                dataStream.Close();
            }

            //responseData = new JavaScriptSerializer().Deserialize<Dictionary<string, dynamic>>(Result);  

            return responseData;
        }

    }
}