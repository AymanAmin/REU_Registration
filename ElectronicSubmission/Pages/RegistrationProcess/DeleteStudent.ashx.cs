using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    /// <summary>
    /// Summary description for DeleteStudent
    /// </summary>
    public class DeleteStudent : IHttpHandler , System.Web.SessionState.IRequiresSessionState
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        public void ProcessRequest(HttpContext context)
        {
            if (context.Request["StudentID"] == null)
                context.Response.Redirect("~/default.aspx");

            int StudentID = int.Parse(context.Request["StudentID"].ToString());

            if (StudentID > 0) DeleteStudents(StudentID);

            context.Response.Redirect("~/Pages/RegistrationProcess/ListView.aspx");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public bool DeleteStudents(int StudentID)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            string str_En = string.Empty, str_Ar = string.Empty;
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Student Stu = db.Students.First(x => x.Student_Id == StudentID);
                if (Stu.Suspended == null || Stu.Suspended == 0)
                {
                    Stu.Suspended = 1;
                    str_En = "Delete Student";
                    str_Ar = "حذف طالب";
                }
                else
                {
                    Stu.Suspended = 0;
                    str_En = "Restore Student";
                    str_Ar = "استعادة طالب";
                }
                db.Entry(Stu).State = System.Data.EntityState.Modified;
                db.SaveChanges();

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Stu, logFileModule.settings);
                logfile(10, str_Ar, str_En, LogData);

            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }

        public void logfile(int controlId, string logName, string logDescription, String noteData)
        {
            try
            {
                using (var dbLog = new REU_RegistrationEntities())
                {
                    Log_File logFileInsert = dbLog.Log_File.Create();
                    logFileInsert.Log_Date = DateTime.Now;
                    if (controlId != 0)
                    {
                        if(SessionWrapper.LoggedUser != null)
                            logFileInsert.Login_Id = SessionWrapper.LoggedUser.Employee_Id;
                        else
                            logFileInsert.Login_Id = 1;
                        logFileInsert.Form_Id = currentPage();
                    }
                    logFileInsert.Log_Name = logName;
                    logFileInsert.Log_Description = logDescription;
                    logFileInsert.Log_Note = noteData;
                    dbLog.Log_File.Add(logFileInsert);
                    dbLog.SaveChanges();
                }
            }
            catch (Exception er) { }
        }

        private int currentPage()
        {
            Permission CurrentPage = new Permission();
            try
            {
                string LocalPath = String.Concat(HttpContext.Current.Request.Url.LocalPath.Skip(1));
                int found = LocalPath.IndexOf(".ashx");
                string url = LocalPath.Substring(0, found + 5);
                CurrentPage = db.Permissions.Where(x => x.Url_Path == url).First();
            }
            catch { CurrentPage = db.Permissions.FirstOrDefault(); }

            return CurrentPage.Permission_Id;
        }
    }
}