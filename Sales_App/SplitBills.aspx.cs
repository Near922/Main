using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;

public partial class Sales_App_SplitBills : System.Web.UI.Page
{
    Server server;
    Table table;
    List<GridView> GridViews = new List<GridView>();
    sqlController sqC;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("~/login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
        //Response.Cache.SetExpires(DateTime.Now);
        //Response.Cache.SetValidUntilExpires(false);
        //Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Response.Cache.SetNoStore();
        PopulateBills();
    }

    private enum GridViewColumns
    {
        ServerID = 0,
        TableNumber = 1,
        ProductID = 2,
        ID = 3,
        BillID = 4,
        GetName = 5,
        GetPrice = 6
    }

    public void PopulateBills()
    {
        try
        {
            server = (Server)Session["Employee"];
            table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
            Session["Table"] = table;
            int i = 0;
            foreach (Bill bill in table.GetBills())
            {
                GridView gv = new GridView();
                gv.ID = String.Format("myGridID{0}", i);
                gv.AutoGenerateColumns = true;
                if (bill.Orders.Count == 0)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("Col1", typeof( string));
                    dt.Columns.Add("Col2", typeof(string));
                    dt.Rows.Add("", "");
                    gv.DataSource = dt;
                    gv.DataBind();
                    gv.CssClass = "checkGridView drag_drop_grid";
                    gv.HeaderRow.Cells[0].Visible = false;
                    gv.HeaderRow.Cells[1].Visible = false;
                }
                else
                {
                    gv.DataSource = bill.Orders;
                    gv.DataBind();

                    gv.CssClass = "checkGridView drag_drop_grid";
                    foreach (GridViewRow gvr in gv.Rows)
                    {

                        gvr.Cells[(int)GridViewColumns.ServerID].Visible = false;
                        gvr.Cells[(int)GridViewColumns.BillID].Visible = false;
                        gvr.Cells[(int)GridViewColumns.ID].Visible = false;
                        gvr.Cells[(int)GridViewColumns.ProductID].Visible = false;
                        gvr.Cells[(int)GridViewColumns.TableNumber].Visible = false;
                        gvr.Cells[(int)GridViewColumns.GetPrice].Text = String.Format("{0:c}", Decimal.Parse(gvr.Cells[(int)GridViewColumns.GetPrice].Text));
                        gv.HeaderRow.Cells[(int)GridViewColumns.ServerID].Visible = false;
                        gv.HeaderRow.Cells[(int)GridViewColumns.BillID].Visible = false;
                        gv.HeaderRow.Cells[(int)GridViewColumns.ID].Visible = false;
                        gv.HeaderRow.Cells[(int)GridViewColumns.ProductID].Visible = false;
                        gv.HeaderRow.Cells[(int)GridViewColumns.TableNumber].Visible = false;
                        gv.HeaderRow.Cells[(int)GridViewColumns.GetPrice].Visible = false;
                        gv.HeaderRow.Cells[(int)GridViewColumns.GetName].Visible = false;

                    }
                }

                Panel myChildPanel = new Panel();
                myChildPanel.CssClass = "checkContainer";
                Label lblCheck = new Label();
                lblCheck.Text = String.Format("Table {0} / {1}", table.TableNumber, i + 1);
                lblCheck.Font.Size = 18;
                myChildPanel.Controls.Add(lblCheck);
                myChildPanel.Controls.Add(gv);
                GridViews.Add(gv);
                ph.Controls.Add(myChildPanel);
                i += 1;
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
        Response.Redirect("~/Sales_App/tblDetails.aspx?Table=" + Int32.Parse(table.TableNumber.ToString()), false);
        Context.ApplicationInstance.CompleteRequest();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            server = (Server)Session["Employee"];
            table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
            table.AddNewList(false);
            GridView gv = new GridView();
            gv.ID = String.Format("myGridID{0}", table.BillCount - 1);
            DataTable dt = new DataTable();
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Amount", typeof(string));
            dt.Rows.Add("", "");
            gv.DataSource = dt;
            gv.DataBind();
            gv.HeaderRow.Cells[0].Visible = false;
            gv.HeaderRow.Cells[1].Visible = false;
            gv.CssClass = "checkGridView drag_drop_grid";
            Panel myChildPanel = new Panel();
            Label lblCheck = new Label();
            lblCheck.Text = String.Format("Table {0} / {1}", table.TableNumber, table.BillCount);
            lblCheck.Font.Size = 18;
            myChildPanel.Controls.Add(lblCheck);
            myChildPanel.Style.Add("float", "left");
            myChildPanel.Style.Add("padding-right", "50px");
            myChildPanel.Controls.Add(gv);
            GridViews.Add(gv);
            ph.Controls.Add(myChildPanel);
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        List<Order> updatedOrders = (List<Order>)HttpContext.Current.Session["UpdatedOrders"];
        sqC = new sqlController();
        foreach (Order order in updatedOrders)
        {
            sqC.updateOrderBillID(order);
        }
        sqC = null;
        server = (Server)Session["Employee"];
        table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
        List<Bill> bills = table.GetBills();

        foreach (Bill bill in bills)
        {
            bill.CalculateTotal();
            bill.Update();
        }
        Session["Table"] = table;
        Response.Redirect("~/Sales_App/tblDetails.aspx?Table=" + Int32.Parse(table.TableNumber.ToString()), false);
        Context.ApplicationInstance.CompleteRequest();
    }

    [WebMethod(EnableSession = true)]
    public static void jqueryRemoveAddOrder(int fromBillIndex, int toBillIndex, int orderIndex)
    {
        try
        {
            Bill toBill;
            List<Order> updatedOrders;
            if (HttpContext.Current.Session["UpdatedOrders"] == null)
            {
                updatedOrders = new List<Order>();
                HttpContext.Current.Session["UpdatedOrders"] = updatedOrders;
            }
            else
            {
                updatedOrders = (List<Order>)HttpContext.Current.Session["UpdatedOrders"];
            }
            Table table;
            Server server = (Server)HttpContext.Current.Session["Employee"];
            table = (Table)HttpContext.Current.Session["Table"];
            Bill fromBill = table.tableBill(fromBillIndex);
            Order order = fromBill.Orders[orderIndex];
            fromBill.RemoveOrder(order);
            toBill = table.tableBill(toBillIndex);
            order.BillID = toBill.ID;
            toBill.CalculateTotal();
            toBill.AddOrder(order);
            updatedOrders.Add(order);
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        //return "Bill " + fromBillIndex + " " + "moved to " + toBillIndex + "order " + orderIndex;

    }

}