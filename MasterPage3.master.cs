using System;
using System.Web;
using System.Web.Security;

public partial class MasterPage3 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] != null)
        {
            User user = (User)Session["User"];
            if (user.IsAdmin)
            {
                hlAdmin.Style["display"] = "block";
            }

            hlLogout.Style["display"] = "block";
        }
        else
        {
            hlAdmin.Style["display"] = "none";
            hlLogout.Style["display"] = "none";
        }

        lblCopyRight.Text = string.Format("Copyright © James Bergen {0}", DateTime.Today.Year.ToString());
    }

    protected void hlLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        FormsAuthentication.SignOut();
        Session["user_id"] = null;
        Session["user_pass"] = null;
        Session["user_name"] = null;
        Session["login_status"] = "no";
        Response.Redirect("~/login.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
}
