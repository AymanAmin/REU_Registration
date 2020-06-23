using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElectronicSubmission;


namespace ElectronicSubmission.Pages.Admin
{
    public partial class LogFile : System.Web.UI.Page
    {
        REU_RegistrationEntities db = new REU_RegistrationEntities();
        UtilityClass UC = new UtilityClass();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            /*if (Session["IsECMS"] != null)
                if (!(bool)Session["IsECMS"])
                    this.MasterPageFile = "~/EminutesMaster.Master";*/
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded = true;
            if (!IsPostBack)
            {
                /*LogFileGridView.DataBind();
                LogFileGridView.DetailRows.ExpandRow(0);*/
            }

        }

        protected void detailGrid_DataSelect(object sender, EventArgs e)
        {

            Int32 id = (Int32)(sender as ASPxGridView).GetMasterRowKeyValue();
            Session["LogID"] = id;
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "changeView();", true);
        }

        protected void detailGrid_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
        {

        }

        protected void chkSingleExpanded_CheckedChanged(object sender, EventArgs e)
        {
            LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded = true;// chkSingleExpanded.Checked;
            if (LogFileGridView.SettingsDetail.AllowOnlyOneMasterRowExpanded)
            {
                LogFileGridView.DetailRows.CollapseAllRows();
            }
        }

        protected void LogFileGridView_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            
        }
    }
}