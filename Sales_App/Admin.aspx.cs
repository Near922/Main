using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_App_Admin : System.Web.UI.Page
{
    private MessageManager _messageManger = new MessageManager();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.Now);
        Response.Cache.SetValidUntilExpires(false);
        Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        if (Session["User"] == null || !Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("Home.aspx");
        }

        if (Session["User"] != null && Page.User.Identity.IsAuthenticated)
        {
            User user = (User)Session["User"];
            if (!user.IsAdmin)
            {
                Response.Redirect("Home.aspx");
            }
        }

        if (Session["Count"] == null)
        {
            HitCounter hc = new HitCounter();
            Session["Count"] = hc.Count;
            hc = null;
        }

        lblhitCounts.Text = String.Format("Total Hits: {0}", Session["Count"].ToString());
        lblMessageCount.Text = String.Format("Total Messages: {0}", _messageManger.Messages.Count);
        _messageManger.Messages.Reverse();
        if (!IsPostBack)
        {
            rptMessages.DataSource = _messageManger.Messages;
            rptMessages.DataBind();
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {

            foreach (RepeaterItem item in rptMessages.Items)
            {
                var checkbox = item.FindControl("chkbox") as CheckBox;
                var hidden = item.FindControl("hidden") as HiddenField;

                if (checkbox.Checked)
                {

                    Message result = _messageManger.Messages.First(x => x.ID == int.Parse(hidden.Value));
                    result.IsActive = false;
                }
            }

            _messageManger.DeleteMessages();
            _messageManger.Messages.Reverse();
            rptMessages.DataSource = _messageManger.Messages;
            lblMessageCount.Text = String.Format("Total Messages: {0}", _messageManger.Messages.Count);
            rptMessages.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }


    }

}