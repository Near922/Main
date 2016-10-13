using System;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetExpires(DateTime.Now.AddYears(1));
        HtmlGenericControl hlHome = Master.FindControl("hlHome") as HtmlGenericControl;
        hlHome.Style["display"] = "none";

        HtmlGenericControl hlContact = Master.FindControl("hlContact") as HtmlGenericControl;
        hlContact.Style["display"] = "block";

        HtmlGenericControl hlPortfolio = Master.FindControl("hlPortfolio") as HtmlGenericControl;
        hlPortfolio.Style["display"] = "block";

        HtmlGenericControl hlExperience = Master.FindControl("hlExperience") as HtmlGenericControl;
        hlExperience.Style["display"] = "block";

        HtmlGenericControl hlAbout = Master.FindControl("hlAbout") as HtmlGenericControl;
        hlAbout.Style["display"] = "block";

        HtmlGenericControl hlSkills = Master.FindControl("hlSkills") as HtmlGenericControl;
        hlSkills.Style["display"] = "block";

        if (!IsPostBack)
        {
            if (Session["Count"] == null)
            {
                HitCounter hc = new HitCounter();
                hc.IPAddress = Request.UserHostAddress;
                hc.VisitDate = DateTime.Now;
                hc.AddCount();
                Session["Count"] = hc.Count;
                hc = null;
            }
        }

    }
    public bool IsValid(string emailaddress)
    {
        try
        {
            MailAddress m = new MailAddress(emailaddress);

            return true;
        }
        catch (FormatException)
        {
            return false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        txtMessage.BorderStyle = BorderStyle.NotSet;
        txtMessage.BorderColor = System.Drawing.Color.Empty;
        txtName.BorderStyle = BorderStyle.NotSet;
        txtName.BorderColor = System.Drawing.Color.Empty;
        txtEmail.BorderStyle = BorderStyle.NotSet;
        txtEmail.BorderColor = System.Drawing.Color.Empty;
        lblEmail.Text = "";

        if (txtName.Text == "")
        {
            txtName.BorderStyle = BorderStyle.Dotted;
            txtName.BorderColor = System.Drawing.Color.Red;
        }
        if (txtEmail.Text == "")
        {
            txtEmail.BorderStyle = BorderStyle.Dotted;
            txtEmail.BorderColor = System.Drawing.Color.Red;
        }

        if (!string.IsNullOrEmpty(txtEmail.Text) && !IsValid(txtEmail.Text))
        {
            lblEmail.Text = "*Please use a valid email address.";
            txtEmail.BorderStyle = BorderStyle.Dotted;
            txtEmail.BorderColor = System.Drawing.Color.Red;
        }


        if (txtMessage.Text == "")
        {
            txtMessage.BorderStyle = BorderStyle.Dotted;
            txtMessage.BorderColor = System.Drawing.Color.Red;
        }

        if (txtName.Text != "" && txtEmail.Text != "" && txtMessage.Text != "" && IsValid(txtEmail.Text))
        {
            try
            {
                Message message = new Message(txtName.Text, txtEmail.Text, txtMessage.Text);
                message.Save();
                message = null;
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
                lblMessage.Text = "Message was sent successfully.";
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
            }
            catch( Exception ex)
            {
                Logger.Log(ex);
                ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
            }
        }
    }
}