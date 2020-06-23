using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using ElectronicSubmission;

namespace ElectronicSubmission
{
    public class ddlFiller
    {
        public static void dropDDL<T>(DropDownList ddlst, string selectID, string selectName, List<T> Entitylst, string selectword)
        {
            using (REU_RegistrationEntities db = new REU_RegistrationEntities())
            {
                ddlst.Items.Clear();

                ddlst.DataValueField = selectID;
                ddlst.DataTextField = selectName;
                ddlst.DataSource = Entitylst;
                ddlst.DataBind();
                ddlst.Items.Insert(0, new ListItem(selectword, "0"));
                ddlst.SelectedIndex = 0;
            }
        }

        public static void dropDDLBox<T>(ListBox ddlst, string selectID, string selectName, List<T> Entitylst)
        {
            using (REU_RegistrationEntities db = new REU_RegistrationEntities())
            {
                ddlst.Items.Clear();

                ddlst.DataValueField = selectID;
                ddlst.DataTextField = selectName;
                ddlst.DataSource = Entitylst;
                ddlst.DataBind();
            }
        }
    }

}