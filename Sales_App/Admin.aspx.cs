using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_App_Admin : System.Web.UI.Page
{
    private MessageManager _messageManger;
    private string[] pageOptions = { "All", "5", "10", "20", "50", "100" };

    private int SetMessagesPerPage(MessageManager messageManager)
    {
        if(!IsPostBack)
        {
            lstMessagePerPage.SelectedIndex = 0;
            return messageManager.TotalMessages;
        }

        if (lstMessagePerPage.Text == "All")
        {
            return messageManager.TotalMessages;
        }
        else
        {
            return int.Parse(lstMessagePerPage.Text);
        }
    }

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
        if(!IsPostBack)
        {
            Session["MessageManager"] = null;
        }

        if (Session["MessageManager"] == null)
        {
            _messageManger = new MessageManager();

        }
        else
        {
            _messageManger = (MessageManager)Session["MessageManager"];
        }

        if (!IsPostBack)
        {
            lstMessagePerPage.DataSource = pageOptions;
            lstMessagePerPage.DataBind();
        }

        //_messageManger.MessagesPerPage = SetMessagesPerPage(_messageManger);
        lblMessageCount.Text = String.Format("Total Messages: {0}", _messageManger.TotalMessages);

        if (!IsPostBack)
        {
            rptMessages.DataSource = _messageManger.CurrentPage;
            rptMessages.DataBind();

            rptPages.DataSource = _messageManger.PagesArray;
            rptPages.DataBind();

        }

        Session["MessageManager"] = _messageManger;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        _messageManger = (MessageManager)Session["MessageManager"];
        try
        {

            foreach (RepeaterItem item in rptMessages.Items)
            {
                var checkbox = item.FindControl("chkbox") as CheckBox;
                var hidden = item.FindControl("hidden") as HiddenField;

                if (checkbox.Checked)
                {

                    Message result = _messageManger.CurrentPage.First(x => x.ID == int.Parse(hidden.Value));
                    result.IsActive = false;
                }
            }

            _messageManger.DeleteMessages();
            //_messageManger.Messages.Reverse();
            rptMessages.DataSource = _messageManger.CurrentPage;
            rptPages.DataSource = _messageManger.PagesArray;
            lblMessageCount.Text = String.Format("Total Messages: {0}", _messageManger.TotalMessages);
            rptMessages.DataBind();
            rptPages.DataBind();
            Session["MessageManager"] = _messageManger;
            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }
    }


    protected void rptPages_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        _messageManger = (MessageManager)Session["MessageManager"];
        var button = e.Item.FindControl("lnkPage") as LinkButton;
        _messageManger.MessagesPerPage = SetMessagesPerPage(_messageManger);
        _messageManger.ChangePage(int.Parse(button.Text));
        Session["MessageManager"] = _messageManger;
        UpdateMessageRepeater(_messageManger);
    }

    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        _messageManger = (MessageManager)Session["MessageManager"];
        _messageManger.MessagesPerPage = SetMessagesPerPage(_messageManger);
        _messageManger.TogglePage(TogglePage.Previous);
        Session["MessageManager"] = _messageManger;
        UpdateMessageRepeater(_messageManger);
    }

    protected void lnkNext_Click(object sender, EventArgs e)
    {
        _messageManger = (MessageManager)Session["MessageManager"];
        _messageManger.MessagesPerPage = SetMessagesPerPage(_messageManger);
        _messageManger.TogglePage(TogglePage.Next);
        Session["MessageManager"] = _messageManger;
        UpdateMessageRepeater(_messageManger);
    }

    protected void lstMessagePerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        _messageManger = (MessageManager)Session["MessageManager"];
        _messageManger.MessagesPerPage = SetMessagesPerPage(_messageManger);
        Session["MessageManager"] = _messageManger;
        UpdateMessageRepeater(_messageManger);
    }

    private void UpdateMessageRepeater(MessageManager manager)
    {
        rptMessages.DataSource = manager.CurrentPage;
        rptMessages.DataBind();
        rptPages.DataSource = manager.PagesArray;
        rptPages.DataBind();
    }
}