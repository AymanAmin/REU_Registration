using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission
{
    public partial class SubmitingClosed : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        public int langId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsLocal && !Request.IsSecureConnection)
            {
                string redirectUrl = Request.Url.ToString().Replace("http:", "https:");
                Response.Redirect(redirectUrl, false);
                //HttpContext.ApplicationInstance.CompleteRequest();
            }

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

                if (Session["Success"] != null)
                {
                    if (langId == 1)
                    {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('تم الارسال', 'تم ارسال البيانات بنجاح', 'success');", true);
                    }
                    else
                    {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "AlertNotify('Done successfully!', 'The message has been submited successfully.', 'success');", true);
                    }


                    Session["Success"] = null;
                }
            }

            }

        //------------------------------------Style-------------------------------------

        private void getStyleScript()
        {
            StyleRTL.Text = FieldNames.getSTyleRTLHome();
            ScriptRTL.Text = FieldNames.getJavaScriptRTLHome();
        }

        private void translateArabic()
        {
            if (langId == 1)
            {
                AdmissionFormButton.Value = "الرجاء تعبئة إستمارة التقديم";
                Save.Text = "ارسال";
            }
            else
            {
                AdmissionFormButton.Value = "Please fill the application Form";
                Save.Text = "Send";
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            NewStudent std = db.NewStudents.Create();
            std.StudentName = StudentName.Text;
            std.StudentPhone = StudentPhone.Text;
            std.StudentEmail = StudentEmail.Text;
            std.CreateDate = DateTime.Now;
            db.NewStudents.Add(std);
            db.SaveChanges();

            Session["Success"] = true;
            Response.Redirect("SubmitingClosed.aspx");

        }
    }
}