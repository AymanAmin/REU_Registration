﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using DevExpress.Web;

namespace ElectronicSubmission.Pages.Setting.UserManagment
{
    public partial class Permissions : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();

        protected void Page_PreInit(object sender, EventArgs e)
        {
           /* if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";*/
        }

        //LogFile Data
        LogFileModule logFileModule = new LogFileModule();
        String LogData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Change_LablesName_BasedOn_Language();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            int ParentID = 0;

            if (MainMenu.Checked){ ParentID = 0; } else {try { ParentID = int.Parse(txtParent.Text); } catch { ParentID = 0; } }

            bool result = AddPermission(txtPermission_Name.Text, txtPermission_Name_En.Text, ParentID, txtUrl_Path.Text, txtClass_Icon.Text);
            if (result)
            {
                clearform();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The new permission was Sucessfully saved in system ! ');", true);
            }
        }

        void clearform()
        {
            txtPermission_Name.Text = string.Empty;
            txtPermission_Name_En.Text = string.Empty;
            //txtParent.SelectedIndex = 1;
            txtClass_Icon.Text = string.Empty;
            txtUrl_Path.Text = string.Empty;
            MainMenu.Checked = false;
        }

        private bool AddPermission(string arabic_name,string english_name, int parent_id , string url,string icon)
        {
            try
            {
                db.Configuration.LazyLoadingEnabled = false;
                Permission Per = db.Permissions.Create();
                Per.Permission_Name_Ar = arabic_name;
                Per.Permission_Name_En = english_name;
                Per.Parent = parent_id;
                Per.Url_Path = url;
                Per.Permission_Icon = icon;
                Per.System_Id = 1;
                db.Permissions.Add(Per);
                db.SaveChanges();

                /* Add it to log file */
                LogData = "data:" + JsonConvert.SerializeObject(Per, logFileModule.settings);
                logFileModule.logfile(10, "إضافة صلاحية جديدة", "add new permission", LogData);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "HideTheModel(); notify('top', 'right', 'fa fa-check', 'success', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','  The Permission add successfully ! ');", true);
                //PriorityDataSource.DataBind();
            }
            catch { Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "notify('top', 'right', 'fa fa-delete', 'danger', 'animated fadeInRight', 'animated fadeOutRight','  Save Status : ','System Error');", true); return false; }
            return true;
        }

        private void Change_LablesName_BasedOn_Language()
        {
            try
            {
                //Permission List
                PermissionTreeList.Columns[0].Caption = FieldNames.getFieldName("Permissions-ArabicName", "Arabic Name");
                PermissionTreeList.Columns[1].Caption = FieldNames.getFieldName("Permissions-EnglishName", "English Name");
                PermissionTreeList.Columns[2].Caption = FieldNames.getFieldName("Permissions-URLPath", "URL Path");
                PermissionTreeList.Columns[3].Caption = FieldNames.getFieldName("Permissions-Icon", "Icon");
                
                PermissionTreeList.Columns[4].Caption = FieldNames.getFieldName("Permissions-Parent", "Parent");
                PermissionTreeList.Columns[5].Caption = FieldNames.getFieldName("Permissions-System", "System");
                PermissionTreeList.Columns[6].Caption = FieldNames.getFieldName("Permissions-Action", "Action");

                // Save Button
                Save.Text = FieldNames.getFieldName("Permissions-Save", "Save");

                //Change DropDown 
            }
            catch { }
        }

        protected void PermissionTreeList_AutoFilterCellEditorInitialize(object sender, DevExpress.Web.ASPxTreeList.ASPxTreeListEditorEventArgs e)
        {
            
        }
    }
}