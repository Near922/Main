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
        if (txtTblNum.Visible)
            {
            if ((tableNumber.Value.ToString() == ""))
            {
                if (tableNumber.Value.ToString() == "")
                {
                    tblNumError.Text = "*Required.";
                }
            }
            else if (!sqC.IsTableAvailable(tableNumber.Value.ToString()))
            {
                tblNumError.Text = "That table number is in use.  Please choose another.";
            }
            else
            {
                //tblGuestButtons.Visible = true;
                //tblTableButtons.Visible = false;
                lblNumGuests.Visible = true;
                txtTblNum.Visible = false;
                lblTblNumber.Text = "Number Of Guests";
                return;
            }
        }

        if (lblNumGuests.Visible)
        {
            if (numberGuests.Value.ToString() == "")
            {
                tblNumError.Text = "*Required.";
            }
            else
            {
                var employee = (Server)Session["Employee"];
                employee.EnterNewTable(Int32.Parse(tableNumber.Value.ToString()), Int32.Parse(numberGuests.Value.ToString()));
                lblNumGuests.Text = "";
                txtTblNum.Text = "";

                Response.Redirect("~/Sales_App/tblDetails.aspx?Table=" + Int32.Parse(tableNumber.Value.ToString()), false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }
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

    protected void btnClose_Click1(object sender, EventArgs e)
    {
        tblNumError.Text = "";
        txtTblNum.Text = "";
        numberGuests.Value = "";
        tableNumber.Value = "";
        lblNumGuests.Visible = false;
        txtTblNum.Visible = true;
        lblTblNumber.Text = "Table Number";
    }

    protected void btnNewTable_Click(object sender, EventArgs e)
    {
        tblNumError.Text = "";
        txtTblNum.Text = "";
        numberGuests.Value = "";
        tableNumber.Value = "";
        lblNumGuests.Visible = false;
        txtTblNum.Visible = true;
        lblTblNumber.Text = "Table Number";
        ScriptManager.RegisterStartupScript(this, GetType(), "Open Modal", "openModal();", true);
    }
}