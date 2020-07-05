using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Payment
{
    public partial class TermsAndConditions : System.Web.UI.Page
    {
        public int langId = 0;
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Terms"] != null)
                Response.Redirect("~/StudentSubmitting.aspx");

            if (!IsPostBack)
            {
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
        }

        protected void Agree_Click(object sender, EventArgs e)
        {
            Session["Terms"] = true;
            Response.Redirect("~/StudentSubmitting.aspx");
        }

        protected void Disagree_Click(object sender, EventArgs e)
        {
            Session["Terms"] = null;
            Response.Redirect("~/homepage.aspx");
        }
    }
}