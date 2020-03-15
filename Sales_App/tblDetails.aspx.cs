using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;


public partial class tblDetails : Page
{
    static Dictionary<string, decimal> menuOrder;
    static Dictionary<string, int> menuIDs;
    sqlController sqC = new sqlController();

    public Server server;
    public Table table;
    public Order order;
    public Bill bill;
    string paymentAmount;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

        server = (Server)Session["Employee"];

        if (Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }


        table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
        if (table == null)
        {
            Response.Redirect("~/Sales_App/PointOfSaleMain.aspx");
        }

        lblTableNum.Text = String.Format("Table {0}", Request.QueryString["Table"].ToString());
        lblServerName.Text = server.Name;

        if (Cache["MenuOrder"] != null)
        {
            menuOrder = (Dictionary<string, decimal>)Cache["MenuOrder"];
        }
        else
        {
            menuOrder = new Dictionary<string, decimal>();
        }

        if (Cache["MenuIDs"] != null)
        {
            menuIDs = (Dictionary<string, int>)Cache["MenuIDs"];
        }
        else
        {
            menuIDs = new Dictionary<string, int>();
        }

        if (!IsPostBack)
        {
            PopulateButtons(MenuItems.Beverages, ListViewBeverage);
            PopulateButtons(MenuItems.Soup, ListViewSoup);
            PopulateButtons(MenuItems.Appetizers, ListViewApps);
            PopulateButtons(MenuItems.Salads, ListViewSalad);
            PopulateButtons(MenuItems.Sandwiches, ListViewSandwichs);
            PopulateButtons(MenuItems.Entrees, ListViewEntree);
            PopulateButtons(MenuItems.Wine, ListViewWine);
            PopulateButtons(MenuItems.Beer, ListViewBeer);
            PopulateButtons(MenuItems.Dessert, ListViewDessert);
        }
        if (Cache["MenuOrder"] == null)
        {
            Cache["MenuOrder"] = menuOrder;
        }
        if (Cache["MenuIDs"] == null)
        {
            Cache["MenuIDs"] = menuIDs;
        }

        bill = table.GetBills()[getActiveTabIndex()];
    }

    public enum MenuItems
    {
        Beverages,
        Soup,
        Appetizers,
        Sandwiches,
        Dessert,
        Beer,
        Wine,
        Entrees,
        Salads
    }

    public void PopulateButtons(MenuItems menuItem, ListView listView)
    {
        if (!IsPostBack)
        {
            DataTable dt = GetMenuData(menuItem);
            PopulateMenuDictionaries(dt);
            listView.DataSource = dt;
            listView.DataBind();
        }
    }

    public void PopulateMenuDictionaries(DataTable dt)
    {
        if (Cache["MenuOrder"] == null || Cache["MenuIDs"] == null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (!menuOrder.ContainsKey(dr["Name"].ToString()))
                {
                    menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
                }

                if (!menuIDs.ContainsKey(dr["Name"].ToString()))
                {
                    menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
                }
            }
        }
    }


    public DataTable GetMenuData(MenuItems menuItem)
    {
        DataTable dt = null;
        if (Cache[menuItem.ToString()] == null)
        {
            dt = GetSqlData(menuItem, dt);
            Cache[menuItem.ToString()] = dt;
        }
        else
        {
            dt = (DataTable)Cache[menuItem.ToString()];
        }
        return dt;
    }

    public DataTable GetSqlData(MenuItems menuItem, DataTable dt)
    {
        switch (menuItem)
        {
            case MenuItems.Beverages:
                dt = sqC.getBeverages();
                break;
            case MenuItems.Soup:
                dt = sqC.getSoup();
                break;
            case MenuItems.Appetizers:
                dt = sqC.getApps();
                break;
            case MenuItems.Sandwiches:
                dt = sqC.getSandwichs();
                break;
            case MenuItems.Dessert:
                dt = sqC.getDesserts();
                break;
            case MenuItems.Beer:
                dt = sqC.getBeer();
                break;
            case MenuItems.Wine:
                dt = sqC.getWine();
                break;
            case MenuItems.Entrees:
                dt = sqC.getEntree();
                break;
            case MenuItems.Salads:
                dt = sqC.getSalads();
                break;
            default:
                dt = null;
                break;
        }

        return dt;
    }

    protected int getActiveTabIndex()
    {
        return int.Parse(lblActiveBill.Value);
    }


    protected void updateValues(string value, int index, int status = 0)
    {

        if (value != "")
        {
            Order order = new Order(menuIDs[value], value, menuOrder[value], table.ID);
            order.Status = (OrderStatus)status;
            order.ServerID = Int32.Parse(server.ID);
            server.TakeOrder(order, index);
        }
    }

    protected void ListViewEntree_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }
    protected void ListViewBeverage_ItemCommand1(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }
    protected void ListViewSandwichs_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }

    protected void ListViewSoup_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }

    protected void ListViewBeer_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }


    protected void ListViewWine_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }

    protected void ListViewDessert_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }

    protected void ListViewSalad_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }

    protected void ListViewApps_ItemCommand(object source, ListViewCommandEventArgs e)
    {
        updateValues(e.CommandName, getActiveTabIndex());
    }

    protected void Item_Command(object source, ListViewCommandEventArgs e)
    {

    }

    protected void addButton_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        AddTab(true);
        loadDataTabs();
    }

    protected void loadDataTabs(bool buttonClick = false)
    {

        int tabCount = table.BillCount;
        if (buttonClick)
        {
            tabCount += 1;
        }
        for (int i = 0; i < tabCount; i++)
        {

            updateValues("", i);
        }
    }

    protected void AddTab(bool buttonClick = false)
    {
        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        int tabCount = table.BillCount;
        if (buttonClick)
        {
            tabCount += 1;
        }

        if (buttonClick)
        {
            table.AddNewList();
        }
    }

    protected void tabContainerBills_ActiveTabChanged(object sender, EventArgs e)
    {
        Session["TabIndex"] = getActiveTabIndex();
    }

    protected void repeatButton_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }


        string value = "";

        if (lblSelectedRow.Value != "")
        {
            value = lblSelectedRow.Value;
            value = value.Split('$')[0];
            updateValues(value.Replace("\r", "").Replace("\n", "").Replace("\t", "").Replace(">>", "").Trim(), getActiveTabIndex());
            lblSelectedRowIndex.Value = "";
            updateHiddenFields.Update();
        }
    }

    protected void deleteButton_Click(object sender, EventArgs e)
    {

        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        if (lblSelectedRowIndex.Value != "" && !lblSelectedRow.Value.Contains(">>"))
        {
            order = table.GetBills()[getActiveTabIndex()].Orders[Int32.Parse(lblSelectedRowIndex.Value.Replace("\r", "").Replace("\n", "").Replace("\t", "").Trim())];
            server.DeleteOrder(order, table);
            updateValues("", getActiveTabIndex());
            lblSelectedRowIndex.Value = "";
            updateHiddenFields.Update();
        }
    }


    protected void exitButton_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");

        }
        List<Bill> bills = table.GetBills();

        foreach (Bill bill in bills)
        {
            if (bill.ID == 0 && bill.Orders.Count > 0)
            {
                bill.SaveBill();
            }
            bill.Update();
        }

        Response.Redirect("PointOfSaleMain.aspx", true);
    }
    protected void sendButton_Click(object sender, EventArgs e)
    {

        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        var test = lblSelectedRowIndex.Value;
        if (lblSelectedRowIndex.Value != "" && !lblSelectedRow.Value.Contains(">>"))
        {
            var bill = table.GetBills()[getActiveTabIndex()];
            order = bill.Orders[Int32.Parse(lblSelectedRowIndex.Value.Replace("\r", "").Replace("\n", "").Replace("\t", "").Trim())];
            if (bill.ID == 0 && bill.Orders.Count > 0)
            {
                bill.SaveBill();
            }
            server.SendOrder(order);
            lblSelectedRowIndex.Value = "";
            updateHiddenFields.Update();
        }
        else
        {
            if (bill.ID == 0 && bill.Orders.Count > 0)
            {
                bill.SaveBill();
            }
            server.SendOrders(table);
        }
        updateValues("", getActiveTabIndex());
    }


    protected void btnEnter_Click(object sender, EventArgs e)
    {

        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        if ((tableNumber.Value.ToString() == ""))
        {
            if (tableNumber.Value.ToString() == "")
            {
                tblNumError.Text = "*Required.";
            }

        }
        else
        {

            bill = table.GetBills()[getActiveTabIndex()];
            server.ApplyPayment(bill, Decimal.Parse(tableNumber.Value.ToString()));
            tableNumber.Value = "";
            updateValues("", getActiveTabIndex());
            ScriptManager.RegisterStartupScript(this, GetType(), "Close Popup", "Closepopup();", true);
        }

    }
    protected void holdButton_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        if (lblSelectedRowIndex.Value != "" && !lblSelectedRow.Value.Contains(">>"))
        {
            var bill = table.GetBills()[getActiveTabIndex()];
            order = table.GetBills()[getActiveTabIndex()].Orders[Int32.Parse(lblSelectedRowIndex.Value.Replace("\r", "").Replace("\n", "").Replace("\t", "").Trim())];
            if (bill.ID == 0 && bill.Orders.Count > 0)
            {
                bill.SaveBill();
            }
            server.HoldOrder(order);
            updateValues("", getActiveTabIndex());
            lblSelectedRowIndex.Value = "";
            updateHiddenFields.Update();
        }
    }
    protected void btnCloseTable_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        decimal total = 0.00M;
        foreach (Bill bill in table.GetBills())
        {

            total += (bill.FinalTotal - bill.Payment);
        }

        if (total > 0.00M)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
      "err_msg",
      "alert('Full payment must be received before closing');",
      true);

        }
        else
        {
            foreach (Bill bill in table.GetBills())
            {

                bill.Update();
            }
            server.CloseTable(table);
            Response.Redirect("~/Sales_App/PointOfSaleMain.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

    }

    protected void btnSplit_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
        Response.Redirect("~/Sales_App/SplitBills.aspx?Table=" + Int32.Parse(table.TableNumber.ToString()), false);
        Context.ApplicationInstance.CompleteRequest();

    }

    protected void paymentButton_Click(object sender, EventArgs e)
    {

        if (Session["User"] == null || Session["Employee"] == null)
        {
            Response.Redirect("~/Home.aspx");
        }

        tblNumError.Text = "";
        txtPaymentSpan.Text = "";
        tableNumber.Value = "";
        ScriptManager.RegisterStartupScript(this, GetType(), "Open Modal", "openModal();", true);
    }
}
