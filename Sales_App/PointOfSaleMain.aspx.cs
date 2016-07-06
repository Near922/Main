using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class PointOfSaleMain : System.Web.UI.Page
{
    string tableNum;
    string guestsNum;
    sqlController sqC = new sqlController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null || !Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/login.aspx");
        }
        //Response.Cache.SetExpires(DateTime.Now);
        //Response.Cache.SetValidUntilExpires(false);
        //Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Response.Cache.SetNoStore();

        var user = (User)Session["User"];
        lblGreeting.Text = String.Format("Welcome {0}!", user.Name.ToUpper());

        if (!IsPostBack)
        {
            Session["Employee"] = null;
            DataTable dt = sqC.GetJob(user.Name);
            var employee = EmployeeService.GetEmployee(user.Name, dt.Rows[0]["Job"].ToString());
            employee.ID = user.ID.ToString();
            Session["Employee"] = employee;
            if (employee.Title == EmployeeRoles.Server.ToString() || employee.Title == EmployeeRoles.Management.ToString())
            {
                DataTable Opentables = sqC.getOpenTables(employee);
                openTblList.DataSource = Opentables;
                if (Opentables.Rows.Count > 0)
                {
                    LoadObjects(employee, Opentables);
                }
                openTblList.DataBind();

            }
        }

    }

    protected void LoadObjects(Employee employee, DataTable openTables)
    {
        try
        {
            EmployeeService.LoadObjects(employee, openTables);
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }
    }
    protected void btnEnter_Click(object sender, EventArgs e)
    {
        if ((txtTblNum.Text == ""))
        {
            if (txtTblNum.Text == "")
            {
                tblNumError.Text = "*Required.";
            }
        }
        else if (!sqC.IsTableAvailable(txtTblNum.Text))
        {
            tblNumError.Text = "That table number is in use.  Please choose another.";
        }
        else
        {
            tblGuestButtons.Visible = true;
            tblTableButtons.Visible = false;
        }
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        tblGuestButtons.Visible = false;
        tblTableButtons.Visible = true;
        modalPopup.Hide();
        guestNumError.Text = "";
        tblNumError.Text = "";
        txtNumGuests.Text = "";
        txtTblNum.Text = "";
    }

    protected void btnGuestEnter_Click(object sender, EventArgs e)
    {
        var employee = (Server)Session["Employee"];
        if ((txtNumGuests.Text == ""))
        {
            if (txtNumGuests.Text == "")
            {
                guestNumError.Text = "*Required.";
            }
        }
        else
        {
            employee.EnterNewTable(Int32.Parse(txtTblNum.Text), Int32.Parse(txtNumGuests.Text));
            guestNumError.Text = "";
            tblNumError.Text = "";
            Response.Redirect("~/Sales_App/tblDetails.aspx?Table=" + Int32.Parse(txtTblNum.Text), false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "1";
        txtTblNum.Text = tableNum;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "2";
        txtTblNum.Text = tableNum;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "3";
        txtTblNum.Text = tableNum;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "4";
        txtTblNum.Text = tableNum;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "5";
        txtTblNum.Text = tableNum;
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "6";
        txtTblNum.Text = tableNum;
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "7";
        txtTblNum.Text = tableNum;
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "8";
        txtTblNum.Text = tableNum;
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "9";
        txtTblNum.Text = tableNum;
    }
    protected void ButtonZero_Click(object sender, EventArgs e)
    {
        tableNum = txtTblNum.Text;
        tableNum += "0";
        txtTblNum.Text = tableNum;
    }
    protected void ButtonClear_Click(object sender, EventArgs e)
    {
        tableNum = "";
        txtTblNum.Text = "";
    }
    protected void ButtonTableNumBack_Click(object sender, EventArgs e)
    {
        if (txtTblNum.Text.Length > 0)
        {
            tableNum = txtTblNum.Text.Substring(0, txtTblNum.Text.Length - 1);
            txtTblNum.Text = tableNum;
        }
    }
    protected void ButtonBack_Click(object sender, EventArgs e)
    {
        if (txtNumGuests.Text.Length > 0)
        {
            guestsNum = txtNumGuests.Text.Substring(0, txtNumGuests.Text.Length - 1);
            txtNumGuests.Text = guestsNum;
        }
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "1";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "2";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "3";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "4";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "5";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "6";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "7";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "8";
        txtNumGuests.Text = guestsNum;
    }
    protected void Button18_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "9";
        txtNumGuests.Text = guestsNum;
    }
    protected void ButtonGuestClear_Click(object sender, EventArgs e)
    {
        guestsNum = "";
        txtNumGuests.Text = "";
    }
    protected void ButtonGuestZero_Click(object sender, EventArgs e)
    {
        guestsNum = txtNumGuests.Text;
        guestsNum += "0";
        txtNumGuests.Text = guestsNum;
    }

    protected void openTblList_ItemCommand1(object source, ListViewCommandEventArgs e)
    {
      Response.Redirect("~/Sales_App/tblDetails.aspx?Table=" + e.CommandName, false);
        Context.ApplicationInstance.CompleteRequest();
    }

    protected void btnClockOut_Click(object sender, EventArgs e)
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

    protected void btnSales_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Sales_App/Sales.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }

    protected void openTblList_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        var tableNumber = DataBinder.Eval(e.Item.DataItem, "TableNumber").ToString();
        var employee = (Server)Session["Employee"];
        var tables = employee.Tables;
        if (tables.Any(t => t.TableNumber == int.Parse(tableNumber)))
        {
            var table = tables.First(t => t.TableNumber == int.Parse(tableNumber));
            var bills = table.GetBills();
            foreach (var bill in bills)
            {
                if ( bill.Orders.Any(o => o.Status == OrderStatus.OnHold))
                {
                    Button button = (Button)e.Item.FindControl("tblButton");
                    button.BackColor = System.Drawing.Color.Pink;
                }
            }
        }
    }
}