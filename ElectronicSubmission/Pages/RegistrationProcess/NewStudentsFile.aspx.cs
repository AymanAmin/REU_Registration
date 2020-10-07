using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    public partial class NewStudentsFile : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            db.Configuration.LazyLoadingEnabled = false;
            List<NewStudent> list_std = db.NewStudents.ToList();
            LoadStatus(list_std);
        }

        private void LoadStatus(List<NewStudent> list_std)
        {
            try
            {
                string str = string.Empty;
                for (int i = 0; i < list_std.Count; i++)
                {
                    str = "<tr>";
                    str += "<td class='text-left'>" + list_std[i].ID + "</td>";
                    str += "<td class='text-left'>" + list_std[i].StudentName + "</td>";
                    str += "<td class='text-left'>" + list_std[i].StudentPhone + "</td>";
                    str += "<td class='text-left'>" + list_std[i].StudentEmail + "</td>";
                    str += "<td class='text-left'>" + list_std[i].CreateDate.ToString() + "</td>";
                    str += "</tr>";

                    txtListofStudentsData.Controls.Add(new LiteralControl(str));
                }
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/NewStudentsFile.aspx"); }
        }
    }
}