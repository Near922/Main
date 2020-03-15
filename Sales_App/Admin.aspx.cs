using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sales_App_Admin : System.Web.UI.Page
{
    private MessageManager _messageManager;
    private string[] pageOptions = { "All", "5", "10", "20", "50", "100" };

    private int SetMessagesPerPage(MessageManager messageManager)
    {
        if (!IsPostBack)
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
        if (Session["User"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        if (Session["User"] != null)
        {
            User user = (User)Session["User"];
            if (!user.IsAdmin)
            {
                Response.Redirect("~/Home.aspx");
            }
        }

        if (Session["Count"] == null)
        {
            HitCounter hc = new HitCounter();
            Session["Count"] = hc.Count;
            hc = null;
        }

        lblhitCounts.Text = String.Format("Total Hits: {0}", Session["Count"].ToString());
        if (!IsPostBack)
        {
            Session["MessageManager"] = null;
        }

        if (Session["MessageManager"] == null)
        {
            _messageManager = new MessageManager();
            Session["MessageManager"] = _messageManager;

        }
        else
        {
            _messageManager = (MessageManager)Session["MessageManager"];
        }

        if (!IsPostBack)
        {
            lstMessagePerPage.DataSource = pageOptions;
            lstMessagePerPage.DataBind();
        }

        lblMessageCount.Text = String.Format("Total Messages: {0}", _messageManager.TotalMessages);

        if (!IsPostBack)
        {
            rptMessages.DataSource = _messageManager.CurrentPage;
            rptMessages.DataBind();
            rptPages.DataSource = _messageManager.PagesArray;
            rptPages.DataBind();
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {

            if (Session["User"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }


            foreach (RepeaterItem item in rptMessages.Items)
            {
                var checkbox = item.FindControl("chkbox") as CheckBox;
                var hidden = item.FindControl("hidden") as HiddenField;

                if (checkbox.Checked)
                {

                    Message result = _messageManager.CurrentPage.First(x => x.ID == int.Parse(hidden.Value));
                    result.IsActive = false;
                }
            }

            _messageManager.DeleteMessages();
            rptMessages.DataSource = _messageManager.CurrentPage;
            rptPages.DataSource = _messageManager.PagesArray;
            lblMessageCount.Text = String.Format("Total Messages: {0}", _messageManager.TotalMessages);
            rptMessages.DataBind();
            rptPages.DataBind();
            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }
    }


    protected void rptPages_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        var button = e.Item.FindControl("lnkPage") as LinkButton;
        button.Style.Add("text-decoration", "underline");
        _messageManager.ChangePage(int.Parse(button.Text));
        UpdateMessageRepeater(_messageManager);
    }

    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        _messageManager.TogglePage(TogglePage.Previous);
        UpdateMessageRepeater(_messageManager);
    }

    protected void lnkNext_Click(object sender, EventArgs e)
    {
        _messageManager.TogglePage(TogglePage.Next);
        UpdateMessageRepeater(_messageManager);
    }

    protected void lstMessagePerPage_SelectedIndexChanged(object sender, EventArgs e)
    {
        _messageManager.MessagesPerPage = SetMessagesPerPage(_messageManager);
        UpdateMessageRepeater(_messageManager);
    }

    private void UpdateMessageRepeater(MessageManager manager)
    {
        rptMessages.DataSource = manager.CurrentPage;
        rptMessages.DataBind();
        rptPages.DataSource = manager.PagesArray;
        rptPages.DataBind();
    }

    protected void rptPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var button = e.Item.FindControl("lnkPage") as LinkButton;
        if (_messageManager.CurrentPageNumber == int.Parse(button.Text))
        {
            button.Style.Add("text-decoration", "underline");
        }
    }
}