using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting
{
    public partial class FormResource : System.Web.UI.Page
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
            bool result = AddGroup(txtResource_Name.Text, txtResource_Name_En.Text);
            if (result)
            {
                clearform();
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','تم حفظ مصدر المعرفة بنجاح في النظام  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status: ','Your Resource was Sucessfully saved in system');", true);
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
            txtResource_Name.Text = string.Empty;
            txtResource_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Resource group = db.Resources.Create();
                group.Resource_Name_Ar = arabic_name;
                group.Resource_Name_En = english_name;
                db.Resources.Add(group);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(group, logFileModule.settings);
                logFileModule.logfile(10, "إنشاء مصدر معرفة", "create new Resources", LogData);
                db.Entry(group).Reload();
                ResourceGridView.DataBind();
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
                    txtResource_Name.Attributes["placeholder"] = "الإسم عربي";
                    RFVtxtResource_Name.Text = "أدخل الإسم العربي";
                    txtResource_Name_En.Attributes["placeholder"] = "الإسم إنجليزي";
                    RFVtxtResource_Name_En.Text = "أدخل الإسم بالإنجليزي";
                    Save.Text = "حفظ";

                    ResourceGridView.Columns[0].Caption = FieldNames.getFieldName("FormCollege-ID", "الرقم");
                    ResourceGridView.Columns[1].Caption = FieldNames.getFieldName("FormCollege-ArabicName", "الإسم عربي");
                    ResourceGridView.Columns[2].Caption = FieldNames.getFieldName("FormCollege-Action", "الاكشن");
                    ResourceGridView.Columns[3].Caption = FieldNames.getFieldName("FormCollege-EnglishName", "الإسم إنجليزي");
                }
                else
                {
                    txtResource_Name.Attributes["placeholder"] = "Arabic Name";
                    RFVtxtResource_Name.Text = "Enter Name Arabic";
                    txtResource_Name_En.Attributes["placeholder"] = "English Name";
                    RFVtxtResource_Name_En.Text = "Enter Name English";
                    Save.Text = "Save";

                    ResourceGridView.Columns[0].Caption = FieldNames.getFieldName("FormCollege-ID", "ID");
                    ResourceGridView.Columns[1].Caption = FieldNames.getFieldName("FormCollege-ArabicName", "Arabic Name");
                    ResourceGridView.Columns[2].Caption = FieldNames.getFieldName("FormCollege-Action", "Action");
                    ResourceGridView.Columns[3].Caption = FieldNames.getFieldName("FormCollege-EnglishName", "English Name");
                }
            }
        }

    }
}