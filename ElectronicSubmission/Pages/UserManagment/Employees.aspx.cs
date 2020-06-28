using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
//using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace ElectronicSubmission.Pages.Treatment
{
    public partial class Employees : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        int EmployeeId = 0;
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Employee> ALLEmployees = new List<Employee>();
        string Encrypted_Password = string.Empty;
        public string name { get; set; }

        protected void Page_PreInit(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (!IsPostBack)
            {
                FillDropDownLists();
            }

            ALLEmployees = db.Employees.ToList();
            UserCard();
            Emp_Language();


        }

        public void Emp_Language()
        {
            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                Groups.DataTextField = "Group_Name_Ar";
                Save.Text = "حفظ";
                AddEmp.InnerText = "إضافة موظف";
                btnSearch.Text = "بحث";
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int Group_id = 0;
            int calander_id = 0;
            int Lang = 0;

            int Emp_ID = 0;
            int.TryParse(EmpID.Value, out Emp_ID);
            int.TryParse(Groups.SelectedValue, out Group_id);
            int.TryParse(Language.SelectedValue, out Lang);
            //if(DateofBirth.Checked) calander_id = 1;
            string EMPN = Employee_Name_Ar.Text;
            bool result = AU_Emplooyees(Emp_ID, EMPN, Employee_Name_En.Text, Employee_Email.Text, Employee_Phone.Text, Active.Checked, Group_id, Lang);

            if (result)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  الحالة : ','  تم حفظ البيانات بنجاح ');", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Employee was Sucessfully saved in system ! ');", true);

               
                   
               

                ALLEmployees = db.Employees.ToList();
                UserCard();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','Error');", true);
            }
        }

        public bool AU_Emplooyees(int EmployeeID, string ArabicName, string EnglishName, string Email, string Phone, bool Active, int GroupID, int lang)
        {

            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Employee Emp = db.Employees.Create();
                if (EmployeeID != 0) Emp = db.Employees.First(x => x.Employee_Id == EmployeeID);
                Emp.Employee_Name_Ar = ArabicName;
                Emp.Employee_Name_En = EnglishName;
                Emp.Employee_Email = Email;
                if (EmployeeID == 0)
                {
                    string New_Password = StringCipher.RandomString(7);
                     Encrypted_Password = StringCipher.Encrypt(New_Password, "Password"); // emp.Employee_Password.ToString();
                    Emp.Employee_Password = Encrypted_Password;
                    
                    /* if (EmailResult)
                     {
                         Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "show_model_sucess();", true);
                     }*/

                    //Send Email
                    string Text = "";
                    string sever_name = Request.Url.Authority.ToString();
                    string StuEmail = Email;
                    SendEmail send = new SendEmail();
                    Text = " <Strong style='font-size:16px;'> Dear " + EnglishName + "</Strong><br /><br /> " + "Now you can access the online admission system through the link: http://registration.riyadh.edu.sa" + " <br /> <br />" + "User Name : "+ Email  + " <br />" + "Password : " + New_Password + " <br /><br />" + "Best Regard," + " <br />" + "Admission System" + " <br />";
                    bool R = send.TextEmail("Riyadh Elm University", StuEmail, Text, sever_name);

                    // Send SMS
                    SendSMS send_sms = new SendSMS();
                    string smsText = "Dear " + EnglishName + "\n" + "Now you can access the online admission system through the link: http://registration.riyadh.edu.sa" + "\n\n" + "User Name : " + Email + "\n" + "Password : " + New_Password + " \n\n" + "Best Regard," + " \n" + "Admission System";
                    string number_Phone = Phone;
                    string reslt_message = send_sms.SendMessage(smsText, number_Phone);
                }
                Emp.Employee_Phone = Phone;
                Emp.Employee_Active = Active;
                Emp.Group_Id = GroupID;
                Emp.Language_id = lang;
                //Emp.Calendar_id = calander;
                string ImagepathProfile = UploadFile(1);
                string ImagepathSignature = UploadFile(2);
                if (ImagepathProfile != "") Emp.Employee_Profile = ImagepathProfile; else if (EmployeeID == 0) Emp.Employee_Profile = "Profile.JPG";
                if (EmployeeID != 0) {
                    db.Entry(Emp).State = System.Data.EntityState.Modified;
                }
                else {
                    db.Employees.Add(Emp);
                }
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Emp, logFileModule.settings);
                if (EmployeeID != 0) {
                    logFileModule.logfile(10, "تعديل بيانات موظف", "update Employee", LogData);
                } else {
                    logFileModule.logfile(10, "إضافة موظف", "Add Employee", LogData);
                }
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




        private void Fillter()
        {
            string val_Fillter = string.Empty;

            if (GroupF.SelectedIndex != 0)
            {
                int id = int.Parse(GroupF.SelectedValue.ToString());
                ALLEmployees = ALLEmployees.Where(x => x.Group_Id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("Employees-Group", "Group") + " : </strong>" + GroupF.SelectedItem + " , ";
            }

            if (LanguageF.SelectedIndex != 0)
            {
                int id = int.Parse(LanguageF.SelectedValue.ToString());
                ALLEmployees = ALLEmployees.Where(x => x.Language_id == id).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("Employees-Language", "Language") + " : </strong>" + LanguageF.SelectedItem + " , ";
            }

            if (ActiveF.Value != null)
            {
                ALLEmployees = ALLEmployees.Where(x => x.Employee_Active == ActiveF.Checked).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("Employees-Active", "Active") + " : </strong>" + ActiveF.Checked + " , ";
            }
            if (Keyword.Text.Trim() != "")
            {
                ALLEmployees = ALLEmployees.Where(x => (x.Employee_Name_Ar != null && x.Employee_Name_Ar.Contains(Keyword.Text.Trim())) || (x.Employee_Name_En != null && x.Employee_Name_En.Contains(Keyword.Text.Trim())) || (x.Employee_Email != null && x.Employee_Email.Contains(Keyword.Text.Trim())) || (x.Employee_Phone != null && x.Employee_Phone.Contains(Keyword.Text.Trim()))).ToList();
                val_Fillter += "<strong>" + FieldNames.getFieldName("AdvancedSearch-Keyword", "Keyword") + " : </strong>" + Keyword.Text + " , ";
            }

            // Create the details of fillter text
            if (val_Fillter != string.Empty)
            {
                val_Fillter = val_Fillter.Substring(0, val_Fillter.Length - 3);
                FilterUsed.Text = val_Fillter + "";
            }
            else
                FilterUsed.Text = "";

            UserCard();
        }


        public void UserCard()
        {
            int i = 0;
            string ImgTag = "";
            string img = "";
            string yourHTMLstring = "";
            string Emp_Name = "";
            UCard.Controls.Clear();
            while (i < ALLEmployees.Count)
            {

                if (ALLEmployees[i].Employee_Profile != "" && ALLEmployees[i].Employee_Profile != null)
                {
                    img = ALLEmployees[i].Employee_Profile.ToString();
                }
                else
                {
                    img = "Profile.jpg";
                }
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Emp_Name = ALLEmployees[i].Employee_Name_Ar.ToString();
                else
                    Emp_Name = ALLEmployees[i].Employee_Name_En.ToString();

                ImgTag = "<img class='img-fluid img-radius'" + "src='../../../../media/Profile/" + img + "'alt='" + img + "'>";
                yourHTMLstring = "<div class='col-lg-6 col-xl-3 col-md-6'>" +
                                               "<div class='card rounded-card user-card'>" +
                                                   "<div class='card-block'>" +
                                                          " <div class='img-hover'>" +
                                                               //"<img class='img-fluid img-radius' src='~/media/Signature/' alt='m.jpg'> " +
                                                               ImgTag +
                                                               "<div class='img-overlay img-radius'>" +
                                                                "   <span>" +
                                                                      " <a class='btn btn-primary btn-outline-primary btn-icon'  id='" + ALLEmployees[i].Employee_Id.ToString() + "'OnClick='showmodel(this)'><i class='icofont icofont-ui-edit text-info h5'></i></a> " +
                                                                     // " <a class='btn btn-danger btn-outline-danger btn-icon'  id='" + ALLEmployees[i].Employee_Id.ToString() + "'OnClick='DeleteEmplooye(this)'><i class='icofont icofont-ui-delete text-danger h5'></i></a> " +
                                                                      " <a class='btn btn-danger btn-outline-danger btn-icon'  id='" + ALLEmployees[i].Employee_Id.ToString() + "' data-href = '" + ALLEmployees[i].Employee_Id.ToString() + "' data-toggle='modal' data-target='#confirm-delete'><i class='icofont icofont-ui-delete text-danger h5'></i></a> " +
                                                                   "</span>" +
                                                               "</div>" +
                                                           "</div>" +
                                                           "<div class='user-content'>" +
                                                               "<h4 class=''>" + Emp_Name + "</h4> " +
                                                          " </div> " +
                                                  " </div>" +
                                              " </div> " +
                                        "</div>";
                UCard.Controls.Add(new LiteralControl(yourHTMLstring));
                i += 1;
            }


        }
        [WebMethod]
        public static string ViewUserCard(int Employee_Id)
        {

            using (var dbcont = new REU_RegistrationEntities())
            {
                var Emplo = dbcont.Employees.Where(d => d.Employee_Id == Employee_Id).Select(x => new EmployeDTO {
                    Employee_Name_Ar = x.Employee_Name_Ar,
                    Employee_Name_En = x.Employee_Name_En,
                    Employee_Id = x.Employee_Id,
                    Employee_Active = x.Employee_Active,
                    Employee_Email = x.Employee_Email,
                    Employee_Password = x.Employee_Password,
                    Employee_Phone = x.Employee_Phone,
                    Employee_Profile = x.Employee_Profile,
                    Language_id = x.Language_id,
                    Group_Id = x.Group_Id,
                }).FirstOrDefault();

                //JavaScriptSerializer js = new JavaScriptSerializer();
                return JsonConvert.SerializeObject(Emplo);
            }
        }

        [WebMethod]
        public static string DeleteEmplooye(int Employee_Id)
        {
            string returnDeleteEmp = "0";
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            try
            {
                REU_RegistrationEntities db = new REU_RegistrationEntities();
                var DelEmp = db.Employees.First(x => x.Employee_Id == Employee_Id);
                db.Employees.Remove(DelEmp);
                db.SaveChanges();
                returnDeleteEmp = "1";
                //  Add it to log file 
                LogData = "data:" + JsonConvert.SerializeObject(DelEmp, logFileModule.settings);
                logFileModule.logfile(10, "حذف الموظف", "Delete Employee", LogData);

            }
            catch (Exception e)
            {
            }
            return JsonConvert.SerializeObject(returnDeleteEmp);
        }

        public void ViewDataEmp()
        {
            if (EmployeeId > 0) {
                var Employeess = db.Employees.First(x => x.Employee_Id == EmployeeId);
                if (Employeess.Employee_Profile != "" && Employeess.Employee_Profile != null) Emp_Profile.ImageUrl = "../../../../media/Profile/" + Employeess.Employee_Profile;
                Employee_Name_Ar.Text = Employeess.Employee_Name_Ar;
                Employee_Name_En.Text = Employeess.Employee_Name_En;
                Employee_Email.Text = Employeess.Employee_Email;
                Employee_Phone.Text = Employeess.Employee_Phone;
                Groups.SelectedValue = Employeess.Group_Id.ToString();
                Active.Checked = bool.Parse(Employeess.Employee_Active.ToString());
            }

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showmodel();", true);
        }

        private void FillDropDownLists()
        {
            // Group dropdown
            List<Group> GroupList = db.Groups.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(GroupF, "Group_Id", "Group_Name_Ar", GroupList, " - الكل -");
            else
                ddlFiller.dropDDL(GroupF, "Group_Id", "Group_Name_En", GroupList, " - All -");

            // Group dropdown
            List<LanguageMaster> LanguageList = db.LanguageMasters.ToList();
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(LanguageF, "ID", "Language_Name", LanguageList, " - الكل -");
            else
                ddlFiller.dropDDL(LanguageF, "ID", "Language_Name", LanguageList, " - All -");

            if (SessionWrapper.LoggedUser.Language_id == 1)
                translateValidationArabic();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Fillter();
        }


        public void translateValidationArabic()
        {
            Employee_Name_ArValidator.Text = "أدخل الإسم بالعربي";
            Employee_Name_EnValidator.Text = "أدخل الإسم بالإنجليزي";
            Employee_EmailValidator.Text = "أدخل البريد الإلكتروني";
            Employee_PhoneValidator.Text = "أدخل الهاتف";
            GroupsValidator.Text = "إختر المجموعة";
            LanguageValidator.Text = "إختر اللغة";

            Employee_Name_Ar.Attributes["placeholder"] = "أدخل الإسم بالعربي";
            Employee_Name_En.Attributes["placeholder"] = "أدخل الإسم بالإنجليزي";
            Employee_Email.Attributes["placeholder"] = "أدخل البريد الإلكتروني";
            Employee_Phone.Attributes["placeholder"] = "أدخل الهاتف";
            Keyword.Attributes["placeholder"] = "الإسم أو الهاتف أو البريدالإلكتروني";


        }


     }
}