using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

public partial class Checkout3 : System.Web.UI.Page
{

    string[] m_strOptions = { "1-Server", "2-Server", "3-Server", "4-Server", "5-Server", "6-Server", "7-Server", "8-Server", "9-Server", "10-Server", "11-Server", "12-Server", "13-Server", "14-Server",
                                     "P1-Server", "P2-Server", "P3-Server", "B1-Server", "B2-Server",  "Bartender 1", "Bartender 2", "Bartender 3", "ToGo-1", "ToGo-2"

                                 };

    string[] serverSections = { "1-Server", "2-Server", "3-Server", "4-Server", "5-Server", "6-Server", "7-Server", "8-Server", "9-Server", "10-Server", "11-Server", "12-Server", "13-Server", "14-Server",
                                     "P1-Server", "P2-Server", "P3-Server", "B1-Server", "B2-Server"

                                 };
    string[] m_ShiftOptions = { "Lunch", "Dinner" };

    Restaurant restaurant;
    sqlController sqc;
    public enum Shift
    {
        Lunch,
        Dinner
    }

    public enum Columns
    {
        Sales = 2,
        Cash = 3,
        Owed = 4,
        SATip = 6

    }

    public DateTime GetDate()
    {
        DateTime date;
        if (string.IsNullOrEmpty(txtDatePicker.Text))
        {
            date = DateTime.Today;
        }
        else
        {
            date = DateTime.Parse(txtDatePicker.Text).Date;
        }
        restaurant.CurrentDate = date;
        return date;
    }

    public DataTable populateServerGrid(string shift)
    {
        sqc = new sqlController();
        try
        {

            var date = GetDate();
            return  sqc.GetServerData(shift, GetDate());
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return null;
        }
        finally
        {
            sqc = null;
        }
    }

    public DataTable populateBWGrid(string shift)
    {
        sqc = new sqlController();
        try
        {
            return sqc.GetBackwaitData(shift, GetDate());
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return null;
        }
        finally
        {
            sqc = null;
        }
    }

    public void AddEmployeesToRestaurant(DataTable employeeData)
    {
        foreach (DataRow row in employeeData.Rows)
        {
            Server server = new Server(row["Name"].ToString());
            server.Cash = (decimal)row["Cash"];
            server.Sales = (decimal)row["Sales"];
            server.TipOut = (decimal)row["BWTipout"];
            server.Shift = row["Shift"].ToString().Trim();
            server.ShiftDate = DateTime.Parse(row["Date"].ToString()).Date;
            restaurant.AddEmployee(server);
        }
    }

    public void AddBackwaitsToRestaurant(DataTable backwaitData)
    {
        foreach (DataRow row in backwaitData.Rows)
        {
            Backwaiter backwait = new Backwaiter(row["Name"].ToString());
            backwait.Hours = Convert.ToDecimal(row["Hours"]);
            decimal tips;
            if(row["Tips"] == null || string.IsNullOrEmpty(row["Tips"].ToString()))
            {
                tips = 0.00M;
            }
            else
            {
                tips = Convert.ToDecimal(row["Tips"]);
            }
            backwait.Tips = tips;
            backwait.Shift = row["Shift"].ToString().Trim();
            backwait.ShiftDate = DateTime.Parse(row["Date"].ToString()).Date;
            restaurant.AddBackwait(backwait);
        }
    }

    public void AddEmployeeToRestaurant(Server server)
    {
        restaurant.AddEmployee(server);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            restaurant = new Restaurant();
            restaurant.CurrentDate = DateTime.Today;
            restaurant.Days.Add(DateTime.Today);
            Session["Restaurant"] = restaurant;
            txtDatePicker.Text = String.Format("{0:MM/dd/yyyy}", DateTime.Today);
        }
        else
        {
            if (Session["Restaurant"] == null)
            {
                Response.Redirect("Home.aspx");
            }

            restaurant = (Restaurant)Session["Restaurant"];
        }
        
        DataTable lunchServers = populateServerGrid(Shift.Lunch.ToString());
        DataTable dinnerServers = populateServerGrid(Shift.Dinner.ToString());
        DataTable lunchBackwaits = populateBWGrid(Shift.Lunch.ToString());
        DataTable dinnerBackwaits = populateBWGrid(Shift.Dinner.ToString());

        if (!IsPostBack)
        {
            AddEmployeesToRestaurant(lunchServers);
            AddEmployeesToRestaurant(dinnerServers);
            AddBackwaitsToRestaurant(lunchBackwaits);
            AddBackwaitsToRestaurant(dinnerBackwaits);
            cboOptions.DataSource = m_strOptions;
            cboOptions.DataBind();

            cboShiftOptions.DataSource = m_ShiftOptions;
            cboShiftOptions.DataBind();

            cboBWShiftOptions.DataSource = m_ShiftOptions;
            cboBWShiftOptions.DataBind();

            popStaffList();
            popBWList();
        }

        if(!CheckDate(txtDatePicker.Text))
        {
            return;
        }

        tblServerDataGridView.DataSource = lunchServers;
        tblServerDataGridView.DataBind();


        tblServerDataGridView1.DataSource = dinnerServers;
        tblServerDataGridView1.DataBind();
        tblBackwaitDataGridView.DataSource = lunchBackwaits;
        tblBackwaitDataGridView.DataBind();
        tblBackwaitDataGridView1.DataSource = dinnerBackwaits;
        tblBackwaitDataGridView1.DataBind();
        SetTotalLabels();
        ColorNegativeRows();
        MakeMobileFriendly();
    }

    public void MakeMobileFriendly()
    {
        if (tblServerDataGridView.HeaderRow != null)
        {
            tblServerDataGridView.HeaderRow.Cells[0].Attributes["data-class"] = "expand";
            tblServerDataGridView.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
            tblServerDataGridView.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            tblServerDataGridView.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            tblServerDataGridView.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
            tblServerDataGridView.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
            tblServerDataGridView.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
            tblServerDataGridView.HeaderRow.Cells[8].Attributes["data-hide"] = "phone";
            tblServerDataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        if (tblServerDataGridView1.HeaderRow != null)
        {
            tblServerDataGridView1.HeaderRow.Cells[0].Attributes["data-class"] = "expand";
            tblServerDataGridView1.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
            tblServerDataGridView1.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            tblServerDataGridView1.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            tblServerDataGridView1.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
            tblServerDataGridView1.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
            tblServerDataGridView1.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
            tblServerDataGridView1.HeaderRow.Cells[8].Attributes["data-hide"] = "phone";
            tblServerDataGridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }

    public void SetTotalLabels()
    {
        lblLunchSales.Text = String.Format("{0:C}", restaurant.LunchSales);
        lblDinnerSales.Text = String.Format("{0:C}", restaurant.DinnerSales);
        lblNetSales.Text = String.Format("{0:C}", restaurant.TotalSales);
        lblDinnerCash.Text = String.Format("{0:C}", restaurant.DinnerCash);
        lblLunchCash.Text = String.Format("{0:C}", restaurant.LunchCash);
        lblNetCashIn.Text = String.Format("{0:C}", restaurant.TotalCash);
        lblLunchBackTips.Text = String.Format("{0:C}", restaurant.LunchSATips);
        lblDinnerBackTips.Text = String.Format("{0:C}", restaurant.DinnerSATips);
        lblBackwait.Text = String.Format("{0:C}", restaurant.TotalSATips);
        lblLunchDeposit.Text = String.Format("{0:C}", restaurant.LunchDeposit);
        lblDinnerDeposit.Text = String.Format("{0:C}", restaurant.DinnerDeposit);
        lblDeposit.Text = String.Format("{0:C}", restaurant.TotalDeposit);
    }


    public void ColorNegativeRows()
    {
        GridView[] ServerGrid = { tblServerDataGridView, tblServerDataGridView1 };
        foreach (GridView grid in ServerGrid)
        {
            for (int i = 0; i < grid.Rows.Count; ++i)
            {

                string c = grid.Rows[i].Cells[(int)Columns.Cash].Text;
                string o = grid.Rows[i].Cells[(int)Columns.Owed].Text;
                var isCommandArray = Regex.IsMatch(c, @"^\(.*?\)$");
                var isNegativeOwed = Regex.IsMatch(o, @"^\(.*?\)$");
                if (isCommandArray == true)
                {
                    grid.Rows[i].Cells[(int)Columns.Cash].ForeColor = System.Drawing.Color.Red;
                }

                if (isNegativeOwed == true)
                {
                    grid.Rows[i].Cells[(int)Columns.Owed].ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }



    protected void btnCalculate_Click(object sender, EventArgs e)
    {
        decimal dblResult;
        decimal dblSales;
        decimal dblOwed;
        string firstName;
        string messageText;
        string cashOwed;
        firstName = txtName.Text;
        var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
        var cashregex = new Regex(@"^[-+]?[0-9]*(?:\.[0-9]*)?$");

        if (txtName.Text == "" || txtSales.Text == "" || txtOwed.Text == "" || txtCharge.Text == "" || (txtBarTips.Text == "" && serverSections.Contains(cboOptions.Text)))
        {
            if (txtName.Text == "")
            {
                lblNameEdit.Text = "*Required";
                lblNameEdit.ForeColor = System.Drawing.Color.Red;
                txtName.BorderStyle = BorderStyle.Dotted;
                txtName.BorderColor = System.Drawing.Color.Red;
            }

            if (txtSales.Text == "")
            {
                lblSalesEdit.Text = "*Required.";
                lblSalesEdit.ForeColor = System.Drawing.Color.Red;
                txtSales.BorderStyle = BorderStyle.Dotted;
                txtSales.BorderColor = System.Drawing.Color.Red;
            }

            if (txtOwed.Text == "")
            {
                lblCashEdit.Text = "*Required.";
                lblCashEdit.ForeColor = System.Drawing.Color.Red;
                txtOwed.BorderStyle = BorderStyle.Dotted;
                txtOwed.BorderColor = System.Drawing.Color.Red;
            }

            if (txtCharge.Text == "")
            {
                lblChargeEdit.Text = "*Required.";
                lblChargeEdit.ForeColor = System.Drawing.Color.Red;
                txtCharge.BorderStyle = BorderStyle.Dotted;
                txtCharge.BorderColor = System.Drawing.Color.Red;
            }

            if (txtBarTips.Text == "" && serverSections.Contains(cboOptions.Text))
            {
                lblBarEdit.Text = "*Required.";
                lblBarEdit.ForeColor = System.Drawing.Color.Red;
                txtBarTips.BorderStyle = BorderStyle.Dotted;
                txtBarTips.BorderColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            if (checkCashValues())
            {

                dblSales = Convert.ToDecimal(txtSales.Text.Replace("$", string.Empty).Replace(",", string.Empty));
                dblOwed = Convert.ToDecimal(txtOwed.Text.Replace("$", string.Empty).Replace(",", string.Empty));

                if (!serverSections.Contains(cboShiftOptions.Text))
                {
                    dblResult = dblOwed;
                }

                else
                {

                    dblResult = dblSales * (decimal).025 + dblOwed;
                }

                cashOwed = Convert.ToString(String.Format("{0:C}", dblResult));
                messageText = " owes you ";

                if (dblResult > 0)
                {
                    lblMain.Text = firstName + messageText;
                    lblCash.Text = cashOwed;
                    lblCash.ForeColor = System.Drawing.Color.LimeGreen;
                    lblMain.ForeColor = System.Drawing.Color.Black;
                    //msgDetails.Show();
                    msgDiv.Visible = true;

                }
                else if (dblResult < 0)
                {
                    lblMain.Text = "You owe " + firstName;
                    lblMain.ForeColor = System.Drawing.Color.Black;
                    lblCash.Text = String.Format("{0:C}", Math.Abs(dblResult));
                    lblCash.ForeColor = System.Drawing.Color.Red;
                    //msgDetails.Show();
                    msgDiv.Visible = true;
                }

                else if (dblResult == 0)
                {
                    lblMain.Text = firstName + " has broken even.";
                    lblMain.ForeColor = System.Drawing.Color.Black;
                    lblMain.Font.Size = 16;
                    lblMain.Font.Bold = true;
                    //msgDetails.Show();
                    msgDiv.Visible = true;
                }

                //mpeServerInput.Hide();
                page_two.Visible = false;
                mainButtons.Visible = false;         
            }
        }
    }

    public bool checkCashValues()
    {

        var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
        var cashregex = new Regex(@"^[-+]?[0-9]*(?:\.[0-9]*)?$");
        if ((regex.IsMatch(txtSales.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false) || (cashregex.IsMatch(txtOwed.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false) ||
    (regex.IsMatch(txtBarTips.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false) || (regex.IsMatch(txtCharge.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false) || (regex.IsMatch(txtTips.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false))
        {
            if (regex.IsMatch(txtSales.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
            {
                lblSalesEdit.Text = "*Invalid entry.";
                lblSalesEdit.ForeColor = System.Drawing.Color.Red;
            }
            if (cashregex.IsMatch(txtOwed.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
            {
                lblCashEdit.Text = "*Invalid entry.";
                lblCashEdit.ForeColor = System.Drawing.Color.Red;
            }
            if (regex.IsMatch(txtBarTips.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
            {
                lblBarEdit.Text = "*Invalid entry.";
                lblBarEdit.ForeColor = System.Drawing.Color.Red;
            }

            if (regex.IsMatch(txtCharge.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
            {
                lblChargeEdit.Text = "*Invalid entry.";
                lblChargeEdit.ForeColor = System.Drawing.Color.Red;
            }

            if (regex.IsMatch(txtTips.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
            {
                lblTipsEdit.Text = "*Invalid entry.";
                lblTipsEdit.ForeColor = System.Drawing.Color.Red;
            }
            return false;
        }
        return true;
    }

    public bool areThereBackWaitHours(string shift)
    {
        sqc = new sqlController();
        try
        {
            return sqc.GetBackWaitHours(shift, GetDate()) > 0;
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
            return false;
        }
        finally
        {
            sqc = null;
        }

    }

    public decimal sumBackWaitHours(string shift)
    {

        sqc = new sqlController();
        try
        {
            return sqc.GetBackWaitHoursSum(shift, GetDate());
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0.00M;
        }
        finally
        {
            sqc = null;
        }
    }

    public void updateBackWaitTips(string shift, decimal hours)
    {
        restaurant = (Restaurant)Session["Restaurant"];
        decimal tips = 0.00M;
        if (shift == Shift.Lunch.ToString())
        {
            tips = restaurant.LunchSATips;
        }
        else
        {
            tips = restaurant.DinnerSATips;
        }
        sqc = new sqlController();
        try
        {
            var tip = (tips / hours);
            sqc.UpdateBackWaitTips(shift, tip, GetDate());
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
        }
        finally
        {
            sqc = null;
        }

    }


    public void insertBackWaitData(Backwaiter backwait)
    {
        sqc = new sqlController();
        try
        {
            if (sqc.InsertBackWait(backwait, GetDate()) > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
            }
            backwait = null;
        }

        catch (Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }
        finally
        {
            sqc = null;
        }
    }

    public void insertServerData(Server server)
    {
        sqc = new sqlController();
        try
        {
            if (sqc.InsertServer(server, GetDate()) > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
            }

            server = null;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }
        finally
        {
            sqc = null;
            txtName.Focus();
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        lblCash.Text = "";
        decimal dblSales;
        decimal dblResult;
        decimal dblOwed;
        decimal dblBackwait;
        decimal dblTips;
        decimal dblBartips;
        string firstName;
        firstName = txtName.Text;
        restaurant = (Restaurant)Session["Restaurant"];
        var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
        var cashregex = new Regex(@"^[-+]?[0-9]*(?:\.[0-9]*)?$");
        if (!CheckDate(txtDatePicker.Text))
        {
            return;
        }

        if (regex.IsMatch(txtTips.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
        {
            if (regex.IsMatch(txtTips.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
            {
                lblTipsEdit.Text = "*Invalid entry.";
                lblTipsEdit.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            if (txtName.Text == "" || txtSales.Text == "" || txtOwed.Text == "" || txtCharge.Text == "" || txtTips.Text == "" ||
                (txtBarTips.Text == "" && serverSections.Contains(cboOptions.Text)) || (serverSections.Contains(cboOptions.Text) && decimal.Parse(txtTips.Text.Replace("$", string.Empty).Replace(",", string.Empty))
                < (decimal.Parse(txtSales.Text.Replace("$", string.Empty).Replace(",", string.Empty)) * (decimal).15)))
            {
                if (txtName.Text == "")
                {
                    lblNameEdit.Text = "*Required";
                    lblNameEdit.ForeColor = System.Drawing.Color.Red;
                    txtName.BorderStyle = BorderStyle.Dotted;
                    txtName.BorderColor = System.Drawing.Color.Red;
                }

                if (txtSales.Text == "")
                {
                    lblSalesEdit.Text = "*Required.";
                    lblSalesEdit.ForeColor = System.Drawing.Color.Red;
                    txtSales.BorderStyle = BorderStyle.Dotted;
                    txtSales.BorderColor = System.Drawing.Color.Red;
                }

                if (txtOwed.Text == "")
                {
                    lblCashEdit.Text = "*Required.";
                    lblCashEdit.ForeColor = System.Drawing.Color.Red;
                    txtOwed.BorderStyle = BorderStyle.Dotted;
                    txtOwed.BorderColor = System.Drawing.Color.Red;
                }

                if (txtCharge.Text == "")
                {
                    lblChargeEdit.Text = "*Required.";
                    lblChargeEdit.ForeColor = System.Drawing.Color.Red;
                    txtCharge.BorderStyle = BorderStyle.Dotted;
                    txtCharge.BorderColor = System.Drawing.Color.Red;
                }

                if (txtTips.Text == "")
                {
                    lblTipsEdit.Text = "*Required.";
                    lblTipsEdit.ForeColor = System.Drawing.Color.Red;
                    txtTips.BorderStyle = BorderStyle.Dotted;
                    txtTips.BorderColor = System.Drawing.Color.Red;
                }

                else if (serverSections.Contains(cboOptions.Text) && decimal.Parse(txtTips.Text.Replace("$", string.Empty).Replace(",", string.Empty)) < (decimal.Parse(txtSales.Text.Replace("$", string.Empty).Replace(",", string.Empty)) * (decimal).15))
                {
                      lblTipsEdit.Text = "*Must claim a minimum of " + String.Format("{0:C}", decimal.Parse(txtSales.Text) * (decimal).15) + " or 15% of sales.";
                      lblTipsEdit.ForeColor = System.Drawing.Color.Red;
                      txtTips.BorderStyle = BorderStyle.Dotted;
                      txtTips.BorderColor = System.Drawing.Color.Red;
                }
                
                if (txtBarTips.Text == "" && serverSections.Contains(cboOptions.Text))
                {
                    lblBarEdit.Text = "*Required.";
                    lblBarEdit.ForeColor = System.Drawing.Color.Red;
                    txtBarTips.BorderStyle = BorderStyle.Dotted;
                    txtBarTips.BorderColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                //verify cash values
                if (checkCashValues())
                {

                    dblTips = decimal.Parse(txtTips.Text.Replace("$", string.Empty).Replace(",", string.Empty));
                    dblSales = decimal.Parse(txtSales.Text.Replace("$", string.Empty).Replace(",", string.Empty));
                    dblOwed = decimal.Parse(txtOwed.Text.Replace("$", string.Empty).Replace(",", string.Empty));
                    decimal dblCharge;
                    dblCharge = decimal.Parse(txtCharge.Text.Replace("$", string.Empty).Replace(",", string.Empty));

                    if (!serverSections.Contains(cboShiftOptions.Text) && txtBarTips.Text == "")
                    {
                        dblBartips = 0;
                    }
                    else
                    {
                        dblBartips = decimal.Parse(txtBarTips.Text.Replace("$", string.Empty).Replace(",", string.Empty));
                    }

                    if (!serverSections.Contains(cboOptions.Text))
                    {
                        dblBackwait = 0;
                        dblResult = dblOwed;
                    }
                    else
                    {
                        dblBackwait = dblSales * (decimal).025;
                        dblResult = dblSales * (decimal).025 + dblOwed;
                    }

                    Server server = new Server(txtName.Text);
                    server.Section = cboOptions.Text;
                    server.Sales = dblSales;
                    server.CashToHouse = dblResult;
                    server.Cash = dblOwed;
                    server.ChargeTips = dblCharge;
                    server.BarTipOut = dblBartips;
                    server.TipOut = dblBackwait;
                    server.Shift = cboShiftOptions.Text.Trim();
                    server.Tips = dblTips;
                    server.ShiftDate = GetDate();
                    restaurant.AddEmployee(server);
                    insertServerData(server);
                    decimal dinner_result = 0;
              
                    if (restaurant.LunchBackWaitHours > 0 )
                    {
                        decimal result = restaurant.LunchBackWaitHours;                 
                        updateBackWaitTips(Shift.Lunch.ToString(), result);    
                    }
         
                    if (restaurant.DinnerBackWaitHours > 0)
                    {
                        dinner_result = restaurant.DinnerBackWaitHours;
                        updateBackWaitTips(Shift.Dinner.ToString(), dinner_result);
                    }

                    ServerFormReset();
                    //mpeTipsInput.Hide();
                    ScriptManager.RegisterStartupScript(this, GetType(), "Close", "$('#serverClose').click();", true);
                    this.Page_Load(null, null);

                }
            }
        }
    }


    protected void txtTips_TextChanged(object sender, EventArgs e)
    {
        lblTipsEdit.Text = "";
        txtTips.BorderStyle = BorderStyle.NotSet;
        txtTips.BorderColor = System.Drawing.Color.Empty;
    }

    protected void button1_Click(object sender, EventArgs e)
    {
        restaurant = (Restaurant)Session["Restaurant"];
        txtBackName.Focus();
        string backName;
        backName = txtBackName.Text;

        if (!CheckDate(txtDatePicker.Text))
        {
            return;
        }

        if (txtBackName.Text == "" || txtHours.Text == "")
        {
            if (txtBackName.Text == "")
            {
                lblBackNameEdit.Text = "*Required.";
                lblBackNameEdit.ForeColor = System.Drawing.Color.Red;
                txtBackName.BorderStyle = BorderStyle.Dotted;
                txtBackName.BorderColor = System.Drawing.Color.Red;
            }
            if (txtHours.Text == "")
            {
                lblHoursEdit.Text = "*Required.";
                lblHoursEdit.ForeColor = System.Drawing.Color.Red;
                txtHours.BorderStyle = BorderStyle.Dotted;
                txtHours.BorderColor = System.Drawing.Color.Red;
            }
        }

        else
        {
            decimal dblHours;
            var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
            if (regex.IsMatch(txtHours.Text.Replace("$", string.Empty).Replace(",", string.Empty)) == false)
            {
                lblHoursEdit.Text = "*Invalid entry.";
                lblHoursEdit.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                dblHours = Decimal.Parse(txtHours.Text.Replace("$", string.Empty).Replace(",", string.Empty));
                Backwaiter backwait = new Backwaiter(txtBackName.Text);
                backwait.Hours = dblHours;
                backwait.Shift = cboBWShiftOptions.Text.Trim();
                backwait.ShiftDate = GetDate();
                restaurant.AddBackwait(backwait);
                insertBackWaitData(backwait);
                if (cboBWShiftOptions.Text.Equals(Shift.Dinner.ToString()))
                {
                    updateBackWaitTips(Shift.Dinner.ToString(), restaurant.DinnerBackWaitHours);
                }
                else
                {
                    updateBackWaitTips(Shift.Lunch.ToString(), restaurant.LunchBackWaitHours);

                }

                ScriptManager.RegisterStartupScript(this, GetType(), "Close", "$('#bwClose').click();", true);
                this.Page_Load(null, null);
            }
        }
    }


    protected void popStaffList()
    {
        sqc = new sqlController();
        try
        {
            txtName.DataSource = sqc.GetServingStaff();
            txtName.DataTextField = "Name";
            txtName.DataValueField = "Name";
            txtName.DataBind();
        }
        catch (Exception ex)
        {

        }
        finally
        {
            sqc = null;
        }
    }

    protected void popBWList()
    {
        sqc = new sqlController();
        try
        {
            txtBackName.DataSource = sqc.GetNamesInJob("Backwaiter");
            txtBackName.DataTextField = "Name";
            txtBackName.DataValueField = "Name";
            txtBackName.DataBind();
        }
        catch(Exception)
        {

        }
        finally
        {
            sqc = null;
        }
    }

    protected void cboOptions_SelectedIndexChanged(object sender, EventArgs e)
    {


        if (cboOptions.SelectedItem.Text == "Bartender 1" || cboOptions.SelectedItem.Text == "Bartender 2" || cboOptions.SelectedItem.Text == "Bartender 3" || cboOptions.SelectedItem.Text == "ToGo-1" || cboOptions.SelectedItem.Text == "ToGo-2")
        {
            barDiv.Visible = false;
        }
        else
        {
            barDiv.Visible = true;
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //msgDetails.Visible = false;
    }
    protected void tblServerDataGridView_Sorting(object sender, GridViewSortEventArgs e)
    {
        tblServerDataGridView.DataBind();
    }

    protected void btnServerClose_Click(object sender, EventArgs e)
    {
        ServerFormReset();
        //mpeServerInput.Hide();
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        page_one.Visible = false;
        btnNext.Visible = false;
        btnBack.Visible = true;
        page_two.Visible = true;
        //buttonbreak.Visible = true;
        btnCalculate.Visible = true;
    }

    private void ServerFormReset()
    {
        txtName.SelectedIndex = 0;
        cboOptions.SelectedIndex = 0;
        txtSales.Text = "";
        txtOwed.Text = "";
        txtTips.Text = "";
        txtBarTips.Text = "";
        txtCharge.Text = "";
        txtName.BorderStyle = BorderStyle.NotSet;
        txtSales.BorderStyle = BorderStyle.NotSet;
        txtOwed.BorderStyle = BorderStyle.NotSet;
        txtTips.BorderStyle = BorderStyle.NotSet;
        txtBarTips.BorderStyle = BorderStyle.NotSet;
        txtCharge.BorderStyle = BorderStyle.NotSet;
        lblNameEdit.Text = "";
        lblSalesEdit.Text = "";
        lblCashEdit.Text = "";
        lblTipsEdit.Text = "";
        lblBarEdit.Text = "";
        lblChargeEdit.Text = "";
        txtName.BorderColor = System.Drawing.Color.Empty;
        txtSales.BorderColor = System.Drawing.Color.Empty;
        txtTips.BorderColor = System.Drawing.Color.Empty;
        txtBarTips.BorderColor = System.Drawing.Color.Empty;
        txtCharge.BorderColor = System.Drawing.Color.Empty;
        txtOwed.BorderColor = System.Drawing.Color.Empty;
        page_one.Visible = true;
        btnNext.Visible = true;
        btnBack.Visible = false;
        page_two.Visible = false;
        msgDiv.Visible = false;
        tipsDiv.Visible = false;
        mainButtons.Visible = true;
        //buttonbreak.Visible = false;
        btnCalculate.Visible = false;
        txtBarTips.Visible = true;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        page_one.Visible = true;
        btnNext.Visible = true;
        btnBack.Visible = false;
        page_two.Visible = false;
        //buttonbreak.Visible = false;
        btnCalculate.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if(!CheckDate(txtDatePicker.Text))
        {
            return;
        }

        restaurant = (Restaurant)Session["Restaurant"];
        if (restaurant.Days.Any(x => x.Date == GetDate()))
        {
            return;
        }
        restaurant.Days.Add(GetDate());
        DataTable lunchServers = populateServerGrid(Shift.Lunch.ToString());
        DataTable dinnerServers = populateServerGrid(Shift.Dinner.ToString());
        DataTable lunchBackwaits = populateBWGrid(Shift.Lunch.ToString());
        DataTable dinnerBackwaits = populateBWGrid(Shift.Dinner.ToString());
        AddEmployeesToRestaurant(lunchServers);
        AddEmployeesToRestaurant(dinnerServers);
        AddBackwaitsToRestaurant(lunchBackwaits);
        AddBackwaitsToRestaurant(dinnerBackwaits);
        SetTotalLabels();
    }

    private bool CheckDate(string date)
    {
        try
        {
            DateTime dt = DateTime.Parse(date);
            lblErrorMessage.Text = "An error has occurred.  Please contact the administrator.";
            return true;
        }
        catch(Exception)
        {
            lblErrorMessage.Text = "*You must enter a valid date in mm/dd/YYYY format.";
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
            return false;
        }
    }

    protected void btnTipsClose_Click(object sender, EventArgs e)
    {
        ServerFormReset();
        //mpeTipsInput.Hide();
    }

    protected void btnAddSA_Click(object sender, EventArgs e)
    {
        txtBackName.SelectedIndex = 0;
        cboBWShiftOptions.SelectedIndex = 0;
        txtHours.Text = "";
        lblBackNameEdit.Text = "";
        lblHoursEdit.Text = "";
        ScriptManager.RegisterStartupScript(this, GetType(), "Open BW Modal", "openBWModal();", true);
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        msgDiv.Visible = false;
        tipsDiv.Visible = true;
    }

    protected void btnAddServer_Click(object sender, EventArgs e)
    {
        ServerFormReset();
        ScriptManager.RegisterStartupScript(this, GetType(), "Open Server Modal", "openServerModal();", true);
    }
}
