using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting.Auth
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();

        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btRest_Click(object sender, EventArgs e)
        {
            bool restult =  rest_account(txtEmail.Text);
            if(!restult)
            {
                return;
            }
        }

        private bool rest_account(string email)
        {
            email = email.Trim().ToLower();
            db.Configuration.LazyLoadingEnabled = false;
            Employee emp = db.Employees.Where(x => x.Employee_Email.ToLower() == email).FirstOrDefault();
            if (emp != null)
            {
                string New_Password = StringCipher.RandomString(7);
                string Encrypted_Password = StringCipher.Encrypt(New_Password, "Password"); // emp.Employee_Password.ToString(); 
                emp.Employee_Password = Encrypted_Password;
                db.Entry(emp).State = System.Data.EntityState.Modified;
                db.SaveChanges();

                string sever_name = Request.Url.Authority.ToString();
                // Send SMS
                SendSMS send_sms = new SendSMS();
                string url = "http://registration.riyadh.edu.sa/Pages/Auth/Login.aspx";
                string Text = "Reset Password\n\nEmail:" + emp.Employee_Email + "\n\nPassword:" + New_Password + "\n\nURL:"+ url;
                string number_Phone = emp.Employee_Phone;
                string reslt_message = send_sms.SendMessage(Text, number_Phone);

                SendEmail send = new SendEmail();
                bool result = send.ResetEmail(emp.Employee_Email, New_Password, sever_name,"Reset Password");
                if (result)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "show_model_sucess();", true);
                    txtEmail.Text = "";

                    /* Add it to log file */
                    
                    LogData = "data:" + JsonConvert.SerializeObject(emp, logFileModule.settings);
                    logFileModule.logfile(10, "إعادة تعين كلمة السر", "reset your password", LogData);

                    return true;
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "show_model_error();", true);
                    return false;
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " show_model_notfound();", true);
                return false;
            }
        }

        
        
    }
}