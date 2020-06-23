using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission
{
    public partial class Bachelors : System.Web.UI.Page
    {
        int SpecializationId = 0;
        public int langId = 0;
        protected void Page_Load(object sender, EventArgs e)
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

            SessionWrapper.LanguageHome = langId;
            getStyleScript();

            if (int.TryParse(Request["SpecializationId"], out SpecializationId) && SpecializationId > 0 || Session["SpecializationId"] != null)
            {
                using (REU_RegistrationEntities db = new REU_RegistrationEntities())
                {
                    if (Session["SpecializationId"] != null && SpecializationId == 0)
                        SpecializationId = (int)Session["SpecializationId"]; 
                    Session["SpecializationId"] = SpecializationId;
                    SessionWrapper.Language = db.Lanuage_Detials.Where(x => x.Language_Master_Id == langId).ToList();
                    Specialization oneSpecialization = db.Specializations.FirstOrDefault(x => x.Specialization_Id == SpecializationId);
                    if (oneSpecialization != null)
                    {
                        if (langId == 2)
                        {
                            headerBachelors.InnerHtml = oneSpecialization.Specialization_Name_En;
                            detailedBachelors.InnerHtml = oneSpecialization.Specialization_Name_En;
                            bachelorsReque.InnerHtml = oneSpecialization.Condition_En;
                            headerBody.InnerHtml = "<i class='" + oneSpecialization.Specialization_Icon + "'></i> " + oneSpecialization.Specialization_Name_En;
                            bachelorsDescription.InnerHtml = oneSpecialization.Specialization_Description_En;
                            bachelorsImage.Src = "Template/extra-images/" + oneSpecialization.Specialization_Image;
                        }
                        else
                        {
                            headerBachelors.InnerHtml = oneSpecialization.Specialization_Name_Ar;
                            detailedBachelors.InnerHtml = oneSpecialization.Specialization_Name_Ar;
                            bachelorsReque.InnerHtml = oneSpecialization.Condition_Ar;
                            headerBody.InnerHtml = "<i class='" + oneSpecialization.Specialization_Icon + "'></i> " + oneSpecialization.Specialization_Name_Ar;
                            bachelorsDescription.InnerHtml = oneSpecialization.Specialization_Description_Ar;
                            bachelorsImage.Src = "Template/extra-images/" + oneSpecialization.Specialization_Image;
                        }
                        translateArabic();
                    }
                    else
                    {
                        Response.Redirect("~/homepage.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("~/homepage.aspx");
            }
        }

        private void getStyleScript()
        {
            StyleRTL.Text = FieldNames.getSTyleRTLHome();
            ScriptRTL.Text = FieldNames.getJavaScriptRTLHome();
        }

        private void translateArabic()
        {
            if (langId == 1)
            {
                AdmissionFormButton.Value = "الرجاء الضغط علي الزر لبدء عملية التقديم للقبول";
            }
            else
            {
                AdmissionFormButton.Value = "Please click on the button to start the application Form";
            }
        }
    }
}