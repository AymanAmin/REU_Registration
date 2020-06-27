using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicSubmission.Pages.RegistrationProcess;
using static ElectronicSubmission.Enums;
using Newtonsoft.Json;
using System.IO;

namespace ElectronicSubmission
{
    
    public partial class StudentSubmitting : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        int StudentID = 0;
        int StatusId = 0;
        float totalSum = 0;
        string Trackingkey = string.Empty;
        int Student_Id = 0;
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        List<Employee> ALLEmployees = new List<Employee>();

        float HighSchoolTotal = 100;
        float CapabilitiesTotal = 100;
        float MyAchievementTotal = 100;
        public int langId = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                    ini();
                    if (!IsPostBack)
                    {
                        FillDropDownLists();
                         if (Session["Success"] != null)
                         {
                                if (langId == 1)
                                {
                                   if(Request["Trackingkey"] == null)
                                      Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('تم التقديم بنجاح', 'تم التقديم الرسالة بنجاح سيتم التواصل معك قريباَ', 'success');", true);
                                   else
                                      Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('تم التعديل بنجاح', 'تم تعديل البيانات بنجاح', 'success');", true);
                                }
                                else
                                {
                                    if (Request["Trackingkey"] == null)
                                       Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('Submitted successfully!', 'The message has been Submitted successfully. You will be contacted soon', 'success');", true);
                                    else
                                       Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('updated successfully!', 'The message has been updated successfully. You will be contacted soon', 'success');", true);
                                }


                                Session["Success"] = null;
                         }else 
                         if (Session["UpdateSuccess"] != null)
                          {
                                    if (langId == 1)
                                    {
                                       Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('تم التعديل بنجاح', 'تم تعديل البيانات بنجاح', 'success');", true);
                                    }
                                    else
                                    {
                                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('updated successfully!', 'The message has been updated successfully. You will be contacted soon', 'success');", true);
                                    }
                                Session["UpdateSuccess"] = null;
                          }

                            if (StudentID == 0) Nationality_ID.SelectedValue = "191";
                            if (StudentID != 0) ViewDataStudent(StudentID);
                    }
            }catch(Exception s)
            {

            }

        }

        public void ini() {

            if (Request["Trackingkey"] != null)
            {

                Trackingkey = Request["Trackingkey"];
                Payment_Process payment = db.Payment_Process.Where(x => x.Payment_Trackingkey == Trackingkey).FirstOrDefault();
                if (payment != null)
                {
                    int.TryParse(payment.Student_Id.ToString(), out StudentID);

                    Student StudInfo = db.Students.Where(x => x.Student_Id == StudentID && x.Student_Status_Id == 4).FirstOrDefault();
                    if (StudInfo != null)
                    {
                        Div_invalid.Visible = false;
                        SubmittingForm.Visible = true;
                        HighSchoolDegreeFileValidator.Enabled = false;
                        CapabilitiesDegreeFileValidator.Enabled = false;
                        MyAchievementDegreeFileValidator.Enabled = false;
                        StudentSSNFileValidator.Enabled = false;
                    }
                    else
                    {
                        StudentID = 0;
                        Div_invalid.Visible = true;
                        SubmittingForm.Visible = false;
                    }
                }
                else
                {
                    Div_invalid.Visible = true;
                    SubmittingForm.Visible = false;
                }
            }
            else
            {
            }

            langId = 0;
            if (int.TryParse(Request["lang"], out langId) && langId > 0)
            {
                Session["lang"] = langId;
            }
            else
            {
                if (Session["lang"] == null)
                {
                    langId = 2;
                    Session["lang"] = langId;
                }
                else
                {
                    langId = int.Parse(Session["lang"].ToString());
                }
            }

            SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_Id == langId).ToList();
            translateArabic();
            SessionWrapper.LanguageHome = langId;
            getStyleScript();

        }

        private void getStyleScript()
        {
            StyleRTL.Text = FieldNames.getSTyleRTLHome();
            ScriptRTL.Text = FieldNames.getJavaScriptRTLHome();
        }


        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                int Stu_ID, Res_id, Spec_id, Nat_id = 0;
                DateTime RegDate = DateTime.Now;
                float HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg = 0;
                bool result = false;

                int.TryParse(Resource_ID.SelectedValue, out Res_id);
                int.TryParse(Specialization_ID.SelectedValue, out Spec_id);
                int.TryParse(Nationality_ID.SelectedValue, out Nat_id);

                float.TryParse(HighSchoolDegree.Text, out HighSchoolDeg);
                float.TryParse(CapabilitiesDegree.Text, out CapabilitiesDeg);
                float.TryParse(MyAchievementDegree.Text, out MyAchievementDeg);


                bool ToCheckPercent = SpecializationPercent(Spec_id, HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg);
                if (ToCheckPercent)
                {
                    result = IU_Student(StudentID, StudentNameAr.Text, StudentNameEn.Text, stuProfile, StudentEmail.Text, StudentPhone.Text, Address.Text, RegDate, Student_SSN.Text, HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg, Res_id, Spec_id, Nat_id, totalSum);
                    if (result)
                    {
                        if (StudentID == 0)
                        {
                            string Text = "";
                            string sever_name = Request.Url.Authority.ToString();
                            string StuEmail = StudentEmail.Text;
                            SendEmail send = new SendEmail();
                            Text = " <Strong style='font-size:16px;'> Dear " + StudentNameEn.Text + "</Strong><br /><br /> " + "Thank you for completed the application from at Riyadh Elm University. We will contact you within 48 hours." + " <br /> <br />" + "Best Regard," + " <br />" + "Admission System" + " <br /> ";
                            bool R = send.TextEmail("Riyadh Elm University", StuEmail, Text, sever_name);
                            SaveMessage(Student_Id, "E-mail", Text);


                            // Send SMS
                            SendSMS send_sms = new SendSMS();
                            string smsText = "Dear " + StudentNameEn.Text + "\n" + "Thank you for completed the application form at Riyadh Elm University. We will contact you within 48 hours." + " \n" + "Best Regard," + " \n" + "Admission System";
                            string number_Phone = StudentPhone.Text;
                            string reslt_message = send_sms.SendMessage(smsText, number_Phone);
                            SaveMessage(Student_Id, "SMS", Text);
                        }
                         if(StudentID == 0) Session["Success"] = true; else Session["UpdateSuccess"] = true;
                        
                        /*if (langId == 1)
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('تم التقديم بنجاح', 'تم التقديم الرسالة بنجاح سيتم التواصل معك قريباَ', 'success');", true);
                        else
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('Submitted successfully!', 'The message has been Submitted successfully. You will be contacted soon', 'success');", true);
                            */
                        Response.Redirect("~/StudentSubmitting.aspx");
                    }
                    else
                    {
                        if (langId == 1)
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('لقد قمت بالتقديم مسبقاً', 'يوجد تقديم مسبق مطابقاً لرقم الهوية', 'error');", true);
                        else
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('You have already applied', 'There is a pre-submission matched to the SSN number', 'error');", true);

                    }
                }
                else
                {
                    // Session["Warning"] = true; Response.Redirect("~/StudentSubmitting.aspx");
                    if (langId == 1)
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('غير مستوفي النسبة المطلوبة !', 'إختر التخصص المناسب', 'error');", true);
                    else
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('The required percentage is not met !', 'Choose the appropriate major, not this!', 'error');", true);

                }
            }
            catch (Exception x) { }
        }

        public bool IU_Student(int StudentID, string ArabicName, string EnglishName, FileUpload StProfile, string Email, string Phone, string StuAddress, DateTime RegistrationDate, string StudentSSN, float HighSchoolDeg, float CapabilitiesDeg, float MyAchievementDeg, int ResourceID, int SpecializationID, int NationalityID, float StudentTotal)
        {

            try
            {
                 Student_Id = 0;
                db.Configuration.LazyLoadingEnabled = false;
                Student Stu = db.Students.Create();
                if (StudentID != 0) Stu = db.Students.First(x => x.Student_Id == StudentID);
                Stu.Student_Name_Ar = ArabicName;
                Stu.Student_Name_En = EnglishName;
                Stu.Student_Email = Email;
                Stu.Student_Phone = Phone;
                Stu.Student_Address = StuAddress;
                Stu.Student_CreationDate = RegistrationDate;
                Stu.Student_SSN = StudentSSN;
                Stu.Student_High_School_Degree = HighSchoolDeg.ToString();
                Stu.Student_Capabilities_Degree = CapabilitiesDeg.ToString();
                Stu.Student_My_Achievement_Degree = MyAchievementDeg.ToString();
                Stu.Student_Resource_Id = ResourceID;
                Stu.Student_Specialization_Id = SpecializationID;
                Stu.Student_Nationality_Id = NationalityID;
                Stu.Student_Total = StudentTotal.ToString();
                Stu.Suspended = 0;
                if (StudentID == 0) Stu.Student_Status_Id = 1;
                string ImegProfile = UploadFile(StProfile, @"~\media\StudentProfile\");
                if (ImegProfile != "") Stu.Student_Image_Profile = ImegProfile; else if (StudentID == 0) Stu.Student_Image_Profile = "Profile.JPG";

                if (StudentID != 0)
                {
                    db.Entry(Stu).State = System.Data.EntityState.Modified;
                }
                else
                {
                    db.Students.Add(Stu);
                }
                db.SaveChanges();
                if (StudentID != 0)
                {
                    Student_Id = StudentID;
                }
                else
                {
                    Student_Id = Stu.Student_Id;
                }
              
            
                string SSSNFile = UploadFile(Student_Id, (int)FileType.Nationality, StudentSSNFile, @"~\media\StudentAttachments\");

                string HSFile = UploadFile(Student_Id, (int)FileType.High_School,HighSchoolDegreeFile, @"~\media\StudentAttachments\");

                string CAFile = UploadFile(Student_Id, (int)FileType.Capabilities,CapabilitiesDegreeFile, @"~\media\StudentAttachments\");

                string MAfile = UploadFile(Student_Id, (int)FileType.My_Achievement,MyAchievementDegreeFile, @"~\media\StudentAttachments\");

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Stu, logFileModule.settings);
                if (StudentID != 0)
                {
                    logFileModule.logfile(10, "تعديل بيانات الطالب", "Update Student", LogData);
                }
                else
                {
                    logFileModule.logfile(10, "إضافة طالب", "Add Student", LogData);
                }
            }
            catch { return false; }
            return true;
        }

        public string UploadFile(FileUpload Uplofile, string Path)
        {
            string Imagepath = "";
            try
            {
                if (this.Page.IsValid)
                {
                    if (!UtilityClass.UploadFileIsValid(ref Uplofile, UtilityClass.ValidImagesExtentions))
                    {
                        Imagepath = "false";
                    }
                    Imagepath = string.Empty;

                    Imagepath = UtilityClass.UploadFileWithExtention(ref Uplofile, Server.MapPath(Path));
                }
            }
            catch (Exception e) { }
            return Imagepath;
        }

        public string UploadFile(int StudentID,int type,FileUpload Uplofile, string Path)
        {
            string Imagepath = string.Empty;
            try
            {
                foreach (HttpPostedFile postfiles in Uplofile.PostedFiles)
                {

                    if (this.Page.IsValid)
                    {
                        if (!UtilityClass.UploadFileIsValid(ref Uplofile, UtilityClass.ValidImagesExtentions))
                        {
                            Imagepath = string.Empty;
                        }
                        Imagepath = string.Empty;

                        Imagepath = UtilityClass.UploadFileWithExtention(ref Uplofile, Server.MapPath(Path));
                        if(Imagepath != string.Empty) { 
                            File Fil = db.Files.Create();
                            Fil.Student_Id = StudentID;
                            Fil.File_Name = Imagepath;
                            Fil.File_Path = Imagepath;
                            Fil.Type = type;
                            Fil.DateCreation = DateTime.Now;
                            db.Files.Add(Fil);
                            db.SaveChanges();
                        }
                    }
                }
            }
            catch (Exception e) { }
            return Imagepath;
        }

        public void ViewDataStudent(int StudentId)
        {
            try
            {
                if (StudentId > 0)
                {
                    var Student = db.Students.First(x => x.Student_Id == StudentId);
                    Stu_Profile.ImageUrl = "media/StudentProfile/" + Student.Student_Image_Profile;
                    StudentNameAr.Text = Student.Student_Name_Ar;
                    StudentNameEn.Text = Student.Student_Name_En;
                    StudentEmail.Text = Student.Student_Email;
                    StudentPhone.Text = Student.Student_Phone;
                    Address.Text = Student.Student_Address;
                    Student_SSN.Text = Student.Student_SSN;
                    HighSchoolDegree.Text = Student.Student_High_School_Degree;
                    CapabilitiesDegree.Text = Student.Student_Capabilities_Degree;
                    MyAchievementDegree.Text = Student.Student_My_Achievement_Degree;
                    Resource_ID.SelectedValue = Student.Student_Resource_Id.ToString();
                    Nationality_ID.SelectedValue = Student.Student_Nationality_Id.ToString();
                    Specialization_ID.SelectedValue = Student.Student_Specialization_Id.ToString();
                    //Note.InnerText = Student.Notes;
                    LoadStudentFiles(StudentId);
                }
            }
            catch (Exception e) { }
        }

        private void LoadStudentFiles(int Student_Id)
        {
            try
            {
                string str = string.Empty, FileName = string.Empty;
                int Nationality_Counter = 0, Capabilities_Counter = 0, High_School_Counter = 0, My_Achievement_Counter = 0;
                int Current_Counter = 1;
                List<File> List_File = db.Files.Where(x => x.Student_Id == Student_Id).OrderBy(x => x.Type).ToList();
                for (int i = 0; i < List_File.Count; i++)
                {
                    string fileType = string.Empty;
                    if (List_File[i].Type == (int)FileType.Nationality) { fileType = FieldNames.getFieldName("View-Nationality", "Nationality"); Current_Counter = Nationality_Counter = Nationality_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Capabilities) { fileType = FieldNames.getFieldName("View-Capabilities", "Capabilities"); Current_Counter = Capabilities_Counter = Capabilities_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.High_School) { fileType = FieldNames.getFieldName("View-HighSchool", "High School"); Current_Counter = High_School_Counter = High_School_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.My_Achievement) { fileType = FieldNames.getFieldName("View-MyAchievement", "My Achievement"); Current_Counter = My_Achievement_Counter = My_Achievement_Counter + 1; }
                    str += "<tr>" +
                           "<td>" +
                           "" + fileType + " " + Current_Counter + "" +
                           "</td>" +
                           "<td>" + fileType + " </td>";
                        str += "<td><a href = '../../../../media/StudentAttachments/" + List_File[i].File_Path + "' target='_blank' style='font-size: x-large; color: blue;'><i class='icofont icofont-eye-alt'></i></a></td>" +
                          "</tr>";
                }
                txtFiles.Text = str;
                FileTable.Visible = true;
            }
            catch { }
        }

        public void ClearForm()
        {
            try
            {
                Stu_Profile.ImageUrl = "../../../../media/StudentProfile/Profile.JPG";
                StudentNameAr.Text = string.Empty;
                StudentNameEn.Text = string.Empty;
                StudentEmail.Text = string.Empty;
                StudentPhone.Text = string.Empty;
                Address.Text = string.Empty;
                Student_SSN.Text = string.Empty;
                HighSchoolDegree.Text = string.Empty;
                CapabilitiesDegree.Text = string.Empty;
                MyAchievementDegree.Text = string.Empty;
                Resource_ID.SelectedValue = "0";
                Nationality_ID.SelectedValue = "0";
                Specialization_ID.SelectedValue = "0";
                StatusId = 0;
                StudentID = 0;
            }
            catch (Exception e) { }
        }

        private void FillDropDownLists()
        {
            try
            {
                // Group dropdown
                List<Resource> ResourceList = db.Resources.ToList();
                if (langId == 1)
                    ddlFiller.dropDDL(Resource_ID, "ResourceID", "Resource_Name_Ar", ResourceList, " - إختر المصدر -");
                else
                    ddlFiller.dropDDL(Resource_ID, "ResourceID", "Resource_Name_En", ResourceList, " - Select Resource -");

                // Group dropdown
                List<Specialization> SpecializationList = db.Specializations.ToList();
                if (langId == 1)
                    ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_Ar", SpecializationList, " - إختر التخصص -");
                else
                    ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_En", SpecializationList, " - Select Specialization -");

                // Group dropdown
                List<Nationality> NationalityList = db.Nationalities.ToList();
                if (langId == 1)
                    ddlFiller.dropDDL(Nationality_ID, "Nationality_Id", "Nationality_Name_Ar", NationalityList, " - إختر الجنسية -");
                else
                    ddlFiller.dropDDL(Nationality_ID, "Nationality_Id", "Nationality_Name_En", NationalityList, " - Select Nationality -");

                if (langId == 1)
                    Save.Text = "حفظ";

                if (langId == 1)
                    translateValidationArabic();
            }
            catch (Exception e) { }

        }



        public bool SpecializationPercent(int Specialization_id, float HighSchoolDegre, float CapabilitiesDegre, float MyAchievementDegre)
        {
            float WeightedRatioPercent = 0;
            float HighSchoolPercent, CapabilitiesPercent, MyAchievementPercent = 0;
            float HighSchoolPercent2, CapabilitiesPercent2, MyAchievementPercent2 = 0;
            try
            {

                var SpecList = db.Specializations.FirstOrDefault(x => x.Specialization_Id == Specialization_id);

                HighSchoolPercent = (HighSchoolDegre / HighSchoolTotal) * 100;
                CapabilitiesPercent = (CapabilitiesDegre / CapabilitiesTotal) * 100;
                MyAchievementPercent = (MyAchievementDegre / MyAchievementTotal) * 100;

                HighSchoolPercent2 = (HighSchoolPercent * int.Parse(SpecList.High_School_Percent)) / 100;
                CapabilitiesPercent2 = (CapabilitiesPercent * int.Parse(SpecList.Capabilities_Percent)) / 100;
                MyAchievementPercent2 = (MyAchievementPercent * int.Parse(SpecList.My_Achievement_Percent)) / 100;

                float.TryParse(SpecList.Weighted_Ratio_Percent, out WeightedRatioPercent);

                totalSum = HighSchoolPercent2 + CapabilitiesPercent2 + MyAchievementPercent2;
            }catch (Exception e) { }
            if (totalSum < WeightedRatioPercent) return false;

            return true;
        }

        private void translateArabic()
        {
            if (langId == 1)
            {
                AdmissionFormButton.Value = "الرجاء تعبئة إستمارة التقديم";
            }
            else
            {
                AdmissionFormButton.Value = "Please fill the application Form";
            }
        }
        
        public void translateValidationArabic()
        {
            //Stu_ProfileValidator.Text = "إختر الصورة الشخصية";
            StudentNameArValidator.Text = "الرجاء إدخال الإسم بالعربي";
            StudentNameEnValidator.Text = "الرجاء إدخال الإسم بالانجليزي";
            StudentEmailValidator.Text = "الرجاء إدخال البريد الإلكتروني";
            StudentPhoneValidator.Text = "الرجاء إدخال رقم الهاتف";
            AddressValidator.Text = "الرجاء إدخال العنوان";
            StudentSSNFileValidator.Text = "الرجاء إرفاق الهوية";
            Student_SSNValidator.Text = "الرجاء إدخال رقم الهوية";
            HighSchoolDegreeValidator.Text = "الرجاء إدخال درجات الشهادة الثانوية";
            CapabilitiesDegreeValidator.Text = "الرجاء إدخال درجات القدرات";
            MyAchievementDegreeValidator.Text = "الرجاء إدخال درجات التحصيلي";
            HighSchoolDegreeFileValidator.Text = "الرجاء إرفق الشهادة الثانوية";
            CapabilitiesDegreeFileValidator.Text = "الرجاء إرفاق شهادة القدرات";
            MyAchievementDegreeFileValidator.Text = "الرجاء إرفاق شهادة التحصيلي";
            Resource_IDValidator.Text = "إختر المصدر";
            Nationality_IDValidator.Text = "إختر الجنسية";
            Specialization_IDValidator.Text = "إختر التخصص";

            StudentNameAr.Attributes["placeholder"] = "أدخل الاسم بالعربي";
            StudentNameEn.Attributes["placeholder"] = "أدخل الأسم بالانجليزي";
            StudentEmail.Attributes["placeholder"] = "أدخل البريد الإلكتروني";
            StudentPhone.Attributes["placeholder"] = "05xxxxxxxx";
            Address.Attributes["placeholder"] = "أدخل العنوان";
            Student_SSN.Attributes["placeholder"] = "أدخل رقم الهوية";
            HighSchoolDegree.Attributes["placeholder"] = "أدخل درجة الشهادة الثانوية";
            CapabilitiesDegree.Attributes["placeholder"] = " أدخل درجة القدرات";
            MyAchievementDegree.Attributes["placeholder"] = "أدخل درجة التحصيلي";
        }

        public void SaveMessage(int student_id, string MessageType, string Message)
        {
            Student_Other_Info std_OI = db.Student_Other_Info.Create();
            std_OI.Student_Id = student_id;
            std_OI.MessageType = MessageType;
            std_OI.Message = Message;
            std_OI.DateCreation = DateTime.Now;
            std_OI.Note = "";
            db.Student_Other_Info.Add(std_OI);
            db.SaveChanges();
        }
    }
}