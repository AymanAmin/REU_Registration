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
        public string EnglishDegree = "0";


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request["Student_Id"] != null) { int.TryParse(Request["Student_Id"], out StudentID); Session["Terms"] = true; }

                if (!IsPostBack)
                {
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


                    FillDropDownLists();
                    if (Session["Success"] != null)
                    {
                        if (langId == 1)
                        {
                            if (Request["Student_Id"] == null)
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('تم التقديم بنجاح', 'تم التقديم الرسالة بنجاح سيتم التواصل معك قريباَ', 'success');", true);
                            else
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('تم التعديل بنجاح', 'تم تعديل البيانات بنجاح', 'success');", true);
                        }
                        else
                        {
                            if (Request["Student_Id"] == null)
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('Submitted successfully!', 'The message has been Submitted successfully. You will be contacted soon', 'success');", true);
                            else
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('updated successfully!', 'The message has been updated successfully. You will be contacted soon', 'success');", true);
                        }


                        Session["Success"] = null;
                    }
                    else
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
                    else
                    if (Request["Student_Id"] == null && Session["Terms"] == null)
                        Response.Redirect("~/Payment/TermsAndConditions.aspx");

                    if (StudentID == 0) Nationality_ID.SelectedValue = "191";
                    ini();
                }
            }
            catch (Exception s)
            {

            }

        }

        //------------------------------------ini-------------------------------------
        public void ini()
        {

            if (Request["Student_Id"] != null)
            {

                int.TryParse(Request["Student_Id"], out StudentID);

                Student StudInfo = db.Students.Where(x => x.Student_Id == StudentID ).FirstOrDefault();
                if (StudInfo != null)
                {
                    HighSchoolDegreeFileValidator.Enabled = false;
                    CapabilitiesDegreeFileValidator.Enabled = false;
                    MyAchievementDegreeFileValidator.Enabled = false;
                    StudentSSNFileValidator.Enabled = false;
                    SAT1Validator.Enabled = false;
                    SAT2Validator.Enabled = false;
                    DiplomaValidator.Enabled = false;
                    DescriptionofcoursesValidator.Enabled = false;
                    AcadimecRegsterationValidator.Enabled = false;
                    SAHSCValidator.Enabled = false;
                    EnglishCertificateValidator.Enabled = false;
                    ContractFilesValidator.Enabled = false;
                    EnglishTestDegreeValidator.Enabled = false;
                    HighSchoolDateValidator.Enabled = false;

                    if(StudInfo.Student_Status_Id == 4)
                    {
                        Div_invalid.Visible = false;
                        SubmittingForm.Visible = true;
                        Contract_Div.Visible = false;
                        if (StudentID != 0) ViewDataStudent(StudentID);
                    }
                    else if(StudInfo.Student_Status_Id ==16)
                    {
                        ContractFilesValidator.Enabled = true;
                        Contract_Div.Visible = true;
                        Div_invalid.Visible = false;
                        SubmittingForm.Visible = false;
                        if (StudentID != 0) ViewDataStudent(StudentID);
                    }
                    else
                    {
                        Div_invalid.Visible = true;
                        SubmittingForm.Visible = false;
                        Contract_Div.Visible = false;
                        FileTable.Visible = false;
                    }

                }
                else
                {
                    StudentID = 0;
                    Div_invalid.Visible=true;
                    SubmittingForm.Visible=false;
                    FileTable.Visible = false;
                }

            }
            else
            {
            }

          

        }

        //------------------------------------Fill DropDown-------------------------------------
        private void FillDropDownLists()
        {
            try
            {

                // Group dropdown
                List<Student_Type> Student_TypeList = db.Student_Type.ToList();
                if (langId == 1)
                    ddlFiller.dropDDL(StudentType, "Student_Type_Id", "Student_Type_Name_Ar", Student_TypeList, " - إختر نوع الطالب -");
                else
                    ddlFiller.dropDDL(StudentType, "Student_Type_Id", "Student_Type_Name_En", Student_TypeList, " - Select Student Type -");

                // Group dropdown
                List<Resource> ResourceList = db.Resources.ToList();
                if (langId == 1)
                    ddlFiller.dropDDL(Resource_ID, "ResourceID", "Resource_Name_Ar", ResourceList, " - إختر المصدر -");
                else
                    ddlFiller.dropDDL(Resource_ID, "ResourceID", "Resource_Name_En", ResourceList, " - Select Resource -");


                // Group dropdown
                List<Specialization> SpecializationList = db.Specializations.Where(x => x.Specialization_Suspend != true).ToList();
                if (langId == 1)
                    ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_Ar", SpecializationList, " - إختر التخصص -");
                else
                    ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_En", SpecializationList, " - Select Specialization -");

                // Group dropdown
               // List<Specialization> SpecializationList2 = db.Specializations.Where(x => x.Specialization_Suspend != true).ToList();
                if (langId == 1)
                    ddlFiller.dropDDL(Specialization_ID2, "Specialization_Id", "Specialization_Name_Ar", SpecializationList, " - إختر التخصص -");
                else
                    ddlFiller.dropDDL(Specialization_ID2, "Specialization_Id", "Specialization_Name_En", SpecializationList, " - Select Specialization -");

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

        //------------------------------------Style-------------------------------------

        private void getStyleScript()
        {
            StyleRTL.Text = FieldNames.getSTyleRTLHome();
            ScriptRTL.Text = FieldNames.getJavaScriptRTLHome();
        }

        //------------------------------------Save-------------------------------------

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                int Stu_ID, Res_id, Spec_id,Spec_id2, Nat_id, Stu_type_Id, Eng_Test_Id,GPA_Id,Edu_Type = 0;
                DateTime RegDate = DateTime.Now;
                float HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg, Eng_Test_Deg = 0;
                bool result = false;
                bool ToCheckPercent = false;
                string ErorrMsg= "";

                int.TryParse(StudentType.SelectedValue, out Stu_type_Id);
                int.TryParse(Resource_ID.SelectedValue, out Res_id);
                int.TryParse(Specialization_ID.SelectedValue, out Spec_id);
                int.TryParse(Specialization_ID2.SelectedValue, out Spec_id2);
                int.TryParse(Nationality_ID.SelectedValue, out Nat_id);
                int.TryParse(EnglishTest.SelectedValue, out Eng_Test_Id);
                int.TryParse(GPA.SelectedValue, out GPA_Id);
                int.TryParse(EducationType.SelectedValue, out Edu_Type);

                float.TryParse(HighSchoolDegree.Text, out HighSchoolDeg);
                float.TryParse(CapabilitiesDegree.Text, out CapabilitiesDeg);
                float.TryParse(MyAchievementDegree.Text, out MyAchievementDeg);
                float.TryParse(EnglishTestDegree.Text, out Eng_Test_Deg);



                switch (Stu_type_Id)
                {
                    //----------------------- New student ------------------------------
                    case 1:
                        if (Edu_Type != 1)ToCheckPercent = true; else ToCheckPercent = SpecializationPercent(Spec_id, HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg);
                        break;
                    //----------------------- Tajseer student ------------------------------
                    case 2:
                        if (Eng_Test_Id != 1 && Eng_Test_Id != 5) ToCheckPercent = TOFEL_Test(Eng_Test_Id, Eng_Test_Deg); else ToCheckPercent = true;
                        break;
                    //----------------------- Mohawl student ------------------------------
                    case 3:
                        ToCheckPercent = GPA_Degree(Spec_id, GPA_Id);
                        break;
                    //----------------------- End Mohwal student ------------------------------

                    default:
                        ToCheckPercent = false;
                        break;
                }

                if (ToCheckPercent)
                {
                    result = IU_Student(StudentID, StudentNameAr.Text, StudentNameEn.Text, stuProfile, StudentEmail.Text, StudentPhone.Text, Address.Text, RegDate, Student_SSN.Text, HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg, Stu_type_Id, Res_id, Spec_id, Spec_id2, Nat_id, totalSum);
                    if (result)
                    {
                        if (StudentID == 0)
                        {
                            string Text = "";
                            string sever_name = Request.Url.Authority.ToString();
                            string StuEmail = StudentEmail.Text;
                            SendEmail send = new SendEmail();
                            Text = " <Strong style='font-size:16px;'> Dear " + StudentNameEn.Text + "</Strong><br /><br /> " + "Thank you for your interest and desire to join Riyadh Elm University. We will contact you within 48 hours." + " <br /> <br />" + "Best Regard," + " <br />" + "Admission System" + " <br /> ";
                            bool R = send.TextEmail("Riyadh Elm University", StuEmail, Text, sever_name);
                            SaveMessage(Student_Id, "E-mail", Text);


                            // Send SMS
                            SendSMS send_sms = new SendSMS();
                            string smsText = "Dear " + StudentNameEn.Text + "\n\n" + "Thank you for your interest and desire to join Riyadh Elm University. We will contact you within 48 hours." + " \n\n" + "Best Regard," + " \n" + "Admission System";
                            string number_Phone = StudentPhone.Text;
                            string reslt_message = send_sms.SendMessage(smsText, number_Phone);
                            SaveMessage(Student_Id, "SMS", Text);
                        }
                        if (StudentID == 0) Session["Success"] = true; else Session["UpdateSuccess"] = true;

                        Response.Redirect("~/StudentSubmitting.aspx");
                    }
                    else
                    {
                        ErorrMsg = "";
                        if (langId == 1)
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('لقد قمت بالتقديم مسبقاً', 'يوجد تقديم مسبق مطابقاً لرقم الهوية', 'error');", true);
                        else
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('You have already applied', 'There is a pre-submission matched to the SSN number', 'error');", true);

                    }
                }
                else
                {
                   
                    switch (Stu_type_Id)
                    {
                        //----------------------- New student ------------------------------
                        case 1:
                            if (langId == 1)
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('غير مستوفي النسبة المطلوبة !', 'إختر التخصص المناسب', 'error');", true);
                            else
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('The required percentage is not met !', 'Choose the appropriate major, not this!', 'error');", true);
                            break;
                        //----------------------- Tajseer student ------------------------------
                        case 2:
                            if (langId == 1)
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('درجة إمتحان التوفل اقلة من المطلوب (" + EnglishDegree + ")!', 'لا يمكن إكمال التقديم', 'error');", true);
                            else
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('Submission cannot be completed !', 'TOEFL score less than required (" + EnglishDegree + ")!', 'error');", true);
                            break;
                        //----------------------- Mohawl student ------------------------------
                        case 3:
                            if (langId == 1)
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('المعدل التراكمي اقلة من المطلوب !', 'لا يمكن إكمال التقديم', 'error');", true);
                            else
                                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('Submission cannot be completed !', 'GPA is lower than required!', 'error');", true);
                            break;
                        //----------------------- End Mohwal student ------------------------------

                        default:
                            ToCheckPercent = false;
                            break;
                    }
                    StudentType.SelectedValue = "0";
                }
            }
            catch (Exception x) { }
        }

        //------------------------------------Insert Update Student-------------------------------------

        public bool IU_Student(int StudentID, string ArabicName, string EnglishName, FileUpload StProfile, string Email, string Phone, string StuAddress, DateTime RegistrationDate, string StudentSSN, float HighSchoolDeg, float CapabilitiesDeg, float MyAchievementDeg, int Stu_Type, int ResourceID, int SpecializationID, int SpecializationID2, int NationalityID, float StudentTotal)
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
                Stu.Student_Type_Id = Stu_Type;
                Stu.Student_Resource_Id = ResourceID;
                Stu.Student_Specialization_Id = SpecializationID;
                if(SpecializationID2 >0) Stu.Student_Specialization_2_Id = SpecializationID2;
                Stu.Student_Nationality_Id = NationalityID;
                Stu.Student_Total = StudentTotal.ToString();
                Stu.Suspended = 0;
                if (StudentID == 0) Stu.Student_Status_Id = 1; else Stu.Student_Status_Id = 3;
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


                if (StudentSSNFile != null) AttachmentFile(Student_Id, (int)FileType.Nationality, StudentSSNFile, @"~\media\StudentAttachments\");

                if (HighSchoolDegreeFile != null) AttachmentFile(Student_Id, (int)FileType.High_School, HighSchoolDegreeFile, @"~\media\StudentAttachments\");

                if (CapabilitiesDegreeFile != null) AttachmentFile(Student_Id, (int)FileType.Capabilities, CapabilitiesDegreeFile, @"~\media\StudentAttachments\");

                if (MyAchievementDegreeFile != null) AttachmentFile(Student_Id, (int)FileType.My_Achievement, MyAchievementDegreeFile, @"~\media\StudentAttachments\");

                if (SAT1 != null) AttachmentFile(Student_Id, (int)FileType.SAT1, SAT1, @"~\media\StudentAttachments\");

                if (SAT2 != null) AttachmentFile(Student_Id, (int)FileType.SAT2, SAT2, @"~\media\StudentAttachments\");

                if (Diploma != null) AttachmentFile(Student_Id, (int)FileType.Diploma, Diploma, @"~\media\StudentAttachments\");

                if (AcadimecRegsteration != null) AttachmentFile(Student_Id, (int)FileType.Acadimec_Regsteration, AcadimecRegsteration, @"~\media\StudentAttachments\");

                if (SAHSC != null) AttachmentFile(Student_Id, (int)FileType.Classification_Authority, SAHSC, @"~\media\StudentAttachments\");

                if (Descriptionofcourses != null) AttachmentFile(Student_Id, (int)FileType.Description_of_Courses, Descriptionofcourses, @"~\media\StudentAttachments\");

                if (EnglishCertificate != null) AttachmentFile(Student_Id, (int)FileType.English_Test, EnglishCertificate, @"~\media\StudentAttachments\");

                

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

        //------------------------------------Start Upload File-------------------------------------
        public void AttachmentFile(int StudentID, int type, FileUpload Uplofile, string Path)
        {
            foreach (HttpPostedFile postfiles in Uplofile.PostedFiles)
            {
                if (postfiles.ContentLength > 0 && postfiles.FileName != "")
                {
                    File Fil = db.Files.Create();
                    Fil.Student_Id = StudentID;
                    Fil.File_Name = postfiles.FileName;
                    Fil.File_Path = UploadFile(postfiles, Path);
                    Fil.Type = type;
                    Fil.DateCreation = DateTime.Now;
                    db.Files.Add(Fil);
                    db.SaveChanges();
                }
            }
        }

        public string UploadFile(HttpPostedFile fileAttach, string Path)
        {
            string Imagepath = string.Empty;
           
                if (!UtilityClass.UploadFileIsValid(ref fileAttach, UtilityClass.ValidFileExtentions))
                {
                    //ltrMessage.Text = "<div class='alert alert-danger fade in'><strong>Images only allowed !</strong></div>";
                    Imagepath = "false";
                }
                Imagepath = string.Empty;

                Imagepath = UtilityClass.UploadFilePostedFile(ref fileAttach, Server.MapPath(Path));
            
            return Imagepath;
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

        //------------------------------------End Upload File-------------------------------------




        //------------------------------------View Data-------------------------------------
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
                    A_Name.Text = Student.Student_Name_Ar;
                    E_Name.Text = Student.Student_Name_En;
                    StudentEmail.Text = Student.Student_Email;
                    StudentPhone.Text = Student.Student_Phone;
                    Address.Text = Student.Student_Address;
                    Student_SSN.Text = Student.Student_SSN;
                    HighSchoolDegree.Text = Student.Student_High_School_Degree;
                    CapabilitiesDegree.Text = Student.Student_Capabilities_Degree;
                    MyAchievementDegree.Text = Student.Student_My_Achievement_Degree;
                    StudentType.SelectedValue = Student.Student_Type_Id.ToString();
                    Resource_ID.SelectedValue = Student.Student_Resource_Id.ToString();
                    Nationality_ID.SelectedValue = Student.Student_Nationality_Id.ToString();
                    Specialization_ID.SelectedValue = Student.Student_Specialization_Id.ToString();
                    Specialization_ID2.SelectedValue = Student.Student_Specialization_2_Id.ToString();
                    //Note.InnerText = Student.Notes;
                    LoadStudentFiles(StudentId);
                    StudentTypeVisible();
                    
                }
            }
            catch (Exception e) { }
        }

        //------------------------------------LoadFile-------------------------------------
        private void LoadStudentFiles(int Student_Id)
        {
            try
            {
                string str = string.Empty, FileName = string.Empty;
                int Nationality_Counter = 0, Capabilities_Counter = 0, High_School_Counter = 0, My_Achievement_Counter = 0, Contracts_Counter = 0, Before_Contract_Counter = 0, Acadimec_Regsteration_Counter = 0;
                int Classification_Authority_Counter = 0, Description_of_Courses_Counter = 0, Diploma_Counter = 0, EnglishCertificate_Counter = 0, SAT1_Counter = 0, SAT2_Counter = 0, Equation_Counter = 0;
                int Current_Counter = 1;
                List<File> List_File = db.Files.Where(x => x.Student_Id == Student_Id).OrderBy(x => x.Type).ToList();
                for (int i = 0; i < List_File.Count; i++)
                {
                    string fileType = string.Empty;
                    if (List_File[i].Type == (int)FileType.Nationality) { fileType = FieldNames.getFieldName("View-Nationality", "Nationality"); Current_Counter = Nationality_Counter = Nationality_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Capabilities) { fileType = FieldNames.getFieldName("View-Capabilities", "Capabilities"); Current_Counter = Capabilities_Counter = Capabilities_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.High_School) { fileType = FieldNames.getFieldName("View-HighSchool", "High School"); Current_Counter = High_School_Counter = High_School_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.My_Achievement) { fileType = FieldNames.getFieldName("View-MyAchievement", "My Achievement"); Current_Counter = My_Achievement_Counter = My_Achievement_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.After_Contract) { fileType = FieldNames.getFieldName("View-Contracts", "Contracts"); Current_Counter = Contracts_Counter = Contracts_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Before_Contract) { fileType = FieldNames.getFieldName("View-PrepareContracts", "Prepare Contracts"); Current_Counter = Before_Contract_Counter = Before_Contract_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Acadimec_Regsteration) { fileType = FieldNames.getFieldName("View-AcadimecRegistration", "Acadimec Registration"); Current_Counter = Acadimec_Regsteration_Counter = Acadimec_Regsteration_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Classification_Authority) { fileType = FieldNames.getFieldName("View-ClassificationAuthorit", "Classification Authorit"); Current_Counter = Classification_Authority_Counter = Classification_Authority_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Description_of_Courses) { fileType = FieldNames.getFieldName("View-DescriptionofCourses", "Description of Courses"); Current_Counter = Description_of_Courses_Counter = Description_of_Courses_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Diploma) { fileType = FieldNames.getFieldName("View-Diploma", "Diploma"); Current_Counter = Diploma_Counter = Diploma_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.English_Test) { fileType = FieldNames.getFieldName("View-EnglishCertificate", "English Certificate"); Current_Counter = EnglishCertificate_Counter = EnglishCertificate_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Equation) { fileType = FieldNames.getFieldName("View-Equation", "Equation"); Current_Counter = Equation_Counter = Equation_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.SAT1) {
                        fileType = FieldNames.getFieldName("View-SAT1", "SAT 1"); Current_Counter = SAT1_Counter = SAT1_Counter + 1;
                        EducationType.SelectedValue = "2";
                    }
                    else if (List_File[i].Type == (int)FileType.SAT2) {
                        fileType = FieldNames.getFieldName("View-SAT2", "SAT 2"); Current_Counter = SAT2_Counter = SAT2_Counter + 1;
                        EducationType.SelectedValue = "2";
                    }
                    str += "<tr>" +
                           "<td>" +
                           "" + fileType + " " + Current_Counter + "" +
                           "</td>" +
                           "<td>" + fileType + " </td>";
                    str += "<td><a href = '../../../../media/StudentAttachments/" + List_File[i].File_Path + "' target='_blank' style='font-size: x-large; color: blue;'><i class='icofont icofont-eye-alt'></i></a></td>" +
                      "</tr>";
                }
                txtFiles.Text = str;
                FileTable.Visible=true;
            }
            catch { }
        }

        //------------------------------------Clear Form-------------------------------------
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




        //------------------------------------Check Specialization Percent -------------------------------------
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
            }
            catch (Exception e) { }
            if (totalSum < WeightedRatioPercent) return false;

            return true;
        }

        //------------------------------------translate Arabic -------------------------------------

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

        //------------------------------------translate Validation Arabic -------------------------------------
        public void translateValidationArabic()
        {
            //Stu_ProfileValidator.Text = "إختر الصورة الشخصية";
            StudentNameArValidator.Text = "الرجاء إدخال الإسم بالعربي";
            StudentNameEnValidator.Text = "الرجاء إدخال الإسم بالانجليزي";
            StudentEmailValidator.Text = "الرجاء إدخال البريد الإلكتروني";
            StudentPhoneValidator.Text = "الرجاء إدخال رقم الهاتف";
            AddressValidator.Text = "الرجاء إدخال العنوان";
            StudentSSNFileValidator.Text = "الرجاء إرفاق الهوية";
            Student_SSNValidator.Text = "الرجاء إدخال رقم الهوية (10 ارقام) ";
            HighSchoolDegreeValidator.Text = "الرجاء إدخال درجات الشهادة الثانوية";
            CapabilitiesDegreeValidator.Text = "الرجاء إدخال درجات القدرات";
            MyAchievementDegreeValidator.Text = "الرجاء إدخال درجات التحصيلي";
            HighSchoolDegreeFileValidator.Text = "الرجاء إرفق الشهادة الثانوية";
            CapabilitiesDegreeFileValidator.Text = "الرجاء إرفاق شهادة القدرات";
            MyAchievementDegreeFileValidator.Text = "الرجاء إرفاق شهادة التحصيلي";
            Resource_IDValidator.Text = "إختر المصدر";
            Nationality_IDValidator.Text = "إختر الجنسية";
            Specialization_IDValidator.Text = "إختر التخصص";
            StudentTypeValidator.Text = "إختر نوع التقديم";
            HighSchoolDateValidator.Text = "أدخل تاريخ الشهادة الثانوية";
            SAT1Validator.Text = "الرجاء إرفاق سات 1";
            SAT2Validator.Text = "الرجاء إرفاق سات 2";
            DiplomaValidator.Text = "الرجاء إرفاق شهادة الدبلوم";
            AcadimecRegsterationValidator.Text = "الرجاء إرفاق السجل الاكاديمي";
            SAHSCValidator.Text = "الرجاء إرفاق  تصنيف الهيئة السعودية للتخصصات الصحية ساري المفعول";
            EnglishTestValidator.Text = "الرجاء إختيار امتحانات الانجليزي";
            EnglishTestDegreeValidator.Text = "أدخل معدل الإختبار";
            EnglishTestValidator.Text = "الرجاء إختيار امتحانات الانجليزي";
            EnglishTestDegreeValidator.Text = "أدخل معدل الإختبار";
            DescriptionofcoursesValidator.Text = "الرجاء إرفاق وصف المقررات";
            GPAValidator.Text = "إختر المعدل التراكمي";
            EnglishCertificateValidator.Text = "أدخل شهادةالانجليزي";




            StudentNameAr.Attributes["placeholder"] = "أدخل الاسم بالعربي";
            StudentNameEn.Attributes["placeholder"] = "أدخل الأسم بالانجليزي";
            StudentEmail.Attributes["placeholder"] = "أدخل البريد الإلكتروني";
            StudentPhone.Attributes["placeholder"] = "05xxxxxxxx";
            Address.Attributes["placeholder"] = "أدخل العنوان";
            Student_SSN.Attributes["placeholder"] = "أدخل رقم الهوية";
            HighSchoolDegree.Attributes["placeholder"] = "أدخل درجة الشهادة الثانوية";
            CapabilitiesDegree.Attributes["placeholder"] = " أدخل درجة القدرات";
            MyAchievementDegree.Attributes["placeholder"] = "أدخل درجة التحصيلي";
            EnglishTestDegree.Attributes["placeholder"] = "أدخل معدل الإختبار";
            HighSchoolDate.Attributes["placeholder"] = "أدخل تاريخ الشهادة الثانوية";
        }

        //------------------------------------Save Message -------------------------------------
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

        //------------------------------------Student Type -------------------------------------
        protected void StudentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            StudentTypeVisible();
        }

        //------------------------------------Visible with the Student Type-------------------------------------
        public void StudentTypeVisible()
        {
            int ST_Id = 0, Nat_Id,Edu_Type;
            int.TryParse(StudentType.SelectedValue, out ST_Id);
            int.TryParse(Nationality_ID.SelectedValue, out Nat_Id);
            int.TryParse(EducationType.SelectedValue, out Edu_Type);
            switch (ST_Id)
            {
                //----------------------- New student ------------------------------
                case 1:
                    HighSchool_Div.Style.Add("display", "block");
                    EducationType_Div.Style.Add("display", "block");
                    if (Edu_Type != 1) {
                        SAT_Div.Style.Add("display", "block");
                        Capabilities_Div.Style.Add("display", "none");
                        MyAchievement_Div.Style.Add("display", "none");
                    } else {
                        SAT_Div.Style.Add("display", "none");
                        Capabilities_Div.Style.Add("display", "block");
                        MyAchievement_Div.Style.Add("display", "block");
                    }
                    Diploma_Div.Style.Add("display", "none");
                    AcadimecRegsteration_Div.Style.Add("display", "none");
                    SAHSC_Div.Style.Add("display", "none");
                    EnglishTest_Div.Style.Add("display", "none");
                    Descriptionofcourses_Div.Style.Add("display", "none");
                    GPA_Div.Style.Add("display", "none");
                    break;
                //-----------------------End New student ------------------------------

                //----------------------- Tajseer student ------------------------------
                case 2:
                    HighSchool_Div.Style.Add("display", "block");
                    Capabilities_Div.Style.Add("display", "none");
                    MyAchievement_Div.Style.Add("display", "none");
                    SAT_Div.Style.Add("display", "none");
                    Diploma_Div.Style.Add("display", "block");
                    AcadimecRegsteration_Div.Style.Add("display", "block");
                    SAHSC_Div.Style.Add("display", "block");
                    EnglishTest_Div.Style.Add("display", "block");
                    Descriptionofcourses_Div.Style.Add("display", "none");
                    GPA_Div.Style.Add("display", "none");
                    EducationType_Div.Style.Add("display", "none");
                    break;
                //----------------------- End Tajseer student ------------------------------

                //----------------------- Mohawl student ------------------------------
                case 3:
                    HighSchool_Div.Style.Add("display", "none");
                    Capabilities_Div.Style.Add("display", "none");
                    MyAchievement_Div.Style.Add("display", "none");
                    SAT_Div.Style.Add("display", "none");
                    Diploma_Div.Style.Add("display", "none");
                    AcadimecRegsteration_Div.Style.Add("display", "block");
                    SAHSC_Div.Style.Add("display", "none");
                    EnglishTest_Div.Style.Add("display", "none");
                    Descriptionofcourses_Div.Style.Add("display", "block");
                    GPA_Div.Style.Add("display", "block");
                    EducationType_Div.Style.Add("display", "none");
                    break;
                //----------------------- End Mohwal student ------------------------------

                default:
                    HighSchool_Div.Style.Add("display", "none");
                    Capabilities_Div.Style.Add("display", "none");
                    MyAchievement_Div.Style.Add("display", "none");
                    SAT_Div.Style.Add("display", "none");
                    Diploma_Div.Style.Add("display", "none");
                    AcadimecRegsteration_Div.Style.Add("display", "none");
                    SAHSC_Div.Style.Add("display", "none");
                    EnglishTest_Div.Style.Add("display", "none");
                    Descriptionofcourses_Div.Style.Add("display", "none");
                    GPA_Div.Style.Add("display", "none");
                    EducationType_Div.Style.Add("display", "none");
                    break;
            }
        }

        //------------------------------------Check to TOFEL Test -------------------------------------
        public bool TOFEL_Test(int T_T_Id, float EnglishTestDeg)
        {
            bool T = false;

            switch (T_T_Id)
            {
                //-----------------------------TOEFL Computer--------------------------------
                case 2:
                    if (EnglishTestDeg < 113) { EnglishDegree = "113"; T = false; } else T = true;
                    break;
                //-----------------------------TOEFL Internet--------------------------------
                case 3:
                    if (EnglishTestDeg < 30) { EnglishDegree = "30"; T = false; } else T = true;
                    break;

                //-----------------------------TOEFL Paper--------------------------------
                case 4:
                    if (EnglishTestDeg < 425) { EnglishDegree = "425"; T = false; } else T = true;
                    break;
                default:
                    T = false;
                    break;
            }
            return T;
        }

        //------------------------------------Check the GPA -------------------------------------
        public bool GPA_Degree(int Specialization_id, int GPA_Deg)
        {
            bool T = false;

            if(Specialization_id ==1 && GPA_Deg > 2)  T = false; else  T = true;

            return T;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (StudentID != 0) {
                if (ContractFiles != null) AttachmentFile(StudentID, (int)FileType.Before_Contract, ContractFiles, @"~\media\StudentAttachments\");
                Student Stu = db.Students.First(x => x.Student_Id == StudentID);
                Stu.Student_Status_Id = 17;
                db.Entry(Stu).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                Response.Redirect("~/StudentSubmitting.aspx");
            }
        }
    }

}