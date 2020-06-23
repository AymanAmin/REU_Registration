using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting
{
    public partial class FormCollege : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            translateArabic();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            bool result = AddGroup(txtCollege_Name.Text, txtCollege_Name_En.Text);
            if (result)
            {
                clearform();
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','تم حفظ الكلية بنجاح في النظام  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status: ','Your College was Sucessfully saved in system');", true);
            }
            else
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'left', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','حدث خطأ  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status: ','Error');", true);
            }
        }

        void clearform()
        {
            txtCollege_Name.Text = string.Empty;
            txtCollege_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Collage group = db.Collages.Create();
                group.Collage_Name_Ar = arabic_name;
                group.Collage_Name_En = english_name;
                db.Collages.Add(group);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(group, logFileModule.settings);
                logFileModule.logfile(10, "إنشاء كلية جديدة", "create new Colleges", LogData);
                db.Entry(group).Reload();
                CollegeDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }

        private void translateArabic()
        {
            if (SessionWrapper.LoggedUser.Language_id != null)
            {
                if (SessionWrapper.LoggedUser.Language_id == 1)
                {
                    txtCollege_Name.Attributes["placeholder"] = "الإسم عربي";
                    RFVtxtCollege_Name.Text = "أدخل الإسم العربي";
                    txtCollege_Name_En.Attributes["placeholder"] = "الإسم إنجليزي";
                    RFVtxtCollege_Name_En.Text = "أدخل الإسم بالإنجليزي";
                    Save.Text = "حفظ";

                    CollegeGridView.Columns[0].Caption = FieldNames.getFieldName("FormCollege-ID", "الرقم");
                    CollegeGridView.Columns[1].Caption = FieldNames.getFieldName("FormCollege-ArabicName", "الإسم عربي");
                    CollegeGridView.Columns[2].Caption = FieldNames.getFieldName("FormCollege-Action", "الاكشن");
                    CollegeGridView.Columns[3].Caption = FieldNames.getFieldName("FormCollege-EnglishName", "الإسم إنجليزي");
                }
                else
                {
                    txtCollege_Name.Attributes["placeholder"] = "Arabic Name";
                    RFVtxtCollege_Name.Text = "Enter Name Arabic";
                    txtCollege_Name_En.Attributes["placeholder"] = "English Name";
                    RFVtxtCollege_Name_En.Text = "Enter Name English";
                    Save.Text = "Save";

                    CollegeGridView.Columns[0].Caption = FieldNames.getFieldName("FormCollege-ID", "ID");
                    CollegeGridView.Columns[1].Caption = FieldNames.getFieldName("FormCollege-ArabicName", "Arabic Name");
                    CollegeGridView.Columns[2].Caption = FieldNames.getFieldName("FormCollege-Action", "Action");
                    CollegeGridView.Columns[3].Caption = FieldNames.getFieldName("FormCollege-EnglishName", "English Name");
                }
            }
        }
    }
}