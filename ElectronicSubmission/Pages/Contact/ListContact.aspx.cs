using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.Contact
{
    public partial class ListContact : System.Web.UI.Page
    {
        List<Student_Concat> ListStudentContact = new List<Student_Concat>();
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        string[] Color = { "#302780", "#fe9365", "blue", "#eb3422", "maroon", "purple", "teal", "deepskyblue", "gray", "hotpink", "blueviolet", "violet", "deepskyblue", "#0ac282", "#eb3422", "coral", "salmon", "#0ac282" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");
            ListStudentContact = db.Student_Concat.ToList();
            LoadStudentContact();
        }

        private void LoadStudentContact()
        {
            try
            {
                int emp_id = (int)SessionWrapper.LoggedUser.Employee_Id;
                int index = 0;
                //txtAddMeeting.Text = "<a class='btn btn-success btn-round' href='#' > </a>";


                //Start Statistic
                string total = txtFirst.Text = ListStudentContact.Count().ToString();
                string current = txtSecond.Text = ListStudentContact.Count(x => x.Student_Concat_Status != 14 && x.Student_Concat_Status != 15).ToString();
                string approved = txtThird.Text = ListStudentContact.Where(x => x.Student_Concat_Status == 14).Count().ToString();
                string rejected = txtFour.Text = ListStudentContact.Where(x => x.Student_Concat_Status == 15).Count().ToString();

                txtFirstPercentage.Text = CalcPercentage(double.Parse(total), double.Parse(total)) + "%";
                txtSecondPercentage.Text = CalcPercentage(double.Parse(current), double.Parse(total)) + "%";
                txtThirdPercentage.Text = CalcPercentage(double.Parse(approved), double.Parse(total)) + "%";
                txtFourPercentage.Text = CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%";

                txtFirstPercentageCss.Text = "<div class='progress-bar bg-c-lite-green' style='width: " + CalcPercentage(double.Parse(total), double.Parse(total)) + "%'></div>";
                txtSecondPercentageCss.Text = "<div class='progress-bar bg-c-yellow' style='width: " + CalcPercentage(double.Parse(current), double.Parse(total)) + "%'></div>";
                txtThirdPercentageCss.Text = "<div class='progress-bar bg-c-green' style='width: " + CalcPercentage(double.Parse(approved), double.Parse(total)) + "%'></div>";
                txtFourPercentageCss.Text = "<div class='progress-bar bg-c-pink' style='width: " + CalcPercentage(double.Parse(rejected), double.Parse(total)) + "%'></div>";

                //End Statistic

                string str = string.Empty;
                for (int i = 0; i < ListStudentContact.Count; i++)
                {
                    // select the color based on status id
                    index = (int)ListStudentContact[i].Status.Status_Code - 1;
                    if (index >= Color.Length)
                        index = 1;

                    str += "<tr>";
                    str += "<td class='txt-primary'>Expand</td>";
                    str += "<td> <a href= '../../../../Pages/Contact/ViewContact.aspx?StudentID=" + ListStudentContact[i].Student_Concat_Id + "' style='color:#00c3da;'>&nbsp;&nbsp; <i class='icofont icofont-eye-alt h5'></i>&nbsp;&nbsp;</a>";
                    if (SessionWrapper.LoggedUser.Language_id == 1)
                    {
                        str += "<td><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListStudentContact[i].Status.Status_Name_Ar + "</label></td>";
                    }
                    else
                    {
                        str += "<td><label class='label label-success' style='background:" + Color[index] + " !important;'>" + ListStudentContact[i].Status.Status_Name_En + "</label></td>";
                    }
                    str += "<td>" + ListStudentContact[i].Student_Concat_Name + "</td>";
                    str += "<td>" + ListStudentContact[i].Student_Concat_Phone + "</td>";
                    str += "<td>" + ListStudentContact[i].Student_Concat_Email + "</td>";
                    str += "<td>" + ListStudentContact[i].Student_Concat_CreationDate.ToString() + "</td>";
                    str += "<td>" + ListStudentContact[i].Student_Concat_Message + "</td>";
                    str += "</tr>";


                }
                txtStudentList.Text = str;
            }
            catch { Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx"); }
        }

        private double CalcPercentage(double sub, double Total)
        {
            double result = 0;
            result = (sub / Total) * 100;
            return Math.Round(result, 1);
        }

    }
}