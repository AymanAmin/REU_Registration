using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.Contact
{
    public partial class ViewContact : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "#0a1350", "#fe9365", "blue", "#eb3422", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "#0ac282", "#eb3422", "coral", "salmon", "#0ac282" };
        int student_record_id = 0;
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

            SessionWrapper.BoardColor = 1;
            if (!IsPostBack)
            {
                Student_Concat student = db.Student_Concat.Find(student_record_id);
                LoadStudentInfo(student);
            }
            translateArabic();
        }

        private void translateArabic()
        {
            if (SessionWrapper.LoggedUser.Language_id != null)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    btnApprove.Text = "تم بنحاج";
                    btnReject.Text = "تم بالفشل";
                }
                else
                {
                    btnApprove.Text = "Completed Successfully";
                    btnReject.Text = "Complete with Failure";
                }
            }
        }

        private void LoadStudentInfo(Student_Concat std)
        {
            try
            {
                if (std != null)
                {
                    // select the color based on status id
                    db.Configuration.LazyLoadingEnabled = true;
                    int index = (int)std.Student_Concat_Status - 1;
                    if (index > Color.Length) index = 4;

                    txtStudent_SSN.Text = std.Student_Concat_Id.ToString();
                    txtStudent_Name.Text = std.Student_Concat_Name;
                    txtStudent_Phone.Text = std.Student_Concat_Phone;
                    txtStudent_Email.Text = std.Student_Concat_Email;
                    txtCreationDate.Text = std.Student_Concat_CreationDate.ToString();
                    txtMessage.Text = std.Student_Concat_Message;

                    // Change status to pendding if it's new
                    if (std.Student_Concat_Status == 1)
                    {
                        std.Student_Concat_Status = 2;
                        db.Entry(std).State = System.Data.EntityState.Modified;
                        db.SaveChanges();
                        index = (int)std.Student_Concat_Status - 1;
                        if (index > Color.Length) index = 1;
                    }
                    else if (std.Student_Concat_Status == 14 || std.Student_Concat_Status == 15)
                    {
                        DivAction.Visible = false;
                    }

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index] + " !important;'>" + std.Status.Status_Name_Ar + "</span>";
                    else
                        txtStatus.Text = "<span class='label label-warning' style='background:" + Color[index] + " !important;'>" + std.Status.Status_Name_En + "</span>";

                    SessionWrapper.BoardColor = (int)std.Student_Concat_Status;
                }
            }
            catch { Response.Redirect("~/Pages/Contact/ListContact.aspx"); }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Student_Concat std = db.Student_Concat.Find(student_record_id);
                std.Student_Concat_Status = 14;
                db.Entry(std).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                LogData = "data:" + JsonConvert.SerializeObject(std, logFileModule.settings);
                logFileModule.logfile(10, "تغير حالة الإتصال", "Update Status Contact", LogData);
                LoadStudentInfo(std);
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','تم حفظ القبول بنجاح في النظام  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','Save Status: ','Your Approve was Sucessfully saved in system');", true);           
            }
            catch {

                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','حدث خطأ  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status: ','Error');", true);
            }
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Student_Concat std = db.Student_Concat.Find(student_record_id);
                std.Student_Concat_Status = 15;
                db.Entry(std).State = System.Data.EntityState.Modified;
                db.SaveChanges();
                LogData = "data:" + JsonConvert.SerializeObject(std, logFileModule.settings);
                logFileModule.logfile(10, "تغير حالة الإتصال", "Update Status Contact", LogData);
                LoadStudentInfo(std);
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','تم حفظ الرفض بنجاح في النظام  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status: ','Your Reject was Sucessfully saved in system');", true);
            }
            catch
            {

                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','حدث خطأ  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status: ','Error');", true);
            }
        }
    }
}