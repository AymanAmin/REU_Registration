using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.Reports
{
    public partial class StudentsPerSpecialization : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            List<Specialization> list_Spec = db.Specializations.ToList();
            LoadSpecialization(list_Spec);

        }

        private void LoadSpecialization(List<Specialization> list_Spec)
        {
            try
            {
                string str = string.Empty;
                for (int i = 0; i < list_Spec.Count; i++)
                {
                    str += "<tr>";
                    
                    if(SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + list_Spec[i].Specialization_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + list_Spec[i].Specialization_Name_En + "</td>";

                    int Count = list_Spec[i].Students.Count;
                    int Count2 = list_Spec[i].Students1.Count;
                    str += "<td class='text-left'>" + Count + "</td>";
                    str += "<td class='text-left'>" + Count2 + "</td>";

                    str += "</tr>";


                }
                txtSpecializationList.Text = str;
            }
            catch { Response.Redirect("~/Pages/Reports/StudentsPerSpecialization.aspx"); }
        }
    }
}