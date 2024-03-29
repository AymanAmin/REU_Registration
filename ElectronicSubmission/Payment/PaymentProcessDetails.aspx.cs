﻿using Microsoft.Web.Administration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Payment
{
    public partial class PaymentProcessDetails : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string Trackingkey, UUID = "";
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        string SADAD_Number = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request["Trackingkey"] != null)
            {
                Trackingkey = Request["Trackingkey"];

                if (!IsPostBack)
                    FillNationality();

                Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                if (payment != null)
                {
                    Div_payment.Visible = true;
                    int student_Id = 0;
                    int.TryParse(payment.Student_Id.ToString(), out student_Id);
                    var student = db.Students.FirstOrDefault(x => x.Student_Id == student_Id);
                    if (student != null)
                    {
                        //if (student.Student_Status_Id == 6)
                           // PaymentType.Items.Remove("SADAD");
                        StudentName.Text = student.Student_Name_En;
                        StudentEmail.Text = student.Student_Email;
                        Guid obj = Guid.NewGuid();
                        UUID = obj.ToString();
                        //UUID = RandomTrackingkey(student.Student_Id);
                    }
                }
                else
                {
                    Div_NotFound.Visible = true;
                }
            }
            else
            {
                Div_invalid.Visible = true;
            }
        }

        public async System.Threading.Tasks.Task<bool> confirm_To_Payment()
        {
            string Entity_ID = "";
            bool Response = false;
            try
            {
                /*  Start Prepare the checkout  */
                Payment_Process checkout_payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey && x.Payment_URL_IsValid == true && x.Payment_IsPaid == false).FirstOrDefault();
                if (checkout_payment != null)
                {
                    if (PaymentType.SelectedValue == "1" || PaymentType.SelectedValue == "2") Entity_ID = "8acda4ce72e5a3df0172fb754c3c488c"; else if (PaymentType.SelectedValue == "3") Entity_ID = "8acda4ce72e5a3df0172fb75d45d4891";

                    if (PaymentType.SelectedValue != "4")
                    {
                        string paymentBrand = "VISA";
                        if (PaymentType.SelectedValue == "1")
                            paymentBrand = "VISA";
                        else if (PaymentType.SelectedValue == "2")
                            paymentBrand = "MASTER";
                        else if (PaymentType.SelectedValue == "3")
                            paymentBrand = "MADA";

                        VISA_MADA NewVM = db.VISA_MADA.Create();
                        NewVM.UUID = UUID;
                        NewVM.PaymentProcess_Id = checkout_payment.Payment_Id;
                        NewVM.Trackingkey = checkout_payment.Payment_Trackingkey;
                        NewVM.Result_JSON = string.Empty;
                        NewVM.DateCreation = DateTime.Now;
                        db.VISA_MADA.Add(NewVM);
                        db.SaveChanges();

                        Dictionary<string, dynamic> responseData =
                            Prepare_Check_Payment_Request(UUID, paymentBrand, Entity_ID, checkout_payment.Send_Amount.ToString(), checkout_payment.Send_Currency, checkout_payment.Send_PaymentType, StudentName.Text, Studentsurname.Text, StudentEmail.Text, StudentCountry.SelectedValue, StudentState.Text, StudentCity.Text, StudentAddress.Text, StudentPostcode.Text);
                        if (responseData["result"]["code"] == "000.200.100")
                        {
                            checkout_payment.Result_Code = responseData["result"]["code"];
                            checkout_payment.Result_Description = responseData["result"]["description"];
                            checkout_payment.Result_BuildNumber = responseData["buildNumber"];
                            checkout_payment.Result_Timestamp = responseData["timestamp"];
                            checkout_payment.Result_Ndc = responseData["ndc"];
                            checkout_payment.Result_Id = responseData["id"];
                            checkout_payment.Send_EntityId = Entity_ID;
                            db.Entry(checkout_payment);
                            db.SaveChanges();


                            Response = true;
                        }
                        else
                        {

                            Response = false;
                            //return false;
                        }
                        // Save Result in all cases
                        VISA_MADA VM_UpdateResult = db.VISA_MADA.Where(x => x.UUID == UUID).FirstOrDefault();
                        if (VM_UpdateResult != null)
                        {
                            VM_UpdateResult.Result_JSON = JsonConvert.SerializeObject(responseData);
                            db.Entry(VM_UpdateResult).State = System.Data.EntityState.Modified;
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        int studentID = 0;
                        int.TryParse(checkout_payment.Student_Id.ToString(), out studentID);
                        string PayeeId = StringCipher.RandomString(10);

                        string Gender = StudentGender.SelectedValue;

                        Dictionary<string, dynamic> responseData = await Prepare_Check_Payment_Request_SADAD(checkout_payment.Payment_Id, PayeeId, UUID, checkout_payment.Send_Amount.ToString(), checkout_payment.Student.Student_SSN, checkout_payment.Send_PaymentType, StudentFirstName.Text, StudentLastName.Text, studentID, Gender);
                        if (responseData["Status"]["Code"] == 0)
                        {
                            checkout_payment.Result_Code = (responseData["Status"]["Code"]).ToString();
                            checkout_payment.Result_Description = responseData["Status"]["Description"];
                            checkout_payment.Result_BuildNumber = responseData["SADADNumber"];
                            checkout_payment.Result_Timestamp = responseData["Status"]["Severity"];
                            checkout_payment.Result_Ndc = responseData["InvoiceId"];
                            db.Entry(checkout_payment).State = System.Data.EntityState.Modified;
                            db.SaveChanges();

                            string InvoiceId = responseData["InvoiceId"];
                            Rosom_Request Rosom = db.Rosom_Request.FirstOrDefault(x => x.Trackingkey == Trackingkey && x.InvoiceId == InvoiceId);
                            Rosom.Response_Status_Code = (responseData["Status"]["Code"]).ToString();
                            // Rosom. = responseData["result"]["description"];
                            Rosom.Response_SADADNumber = responseData["SADADNumber"];
                            Rosom.Result_JSON = JsonConvert.SerializeObject(responseData); 
                            db.Entry(Rosom).State = System.Data.EntityState.Modified; ;
                            db.SaveChanges();

                            SADAD_Number = responseData["SADADNumber"];

                            string Text = "";
                            string sever_name = Request.Url.Authority.ToString();
                            string StuEmail = checkout_payment.Student.Student_Email;

                            SendEmail send = new SendEmail();
                            Text = " <Strong style='font-size:16px;'> Dear " + checkout_payment.Student.Student_Name_En + "</Strong><br /><br /> " + "The invoice number of SADAD is:<Strong>" + SADAD_Number + "</Strong>.<br />The total amount: <Strong>" + checkout_payment.Send_Amount + "</Strong> SAR.<br /><br />Please complete the payment before 48 hours." + " <br /> <br />" + "Best Regard," + " <br />";
                            bool R = send.TextEmail("Riyadh Elm University", StuEmail, Text, sever_name);

                            // Send SMS
                            SendSMS send_sms = new SendSMS();
                            string smsText = "Dear " + checkout_payment.Student.Student_Name_En + "\n\n" + "The invoice number of SADAD is:" + SADAD_Number + ".\n\nThe total amount: " + checkout_payment.Send_Amount + " SAR.\n\nPlease complete the payment before 48 hours." + " \n\n" + "Best Regard";
                            string number_Phone = checkout_payment.Student.Student_Phone;
                            string reslt_message = send_sms.SendMessage(smsText, number_Phone);

                            Response = true;
                        }
                        else
                        {
                            Response = false;
                            //return false;
                        }
                    }
                }
                else
                {
                    Response = false;
                    //return Response;
                }

            }
            catch (Exception er)
            {
                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(er, logFileModule.settings);
                logFileModule.logfile(10, "خطأ جديد للدفع", "New Exception in Payment", LogData);
                return false;
            }

            return Response;
            /* End Prepare the checkout */
        }

        /// <summary>
        /// MADA - VISA - MASTER CARD
        /// </summary>
        /// <param name="UUID_Local"></param>
        /// <param name="entityId"></param>
        /// <param name="amount"></param>
        /// <param name="currency"></param>
        /// <param name="paymentType"></param>
        /// <param name="Name"></param>
        /// <param name="surname"></param>
        /// <param name="Email"></param>
        /// <param name="Country"></param>
        /// <param name="State"></param>
        /// <param name="City"></param>
        /// <param name="Address"></param>
        /// <param name="Postcode"></param>
        /// <returns></returns>
        public Dictionary<string, dynamic> Prepare_Check_Payment_Request(string UUID_Local,string paymentBrand, string entityId, string amount, string currency, string paymentType, string Name, string surname, string Email, string Country, string State, string City, string Address, string Postcode)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            Dictionary<string, dynamic> responseData;
            string data = "entityId=" + entityId +
                "&amount=" + amount +
                "&currency=" + currency +
                "&paymentType=" + paymentType +
                //"&testMode=EXTERNAL" +
                "&merchantTransactionId=" + UUID_Local +
                //"&paymentBrand=" + paymentBrand +
                "&customer.email=" + Email +
                "&billing.street1=" + Address +
                "&billing.city=" + City +
                "&billing.state=" + State +
                "&billing.country=" + Country +
                "&billing.postcode=" + Postcode +
                "&customer.givenName=" + Name +
                "&customer.surname=" + surname;
            string url = "https://oppwa.com/v1/checkouts";
            byte[] buffer = Encoding.ASCII.GetBytes(data);
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "POST";
            request.Headers["Authorization"] = "Bearer OGFjZGE0Y2U3MmU1YTNkZjAxNzJmYjc0Y2ZjZTQ4ODd8NHBZOWZQc3lxeQ==";
            request.ContentType = "application/x-www-form-urlencoded";
            Stream PostData = request.GetRequestStream();
            PostData.Write(buffer, 0, buffer.Length);
            PostData.Close();
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                Stream dataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(dataStream);
                var s = new JavaScriptSerializer();
                responseData = s.Deserialize<Dictionary<string, dynamic>>(reader.ReadToEnd());
                reader.Close();
                dataStream.Close();
            }
            return responseData;
        }


        /// <summary>
        /// ROSOM - SADAD
        /// </summary>
        /// <param name="UUID"></param>
        /// <param name="amount"></param>
        /// <param name="SSN"></param>
        /// <param name="paymentType"></param>
        /// <param name="FirstName"></param>
        /// <param name="LastName"></param>
        /// <param name="Student_id"></param>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<Dictionary<string, dynamic>> Prepare_Check_Payment_Request_SADAD(int Payment_Process_Id, string PayeeId, string UUID, string amount, string SSN, string paymentType, string FirstName, string LastName, int Student_id,string Gender)
        {
            List < Rosom_Request> rosom_request = db.Rosom_Request.Where(x => x.Payment_Process_Id == Payment_Process_Id).ToList();
            string Res_str = "";
            string NewInvoiceID = "";
            string School_Id = "2426"; // Female
            if(Gender == "1") 
                School_Id = "2427"; // Male

            string CreateDate = DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss");
            string ExpiryDate = DateTime.Now.AddDays(7).ToString("yyyy-MM-ddTHH:mm:ss");

            string InvoiceId = StringCipher.RandomString(5) + StringCipher.RandomString(3) + DateTime.Now.GetHashCode() + StringCipher.RandomString(5);
            string DisplayInfo = "REU Riyadh Elm University - Admission System. ";

            List<student_local> student_List = new List<student_local>();
            student_local std_local = new student_local();

            std_local.Id = SSN;
            std_local.FirstName = FirstName;
            std_local.LastName = LastName;
            student_List.Add(std_local);

            PaymentRange paymentRange_object = new PaymentRange();
            paymentRange_object.MinPartialAmount = Decimal.Parse(amount);
            paymentRange_object.MinAdvanceAmount = Decimal.Parse(amount);
            paymentRange_object.MaxAdvanceAmount = Decimal.Parse(amount) + 100;

            Invoice invoice_object = new Invoice();
            invoice_object.Students = student_List;
            invoice_object.InvoiceId = InvoiceId;
            invoice_object.PayeeId = SSN;
            invoice_object.InvoiceStatus = "BillNew";
            invoice_object.BillType = "OneTime";
            invoice_object.DisplayInfo = DisplayInfo;
            invoice_object.AmountDue = Decimal.Parse(amount);
            invoice_object.CreateDate = CreateDate;
            invoice_object.ExpiryDate = ExpiryDate;
            invoice_object.PaymentRange = paymentRange_object;

            // If it's Update
            if (rosom_request.Count > 0)
            {
                invoice_object.InvoiceId = rosom_request[rosom_request.Count - 1].InvoiceId;
                invoice_object.InvoiceStatus = "BillUpdated";
                NewInvoiceID = rosom_request[rosom_request.Count - 1].InvoiceId;
            }
            Rosom rosom_object = new Rosom();
            rosom_object.UUID = UUID;
            rosom_object.Timestamp = CreateDate;
            rosom_object.MerchantId = "12190";
            rosom_object.SchoolId = School_Id;
            rosom_object.Invoice = invoice_object;

            var json = JsonConvert.SerializeObject(rosom_object);
            var data = new StringContent(json, Encoding.UTF8, "application/json");

            // Get and Add the certificate to http client
            WebRequestHandler handler = new WebRequestHandler();
            handler.ServerCertificateValidationCallback = (message, cert, chain, errors) => { return true; };

            // Load certificate
            string certificateSerialNumber = "79011992a06448bb4d19fd844cb54731";

            X509Store store = new X509Store(StoreName.My, StoreLocation.LocalMachine);
            store.Open(OpenFlags.ReadOnly);
            X509Certificate2Collection certs = store.Certificates.Find(X509FindType.FindBySerialNumber, certificateSerialNumber, false);
            store.Close();

            if (certs[0] != null)
            {
                // Fetch private key
                using (certs[0].GetRSAPrivateKey()) { }

                // Add certificate to web handler
                handler.ClientCertificates.Add(certs[0]);
            }

            string url = "Bill/CreateBill";
            HttpClient client = new HttpClient(handler);
            client.BaseAddress = new Uri("https://rosomtest.brightware.com.sa/RosomAPI/api/");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            

            var response = await client.PostAsync(url, data);

            Res_str = response.Content.ReadAsStringAsync().Result;

            if (Res_str == "")
            {
                Dictionary<string, dynamic> responseData2 = new Dictionary<string, dynamic>();
                return responseData2;
            }


            var s = new JavaScriptSerializer();
            Dictionary<string, dynamic> responseData = s.Deserialize<Dictionary<string, dynamic>>(Res_str);
            if (responseData != null && responseData["Status"]["Code"] == 0)
            {
                Rosom_Request Rosom;
                if(rosom_request.Count > 0)
                    Rosom = db.Rosom_Request.Find(rosom_request[rosom_request.Count - 1].Id);
                else
                    Rosom = db.Rosom_Request.Create();

                Rosom.Trackingkey = Trackingkey;
                Rosom.Payment_Process_Id = Payment_Process_Id;
                Rosom.CreateDate = DateTime.Now.ToLongDateString();
                Rosom.Invoice_Students_Id = InvoiceId;
                if (rosom_request.Count > 0)
                    Rosom.Invoice_Students_Id = NewInvoiceID;

                Rosom.PayeeId = PayeeId;
                Rosom.InvoiceStatus = "BillNew";
                if (rosom_request.Count > 0)
                    Rosom.InvoiceStatus = "BillUpdated";

                Rosom.BillType = "OneTime";
                Rosom.DisplayInfo = DisplayInfo;
                Rosom.PaymentType = 4; //SADDAD option type id;
                Rosom.IsPaid = false;

                Rosom.DateCreation = DateTime.Now;
                Rosom.MerchantId = "12190";
                Rosom.Timestamp = CreateDate;
                Rosom.UUID = UUID;
                Rosom.Invoice_Students_FirstName = FirstName;
                Rosom.Invoice_Students_LastName = LastName;
                Rosom.InvoiceId = InvoiceId;

                if (rosom_request.Count > 0)
                    Rosom.InvoiceId = NewInvoiceID;

                Rosom.DisplayInfo = DisplayInfo;
                Rosom.AmountDue = amount;
                Rosom.CreateDate = CreateDate;
                Rosom.ExpiryDate = ExpiryDate;

                Rosom.PaymentRange_MaxAdvanceAmount = amount;
                Rosom.PaymentRange_MinAdvanceAmount = amount;
                Rosom.PaymentRange_MinPartialAmount = amount + 1;
                if (rosom_request.Count > 0)
                    db.Entry(Rosom).State = System.Data.EntityState.Modified;
                else
                    db.Rosom_Request.Add(Rosom);
                db.SaveChanges();
            }
            return responseData;
        }

        protected async void confirm_Click(object sender, EventArgs e)
        {
            bool redirect = await confirm_To_Payment();
            if (redirect)
            {
                if (PaymentType.SelectedValue != "4")
                {
                    Response.Redirect("~/Payment/PaymentProcess.aspx?Trackingkey=" + Trackingkey, false);
                    Context.ApplicationInstance.CompleteRequest();
                }
                else
                {
                    Div_Sucess.Visible = true;
                    Div_NotFound.Visible = false;
                    Div_payment.Visible = false;
                    Div_NotFound.Visible = false;
                    SDADNumber.InnerText = "SDAD Number : " + SADAD_Number;
                }

            }
        }

        private void FillNationality()
        {
            List<Nationality> NationalityList = db.Nationalities.ToList();

            ddlFiller.dropDDL(StudentCountry, "Country_code", "Country_Name_En", NationalityList, "Select Country");
            //if (GroupList.Count > 0)
            //ddlGroups.SelectedIndex = 1;
        }

        protected void PaymentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int x = 0;
            if (PaymentType.SelectedValue == "4")
            {
                Visa.Visible = false;
                SADAD.Visible = true;
            }
            else
            {
                Visa.Visible = true;
                SADAD.Visible = false;
            }
        }

        public string RandomTrackingkey(int student_id)
        {
            string Trackingkey = StringCipher.RandomString(5) + student_id + StringCipher.RandomString(3) + DateTime.Now.GetHashCode() + StringCipher.RandomString(5);

            return Trackingkey;
        }

        public static string ToHex(byte[] ba)
        {
            var hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
            {
                hex.AppendFormat("{0:x2}", b);
            }

            return hex.ToString();
        }

    }


    public class Rosom
    {
        public string UUID { get; set; }
        public string Timestamp { get; set; }
        public string MerchantId { get; set; }
        public string SchoolId { get; set; }
        public Invoice Invoice { get; set; }
    }

    public class Invoice
    {
        public string InvoiceId { get; set; }
        public string PayeeId { get; set; }
        public string InvoiceStatus { get; set; }
        public string BillType { get; set; }
        public string DisplayInfo { get; set; }
        public Decimal AmountDue { get; set; }
        public string CreateDate { get; set; }
        public string ExpiryDate { get; set; }
        public List<student_local> Students { get; set; }
        public PaymentRange PaymentRange { get; set; }

    }
    public class PaymentRange
    {
        public Decimal MinPartialAmount { get; set; }
        public Decimal MinAdvanceAmount { get; set; }
        public Decimal MaxAdvanceAmount { get; set; }
    }
    public class student_local
    {
        public string Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

    }


    //string data = JsonConvert.SerializeObject(rosom_object);
    // Local Device
    //X509Certificate2Collection col_cer = new X509Certificate2Collection();
    //col_cer.Add(Certificate);
    /*byte[] rawdata = Certificate.RawData;

    string s3 = Convert.ToBase64String(rawdata);  // gsjqFw==
    byte[] decByte3 = Convert.FromBase64String(s3);*/

    /*string str = rawdata.ToString();
    string cert_str = Encoding.UTF8.GetString(rawdata, 0, rawdata.Length);
    rawdata = Encoding.UTF8.GetBytes(cert_str);*/
    //string cert_str = results.ToString();
    //Certificate.Import(certPath, certPass, X509KeyStorageFlags.DefaultKeySet | X509KeyStorageFlags.PersistKeySet | X509KeyStorageFlags.UserKeySet | X509KeyStorageFlags.MachineKeySet | X509KeyStorageFlags.Exportable);

    //string certPath = "C:\\CertificateREU\\RiyadhEducation.pfx";
    //string certPath = Server.MapPath("../RiyadhEducation.pfx");


    //Server 
    //string certPath = "C:\\CertificateREU\\RiyadhEducation.pfx";
    //string certPass = "Ri%ydHd@n9$";

    //string cert_str = "MIIDDjCCAfagAwIBAgIQeQEZkqBkSLtNGf2ETLVHMTANBgkqhkiG9w0BAQUFADAaMRgwFgYDVQQDDA9SaXlhZGhFZHVjYXRpb24wHhcNMjAwNzAxMTEyODAxWhcNMzAwNzAxMTEzODAxWjAaMRgwFgYDVQQDDA9SaXlhZGhFZHVjYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqJPVBfVX+oUkPXNUNxlVAQRnQ2A4ewqdYepsS2ClW6UQUFytlMs4d3TW4sNS4QatyIQ8PzzVYuqk3fBRxYzLElPkZolxWzErp0njZQmFuvSNVp/rupbGqtv8FMaxqnvKvR3Y0xB8VLXhvyuZOx0jDv2+kU6Zr4+qQTMqSMro0d9cNF2BqnVim8q5bUkDBpEGjlP2ZejV2vK53wH+SOLmmEhbGdxsZBquiCuHE3V+ljnMf76IDH6yWKt61MtBKOUQVUyN+mL6KiL6ivjY8azv4eu40epoYnOmzmQqfGDCaxJhJKBFJlJHmO9K17+PZU44fHRrVLkvlRQRqq5JLk7lpAgMBAAGjUDBOMA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwHQYDVR0OBBYEFNMeHmwhS01dl2sZ8M8ZrF9Dn8snMA0GCSqGSIb3DQEBBQUAA4IBAQB6/tALT8Gs72Y2OZQMqMFomgJMrP5hTHuV6sLRuOA0gelu8z+aNEiOZ80DcqbjxD4bM+xOU/6J0dWgVJqntewZZscdpp0MfPeBaHlairx+qwe7XAFYoIncqbsYpikM3lYzP89tQ0hlle7YLepz8w3vGF81+eqKHvQl46qsusEq+iChEYqC8/EdLYd+gtKieNYmKvGMuW3R9ZNDXeSOkcWmnZ2S5OncnP6MBsu++iXtlT1Y6abqoqjlYwWyc+vz+1JQ0p+DB9T7CScLclYVETaY7el+/PbumFjVNXNY5myCdLjohAEBL3sl8sY8RN76IhRxOFLxZSzOLVcDN6SyG65R";
    //byte[] rawdata = Convert.FromBase64String(cert_str);

    // Create a collection object and populate it using the PFX file
    //X509Certificate2Collection certs = new X509Certificate2Collection();
    //certs.Add(new X509Certificate2(rawdata, certPass));

    //ServicePointManager.ServerCertificateValidationCallback = (a, b, c, d) => true;

    //string url = "https://rosomtest.brightware.com.sa/RosomAPI/api/Bill/CreateBill";

}