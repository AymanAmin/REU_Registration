using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.Setting.UserManagment
{
    public partial class Profile : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        int EmployeeId = 0;
        protected void Page_PreInit(object sender, EventArgs e)
        {
        
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser != null)
            {
                if (SessionWrapper.LoggedUser.Employee_Id > 0) EmployeeId = SessionWrapper.LoggedUser.Employee_Id;
            }
            else
            {
                Response.Redirect("~/Pages/Auth/Login.aspx");
            }

            if (!IsPostBack)
            {
                LoggedUser();
                ViewEmpLoyeeData();
            }
        }

        private void LoggedUser()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1) {
                EmpUpdate.Text = "حفظ";
                ChangeButton.Text = "حفظ";
                translateValidationArabic();
            }

        }


        public void ViewEmpLoyeeData()
        {
            try
            {
                int i = 0;
                String EmpStru = "";
                if (EmployeeId > 0)
                {
                    var Employees = db.Employees.First(x => x.Employee_Id == EmployeeId);

                    if (Employees.Employee_Profile != "" && Employees.Employee_Profile != null)
                    {
                        Emp_Profile.ImageUrl = "../../../../media/Profile/" + Employees.Employee_Profile;
                        Emp_Profile1.ImageUrl = "../../../../media/Profile/" + Employees.Employee_Profile;
                    }
                   
                    ArabicName.InnerText = Employees.Employee_Name_Ar;
                    EnglishName.InnerText = Employees.Employee_Name_En;
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        Name.InnerText = Employees.Employee_Name_Ar;
                    else
                        Name.InnerText = Employees.Employee_Name_En;

                    Employee_Email.Text = Employees.Employee_Email;
                    Email.InnerText = Employees.Employee_Email;

                    Employee_Phone.Text = Employees.Employee_Phone;
                    Phone.InnerText = Employees.Employee_Phone;


                    /*if (Employees.Calendar_id == 1) CalendarType.InnerText = "Birth Date"; else CalendarType.InnerText = "Hegira Date";*/
                    ActiveL.InnerText = bool.Parse(Employees.Employee_Active.ToString()).ToString();

                    if (Employees.Group_Id != null && Employees.Group_Id > 0)
                    {
                        var Gro = db.Groups.First(x => x.Group_Id == Employees.Group_Id);
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                        {
                            Group.InnerText = Gro.Group_Name_Ar;
                        }
                        else
                        {
                            Group.InnerText = Gro.Group_Name_En;
                        }
                    }

                    if (Employees.Language_id != null && Employees.Language_id > 0)
                    {
                        var Lang = db.LanguageMasters.First(x => x.ID == Employees.Language_id);
                        EmpLanguage.InnerText = Lang.Language_Name;
                        Language.SelectedValue = Employees.Language_id.ToString();
                    }

                    Position.InnerText = EmpStru;
                }

            }
            catch (Exception e) { }
        }

        protected void EmpUpdate_Click(object sender, EventArgs e)
        {
            int calander_id = 0;
            int Lang = 0;
            int.TryParse(Language.SelectedValue, out Lang);
            //if (DateofBirth.Checked) calander_id = 1;
            bool result = AU_Emplooyees(EmployeeId, Employee_Email.Text, Employee_Phone.Text, Lang, calander_id);

            if (result)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  الحالة : ','  تم تحديث البيانات بنجاح ');", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The Update Info was Sucessfully saved in system ! ');", true);

                ViewEmpLoyeeData();
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  الحالة : ','حدث خطأ');", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);

            }
        }

        public bool AU_Emplooyees(int EmployeeID, string Email,string Phone,int lang, int calander)
        {
            bool refresh = false;
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Employee Emp = db.Employees.First(x => x.Employee_Id == EmployeeID);
                Emp.Employee_Email = Email;
                Emp.Employee_Phone = Phone;
                if (lang != Emp.Language_id)
                    refresh = true;
                Emp.Language_id = lang;
                //Emp.Calendar_id = calander;
                string ImagepathProfile = UploadFile(1);
                string ImagepathSignature = UploadFile(2);
                if (ImagepathProfile != "") Emp.Employee_Profile = ImagepathProfile;
                db.Entry(Emp).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Emp, logFileModule.settings);
                logFileModule.logfile(10, "تعديل بيانات الموظف", "Update Employee Info", LogData);
                SessionWrapper.LoggedUser = Emp;
                SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_Id == lang).ToList();
                if (refresh)
                    Response.Redirect("~/Pages/UserManagment/Profile.aspx");
            }
            catch { return false; }
            return true;
        }

        public string UploadFile(int Type)
        {
            string Imagepath = " ";
            switch (Type)
            {
                case 1:
                    if (this.Page.IsValid)
                    {
                        if (!UtilityClass.UploadFileIsValid(ref EmpProfile, UtilityClass.ValidImagesExtentions))
                        {
                            Imagepath = "false";
                        }
                        Imagepath = string.Empty;

                        Imagepath = UtilityClass.UploadFileWithExtention(ref EmpProfile, Server.MapPath(@"~\media\Profile\"));
                    }
                    break;
            }



            return Imagepath;
        }

        protected void ChangeButton_Click(object sender, EventArgs e)
        {
            string PassWord = SessionWrapper.LoggedUser.Employee_Password;
            string pass = StringCipher.Decrypt(PassWord, "Password");
            if (OldPassWord.Text.Equals(pass))
            {
                if (NewPassWord.Text.Equals(TryNewPassWord.Text))
                {
                    db.Configuration.LazyLoadingEnabled = false;
                    Employee Emp = db.Employees.First(x => x.Employee_Id == EmployeeId);
                    string EncryptedPassword = StringCipher.Encrypt(NewPassWord.Text, "Password");
                    Emp.Employee_Password = EncryptedPassword;
                    db.Entry(Emp).State = System.Data.EntityState.Modified;
                    db.SaveChanges();
                    /* Add it to log file */
                    LogData = "data:" + JsonConvert.SerializeObject(Emp, logFileModule.settings);
                    logFileModule.logfile(10, "تعديل كلمة المرور", "Change PassWord", LogData);
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Sالحاله :',' تم تعديل كلمة المرور بنجاح ');", true);
                    else
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The Change PassWord was Sucessfully saved in system ! ');", true);

                }
                else
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  الحالة : ','كلمة المرورة غير متطابقة');", true);
                    else
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Try Agin New PassWord');", true);
                }
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  الحاله : ','كلمة المرور غير صحيحة');", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','The Old PassWord is rong');", true);
            }
        }

        public void translateValidationArabic()
        {
         
            Employee_EmailValidator.Text = "أدخل البريد الإلكتروني";
            Employee_PhoneValidator.Text = "أدخل الهاتف";
            LanguageValidator.Text = "إختر اللغة";

            OldPassWordValidator.Text = "أدخل كلمة المرور";
            NewPassWordValidator.Text = "أدخل كلمة المرور الجديدة";
            TryNewPassWordValidator.Text = "أعادة كلمة المرور الجديدة";


            Employee_Email.Attributes["placeholder"] = "أدخل البريد الإلكتروني";
            Employee_Phone.Attributes["placeholder"] = "أدخل الهاتف";

            OldPassWord.Attributes["placeholder"] = "أدخل كلمة المرور";
            NewPassWord.Attributes["placeholder"] = "أدخل كلمة المرور الجديدة";
            TryNewPassWord.Attributes["placeholder"] = "أعادة كلمة المرور الجديدة";


        }

    }
}