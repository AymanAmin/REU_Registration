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
using static ElectronicSubmission.Enums;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class View : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "green", "orange", "blue", "red", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "cyan", "olivedrab", "coral", "salmon", "yellow" };
        int student_record_id = 0;
        bool EnableEditActions = false, EnableEditAssign = false;
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (Request["StudentID"] == null)
                Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");
            else
                student_record_id = int.Parse(Request["StudentID"].ToString());

            if (Session["Error_Message"] != null)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  حالة التعديل : ','هذه العملية تمت من قبل موظف اخر');", true);
                else
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','This action done by other employee');", true);

                Session["Error_Message"] = null;
            }

            if (!IsPostBack)
            {
                //Fill Employee DropDown List
                FillEmployeeDropDown();

                //Get Current student Record
                Student student = db.Students.Find(student_record_id);

                //Get Current student information
                LoadStudentInfo(student);

                //Rename button names
                btnAssign.Text = FieldNames.getFieldName("View-Assign", "Assign");
                
            }
        }

        private void FillEmployeeDropDown()
        {
            Status status = db.Status.Where(x => x.Status_Code == 3).FirstOrDefault();
            if (status == null)
                return;

            List<Group_Status> Group_Status_List = status.Group_Status.ToList();

            List<Employee> EmpList = new List<Employee>();
            for(int i =0; i < Group_Status_List.Count; i++)
            {
                List<Employee> Temp_List = Group_Status_List[i].Group.Employees.ToList();
                EmpList.AddRange(Temp_List);
            }
            if (SessionWrapper.LoggedUser.Language_id == 1)
                ddlFiller.dropDDL(txtEmployees, "Employee_Id", "Employee_Name_Ar", EmpList, "أختر الموظف");
            else
                ddlFiller.dropDDL(txtEmployees, "Employee_Id", "Employee_Name_En", EmpList, "Select Employee");

            if (SessionWrapper.LoggedUser.Language_id == 1)
            {
                txtTypeOfCash.Items.Add("سنة كاملة");
                txtTypeOfCash.Items.Add("فصل دراسي");
            }else
            {
                txtTypeOfCash.Items.Add("Full Year");
                txtTypeOfCash.Items.Add("Semster");
            }
            txtTypeOfCash.SelectedIndex = 0;

        }

        private void LoadStudentInfo(Student std)
        {
            try
            {
                if (std != null)
                {
                    //Check If He Has Permission
                    CheckIfHeHasPermission(std);

                    // select the color based on status id
                    int index = (int)std.Student_Status_Id - 1;
                    if (index >= Color.Length) index = 1;

                    // Set profile image
                    if(std.Student_Image_Profile == null || std.Student_Image_Profile == "")
                        txtProfileImage.ImageUrl = "~/media/StudentProfile/Profile.jpg";
                    else
                        txtProfileImage.ImageUrl = "~/media/StudentProfile/" + std.Student_Image_Profile;
                    

                    // load other data
                    txtStudent_Id.Text = std.Student_Id.ToString();
                    txtStudent_SSN.Text = std.Student_SSN;
                    
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtStudent_Name.Text = std.Student_Name_Ar;
                    else
                        txtStudent_Name.Text = std.Student_Name_En;
                    txtStudent_Phone.Text = std.Student_Phone;
                    txtStudent_Email.Text = std.Student_Email;
                    txtStudent_Address.Text = std.Student_Address;
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        txtTypeofSubmission.Text = std.Student_Type.Student_Type_Name_Ar;
                        txtSpecialization.Text = std.Specialization.Specialization_Name_Ar;
                        if (std.Student_Specialization_2_Id != null)
                            txtSpecializationOptional.Text = std.Specialization1.Specialization_Name_Ar;
                        else
                            txtSpecializationOptional.Text = "  -  ";
                    }
                    else
                    {
                        txtTypeofSubmission.Text = std.Student_Type.Student_Type_Name_En;
                        txtSpecialization.Text = std.Specialization.Specialization_Name_En;
                        if (std.Student_Specialization_2_Id != null)
                            txtSpecializationOptional.Text = std.Specialization1.Specialization_Name_En;
                        else
                            txtSpecializationOptional.Text = "  -  ";
                    }
                    if (SessionWrapper.LoggedUser.Language_id ==1)
                        txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index] + " !important;'>" + std.Status.Status_Name_Ar + "</span>";
                    else
                    txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index] + " !important;'>" + std.Status.Status_Name_En + "</span>";

                    Status_ID_Verification.Text = std.Student_Status_Id.ToString();

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtStudent_Nationality.Text = std.Nationality.Nationality_Name_Ar;
                    else
                        txtStudent_Nationality.Text = std.Nationality.Nationality_Name_En;

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtStudent_Resource.Text = std.Resource.Resource_Name_Ar;
                    else
                        txtStudent_Resource.Text = std.Resource.Resource_Name_En;

                    txtStudent_Capabilities_Degree.Text = " " + std.Student_Capabilities_Degree + "";
                    txtStudent_High_School_Degree.Text = " " + std.Student_High_School_Degree + "";
                    txtStudent_My_Achievement_Degree.Text = " " + std.Student_My_Achievement_Degree + "";

                    int str_index = (std.Student_Total.ToString()).IndexOf('.');
                    if (str_index != -1)
                        txtStudent_Total.Text = (std.Student_Total.ToString()).Substring(0, str_index + 2);
                    else
                    {
                        str_index = (std.Student_Total.ToString()).IndexOf(',');
                        if (str_index != -1)
                            txtStudent_Total.Text = (std.Student_Total.ToString()).Substring(0, str_index + 2);
                        else
                            txtStudent_Total.Text = std.Student_Total + "%";
                    }

                    DateTime date = DateTime.Parse(std.Student_CreationDate.ToString());
                    txtStudent_CreationDate.Text = date.ToShortDateString();
                    bool IsFinish_Equation = Made_Equation(std);
                    if ((std.Student_Status_Id == 7 || std.Student_Status_Id == 17) && (std.Student_Type_Id == 1 || IsFinish_Equation))
                    {
                        txtSetMeetingInfo.Visible = true;
                    }

                    if (std.Student_Status_Id == 17)
                        txtURL_Video.Text = "https://goo.gl/maps/SNM8YwauaTVRospB6";

                    // Change status to pendding if it's new
                    if (std.Status.Status_Code == 1)// New
                    {
                        std.Student_Status_Id = 2;// Assigned
                        Status_ID_Verification.Text = "2";
                        db.Entry(std).State = System.Data.EntityState.Modified;

                        Sequence seq = db.Sequences.Create();

                        seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                        seq.Status_Id = 2;
                        seq.Student_Id = std.Student_Id;
                        seq.DateCreation = DateTime.Now;

                        if (SessionWrapper.LoggedUser.Language_id == 1)
                            txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index + 1] + " !important;'>" + std.Status.Status_Name_Ar + "</span>";
                        else
                            txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index + 1] + " !important;'>" + std.Status.Status_Name_En + "</span>";

                        db.Sequences.Add(seq);
                        db.SaveChanges();


                        db.Configuration.LazyLoadingEnabled = false;
                        /* Add it to log file */
                        Student stdLogFile = db.Students.Find(std.Student_Id);
                        stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                        stdLogFile.Status = db.Status.Find(seq.Status_Id);

                        LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                        logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);
                    }

                    // Set action if it's allow
                    int emp_id = 0;
                    if (std.Student_Employee_Id != null)
                        emp_id = (int)std.Student_Employee_Id;
                    IsAllowToTakeAction((int)std.Student_Status_Id, emp_id, std);

                    //Set Action
                    SetActions();

                    // Load Files
                    LoadStudentFiles(std.Student_Id);

                    //Load sequence
                    LoadSequence(std.Student_Id);

                    //Buttons Name
                    btnReject.Text = GetRejectStatusName((int)std.Student_Status_Id);
                    btnApprove.Text = GetApproveStatusName((int)std.Student_Status_Id,std);
                    btnBranch2.Text = GetApproveBranchStatusName((int)std.Student_Status_Id,std);

                    /* المالية */
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        btnSendSMS.Text = "إرسال";
                    else
                        btnSendSMS.Text = "Send";

                    if (std.Student_Status_Id != 6 && std.Student_Status_Id != 11)
                    {
                        btnSendSMS.Visible = false;
                        txtReadyToPay.Visible = false;
                    }
                    else
                    {
                        List<Payment_Process> ppList = db.Payment_Process.Where(x => x.Student_Id == std.Student_Id).ToList();
                        if (ppList.Count > 0)
                        {
                            txtAmount.Text = ppList[ppList.Count - 1].Send_Amount.ToString();
                            txtSadadNumber.Text = ppList[ppList.Count - 1].Result_Description;
                            if(ppList[ppList.Count - 1].Result_Description != null && ppList[ppList.Count - 1].Result_Description != "")
                            if (SessionWrapper.LoggedUser.Language_id == 1)
                                btnSendSMS.Text = "إعادة ارسال";
                            else
                                btnSendSMS.Text = "Resend";

                        }

                        txtNote.Text = "Please complete the payment within 48 hours.";
                    }
                    /* المالية */

                    if (std.Student_Status_Id != 17 && std.Student_Status_Id != 10)
                    {
                        btnBranch2.Visible = false;
                    }

                    if (std.Student_Status_Id != 10)
                    {
                        txtTypeOfCash.Visible = false;
                        txtTypeOfCash_Label.Visible = false;
                    }


                    if (std.Student_Status_Id == 18 || std.Student_Status_Id == 19)
                    {
                        txtContracts.Visible = true;
                        txtContract_Label.Visible = true;
                        
                    }

                }
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }

        private bool Can_I_Update_Record(Student std)
        {
            int status_id = int.Parse(Status_ID_Verification.Text);
            if (std.Student_Status_Id == status_id)
                return true;
            else
            {
                Session["Error_Message"] = true;
                return false;
            }
        }
        private void CheckIfHeHasPermission(Student std)
        {
            if (std.Student_Employee_Id == SessionWrapper.LoggedUser.Employee_Id)
                return;
            else
            {
                List<Group_Status> List_group_status = db.Group_Status.Where(x => x.Group_Id == SessionWrapper.LoggedUser.Group_Id).ToList();
                for(int i =0; i < List_group_status.Count; i++)
                {
                    if (List_group_status[i].Status_Id == std.Student_Status_Id)
                        return;
                    else
                    {
                        int Temp_Status_Id = (int)List_group_status[i].Status_Id;
                        List<Sequence> list_sequence = db.Sequences.Where(x => x.Student_Id == std.Student_Id && x.Status_Id == Temp_Status_Id).ToList();
                        if (list_sequence.Count > 0)
                            return;
                    }
                }
            }

            Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");
        }

        private void SetActions()
        {
            if (EnableEditActions)
                DivAction.Visible = true;

            if (EnableEditAssign)
                DivAssign.Visible = true;
        }

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
                    if (List_File[i].Type == (int)FileType.ProfileImage) { txtProfileImage.ImageUrl = List_File[i].File_Path; continue; }
                    else if (List_File[i].Type == (int)FileType.Nationality) { fileType = FieldNames.getFieldName("View-Nationality", "Nationality"); Current_Counter = Nationality_Counter = Nationality_Counter + 1; }
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
                    else if (List_File[i].Type == (int)FileType.SAT1) { fileType = FieldNames.getFieldName("View-SAT1", "SAT 1"); Current_Counter = SAT1_Counter = SAT1_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.SAT2) { fileType = FieldNames.getFieldName("View-SAT2", "SAT 2"); Current_Counter = SAT2_Counter = SAT2_Counter + 1; }
                    else if (List_File[i].Type == (int)FileType.Equation) { fileType = FieldNames.getFieldName("View-Equation", "Equation"); Current_Counter = Equation_Counter = Equation_Counter + 1; }
                    str += "<tr>" +
                           "<td>" +
                           "" + fileType + " " + Current_Counter + "" +
                           "</td>" +
                           "<td>" + fileType + " </td>";
                    if (EnableEditActions)
                        str += "<td><a href='#' data-href='../../../Pages/RegistrationProcess/DeleteFile.ashx?FileID=" + List_File[i].File_Id + "&StudentID=" + List_File[i].Student_Id + "' data-toggle='modal' data-target='#confirm-delete' style ='font-size: x-large; color: red;' ><i class='icofont icofont-ui-delete'></i></a></td>";
                    else
                        str += "<td><a href = '#' disabled='disabled' style ='font-size: x-large; color: red;' ><i class='icofont icofont-ui-delete'></i></a></td>";
                    str += "<td><a href = '../../../../media/StudentAttachments/" + List_File[i].File_Path + "' target='_blank' style='font-size: x-large; color: blue;'><i class='icofont icofont-eye-alt'></i></a></td>" +
                           "</tr>";
                }
                txtFiles.Text = str;
            }
            catch { }
        }

        public void IsAllowToTakeAction(int StatusId, int emp_id,Student std)
        {
            Group_Status GS = db.Group_Status.Where(x => x.Group_Id == SessionWrapper.LoggedUser.Group_Id && x.Status_Id == StatusId).FirstOrDefault();
            if (GS != null && (GS.Status_Id != 3 || (GS.Status_Id == 3 && emp_id == SessionWrapper.LoggedUser.Employee_Id)))
            {
                EnableEditActions = true;
            }
            else
                EnableEditActions = false;

            if (StatusId == 1 || StatusId == 2)
            {
                EnableEditAssign = true;
                EnableEditActions = false;
            }
            else
            {
                EnableEditAssign = false;
            }

            if ((std.Student_Employee_Id != SessionWrapper.LoggedUser.Employee_Id && (std.Student_Status_Id == 3 || std.Student_Status_Id == 4)))
            {
                EnableEditActions = false;
            }


        }

        public void LoadSequence(int Student_Id)
        {
            string CssClass = "icofont icofont-exchange";//string.Empty;
            string str = string.Empty;
            List<Sequence> sequence = db.Sequences.Where(x => x.Student_Id == Student_Id).ToList();
            sequence = sequence.OrderByDescending(x => x.DateCreation).Take(100).ToList();
            List<Status> Status_List = db.Status.ToList();

            for (int i = 0; i < sequence.Count; i++)
            {
                string activity_verb = FieldNames.getFieldName("View-ChangeStatusTo", "Change Status To") + " ";

                // get data based on language
                string Log_Name = sequence[i].Status.Status_Name_En;
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    Log_Name = sequence[i].Status.Status_Name_Ar;
                }

                if (Log_Name == null || Log_Name == "")
                    Log_Name = "Unknow";


                string space = string.Empty, per_name = string.Empty;
                string marginRight_RTL = string.Empty;

                per_name = sequence[i].Employee.Employee_Name_Ar;
                if (SessionWrapper.LoggedUser.Language_id != 1)
                {
                    space = "&nbsp;";
                    per_name = sequence[i].Employee.Employee_Name_En;

                }
                else
                {
                    marginRight_RTL = "margin-right:20% !important;";
                }

                // select the color based on status id
                int index = (int)sequence[i].Status_Id - 1;
                if (index >= Color.Length) index = 1;

                str += "<div class='row m-b-25'>" +
                                "<div class='col-auto p-r-0' style='margin-top:3%;'>" +
                                "<a class='btn btn-lg txt-muted btn-icon' href='#' role='button' style='font-size:150%;border-color:" + Color[index] + ";color: " + Color[index] + " !important;" + marginRight_RTL + "'>" + space + "<i class='" + CssClass + "'></i></a>" +
                                "</div>" +
                                "<div class='col'>" +
                                "<h6 class='m-b-5'>" + per_name + "</h6>" +
                                "<p class='text-muted m-b-0'>" + "<span style='font-weight: bold;'>" + activity_verb + "</span>" + Log_Name + " </p>";
                if (sequence[i].Note != null && sequence[i].Note != "")
                    str += "<p class='text-muted m-b-0'>" + "<span style='color:" + Color[index] + "'>" + sequence[i].Note + "</span></p>";

                str += "<p class='text-muted m-b-0'> <i class='feather icon-clock m-r-10'></i> " + Date_Different((DateTime)sequence[i].DateCreation) + "</p>" +
                "</div>" +
            "</div>";
            }
            Activity.Text = str;
        }

        protected void Refresh_Click(object sender, EventArgs e)
        {
            /*int UserID = SessionWrapper.LoggedUser.Employee_Id;
            LoadSequence(UserID);*/
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            int newStatus = 0, restore_id = 15;
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);

            if (std != null)
            {
                if (!Can_I_Update_Record(std))
                    return;

                if (std.Student_Status_Id == 15)
                {
                    List<Sequence> list_seq = db.Sequences.Where(x => x.Student_Id == student_record_id).OrderBy(x => x.DateCreation).ToList();
                    if (list_seq.Count > 1)
                    {
                        restore_id = (int)list_seq[list_seq.Count - 2].Status_Id;
                    }

                }

                bool IsFinish_Equation = Made_Equation(std);

                switch (std.Student_Status_Id)
                {
                    case 1: newStatus = 2; break; // 1- New
                    case 2: newStatus = 2; break; // 2- Pending
                    case 3: newStatus = 5; break; // 3- Assigned
                    case 4: newStatus = 5; break; // 4- Not Complete
                    case 5: newStatus = 6; break; // 5- Data Completed
                    case 6: newStatus = 7; break; // 6- Pay the Registration Fees
                    case 7: if (std.Student_Type_Id == 1 || IsFinish_Equation) newStatus = 8; else newStatus = 19; break; // 7- Registration Fee Paid
                    case 8: newStatus = 10; break; // 8- Book a Test Date
                    case 9: newStatus = 7; break; // 9- Failure in the Test
                    case 10: newStatus = 11; break; // 10- Success in the Test
                    case 11: newStatus = 12; break; // 11- Pay the Tuition Fees
                    case 12: newStatus = 13; break; // 12- Tuition Fees Paid
                    case 13: newStatus = 14; break; // 13- Issuance University ID
                    case 14: newStatus = 15; break; // 14- File Completed Successfully
                    case 15: newStatus = restore_id; break; // 15- File Complete with Failure

                    case 16: newStatus = 17; break; // 16- Complete Contract Files
                    case 17: newStatus = 18; break; // 17- Files Contract Completed
                    case 18: newStatus = 12; break; // 18- Contract Stage
                    case 19: newStatus = 1016; break; // 19- Certificate Equation
                    case 1016: newStatus = 6; break; // 20- Certificate Equation Completed

                    default: newStatus = 15; break; // Defalut Set To 15 File Complete with Failure
                }
                bool meeting_stage = false;
                if ((std.Student_Status_Id == 7 || std.Student_Status_Id == 17) && (std.Student_Type_Id == 1 || IsFinish_Equation))
                {
                    std.Student_URL_Video = txtURL_Video.Text;
                    std.Notes = "Meeting Date: " + txtMeeting_Date.Value + " Meeting Time: " + txtMeeting_Time.Value+ "(24-hour Clock)";
                    string MeetingDate = txtMeeting_Date.Value;
                    string MeetingTime = txtMeeting_Time.Value;
                    meeting_stage = true;
                }

                //Contract File upload
                if (std.Student_Status_Id == 18)
                {
                    UploadFile(std.Student_Id, (int)FileType.After_Contract, txtContracts, @"~\media\StudentAttachments\");
                }
                //Equation File upload
                else if (std.Student_Status_Id == 19)
                {
                    UploadFile(std.Student_Id, (int)FileType.Equation, txtContracts, @"~\media\StudentAttachments\");
                }

                std.Student_Status_Id = newStatus;
                db.Entry(std).State = System.Data.EntityState.Modified;
                db.SaveChanges();



                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = newStatus;
                seq.Student_Id = student_record_id;
                seq.Note = txtNote.Text;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();



                //Ready to apay
                if (std.Student_Status_Id == 6 || std.Student_Status_Id == 11)
                {
                    ReadyToPay(std);
                }
                else if (meeting_stage)
                {
                    if (std.Student_Status_Id == 7)
                    {
                        sendEamil_Meeting(std, txtURL_Video.Text, txtMeeting_Date.Value, txtMeeting_Time.Value);
                        // Send SMS
                        SendSMS send_sms = new SendSMS();


                        string Text = "Dear " + std.Student_Name_En + "\n\nUse the link that sent with the message to attend the exam Link:" + std.Student_URL_Video + "\n\n" + std.Notes + "\n\nPlease Check Your Email.";
                        string number_Phone = std.Student_Phone;
                        string reslt_message = send_sms.SendMessage(Text, number_Phone);

                        SaveMessage(std.Student_Id, "SMS", Text);
                    }else
                    {
                        sendEamil_Meeting(std, txtURL_Video.Text, txtMeeting_Date.Value, txtMeeting_Time.Value);
                        // Send SMS
                        SendSMS send_sms = new SendSMS();


                        string Text = "Dear " + std.Student_Name_En + "\n\nUse this link to reach the location :" + std.Student_URL_Video + "\n\n" + std.Notes + "\n\nPlease Check Your Email.";
                        string number_Phone = std.Student_Phone;
                        string reslt_message = send_sms.SendMessage(Text, number_Phone);

                        SaveMessage(std.Student_Id, "SMS", Text);
                    }
                }
                else
                { //Send Email
                    sendEamil(std);
                }

                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);

                Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)seq.Student_Id);
            }

        }

        // Here Update Ayman Amin
        protected void btnBranch2_Click(object sender, EventArgs e) 
        {
            int newStatus = 0, restore_id = 15;
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                if (!Can_I_Update_Record(std))
                    return;

                if (std.Student_Status_Id == 15)
                {
                    List<Sequence> list_seq = db.Sequences.Where(x => x.Student_Id == student_record_id).OrderBy(x => x.DateCreation).ToList();
                    if (list_seq.Count > 1)
                    {
                        restore_id = (int)list_seq[list_seq.Count - 2].Status_Id;
                    }

                }

                bool IsFinish_Equation = Made_Equation(std);

                switch (std.Student_Status_Id)
                {
                    case 1: newStatus = 2; break; // 1- New
                    case 2: newStatus = 2; break; // 2- Pending
                    case 3: newStatus = 5; break; // 3- Assigned
                    case 4: newStatus = 5; break; // 4- Not Complete
                    case 5: newStatus = 6; break; // 5- Data Completed
                    case 6: newStatus = 7; break; // 6- Pay the Registration Fees
                    case 7: if(std.Student_Type_Id == 1 || IsFinish_Equation) newStatus = 8; else newStatus = 19; break; // 7- Registration Fee Paid
                    case 8: newStatus = 10; break; // 8- Book a Test Date
                    case 9: newStatus = 7; break; // 9- Failure in the Test
                    case 10: newStatus = 16; break; // 10- Success in the Test
                    case 11: newStatus = 12; break; // 11- Pay the Tuition Fees
                    case 12: newStatus = 13; break; // 12- Tuition Fees Paid
                    case 13: newStatus = 14; break; // 13- Issuance University ID
                    case 14: newStatus = 15; break; // 14- File Completed Successfully
                    case 15: newStatus = restore_id; break; // 15- File Complete with Failure

                    case 16: newStatus = 17; break; // 16- Complete Contract Files
                    case 17: newStatus = 16; break; // 17- Files Contract Completed
                    case 18: newStatus = 12; break; // 18- Contract Stage
                    case 19: newStatus = 1016; break; // 19- Certificate Equation
                    case 1016: newStatus = 6; break; // 20- Certificate Equation Completed

                    default: newStatus = 15; break; // Defalut Set To 15 File Complete with Failure
                }
                bool meeting_stage = false;
                if ((std.Student_Status_Id == 7 || std.Student_Status_Id == 17) && (std.Student_Type_Id == 1 || IsFinish_Equation))
                {
                    std.Student_URL_Video = txtURL_Video.Text;
                    std.Notes = "Meeting Date: " + txtMeeting_Date.Value + " Meeting Time: " + txtMeeting_Time.Value;
                    string MeetingDate = txtMeeting_Date.Value;
                    string MeetingTime = txtMeeting_Time.Value;
                    meeting_stage = true;
                }

                std.Student_Status_Id = newStatus;
                db.Entry(std).State = System.Data.EntityState.Modified;

                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = newStatus;
                seq.Student_Id = student_record_id;
                seq.Note = txtNote.Text;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();


                

                //Ready to apay
                if (std.Student_Status_Id == 6 || std.Student_Status_Id == 11)
                {
                    ReadyToPay(std);
                }
                else if (meeting_stage)
                {
                    sendEamil_Meeting(std, txtURL_Video.Text, txtMeeting_Date.Value, txtMeeting_Time.Value);
                    // Send SMS
                    SendSMS send_sms = new SendSMS();


                    string Text = "Dear " + std.Student_Name_En + "\n\nUse the link that sent with the message to attend the exam Link:" + std.Student_URL_Video + "\n\n" + std.Notes + "\n\nPlease Check Your Email.";
                    string number_Phone = std.Student_Phone;
                    string reslt_message = send_sms.SendMessage(Text, number_Phone);

                    SaveMessage(std.Student_Id, "SMS", Text);
                }
                else if (std.Student_Status_Id == 16)
                {
                    string sever_name = Request.Url.Authority.ToString();

                    string url = sever_name + "/StudentSubmitting.aspx?Student_Id=" + std.Student_Id;
                    if (url.Substring(0, 4).ToLower() != "http".ToLower())
                        url = "http://" + url;

                    sendEamil_UploadFilesContract(std, url);
                    // Send SMS
                    SendSMS send_sms = new SendSMS();


                    string Text = "Dear " + std.Student_Name_En + "\n\nUse the link that sent with the message to upload the required files Link:" + url + "\n\nPlease Check Your Email.";
                    string number_Phone = std.Student_Phone;
                    string reslt_message = send_sms.SendMessage(Text, number_Phone);

                    SaveMessage(std.Student_Id, "SMS", Text);
                }
                else
                { //Send Email
                    sendEamil(std);
                }

                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);

                Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)seq.Student_Id);
            }

        }

        public bool sendEamil(Student std)
        {
            string sever_name = Request.Url.Authority.ToString();

            string StudentEmail = std.Student_Email;
            SendEmail send = new SendEmail();
            if (std.Student_Status_Id == 20)//  Certificate Equation Completed
            {
                string equation = "Congratulations, the equation has been successfully completed. Please pay the registration fee to complete the registration processes";
                string Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>" + equation + "</Strong> <br /> <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
                bool result = send.TextEmail(std.Status.Status_Name_En, StudentEmail, Text, sever_name);
                SaveMessage(std.Student_Id, "E-mail", Text);
                return result;
            } else if (std.Student_Status_Id == 7)//  Paid (Registration)
            {
                string interview = "Thank you, the request has been received and we will contact you soon to schedule the test and interview.";
                string Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>" + interview + "</Strong> <br /> <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
                bool result = send.TextEmail(std.Status.Status_Name_En, StudentEmail, Text, sever_name);
                SaveMessage(std.Student_Id, "E-mail", Text);
                return result;
            }
            else if(std.Student_Status_Id == 9)
            {
                string NoteStr = "";
                if (txtNote.Text != string.Empty)
                    NoteStr = "<br /><Strong>Note:</Strong>" + txtNote.Text + "<br />";

                string Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>Your file has now reached the " + std.Status.Status_Name_En + " stage </Strong> <br />"+ NoteStr + " <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
                bool result = send.TextEmail(std.Status.Status_Name_En, StudentEmail, Text, sever_name);
                SaveMessage(std.Student_Id, "E-mail", Text);
                return result;
            }
            else
            {
                string Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>Your file has now reached the " + std.Status.Status_Name_En + " stage </Strong> <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
                bool result = send.TextEmail(std.Status.Status_Name_En, StudentEmail, Text, sever_name);
                SaveMessage(std.Student_Id, "E-mail", Text);
                return result;
            }
        }

        public bool sendEamil_Meeting(Student std,string url,string date, string time)
        {
            string sever_name = Request.Url.Authority.ToString();

            string StudentEmail = std.Student_Email;
            string Text = "";
            string notes = "";
            if (txtNote.Text != string.Empty)
                notes = "<br /><Strong>Notes:</Strong>"+ txtNote.Text + "<br />";

            SendEmail send = new SendEmail();
            if(std.Student_Status_Id == 7)
                Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>Your file has now reached the " + std.Status.Status_Name_En + " stage </Strong> <br /><Strong>Meeting Date:</Strong> " + date + "<br /><Strong>Meeting Time:</Strong> " + time + "<br /><Strong>URL Meeting:</Strong> " + url + "<br /><Strong>Video:</Strong> https://mega.nz/file/Y4Mz2AqA#vjyWb8rdnz3x-9pQhHzvhsdDfai2625uOmxH2P6UHxM " + notes + "<br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
            else
                Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>Your file has now reached the " + std.Status.Status_Name_En + " stage </Strong> <br /><Strong>Meeting Date:</Strong> " + date + "<br /><Strong>Meeting Time:</Strong> " + time + "<br /><Strong>URL Location:</Strong> " + url + "" + notes + "<br /><Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";

            bool result = send.TextEmail(std.Status.Status_Name_En, StudentEmail, Text, sever_name);
            SaveMessage(std.Student_Id, "E-mail", Text);
            return result;
        }

        public bool sendEamil_UploadFilesContract(Student std, string url)
        {
            string sever_name = Request.Url.Authority.ToString();

            string StudentEmail = std.Student_Email;

            SendEmail send = new SendEmail();
            string Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>Please Upload your the required Files via below </Strong><br /><Strong>URL Link:</Strong> " + url + "<br /> "+ txtNote.Text + "<br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
            bool result = send.TextEmail(std.Status.Status_Name_En, StudentEmail, Text, sever_name);
            SaveMessage(std.Student_Id, "E-mail", Text);
            return result;
        }

        public bool send_ReadyToPay(Student std, Payment_Process payment, string Payment_For)
        {
            string sever_name = Request.Url.Authority.ToString();
            string URL = sever_name + "/Payment/PaymentProcessDetails.aspx?Trackingkey=" + payment.Payment_Trackingkey;
            if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                URL = "http://" + URL;
            string StudentEmail = std.Student_Email; // "ayman@softwarecornerit.com";//
            SendEmail send = new SendEmail();

            string Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>Now you can pay the fees of " + Payment_For + ": </Strong> " + URL + " <br /> <Strong>Current Status:</Strong> " + std.Status.Status_Name_En + " <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
            bool result = send.TextEmail("Ready To Pay("+ Payment_For + ")", StudentEmail, Text, sever_name);

            SaveMessage(std.Student_Id, "E-mail", Text);

            return true;
        }

        public bool send_DatNotCompleted(Student std)
        {
            string sever_name = Request.Url.Authority.ToString();
            string URL = sever_name + "/StudentSubmitting.aspx?Student_Id=" + std.Student_Id;
            if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                URL = "http://" + URL;

            string StudentEmail = std.Student_Email; // "ayman@softwarecornerit.com";//
            SendEmail send = new SendEmail();
            string Text = " <Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>Please complete the missing data in your file as soon as posible Link:</Strong> " + URL + " <br /> <Strong>Current Status:</Strong> " + std.Status.Status_Name_En + " <br /> <Strong>Note:</Strong> " + txtNote.Text + " <br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
            bool result = send.TextEmail("Data Not Complete", StudentEmail, Text, sever_name);

            SaveMessage(std.Student_Id, "E-mail", Text);

            return result;
        }

        private string GetApproveStatusName(int CurrentStatus_Id,Student std)
        {
            bool IsFinish_Equation = Made_Equation(std);

            if (SessionWrapper.LoggedUser.Language_id != 1)
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(2).Status_Name_En;// 1- New
                    case 2: return db.Status.Find(3).Status_Name_En;// 2- Pending
                    case 3: return db.Status.Find(5).Status_Name_En;// 3- Assigned
                    case 4: return db.Status.Find(5).Status_Name_En;// 4- Not Complete
                    case 5: return db.Status.Find(6).Status_Name_En;// 5- Data Completed
                    case 6: return db.Status.Find(7).Status_Name_En;// 6- Pay the Registration Fees
                    case 7: if(std.Student_Type_Id == 1 || IsFinish_Equation) return db.Status.Find(8).Status_Name_En; else return db.Status.Find(19).Status_Name_En;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(10).Status_Name_En;// 8- Book a Test Date
                    case 9: return db.Status.Find(8).Status_Name_En;// 9- Failure in the Test
                    case 10: return db.Status.Find(11).Status_Name_En;// 10- Success in the Test
                    case 11: return db.Status.Find(12).Status_Name_En;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(13).Status_Name_En;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(14).Status_Name_En;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_En;// 14- File Completed Successfully
                    case 15: return "Restore the last Status";// 15- File Complete with Failure

                    case 16: return db.Status.Find(17).Status_Name_En;  // 16- Complete Contract Files
                    case 17: return db.Status.Find(18).Status_Name_En;  // 17- Files Contract Completed
                    case 18: return db.Status.Find(12).Status_Name_En;  // 18- Contract Stage
                    case 19: return db.Status.Find(1016).Status_Name_En;  // 19- Certificate Equation
                    case 1016: return db.Status.Find(6).Status_Name_En;  // 20- Certificate Equation Completed


                    default: return db.Status.Find(4).Status_Name_En;// Defalut Set To 4 Not Complate
                }
            }
            else
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(2).Status_Name_Ar;// 1- New
                    case 2: return db.Status.Find(3).Status_Name_Ar;// 2- Pending
                    case 3: return db.Status.Find(5).Status_Name_Ar;// 3- Assigned
                    case 4: return db.Status.Find(5).Status_Name_Ar;// 4- Not Complete
                    case 5: return db.Status.Find(6).Status_Name_Ar;// 5- Data Completed
                    case 6: return db.Status.Find(7).Status_Name_Ar;// 6- Pay the Registration Fees
                    case 7: if (std.Student_Type_Id == 1 || IsFinish_Equation) return db.Status.Find(8).Status_Name_Ar; else return db.Status.Find(19).Status_Name_Ar;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(10).Status_Name_Ar;// 8- Book a Test Date
                    case 9: return db.Status.Find(8).Status_Name_Ar;// 9- Failure in the Test
                    case 10: return db.Status.Find(11).Status_Name_Ar;// 10- Success in the Test
                    case 11: return db.Status.Find(12).Status_Name_Ar;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(13).Status_Name_Ar;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(14).Status_Name_Ar;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_Ar;// 14- File Completed Successfully
                    case 15: return "الرجوع للحالة السابقة";// 15- File Complete with Failure

                    case 16: return db.Status.Find(17).Status_Name_Ar;  // 16- Complete Contract Files
                    case 17: return db.Status.Find(18).Status_Name_Ar;  // 17- Files Contract Completed
                    case 18: return db.Status.Find(12).Status_Name_Ar;  // 18- Contract Stage
                    case 19: return db.Status.Find(1016).Status_Name_Ar;  // 19- Certificate Equation
                    case 1016: return db.Status.Find(6).Status_Name_Ar;  // 20- Certificate Equation Completed

                    default: return db.Status.Find(4).Status_Name_Ar;// Defalut Set To 4 Not Complate
                }
            }
        }

        private string GetApproveBranchStatusName(int CurrentStatus_Id,Student std)
        {
            bool IsFinish_Equation = Made_Equation(std);

            if (SessionWrapper.LoggedUser.Language_id != 1)
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(2).Status_Name_En;// 1- New
                    case 2: return db.Status.Find(3).Status_Name_En;// 2- Pending
                    case 3: return db.Status.Find(5).Status_Name_En;// 3- Assigned
                    case 4: return db.Status.Find(5).Status_Name_En;// 4- Not Complete
                    case 5: return db.Status.Find(6).Status_Name_En;// 5- Data Completed
                    case 6: return db.Status.Find(7).Status_Name_En;// 6- Pay the Registration Fees
                    case 7: if (std.Student_Type_Id == 1 || IsFinish_Equation) return db.Status.Find(8).Status_Name_En; else return db.Status.Find(19).Status_Name_En;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(10).Status_Name_En;// 8- Book a Test Date
                    case 9: return db.Status.Find(8).Status_Name_En;// 9- Failure in the Test
                    case 10: return db.Status.Find(16).Status_Name_En;// 10- Success in the Test
                    case 11: return db.Status.Find(12).Status_Name_En;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(13).Status_Name_En;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(14).Status_Name_En;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_En;// 14- File Completed Successfully
                    case 15: return "Restore the last Status";// 15- File Complete with Failure

                    case 16: return db.Status.Find(17).Status_Name_En;  // 16- Complete Contract Files
                    case 17: return db.Status.Find(16).Status_Name_En;  // 17- Files Contract Completed
                    case 18: return db.Status.Find(12).Status_Name_En;  // 18- Contract Stage
                    case 19: return db.Status.Find(1016).Status_Name_En;  // 19- Certificate Equation
                    case 1016: return db.Status.Find(6).Status_Name_En;  // 20- Certificate Equation Completed

                    default: return db.Status.Find(4).Status_Name_En;// Defalut Set To 4 Not Complate
                }
            }
            else
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(2).Status_Name_Ar;// 1- New
                    case 2: return db.Status.Find(3).Status_Name_Ar;// 2- Pending
                    case 3: return db.Status.Find(5).Status_Name_Ar;// 3- Assigned
                    case 4: return db.Status.Find(5).Status_Name_Ar;// 4- Not Complete
                    case 5: return db.Status.Find(6).Status_Name_Ar;// 5- Data Completed
                    case 6: return db.Status.Find(7).Status_Name_Ar;// 6- Pay the Registration Fees
                    case 7: if (std.Student_Type_Id == 1 || IsFinish_Equation) return db.Status.Find(8).Status_Name_Ar; else return db.Status.Find(19).Status_Name_Ar;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(10).Status_Name_Ar;// 8- Book a Test Date
                    case 9: return db.Status.Find(8).Status_Name_Ar;// 9- Failure in the Test
                    case 10: return db.Status.Find(16).Status_Name_Ar;// 10- Success in the Test
                    case 11: return db.Status.Find(12).Status_Name_Ar;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(13).Status_Name_Ar;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(14).Status_Name_Ar;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_Ar;// 14- File Completed Successfully
                    case 15: return "الرجوع للحالة السابقة";// 15- File Complete with Failure

                    case 16: return db.Status.Find(17).Status_Name_Ar;  // 16- Complete Contract Files
                    case 17: return db.Status.Find(16).Status_Name_Ar;  // 17- Files Contract Completed
                    case 18: return db.Status.Find(12).Status_Name_Ar;  // 18- Contract Stage
                    case 19: return db.Status.Find(1016).Status_Name_Ar;  // 19- Certificate Equation
                    case 1016: return db.Status.Find(6).Status_Name_Ar;  // 20- Certificate Equation Completed

                    default: return db.Status.Find(4).Status_Name_Ar;// Defalut Set To 4 Not Complate
                }
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            int newStatus = 0;
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                if (!Can_I_Update_Record(std))
                    return;

                switch (std.Student_Status_Id)
                {
                    case 1: newStatus = 4; break; // 1- New
                    case 2: newStatus = 4; break; // 2- Pending
                    case 3: newStatus = 4; break; // 3- Assigned
                    case 4: newStatus = 15; break; // 4- Not Complete
                    case 5: newStatus = 4; break; // 5- Data Completed
                    case 6: newStatus = 15; break; // 6- Pay the Registration Fees
                    case 7: newStatus = 15; break; // 7- Registration Fee Paid
                    case 8: newStatus = 9; break; // 8- Book a Test Date
                    case 9: newStatus = 15; break; // 9- Failure in the Test
                    case 10: newStatus = 15; break; // 10- Success in the Test
                    case 11: newStatus = 15; break; // 11- Pay the Tuition Fees
                    case 12: newStatus = 15; break; // 12- Tuition Fees Paid
                    case 13: newStatus = 15; break; // 13- Issuance University ID
                    case 14: newStatus = 15; break; // 14- File Completed Successfully
                    case 15: newStatus = 15; return; // 15- File Complete with Failure

                    case 16: newStatus = 15; break; // 16- Complete Contract Files
                    case 17: newStatus = 15; break; // 17- Files Contract Completed
                    case 18: newStatus = 15; break; // 18- Contract Stage
                    case 19: newStatus = 15; break; // 19- Certificate Equation
                    case 1016: newStatus = 15; break; // 20- Certificate Equation Completed

                    default: newStatus = 15; break; // Defalut Set To 15 File Complete with Failure
                }


                std.Student_Status_Id = newStatus;
                db.Entry(std).State = System.Data.EntityState.Modified;
                db.SaveChanges();

                bool IsNotCompleted = false;
                if (std.Student_Status_Id == 4)
                    IsNotCompleted = true;
                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = newStatus;
                seq.Student_Id = student_record_id;
                seq.Note = txtNote.Text;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();

                //Send Email
                sendEamil(std);

                // Send Not Complete data
                if (IsNotCompleted)
                {
                    send_DatNotCompleted(std);
                    // Send SMS
                    SendSMS send_sms = new SendSMS();
                    string sever_name = Request.Url.Authority.ToString();
                    string URL = sever_name + "/StudentSubmitting.aspx?Student_Id=" + std.Student_Id;
                    if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                        URL = "http://" + URL;

                    string Text = "Dear " + std.Student_Name_En + "\nPlease complete the missing data in your file as soon as posible Link:" + URL +"\n\nPlease Check Your Email";
                    string number_Phone = std.Student_Phone;
                    string reslt_message = send_sms.SendMessage(Text, number_Phone);

                    SaveMessage(std.Student_Id, "SMS", Text);
                }

                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "تغير الحالة", "Update Status", LogData);

                Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)seq.Student_Id);
            }
        }

        private void ReadyToPay(Student std)
        {
            string amount = string.Empty, Payment_For = string.Empty;
            int payment_type_id = 1;
            Specialization spec = db.Specializations.Find(std.Student_Specialization_Id);
            double VAT = 0;
            int Type_of_Cash = txtTypeOfCash.SelectedIndex;

            bool IsFinish_Equation = Made_Equation(std);

            if (std.Student_Status_Id == 6)
            {
                // Check if He is New
                double amount_reg = 0;
                if (std.Student_Type_Id == 1 || IsFinish_Equation)
                { amount_reg = (double)spec.Specialization_Registeration_Payment; Payment_For = "Registration"; }
                else
                { amount_reg = (double)spec.Specialization_Study_Payment_Equation; Payment_For = "Equation"; }

                    // Check if He is not Saudi
                    if (std.Nationality.Nationality_Id != 191)
                    VAT = (amount_reg * 15) / 100;

                amount = (amount_reg + VAT).ToString();
                
                payment_type_id = 1;
            }
            else
            {
                // Check if He is not Saudi
                if (std.Nationality.Nationality_Id != 191)
                    if (Type_of_Cash == 1)
                        VAT = (double)spec.Specialization_Study_Payment_Semester * 15 / 100;
                    else
                        VAT = (double)spec.Specialization_Study_Payment * 15 / 100;

                // Check if He is pay for full year of semster
                if (Type_of_Cash == 1)
                    amount = ((spec.Specialization_Study_Payment_Semester + VAT)).ToString();
                else
                    amount = (spec.Specialization_Study_Payment + VAT).ToString();

                Payment_For = "Study";
                payment_type_id = 2;
            }

            int student_id = std.Student_Id;
            string entityId = "";
            string currency = "SAR";
            string paymentType = "DB";

            Payment_Process payment = db.Payment_Process.Create();
            payment.Student_Id = student_id;
            payment.Send_Amount = float.Parse(amount);
            payment.Send_Currency = currency;
            payment.Send_EntityId = entityId;
            payment.Send_PaymentType = paymentType;
            payment.Payment_IsPaid = false;
            payment.Payment_Type_Id = payment_type_id;
            payment.DateCreation = DateTime.Now;
            payment.Comment = Payment_For+ " Fees";
            payment.Payment_Trackingkey = StringCipher.RandomString(5) + student_id + StringCipher.RandomString(3) + DateTime.Now.GetHashCode()+ StringCipher.RandomString(5);
            payment.Payment_URL_IsValid = true;
            db.Payment_Process.Add(payment);
            db.SaveChanges();

            // Send Email 
            send_ReadyToPay(std, payment, Payment_For);

            // Send SMS
            SendSMS send_sms = new SendSMS();
            string sever_name = Request.Url.Authority.ToString();
            string URL = sever_name + "/Payment/PaymentProcessDetails.aspx?Trackingkey=" + payment.Payment_Trackingkey;
            if (URL.Substring(0, 4).ToLower() != "http".ToLower())
                URL = "http://" + URL;

            string Text = "Dear " + std.Student_Name_En + "\n\nNow you can pay the fees of " + Payment_For + "\n\nPlease use this link: " + URL;
            string number_Phone = std.Student_Phone;
            string reslt_message = send_sms.SendMessage(Text, number_Phone);

            SaveMessage(std.Student_Id, "SMS", Text);


        }

        private string GetRejectStatusName(int CurrentStatus_Id)
        {
            if (SessionWrapper.LoggedUser.Language_id != 1)
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(4).Status_Name_En;// 1- New
                    case 2: return db.Status.Find(4).Status_Name_En;// 2- Pending
                    case 3: return db.Status.Find(4).Status_Name_En;// 3- Assigned
                    case 4: return db.Status.Find(15).Status_Name_En;// 4- Not Complete
                    case 5: return db.Status.Find(4).Status_Name_En;// 5- Data Completed
                    case 6: return db.Status.Find(15).Status_Name_En;// 6- Pay the Registration Fees
                    case 7: return db.Status.Find(15).Status_Name_En;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(9).Status_Name_En;// 8- Book a Test Date
                    case 9: return db.Status.Find(15).Status_Name_En;// 9- Failure in the Test
                    case 10: return db.Status.Find(15).Status_Name_En;// 10- Success in the Test
                    case 11: return db.Status.Find(15).Status_Name_En;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(15).Status_Name_En;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(15).Status_Name_En;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_En;// 14- File Completed Successfully
                    case 15: return db.Status.Find(15).Status_Name_En;// 15- File Complete with Failure

                    case 16: return db.Status.Find(15).Status_Name_En; // 16- Complete Contract Files
                    case 17: return db.Status.Find(15).Status_Name_En; // 17- Files Contract Completed
                    case 18: return db.Status.Find(15).Status_Name_En; // 18- Contract Stage
                    case 19: return db.Status.Find(15).Status_Name_En; // 19- Certificate Equation
                    case 1016: return db.Status.Find(15).Status_Name_En; // 20- Certificate Equation Completed

                    default: return db.Status.Find(15).Status_Name_En;// Defalut Set To 15 Not Complate
                }
            }else
            {
                switch (CurrentStatus_Id)
                {
                    case 1: return db.Status.Find(4).Status_Name_Ar;// 1- New
                    case 2: return db.Status.Find(4).Status_Name_Ar;// 2- Pending
                    case 3: return db.Status.Find(4).Status_Name_Ar;// 3- Assigned
                    case 4: return db.Status.Find(15).Status_Name_Ar;// 4- Not Complete
                    case 5: return db.Status.Find(4).Status_Name_Ar;// 5- Data Completed
                    case 6: return db.Status.Find(15).Status_Name_Ar;// 6- Pay the Registration Fees
                    case 7: return db.Status.Find(15).Status_Name_Ar;// 7- Registration Fee Paid
                    case 8: return db.Status.Find(9).Status_Name_Ar;// 8- Book a Test Date
                    case 9: return db.Status.Find(15).Status_Name_Ar;// 9- Failure in the Test
                    case 10: return db.Status.Find(15).Status_Name_Ar;// 10- Success in the Test
                    case 11: return db.Status.Find(15).Status_Name_Ar;// 11- Pay the Tuition Fees
                    case 12: return db.Status.Find(15).Status_Name_Ar;// 12- Tuition Fees Paid
                    case 13: return db.Status.Find(15).Status_Name_Ar;// 13- Issuance University ID
                    case 14: return db.Status.Find(15).Status_Name_Ar;// 14- File Completed Successfully
                    case 15: return db.Status.Find(15).Status_Name_Ar;// 15- File Complete with Failure

                    case 16: return db.Status.Find(15).Status_Name_Ar; // 16- Complete Contract Files
                    case 17: return db.Status.Find(15).Status_Name_Ar; // 17- Files Contract Completed
                    case 18: return db.Status.Find(15).Status_Name_Ar; // 18- Contract Stage
                    case 19: return db.Status.Find(15).Status_Name_Ar; // 19- Certificate Equation
                    case 1016: return db.Status.Find(15).Status_Name_Ar; // 20- Certificate Equation Completed

                    default: return db.Status.Find(15).Status_Name_Ar;// Defalut Set To 15 Not Complate
                }
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            Student std = db.Students.Find(student_record_id);
            if (std != null)
            {
                if (!Can_I_Update_Record(std))
                    return;

                std.Student_Employee_Id = int.Parse(txtEmployees.SelectedValue);
                std.Student_Status_Id = 3; // Assigned
                db.Entry(std).State = System.Data.EntityState.Modified;

                Sequence seq = db.Sequences.Create();

                seq.Emp_Id = SessionWrapper.LoggedUser.Employee_Id;
                seq.Status_Id = 3; // Assigned
                seq.Student_Id = student_record_id;
                seq.DateCreation = DateTime.Now;

                db.Sequences.Add(seq);
                db.SaveChanges();

                db.Configuration.LazyLoadingEnabled = false;
                /* Add it to log file */
                Student stdLogFile = db.Students.Find(std.Student_Id);
                stdLogFile.Employee = db.Employees.Find(seq.Emp_Id);
                stdLogFile.Status = db.Status.Find(seq.Status_Id);

                LogData = "data:" + JsonConvert.SerializeObject(stdLogFile, logFileModule.settings);
                logFileModule.logfile(10, "اسناد ملف لموظف مركز الاتصالات", "File assigned to Call Center", LogData);

                Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)seq.Student_Id);
            }

        }

        public void SaveMessage(int student_id,string MessageType,string Message)
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

        public string Date_Different(DateTime ReveviedDate)
        {

            string Different = "Unkown time";
            if (SessionWrapper.LoggedUser.Language_id == 1)
                Different = "غير معروف";
            try
            {
                // Get the current DateTime.
                DateTime now = DateTime.Now;

                // Get the TimeSpan of the difference.
                TimeSpan elapsed = now.Subtract(ReveviedDate);


                // Get number of days ago.
                int Ago = (int)elapsed.TotalDays;

                if (Ago > 366)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 366 + " Years";
                    else
                        Different = "منذ " + Ago / 366 + " سنة";
                }
                else if (Ago >= 30)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 30 + " Mounths";
                    else
                        Different = "منذ " + Ago / 30 + " شهر";
                }
                else if (Ago >= 7)
                {
                    if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago / 7 + " Weeks";
                    else
                        Different = "منذ " + Ago / 7 + " اسبوع";
                }
                else if (Ago < 1)
                {
                    Ago = (int)elapsed.TotalHours;

                    if (Ago < 1)
                    {
                        Ago = (int)elapsed.TotalMinutes;
                        if (Ago < 1)
                        {
                            Ago = (int)elapsed.Seconds;
                            if (SessionWrapper.LoggedUser.Language_id == 2)
                                Different = Ago + " Seconds";
                            else
                                Different = "منذ " + Ago + " ثانية";
                        }
                        else if (SessionWrapper.LoggedUser.Language_id == 2)
                            Different = Ago + " Minutes";
                        else
                            Different = "منذ " + Ago + " دقيقة";
                    }
                    else if (SessionWrapper.LoggedUser.Language_id == 2)
                        Different = Ago + " Hours";
                    else
                        Different = "منذ " + Ago + " ساعة";

                }
                else if (SessionWrapper.LoggedUser.Language_id == 2)
                    Different = Ago + " days";
                else
                    Different = "منذ " + Ago + " يوم";
            }
            catch { }

            return Different;
        }

        public void UploadFile(int StudentID, int type, FileUpload Uplofile, string Path)
        {
            foreach (HttpPostedFile postfiles in Uplofile.PostedFiles)
            {
                if (postfiles.ContentLength > 0 && postfiles.FileName != "")
                {
                    File Fil = db.Files.Create();
                    Fil.Student_Id = StudentID;
                    Fil.File_Name = UploadFile(postfiles, Path); 
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
            string Imagepath = " ";
            if (this.Page.IsValid)
            {
                if (!UtilityClass.UploadFileIsValid(ref fileAttach, UtilityClass.ValidFileExtentions))
                {
                    //ltrMessage.Text = "<div class='alert alert-danger fade in'><strong>Images only allowed !</strong></div>";
                    Imagepath = "false";
                }
                Imagepath = string.Empty;

                Imagepath = UtilityClass.UploadFilePostedFile(ref fileAttach, Server.MapPath(Path));
            }
            return Imagepath;
        }

        protected void btnSendSMS_Click(object sender, EventArgs e)
        {
            int student_record_id = int.Parse(Request["StudentID"].ToString());
            Student std = db.Students.Find(student_record_id);
            string Text = "Dear " + std.Student_Name_En + "\n\nUse the link that sent with the message to attend the exam Link:" + std.Student_URL_Video + "\n\n" + std.Notes + "\n\nPlease Check Your Email.";
            string number_Phone = std.Student_Phone;
            SendSMS send_sms = new SendSMS();
            string reslt_message = send_sms.SendMessage(Text, number_Phone);
            SaveMessage(std.Student_Id, "SMS", Text);

            string notes = "";
            if (txtNote.Text != string.Empty)
                notes = "<br /><Strong>Notes:</Strong>" + txtNote.Text + "<br />";
            SendEmail send = new SendEmail();
            Text = "<Strong style='font-size:18;'>Dear " + std.Student_Name_En + "</Strong><br /><br /><Strong>TrackId : </Strong>  " + std.Student_Id + " <br /> <Strong>Your file has now reached the " + std.Status.Status_Name_En + " stage </Strong> <br /><Strong>SADAD Number:</Strong> " + txtSadadNumber.Text + "<br /><Strong>Amount:</Strong> " + txtAmount.Text + "<br />" + notes + "<br /> <Strong>Date:</Strong> " + DateTime.Now.ToShortDateString() + "<br /><br /><Strong>Elm University Riyadh<br />Admission System</Strong> ";
            string sever_name = Request.Url.Authority.ToString();
            string StudentEmail = std.Student_Email; // "ayman@softwarecornerit.com";//
            bool result = send.TextEmail("Ready To Pay", StudentEmail, Text, sever_name);

            SaveMessage(std.Student_Id, "E-mail", Text);

            List<Payment_Process> ppList = db.Payment_Process.Where(x => x.Student_Id == std.Student_Id).ToList();
            if (ppList.Count > 0)
            {
                Payment_Process pp = ppList[ppList.Count - 1];
                pp.Result_Description = txtSadadNumber.Text;
                db.Payment_Process.Add(pp);
                db.SaveChanges();
            }

            Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + (int)std.Student_Id);
        }

        public bool Made_Equation(Student std)
        {
            //Check If the student is make Equation Certificate
            bool Make_Equation = false;
            List<Sequence> seq = db.Sequences.Where(x => x.Student_Id == std.Student_Id && x.Status_Id == 1016).ToList(); // 1016 : Certificate Equation Completed
            if (seq.Count > 0)
                Make_Equation = true;

            return Make_Equation;
        }


    }
}