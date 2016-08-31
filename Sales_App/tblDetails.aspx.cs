using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;


public partial class tblDetails : System.Web.UI.Page
{
    static Dictionary<string, decimal> menuOrder;
    static Dictionary<string, int> menuIDs;
    sqlController sqC = new sqlController();
    AjaxControlToolkit.TabContainer TabContainerBills;
    Server server;
    Table table;
    Order order;
    Bill bill;
    string paymentAmount;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null || !Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/login.aspx");
        }

        server = (Server)Session["Employee"];
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
        AddTab();
        loadDataTabs();
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

        return TabContainerBills.ActiveTabIndex;
    }


    protected void updateValues(string value, int index, int status = 0)
    {
        HtmlTable divContainer = new HtmlTable();
        HtmlTable spacer = new HtmlTable();
        spacer.Style.Add("height", "150px");
        HtmlTable spacerTwo = new HtmlTable();
        spacerTwo.Style.Add("height", "50px");
        divContainer.Attributes.Add("class", "checkGridView");
        HtmlTableRow containerrow = new HtmlTableRow();
 
        HtmlTableCell containercell = new HtmlTableCell();
        containercell.VAlign = "top";

        HtmlTable httable = new HtmlTable();
        httable.Style.Add("width", "100%");
        httable.BgColor = "cyan";
        HtmlTable billTotal = new HtmlTable();
        billTotal.Style.Add("width", "100%");
        billTotal.Style.Add("color", "red");
        billTotal.BgColor = "cyan";
        HtmlTable paymentTable = new HtmlTable();
        paymentTable.Style.Add("width", "100%");
        paymentTable.Style.Add("color", "red");
        paymentTable.BgColor = "cyan";
        HtmlTable totalTable = new HtmlTable();
        totalTable.Style.Add("width", "100%");
        totalTable.Style.Add("color", "red");
        totalTable.BgColor = "cyan";
        httable.Attributes.Add("class", "add");
        HtmlTableRow row;
        HtmlTableCell first_cell;
        HtmlTableCell second_cell;
        httable.ID = "ordersTable" + index.ToString();
        table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
        StringBuilder sb = new StringBuilder();
        sb.Append("<table>");

        if (value != "")
        {
            Order order = new Order(menuIDs[value], value, menuOrder[value], table.ID);
            order.Status = (OrderStatus)status;
            order.ServerID = Int32.Parse(server.ID);
            server.TakeOrder(order, index);
        }

        bill = table.GetBills()[index];
        if (bill != null)
        {
            foreach (Order o in bill.Orders)
            {
                row = new HtmlTableRow();
                row.Style.Add("width", "100%");
                first_cell = new HtmlTableCell();
                first_cell.Width = "50%";
                second_cell = new HtmlTableCell();
                second_cell.Align = "right";
                switch (o.Status)
                {
                    case OrderStatus.UnOrdered:
                        first_cell.InnerText = String.Format("{0}", o.GetName);
                        second_cell.InnerText = String.Format("{0:C}", o.GetPrice);
                        break;
                    case OrderStatus.Ordered:
                        first_cell.InnerText = String.Format(">>{0}", o.GetName);
                        second_cell.InnerText = String.Format("{0:C}", o.GetPrice);
                        break;
                    case OrderStatus.OnHold:
                        first_cell.InnerText = String.Format("{0}", o.GetName);
                        second_cell.InnerText = String.Format("{0:C}", o.GetPrice);
                        row.BgColor = "pink";
                        break;
                }

                row.Cells.Add(first_cell);
                row.Cells.Add(second_cell);
                row.Style.Add("height", "50px");
                httable.Rows.Add(row);
            }
            if (table.tableBill(index).Payment > 0.00M)
            {
                HtmlTableRow paymentrow = new HtmlTableRow();
                paymentrow.Style.Add("width", "100%");
                HtmlTableCell paymentcell = new HtmlTableCell();
                paymentcell.Width = "50%";
                HtmlTableCell second_paymentcell = new HtmlTableCell();
                second_paymentcell.Align = "right";
                paymentcell.InnerText = String.Format("Cash");
                second_paymentcell.InnerText = String.Format("({0:C})", table.tableBill(index).Payment);
                paymentrow.Cells.Add(paymentcell);
                paymentrow.Cells.Add(second_paymentcell);
                paymentTable.Rows.Add(paymentrow);
                HtmlTableRow totalrow = new HtmlTableRow();
                HtmlTableCell totalcell = new HtmlTableCell();
                HtmlTableCell second_totalcell = new HtmlTableCell();
                second_totalcell.Align = "right";
                totalcell.InnerText = String.Format("Balance Due");
                second_totalcell.InnerText = String.Format("{0:C}", (table.tableBill(index).FinalTotal - table.tableBill(index).Payment));
                totalrow.Cells.Add(totalcell);
                totalrow.Cells.Add(second_totalcell);
                totalTable.Rows.Add(totalrow);
            }
            HtmlTableRow subtotalrow = new HtmlTableRow();
            subtotalrow.Style.Add("width", "100%");
            HtmlTableCell subtotalcell = new HtmlTableCell();
            subtotalcell.Width = "50%";
            HtmlTableCell second_subtotalcell = new HtmlTableCell();
            second_subtotalcell.Align = "right";
            subtotalcell.InnerText = String.Format("Subtotal");
            second_subtotalcell.InnerText = String.Format("{0:C}", table.tableBill(index).SubTotal);
            subtotalrow.Cells.Add(subtotalcell);
            subtotalrow.Cells.Add(second_subtotalcell);
            billTotal.Rows.Add(subtotalrow);

            HtmlTableRow taxrow = new HtmlTableRow();
            taxrow.Style.Add("width", "100%");
            HtmlTableCell taxcell = new HtmlTableCell();
            HtmlTableCell second_taxcell = new HtmlTableCell();
            second_taxcell.Align = "right";
            taxcell.InnerText = String.Format("Tax", table.tableBill(index).TaxTotal);
            second_taxcell.InnerText = String.Format("{0:C}", table.tableBill(index).TaxTotal);
            taxrow.Cells.Add(taxcell);
            taxrow.Cells.Add(second_taxcell);
            billTotal.Rows.Add(taxrow);

            HtmlTableRow finalrow = new HtmlTableRow();
            finalrow.Style.Add("width", "100%");
            HtmlTableCell finalcell = new HtmlTableCell();
            HtmlTableCell second_finalcell = new HtmlTableCell();
            second_finalcell.Align = "right";
            finalcell.InnerText = String.Format("Total");
            second_finalcell.InnerText = String.Format("{0:C}", table.tableBill(index).FinalTotal);
            finalrow.Cells.Add(finalcell);
            finalrow.Cells.Add(second_finalcell);
            billTotal.Rows.Add(finalrow);
        }


        TabContainerBills.Tabs[index].Controls.Clear();
        containercell.Controls.Add(httable);
        containercell.Controls.Add(spacer);
        containercell.Controls.Add(billTotal);
        containercell.Controls.Add(paymentTable);
        containercell.Controls.Add(totalTable);
        containerrow.Cells.Add(containercell);
        divContainer.Rows.Add(containerrow);
        containercell.Controls.Add(spacerTwo);
        TabContainerBills.Tabs[index].Controls.Add(divContainer);
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
        //ListViewRunningTotal.SelectedIndex = e.Item.ItemIndex;
        //ListViewRunningTotal.DataBind();
    }
    protected void addButton_Click(object sender, EventArgs e)
    {
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

        int tabCount = table.BillCount;
        if (buttonClick)
        {
            tabCount += 1;
        }

        billContainer.Controls.Remove(TabContainerBills);

        TabContainerBills = new AjaxControlToolkit.TabContainer();
        TabContainerBills.ID = "tabContainerBills";
        TabContainerBills.ActiveTabChanged += tabContainerBills_ActiveTabChanged;

        TabContainerBills.CssClass = "MyTabStyle";
        TabContainerBills.Style.Add("position", "relative");
        TabContainerBills.Width = 250;

        AjaxControlToolkit.TabPanel initialTab = new AjaxControlToolkit.TabPanel();
        initialTab.BackColor = System.Drawing.Color.Cyan;
        initialTab.ID = "tabPanel" + "1".ToString();
        initialTab.HeaderText = String.Format("Table {0} / 1", Request.QueryString["Table"]);
        TabContainerBills.Tabs.Add(initialTab);
        for (int i = 1; i < tabCount; i++)
        {
            AjaxControlToolkit.TabPanel Dyntab = new AjaxControlToolkit.TabPanel();
            Dyntab.ID = "tabPanel" + (i + 1).ToString();
            Dyntab.BackColor = System.Drawing.Color.Cyan;
            Dyntab.HeaderText = String.Format("Table {0} / {1}", Request.QueryString["Table"], i + 1);
            TabContainerBills.Tabs.Add(Dyntab);
        }

        if (buttonClick)
        {
            table.AddNewList();
        }
        billContainer.Controls.Add(TabContainerBills);

    }
    protected void tabContainerBills_ActiveTabChanged(object sender, EventArgs e)
    {
        Session["TabIndex"] = getActiveTabIndex();
    }

    protected void repeatButton_Click(object sender, EventArgs e)
    {
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
        table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
        Response.Redirect("~/Sales_App/SplitBills.aspx?Table=" + Int32.Parse(table.TableNumber.ToString()), false);
        Context.ApplicationInstance.CompleteRequest();

    }

    protected void paymentButton_Click(object sender, EventArgs e)
    {
        tblNumError.Text = "";
        txtPaymentSpan.Text = "";
        tableNumber.Value = "";
        ScriptManager.RegisterStartupScript(this, GetType(), "Open Modal", "openModal();", true);
    }
}
