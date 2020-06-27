using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ElectronicSubmission.Enums;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class StudentInfo : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        int StudentID = 0;
        int StatusId = 0;
        float totalSum = 0;
        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        float HighSchoolTotal = 100;
        float CapabilitiesTotal = 100;
        float MyAchievementTotal = 100;

        protected void Page_Load(object sender, EventArgs e)
        {
             if (SessionWrapper.LoggedUser == null)
                 Response.Redirect("~/Pages/Auth/Login.aspx");

            if (Request["StudentID"] != null)
            {
                int.TryParse(Request["StudentID"],out StudentID);
            }
            else
            {
                Student_ID.Text = "New";
            }

            if (!IsPostBack)
            {
                FillDropDownLists();
                RegistrationDate.Text = DateTime.Now.Date.ToString();
                if(StudentID !=0) ViewDataStudent(StudentID);
                if(StudentID == 0) Nationality_ID.SelectedValue = "191";
            }

            if(StudentID != 0) {
                int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
                var StudentAssign = db.Students.FirstOrDefault(x => x.Student_Employee_Id == emp_id && x.Student_Id== StudentID);
                 if(StudentAssign ==null) Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");

            }

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                int Stu_ID, Res_id, Spec_id, Nat_id = 0;
                DateTime RegDate = DateTime.Now;
                float HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg = 0;
                bool result = false;

                int.TryParse(Student_ID.Text, out Stu_ID);
                int.TryParse(Resource_ID.SelectedValue, out Res_id);
                int.TryParse(Specialization_ID.SelectedValue, out Spec_id);
                int.TryParse(Nationality_ID.SelectedValue, out Nat_id);

                float.TryParse(HighSchoolDegree.Text, out HighSchoolDeg);
                float.TryParse(CapabilitiesDegree.Text, out CapabilitiesDeg);
                float.TryParse(MyAchievementDegree.Text, out MyAchievementDeg);

                DateTime.TryParse(RegistrationDate.Text, out RegDate);

                bool ToCheckPercent = SpecializationPercent(Spec_id, HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg);
                if (ToCheckPercent)
                {
                    result = IU_Student(StudentID, StudentNameAr.Text, StudentNameEn.Text, stuProfile, StudentEmail.Text, StudentPhone.Text, Address.Text, RegDate, Student_SSN.Text, HighSchoolDeg, CapabilitiesDeg, MyAchievementDeg, Res_id, Spec_id, Nat_id, Note.InnerText, totalSum);

                    if (result)
                    {
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  الحالة : ','  تم الحفظ بيانات الطالب بنجاح ');", true);
                        else
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The  Student was Sucessfully saved in system ! ');", true);

                        if (StudentID == 0) ClearForm();
                    }
                    else
                    {
                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  الحالة: ','لقد قمت بالتقديم مسبقاً أو يوجد تقديم مسبق مطابقاً لرقم الهوية !');", true);
                        else
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','You have already applied or There is a pre-submission matched to the SSN number');", true);

                    }
                }
                else
                {
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  الحالة: ','غير مستوفي النسبة المطلوبة !');", true);
                    else
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','The required percentage is not met ! Choose the appropriate major, not this!');", true);
                }
            }
            catch (Exception x) { }
        }

        public bool IU_Student(int StudentID, string ArabicName, string EnglishName,FileUpload StProfile,string Email, string Phone,string StuAddress, DateTime RegistrationDate,string StudentSSN, float HighSchoolDeg,float CapabilitiesDeg,float MyAchievementDeg, int ResourceID, int SpecializationID,int NationalityID,string Notes,float StudentTotal)
        {

            try
            {
                int Student_Id = 0;
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
                Stu.Notes = Notes;
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
                if (StudentID != 0) {
                    Student_Id = StudentID;
                }
                else
                {
                    Student_Id = Stu.Student_Id; 
                }
                string SSSNFile = UploadFile(Student_Id, (int)FileType.Nationality, StudentSSNFile, @"~\media\StudentAttachments\");

                string HSFile = UploadFile(Student_Id, (int)FileType.High_School, HighSchoolDegreeFile, @"~\media\StudentAttachments\");

                string CAFile = UploadFile(Student_Id, (int)FileType.Capabilities, CapabilitiesDegreeFile, @"~\media\StudentAttachments\");

                string MAfile = UploadFile(Student_Id, (int)FileType.My_Achievement, MyAchievementDegreeFile, @"~\media\StudentAttachments\");

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

     

         public string UploadFile(FileUpload Uplofile,string Path)
         {
             string Imagepath = "";
            try { 
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

        public string UploadFile(int StudentID, int type, FileUpload Uplofile, string Path)
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
                        if (Imagepath != string.Empty)
                        {
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
                    Stu_Profile.ImageUrl = "../../../../media/StudentProfile/" + Student.Student_Image_Profile;
                    Student_ID.Text = Student.Student_Id.ToString();
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
                    Note.InnerText = Student.Notes;
                    RegistrationDate.Text = Student.Student_CreationDate.ToString();
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
                Stu_Profile.ImageUrl = "../../../../media/Profile/Profile.JPG";
                Student_ID.Text = "New";
                StudentNameAr.Text = "";
                StudentNameEn.Text = "";
                StudentEmail.Text = "";
                StudentPhone.Text = "";
                Address.Text = "";
                Student_SSN.Text = "";
                HighSchoolDegree.Text = "";
                CapabilitiesDegree.Text = "";
                MyAchievementDegree.Text = "";
                Resource_ID.SelectedValue = null;
                Nationality_ID.SelectedValue = null;
                Specialization_ID.SelectedValue = null;
                Note.InnerText = "";
                RegistrationDate.Text = DateTime.Now.Date.ToString();
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
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    ddlFiller.dropDDL(Resource_ID, "ResourceID", "Resource_Name_Ar", ResourceList, " - إختر المصدر -");
                else
                    ddlFiller.dropDDL(Resource_ID, "ResourceID", "Resource_Name_En", ResourceList, " - Select Resource -");

                // Group dropdown
                List<Specialization> SpecializationList = db.Specializations.ToList();
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_Ar", SpecializationList, " - إختر التخصص -");
                else
                    ddlFiller.dropDDL(Specialization_ID, "Specialization_Id", "Specialization_Name_En", SpecializationList, " - Select Specialization -");

                // Group dropdown
                List<Nationality> NationalityList = db.Nationalities.ToList();
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    ddlFiller.dropDDL(Nationality_ID, "Nationality_Id", "Nationality_Name_Ar", NationalityList, " - إختر الجنسية -");
                else
                    ddlFiller.dropDDL(Nationality_ID, "Nationality_Id", "Nationality_Name_En", NationalityList, " - Select Nationality -");

                   if (SessionWrapper.LoggedUser.Language_id == 1)
                    Save.Text = "حفظ";

                if (SessionWrapper.LoggedUser.Language_id == 1)
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
            }
            catch (Exception e) { }
            if (totalSum < WeightedRatioPercent) return false;

            return true;

        }

        public void translateValidationArabic()
        {
            StudentNameArValidator.Text = "الرجاء إدخال الإسم بالعربي";
            StudentNameEnValidator.Text = "الرجاء إدخال الإسم بالانجليزي";
            StudentEmailValidator.Text = "الرجاء إدخال البريد الإلكتروني";
            StudentPhoneValidator.Text = "الرجاء إدخال رقم الهاتف";
            AddressValidator.Text = "الرجاء إدخال العنوان";
            Student_SSNValidator.Text = "الرجاء إدخال رقم الهوية";
            HighSchoolDegreeValidator.Text = "الرجاء إدخال درجات الشهادة الثانوية";
            CapabilitiesDegreeValidator.Text = "الرجاء إدخال درجات القدرات";
            MyAchievementDegreeValidator.Text = "الرجاء إدخال درجات التحصيلي";
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
    }
}