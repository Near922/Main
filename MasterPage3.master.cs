using System;
using System.Web;

public partial class MasterPage3 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.Now);
        Response.Cache.SetValidUntilExpires(false);
        Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["User"] != null && Page.User.Identity.IsAuthenticated)
        {
            User user = (User)Session["User"];
            if (user.IsAdmin)
            {
                hlAdmin.Style["display"] = "block";
            }
        }
        else
        {
            hlAdmin.Style["display"] = "none";
        }
    }
}
