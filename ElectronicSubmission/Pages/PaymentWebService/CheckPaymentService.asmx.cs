using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Script.Serialization;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.PaymentWebService
{
    /// <summary>
    /// Summary description for CheckPaymentService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CheckPaymentService : System.Web.Services.WebService
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        [WebMethod]
        public void CheckPayment()
        {


            var startTimeSpan = TimeSpan.Zero;
            var periodTimeSpan = TimeSpan.FromSeconds(20);

            var timer = new System.Threading.Timer((e) =>
            {
                PaymentProcessFunction();
            }, null, startTimeSpan, periodTimeSpan);

        }

        public async void PaymentProcessFunction()
        {
            try
            {
                int counter = 0;
                int newStatus = 0;
                List<Payment_Process> ListPayment = db.Payment_Process.Where(x => x.Payment_IsPaid == false && x.Payment_URL_IsValid == false).ToList();
                for (int i = 0; i < ListPayment.Count; i++)
                {
                    Dictionary<string, dynamic> responseData = Request(ListPayment[i].Send_EntityId);
                    if (responseData["result"]["code"] == "000.200.100")
                    {
                        Payment_Process PaymentProcess_update = db.Payment_Process.Find(ListPayment[i].Payment_Id);
                        PaymentProcess_update.Payment_IsPaid = true;
                        PaymentProcess_update.Result_Code = responseData["result"]["code"];
                        PaymentProcess_update.Result_Description = responseData["result"]["description"];
                        PaymentProcess_update.Result_BuildNumber = responseData["buildNumber"];
                        PaymentProcess_update.Result_Timestamp = responseData["timestamp"];
                        PaymentProcess_update.Result_Ndc = responseData["ndc"];
                        PaymentProcess_update.Result_Id = responseData["id"];
                        PaymentProcess_update.Payment_Date = DateTime.Now;
                        db.Entry(PaymentProcess_update).State = System.Data.EntityState.Modified;
                        db.SaveChanges();
                        counter++;


                        Student std = db.Students.Find(PaymentProcess_update.Student_Id);
                        if (std.Student_Status_Id == 6)
                            newStatus = 7;
                        else if (std.Student_Status_Id == 11)
                            newStatus = 10;

                        std.Student_Status_Id = newStatus;
                        db.Entry(std).State = System.Data.EntityState.Modified;
                        db.SaveChanges();

                        Sequence seq = db.Sequences.Create();

                        seq.Emp_Id = 1;
                        seq.Status_Id = newStatus;
                        seq.Student_Id = std.Student_Id;
                        seq.Note = "Student Complate The Payment";
                        seq.DateCreation = DateTime.Now;

                        db.Sequences.Add(seq);
                        db.SaveChanges();

                        db.Configuration.LazyLoadingEnabled = false;
                        /* Add it to log file */
                        Student stdLogFilestd = db.Students.Find(std.Student_Id);
                        stdLogFilestd.Employee = db.Employees.Find(seq.Emp_Id);
                        stdLogFilestd.Status = db.Status.Find(seq.Status_Id);

                        LogData = "data:" + JsonConvert.SerializeObject(stdLogFilestd, logFileModule.settings);
                        logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);

                        /* Add it to log file */
                        Payment_Process stdLogFile = db.Payment_Process.Find(PaymentProcess_update.Payment_Id);
                        stdLogFile.Student = db.Students.Find(PaymentProcess_update.Student_Id);

                        LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                        logFileModule.logfile(10, "اضافة دفعية جديدة", "Add new payment operation", LogData);
                    }

                }
                LastUpdate lastupdate_exist = db.LastUpdates.FirstOrDefault();
                if (lastupdate_exist != null)
                {
                    lastupdate_exist.CreationDate = DateTime.Now;
                    lastupdate_exist.Counter = lastupdate_exist.Counter + counter;
                    db.Entry(lastupdate_exist).State = System.Data.EntityState.Modified;
                    db.SaveChanges();
                }
                else
                {
                    LastUpdate lastupdate_new = db.LastUpdates.Create();
                    lastupdate_new.CreationDate = DateTime.Now;
                    lastupdate_new.Counter = counter;
                    db.LastUpdates.Add(lastupdate_new);
                    db.SaveChanges();
                }
            }
            catch (Exception er)
            {
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(er.StackTrace, logFileModule.settings);
                logFileModule.logfile(10, "حدث خطاء في النظام", "Exception in system", LogData);
                return;
            }
        }

        public Dictionary<string, dynamic> Request(string entityId)
        {
            string Result = "{'result':{'code':'000.200.100','description':'successfully created checkout'},'buildNumber':'8157609e6e0eada1aa110d0a82ee3af66f6009d5@2020-05-29 07:32:36 +0000','timestamp':'2020-06-02 12:24:42+0000','ndc':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02','id':'27E0DBE4D0D8465CC94B5862C4EE05D2.uat01-vm-tx02'}";
            Dictionary<string, dynamic> responseData;
            /*string data = "entityId="+ entityId;
            string url = "https://test.oppwa.com/v1/checkouts/{id}/payment?" + data;
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "GET";
            request.Headers["Authorization"] = "Bearer OGE4Mjk0MTc0ZDA1OTViYjAxNGQwNWQ4MjllNzAxZDF8OVRuSlBjMm45aA==";
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                Stream dataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                var s = new JavaScriptSerializer();
                responseData = s.Deserialize<Dictionary<string, dynamic>>(reader.ReadToEnd());
                reader.Close();
                dataStream.Close();
            }*/
            responseData = new JavaScriptSerializer().Deserialize<Dictionary<string, dynamic>>(Result);
            return responseData;
        }
    }
}
