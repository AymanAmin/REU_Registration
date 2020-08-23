using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.Reports
{
    public partial class StatByStatus : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        List<Status> list_Status = new List<Status>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            list_Status = db.Status.ToList();
            DateTime From = DateTime.Now;
            LoadStatus(list_Status, From);

            if (SessionWrapper.LoggedUser.Language_id == 1)
                btnSubmit.Text = "بحث";
        }

        private void LoadStatus(List<Status> list_Status, DateTime From)
        {
            try
            {
                string str = string.Empty;
                for (int i = 0; i < list_Status.Count; i++)
                {
                    str += "<tr>";

                    if (SessionWrapper.LoggedUser.Language_id == 1)
                        str += "<td class='text-left'>" + list_Status[i].Status_Name_Ar + "</td>";
                    else
                        str += "<td class='text-left'>" + list_Status[i].Status_Name_En + "</td>";

                    string date = "";                    
                    date = From.ToShortDateString();
                    From = DateTime.Parse(date);
                    DateTime To = From.AddSeconds(86399);
                    List<Sequence> list_seq = list_Status[i].Sequences.Where(x => x.DateCreation >= From && x.DateCreation <= To).ToList();
                    List<Student> List_std = new List<Student>();
                    for (int k = 0; k< list_seq.Count;k++)
                    {
                        List_std.Add(list_seq[k].Student);
                    }
                    List_std = List_std.Distinct().ToList();
                    int Count = List_std.Count;
                    //int Count2 = list_Status[i].Students1.Count;
                    str += "<td class='text-left'>" + Count + "</td>";
                    str += "<td class='text-left'>" + date + "</td>";

                    str += "</tr>";


                }
                txtSpecializationList.Text = str;
            }
            catch { Response.Redirect("~/Pages/Reports/StudentsPerSpecialization.aspx"); }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Date = txtDate.Value;
            if (Date != null && Date != "" && Date != string.Empty)
            {
                DateTime From = DateTime.Parse(Date);
                LoadStatus(list_Status, From);
            }
        }
    }
}