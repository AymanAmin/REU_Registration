using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ElectronicSubmission.Pages.Setting.UserManagment
{
    public partial class PermissionGroups : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();

        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        protected void Page_PreInit(object sender, EventArgs e)
        {
           /* if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";*/
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Permission_Group group = db.Permission_Group.First();
            if (SessionWrapper.LoggedUser == null)
                Response.Redirect("~/Pages/Auth/Login.aspx");

            if (!IsPostBack)
            {
                FillGroupPermission();
                Change_LablesName_BasedOn_Language();
                Save.Text = FieldNames.getFieldName("PermissionGroups-Save", "Save");
            }
        }

        

        protected void Save_Click(object sender, EventArgs e)
        {
            bool result = AddGroup(txtGroup_Name.Text, txtGroup_Name_En.Text);
            if (result)
            {
                clearform();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  Your Item was Sucessfully saved in system ! ');", true);
                FillGroupPermission();
                //Response.Redirect("~/Pages/UserManagment/PermissionGroups.aspx");
            }
        }

        void clearform ()
        {
            txtGroup_Name.Text = string.Empty;
            txtGroup_Name_En.Text = string.Empty;
        }

        private bool AddGroup(string arabic_name, string english_name)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Group group = db.Groups.Create();
                group.Group_Name_Ar = arabic_name;
                group.Group_Name_En = english_name;
                db.Groups.Add(group);
                db.SaveChanges();
                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(group, logFileModule.settings);
                logFileModule.logfile(10, "إنشاء مجموعة جديدة", "create new group", LogData);
                //PriorityDataSource.DataBind();
            }
            catch { return false; }
            return true;
        }

        private void FillGroupPermission()
        {
            List<Group> GroupList = db.Groups.ToList();
            if(SessionWrapper.LoggedUser.Language_id == 1)
            ddlFiller.dropDDL(ddlGroups, "Group_Id", "Group_Name_Ar", GroupList, "أختر المجموعة");
            else
                ddlFiller.dropDDL(ddlGroups, "Group_Id", "Group_Name_En", GroupList, "Select Group");
            //if (GroupList.Count > 0)
            //ddlGroups.SelectedIndex = 1;
        }

        protected void ddlGroups_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Group Permission
                int Group_Id = int.Parse(ddlGroups.SelectedValue.ToString());
                PermissionGroupGridView.Selection.UnselectAll();
                List<Permission_Group> Group_Permission_List = db.Permission_Group.Where(x => x.Group_Id == Group_Id).ToList();
                for(int i = 0; i < Group_Permission_List.Count; i++)
                {
                    PermissionGroupGridView.Selection.SelectRowByKey(Group_Permission_List[i].Permission_Id);
                }

                // Status 
                StatusGridView.Selection.UnselectAll();
                List<Group_Status> Group_Status_List = db.Group_Status.Where(x => x.Group_Id == Group_Id).ToList();
                for (int i = 0; i < Group_Status_List.Count; i++)
                {
                    StatusGridView.Selection.SelectRowByKey(Group_Status_List[i].Status_Id);
                }
            }
            catch { }

        }

        protected void SaveChanges_Click(object sender, EventArgs e)
        {
            try
            {
                int Group_Id = int.Parse(ddlGroups.SelectedValue.ToString());

                // Save Group Permission
                var Permision_Ids = PermissionGroupGridView.GetSelectedFieldValues("Permission_Id");
                db.Database.ExecuteSqlCommand("Delete Permission_Group where Group_Id = " + Group_Id);
                for (int i = 0; i < Permision_Ids.Count; i++)
                {
                    Permission_Group per_group = db.Permission_Group.Create();
                    per_group.Group_Id = Group_Id;
                    per_group.Permission_Id = int.Parse(Permision_Ids[i].ToString());
                    db.Permission_Group.Add(per_group);    
                }
                db.SaveChanges();

                //Save Status
                var Status_Ids = StatusGridView.GetSelectedFieldValues("Status_Id");
                db.Database.ExecuteSqlCommand("Delete Group_Status where Group_Id = " + Group_Id);
                for (int i = 0; i < Status_Ids.Count; i++)
                {
                    Group_Status per_groupStatus = db.Group_Status.Create();
                    per_groupStatus.Group_Id = Group_Id;
                    per_groupStatus.Status_Id = int.Parse(Status_Ids[i].ToString());
                    db.Group_Status.Add(per_groupStatus);
                    db.SaveChanges();
                }
               

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Group_Id, logFileModule.settings);
                logFileModule.logfile(10, "تعديل صلاحيات المجموعة", "update group permissions", LogData);
            }
            catch (Exception er){ }
        }

        private void Change_LablesName_BasedOn_Language()
        {
            try
            {
                // Group Grid View
                GroupGridView.Columns[0].Caption = FieldNames.getFieldName("PermissionGroups-ID", "ID");
                GroupGridView.Columns[1].Caption = FieldNames.getFieldName("PermissionGroups-ArabicName", "Arabic Name");
                GroupGridView.Columns[2].Caption = FieldNames.getFieldName("PermissionGroups-Action", "Action");
                GroupGridView.Columns[3].Caption = FieldNames.getFieldName("PermissionGroups-EnglishName", "English Name");

                // Permission Grid View
                PermissionGroupGridView.Columns[0].Caption = FieldNames.getFieldName("PermissionGroups-ID", "ID");
                PermissionGroupGridView.Columns[1].Caption = FieldNames.getFieldName("PermissionGroups-PermissionID", "Permission ID");
                PermissionGroupGridView.Columns[2].Caption = FieldNames.getFieldName("PermissionGroups-ArabicName", "Arabic Name");
                PermissionGroupGridView.Columns[3].Caption = FieldNames.getFieldName("PermissionGroups-EnglishName", "English Name");
                PermissionGroupGridView.Columns[4].Caption = FieldNames.getFieldName("PermissionGroups-URLPath", "URL Path");

                // Status Grid View
                StatusGridView.Columns[0].Caption = FieldNames.getFieldName("PermissionGroups-ID", "ID");
                StatusGridView.Columns[2].Caption = FieldNames.getFieldName("PermissionGroups-ArabicName", "Arabic Name");
                StatusGridView.Columns[3].Caption = FieldNames.getFieldName("PermissionGroups-EnglishName", "English Name");
                StatusGridView.Columns[4].Caption = FieldNames.getFieldName("PermissionGroups-Code", "Code");

                // Save Button
                SaveChanges.Text = FieldNames.getFieldName("PermissionGroups-Save", "Save");
            }
            catch { }
        }


    }
}