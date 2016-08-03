using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Web.UI.HtmlControls;


public partial class tblDetails : System.Web.UI.Page
{
    Dictionary<string, decimal> menuOrder = new Dictionary<string, decimal>();
    Dictionary<string, int> menuIDs = new Dictionary<string, int>();
    sqlController sqC = new sqlController();
    AjaxControlToolkit.TabContainer TabContainerBills;
    Server server;
    Table table;
    Order order;
    Bill bill;
    string paymentAmount;


    protected void Page_Load(object sender, EventArgs e)
    {
        //ClientScript.RegisterClientScriptInclude(this.GetType(), "myScript", "../Scripts/JScript.js");
        server = (Server)Session["Employee"];
        lblTableNum.Text = String.Format("Table {0}", Request.QueryString["Table"].ToString());
        lblServerName.Text = server.Name;
        table = server.getTable(Int32.Parse(Request.QueryString["Table"]));
        populateBeverageButtons();
        populateSoupButtons();
        populateAppButtons();
        populateSaladButtons();
        populateSandwhichButtons();
        populateEntreeButtons();
        populateWineButtons();
        populateBeerButtons();
        populateDessertButtons();
        AddTab();
        loadDataTabs();
    }


    public void populateBeverageButtons()
    {
        DataTable dt = sqC.getBeverages();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }
        ListViewBeverage.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewBeverage.DataBind();
        }
    }

    public void populateSoupButtons()
    {
        DataTable dt = sqC.getSoup();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }
        ListViewSoup.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewSoup.DataBind();
        }
    }

    public void populateAppButtons()
    {
        DataTable dt = sqC.getApps();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }

        ListViewApps.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewApps.DataBind();
        }
    }

    public void populateSandwhichButtons()
    {
        DataTable dt = sqC.getSandwichs();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }

        ListViewSandwichs.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewSandwichs.DataBind();
        }
    }

    public void populateDessertButtons()
    {

        DataTable dt = sqC.getDesserts();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }
   
        ListViewDessert.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewDessert.DataBind();
        }
    }

    public void populateBeerButtons()
    {
    
        DataTable dt = sqC.getBeer();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }
      
        ListViewBeer.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewBeer.DataBind();
        }
    }

    public void populateWineButtons()
    {

        DataTable dt = sqC.getWine();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }
 
        ListViewWine.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewWine.DataBind();
        }
    }

    public void populateEntreeButtons()
    {
        
        DataTable dt = sqC.getEntree();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }
   
        ListViewEntree.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewEntree.DataBind();
        }
    }

    public void populateSaladButtons()
    {
       
        DataTable dt = sqC.getSalads();
        foreach (DataRow dr in dt.Rows)
        {
            menuOrder.Add(dr["Name"].ToString(), (decimal)dr["Price"]);
            menuIDs.Add(dr["Name"].ToString(), (int)dr["ID"]);
        }
  
        ListViewSalad.DataSource = dt;
        if (!IsPostBack)
        {
            ListViewSalad.DataBind();
        }
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
        divContainer.Style.Add("width", "100%");
        divContainer.Style.Add("min-height", "500px");
        divContainer.BgColor = "cyan";
        divContainer.Style.Add("position", "relative");
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

        billContainter.Controls.Remove(TabContainerBills);

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
            table.AddNewList(false);
        }
        billContainter.Controls.Add(TabContainerBills);

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
        }
    }


    protected void exitButton_Click(object sender, EventArgs e)
    {
        List<Bill> bills = table.GetBills();

        foreach (Bill bill in bills)
        {
            bill.Update();
        }

        Response.Redirect("PointOfSaleMain.aspx");
    }
    protected void sendButton_Click(object sender, EventArgs e)
    {
        if (lblSelectedRowIndex.Value != "" && !lblSelectedRow.Value.Contains(">>"))
        {
            order = table.GetBills()[getActiveTabIndex()].Orders[Int32.Parse(lblSelectedRowIndex.Value.Replace("\r", "").Replace("\n", "").Replace("\t", "").Trim())];
            server.SendOrder(order);
        }
        else
        {
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
            ScriptManager.RegisterStartupScript(this, GetType(), "Closepopup", "Closepopup();", true);
        }

    }
    protected void holdButton_Click(object sender, EventArgs e)
    {
        if (lblSelectedRowIndex.Value != "" && !lblSelectedRow.Value.Contains(">>"))
        {
            order = table.GetBills()[getActiveTabIndex()].Orders[Int32.Parse(lblSelectedRowIndex.Value.Replace("\r", "").Replace("\n", "").Replace("\t", "").Trim())];
            server.HoldOrder(order);
            updateValues("", getActiveTabIndex());
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
    protected void btnClose_Click(object sender, EventArgs e)
    {
        tblNumError.Text = "";
        txtPaymentSpan.Text = "";
        tableNumber.Value = "";
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
