using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectronicSubmission.Pages.RegistrationProcess
{
    /// <summary>
    /// Summary description for DeleteFile
    /// </summary>
    public class DeleteFile : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        int StudentID = 0;
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                if (context.Request["FileID"] == null || context.Request["StudentID"] == null)
                    context.Response.Redirect("~/default.aspx");

                int FileID = int.Parse(context.Request["FileID"].ToString());
                StudentID = int.Parse(context.Request["StudentID"].ToString());

                if ( FileID > 0) DeleteFileID(FileID, StudentID);

                context.Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + StudentID);
            }
            catch { context.Response.Redirect("~/Pages/RegistrationProcess/view.aspx?StudentID=" + StudentID); }
        }

        public bool DeleteFileID(int FileID,int studentID)
        {
            LogFileModule logFileModule = new LogFileModule();
            String LogData = "";
            string str_En = string.Empty, str_Ar = string.Empty;
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                File file = db.Files.First(x => x.File_Id == FileID);
                file.Student_Id = studentID;
                str_En = "Delete File";
                str_Ar = "حذف ملف";

                db.Entry(file).State = System.Data.EntityState.Deleted;
                db.SaveChanges();

                file.Student_Id = studentID;

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(file, logFileModule.settings);
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
                        if (SessionWrapper.LoggedUser != null)
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


        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}