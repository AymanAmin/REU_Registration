using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting
{
    public partial class FormNationality : System.Web.UI.Page
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
            bool result = AddGroup(txtNationality_Name.Text, txtNationality_Name_En.Text);
            if (result)
            {
                clearform();
                if (SessionWrapper.LoggedUser.Language_id == 1)
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'left', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','حالة الحفظ: ','تم حفظ الجنسية بنجاح في النظام  ');", true);
                else Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status: ','Your Nationality was Sucessfully saved in system');", true);
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
            txtNationality_Name.Text = string.Empty;
            txtNationality_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Nationality group = db.Nationalities.Create();
                group.Nationality_Name_Ar = arabic_name;
                group.Nationality_Name_En = english_name;
                db.Nationalities.Add(group);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(group, logFileModule.settings);
                logFileModule.logfile(10, "إنشاء جنسية جديدة", "create new Nationalitys", LogData);
                db.Entry(group).Reload();
                NationalityGridView.DataBind();
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
                    txtNationality_Name.Attributes["placeholder"] = "الإسم عربي";
                    RFVtxtNationality_Name.Text = "أدخل الإسم العربي";
                    txtNationality_Name_En.Attributes["placeholder"] = "الإسم إنجليزي";
                    RFVtxtNationality_Name_En.Text = "أدخل الإسم بالإنجليزي";
                    Save.Text = "حفظ";

                    NationalityGridView.Columns[0].Caption = FieldNames.getFieldName("FormCollege-ID", "الرقم");
                    NationalityGridView.Columns[1].Caption = FieldNames.getFieldName("FormCollege-ArabicName", "الإسم عربي");
                    NationalityGridView.Columns[2].Caption = FieldNames.getFieldName("FormCollege-Action", "الاكشن");
                    NationalityGridView.Columns[3].Caption = FieldNames.getFieldName("FormCollege-EnglishName", "الإسم إنجليزي");
                }
                else
                {
                    txtNationality_Name.Attributes["placeholder"] = "Arabic Name";
                    RFVtxtNationality_Name.Text = "Enter Name Arabic";
                    txtNationality_Name_En.Attributes["placeholder"] = "English Name";
                    RFVtxtNationality_Name_En.Text = "Enter Name English";
                    Save.Text = "Save";

                    NationalityGridView.Columns[0].Caption = FieldNames.getFieldName("FormCollege-ID", "ID");
                    NationalityGridView.Columns[1].Caption = FieldNames.getFieldName("FormCollege-ArabicName", "Arabic Name");
                    NationalityGridView.Columns[2].Caption = FieldNames.getFieldName("FormCollege-Action", "Action");
                    NationalityGridView.Columns[3].Caption = FieldNames.getFieldName("FormCollege-EnglishName", "English Name");
                }
            }
        }
    }
}