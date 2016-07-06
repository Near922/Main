using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Data;
using System.Text;


public partial class _Default : System.Web.UI.Page
{

    string[] strtLunchHours = { " ", "7 am", "8 am", "9 am", "10 am", "11 am", "12 pm", "1 pm", "2 pm", "3 pm" };
    string[] strtLunchMinutes = { " ", "00", "15", "30", "45" };
    string[] strtDinnerHours = { " ", "4 pm", "5 pm", "6 pm", "7 pm", "8 pm", "9 pm", "10 pm", "11 pm" };
    string[] strStaffType = { " ", "Server", "Backwaiter", "Host", "Bartender", "ToGo", "Dish", "Prep", "Cook", "Management" };
    string[] strEmployeeStaff = { "Jimmy", "Meghan", "Kevin", "Nick", "Jason", "Mary", "Sara" };
    string[] strBarStaff = { "Joe", "Denise", "Beth", "Mike", "Matt" };
    string[] strHostStaff = { "Mary", "Kaitlyn", "Margaret", "Rachel", "Lindsay" };
    string[] strBackWaitStaff = { "Michael", "Samantha", "Tiffany", "Anthony", "Eric" };
    string[] strToGoStaff = { "Monica", "Nick", "Anthony", "Harry" };
    string[] strManagementStaff = { "Patrick", "Andrew", "James", "Michelle" };
    string[] strDishStaff = { "Calvin", "Bernard", "Jose" };
    string[] strCooksStaff = { "Drew", "Maria", "Sean", "Justin" };
    string[] strPrepStaff = { "Santiago" };
    string[] strDefault = { " " };
    string[] strShifts = { "Lunch", "Dinner" };

    List<Employee> empList = new List<Employee>();
    List<Employee> fullList = new List<Employee>();
    List<Shift> lstShifts = new List<Shift>();

    DateTime previousDate;


    string[] strSchedule = { DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 1).ToString("dddd MMMM dd"), DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 2).ToString("dddd MMMM dd"),
                               DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 3).ToString("dddd MMMM dd"), DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 4).ToString("dddd MMMM dd"),
                               DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 5).ToString("dddd MMMM dd"), DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 6).ToString("dddd MMMM dd"),
                               DateTime.Today.AddDays(((int)(DateTime.Today.DayOfWeek) * -1) + 7).ToString("dddd MMMM dd")};



    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            lstStartHours.DataSource = strtLunchHours;
            lstStartHours.DataBind();

            lstStartMinutes.DataSource = strtLunchMinutes;
            lstStartMinutes.DataBind();

            lstStaffType.DataSource = strStaffType;
            lstStaffType.DataBind();
            lstShift.DataSource = strShifts;
            lstShift.DataBind();

            lstEndHours.DataSource = strtLunchHours;
            lstEndHours.DataBind();

            lstEndMinutes.DataSource = strtLunchMinutes;
            lstEndMinutes.DataBind();

            Calendar1.SelectedDate = DateTime.Today;

            previousDate = Calendar1.SelectedDate;
            Session["PreviousDate"] = previousDate;
  
            if ((int)Calendar1.SelectedDate.DayOfWeek == 0)
            {
                lblMonday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 6).ToString("dddd MMMM dd");
                lblTuesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 5).ToString("dddd MMMM dd");
                lblWednesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 4).ToString("dddd MMMM dd");
                lblThursday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 3).ToString("dddd MMMM dd");
                lblFriday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 2).ToString("dddd MMMM dd");
                lblSaturday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 1).ToString("dddd MMMM dd");
                lblSunday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1)).ToString("dddd MMMM dd");

            }

            else
            {
                lblMonday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 1).ToString("dddd MMMM dd");
                lblTuesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 2).ToString("dddd MMMM dd");
                lblWednesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 3).ToString("dddd MMMM dd");
                lblThursday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 4).ToString("dddd MMMM dd");
                lblFriday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 5).ToString("dddd MMMM dd");
                lblSaturday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 6).ToString("dddd MMMM dd");
                lblSunday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 7).ToString("dddd MMMM dd");


            }

            GetShifts();
        }
        else
        {
            previousDate = (DateTime)Session["PreviousDate"];
        }
    }
    protected void lstStaffType_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (lstStaffType.Text)
        {
            case "Server":
                popStaffList(EmployeeRoles.Server);

                break;

            case "Bartender":
                popStaffList(EmployeeRoles.Bartender);
                break;

            case "Management":
                popStaffList(EmployeeRoles.Management);
                break;

            case "Backwaiter":
                popStaffList(EmployeeRoles.Backwaiter);
                break;

            case "Host":
                popStaffList(EmployeeRoles.Host);
                break;

            case "ToGo":
                popStaffList(EmployeeRoles.ToGo);
                break;

            case "Prep":
                popStaffList(EmployeeRoles.Prep);
                break;

            case "Cook":
                popStaffList(EmployeeRoles.Cook);
                break;

            case "Dish":
                popStaffList(EmployeeRoles.Dish);
                break;
        }

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if ((int)Calendar1.SelectedDate.DayOfWeek == 0)
        {
            lblMonday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 6).ToString("dddd MMMM dd");
            lblTuesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 5).ToString("dddd MMMM dd");
            lblWednesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 4).ToString("dddd MMMM dd");
            lblThursday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 3).ToString("dddd MMMM dd");
            lblFriday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 2).ToString("dddd MMMM dd");
            lblSaturday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 1).ToString("dddd MMMM dd");
            lblSunday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1)).ToString("dddd MMMM dd");
        }

        else
        {
            lblMonday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 1).ToString("dddd MMMM dd");
            lblTuesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 2).ToString("dddd MMMM dd");
            lblWednesday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 3).ToString("dddd MMMM dd");
            lblThursday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 4).ToString("dddd MMMM dd");
            lblFriday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 5).ToString("dddd MMMM dd");
            lblSaturday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 6).ToString("dddd MMMM dd");
            lblSunday.Text = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 7).ToString("dddd MMMM dd");
        }

        var currentWeek = GetDay(Calendar1.SelectedDate);
        if ( previousDate < currentWeek[0] || previousDate > currentWeek[1])
        {
            GetShifts();
        }

        previousDate = Calendar1.SelectedDate;
        Session["PreviousDate"] = previousDate;
    }

    public DateTime[] GetDay(DateTime calendarDate)
    {
        DateTime thisWeekStart;
        DateTime thisWeekEnd;

        if ((int)Calendar1.SelectedDate.DayOfWeek == 0)
        {
            thisWeekStart = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) - 6);
            thisWeekEnd = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 1);
        }

        else
        {
            thisWeekStart = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 1);
            thisWeekEnd = Calendar1.SelectedDate.AddDays(((int)(Calendar1.SelectedDate.DayOfWeek) * -1) + 8);
        }

        DateTime[] range = { thisWeekStart, thisWeekEnd };
        return range;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string truLunchStart;
        string lunchresultString;
        string lunchendresultString;
        string FinalLunchStart;
        string lunchEndTime;
        string lunchEndTimeEndResult;
        string truLunchEnd;
        string FinalLunchEnd;


        string staffName = lstStaff.Text;
        string strJob = lstStaffType.Text;
        DateTime strtTime = new DateTime(1975, 01, 01);
        DateTime endTime = new DateTime(1975, 01, 01);
        DateTime dinnerStart = new DateTime(1975, 01, 01);
        DateTime dinnerEnd = new DateTime(1975, 01, 01);

        if ((lstStartHours.Text != " ") && (lstStartMinutes.Text == " " || lstEndHours.Text == " " || lstEndMinutes.Text == " "))
        {

            lblStrtTimeEdit.Text = "*Please complete selection.";
            lblStrtTimeEdit.ForeColor = System.Drawing.Color.Red;
            lstStartHours.BorderStyle = BorderStyle.Dotted;
            lstStartHours.BorderColor = System.Drawing.Color.Red;
            lstStartMinutes.BorderStyle = BorderStyle.Dotted;
            lstStartMinutes.BorderColor = System.Drawing.Color.Red;

        }
        else if (lstStartHours.Text != " ")
        {
            lunchresultString = Regex.Match(lstStartHours.Text, @"\d+").Value;
            lunchendresultString = Regex.Match(lstStartHours.Text, @"\D+").Value;
            truLunchStart = Calendar1.SelectedDate.ToShortDateString() + " " + (lunchresultString + ":" + lstStartMinutes.Text + " " + lunchendresultString);
            strtTime = DateTime.Parse(truLunchStart);
            FinalLunchStart = strtTime.ToString("MM/dd/yyyy HH:mm tt");
            lunchEndTime = Regex.Match(lstEndHours.Text, @"\d+").Value;
            lunchEndTimeEndResult = Regex.Match(lstEndHours.Text, @"\D+").Value;
            truLunchEnd = Calendar1.SelectedDate.ToShortDateString() + " " + (lunchEndTime + ":" + lstEndMinutes.Text + " " + lunchEndTimeEndResult);
            endTime = DateTime.Parse(truLunchEnd);
            FinalLunchEnd = endTime.ToString("MM/dd/yyyy HH:mm tt");
        }


        if ((lstStaffType.Text == " ") || (lstStartHours.Text == " ") || (Calendar1.SelectedDate < DateTime.Today) || ((strtTime <= DateTime.Now) && (lstStartHours.Text != " "))
            || (((lstStartHours.Text != " ") || (lstEndHours.Text != " ")) && Check_Shift(staffName, strtTime, lstShift.SelectedItem.Text) == false) || ((lstStartHours.Text != " ") && (lstStartMinutes.Text == " " || lstEndHours.Text == " " || lstEndMinutes.Text == " "))
            || ((strtTime >= endTime) && (lstStartHours.Text != " "))
        )
        {
            if (lstStaffType.Text == " ")
            {
                lblStaffTypeEdit.Text = "*Please select a staff type.";
                lblStaffTypeEdit.ForeColor = System.Drawing.Color.Red;
                lstStaffType.BorderStyle = BorderStyle.Dotted;
                lstStaffType.BorderColor = System.Drawing.Color.Red;
                lblStaffEdit.Text = "*Please select an employee.";
                lblStaffEdit.ForeColor = System.Drawing.Color.Red;
                lstStaff.BorderStyle = BorderStyle.Dotted;
                lstStaff.BorderColor = System.Drawing.Color.Red;
            }


            if ((lstStartHours.Text == " "))
            {
                lblStrtTimeEdit.Text = "*Please select a shift.";
                lblStrtTimeEdit.ForeColor = System.Drawing.Color.Red;
                lstStartHours.BorderStyle = BorderStyle.Dotted;
                lstStartHours.BorderColor = System.Drawing.Color.Red;
                lstStartMinutes.BorderStyle = BorderStyle.Dotted;
                lstStartMinutes.BorderColor = System.Drawing.Color.Red;
            }
            if (Calendar1.SelectedDate < DateTime.Today)
            {
                lblCalendarEdit.Text = "*Please select a valid date.";
                lblCalendarEdit.ForeColor = System.Drawing.Color.Red;
            }

            if (((lstStartHours.Text != " ") || (lstEndHours.Text != " ")) && Check_Shift(staffName, strtTime, lstShift.SelectedItem.Text) == false)
            {

                lblStrtTimeEdit.Text = "*Shift is unavailable.";
                lblStrtTimeEdit.ForeColor = System.Drawing.Color.Red;
                lstStartHours.BorderStyle = BorderStyle.Dotted;
                lstStartHours.BorderColor = System.Drawing.Color.Red;
                lstStartMinutes.BorderStyle = BorderStyle.Dotted;
                lstStartMinutes.BorderColor = System.Drawing.Color.Red;

            }


            if ((strtTime <= DateTime.Now) && (lstStartHours.Text != " "))
            {

                lblStrtTimeEdit.Text = "*Please choose valid time.";
                lblStrtTimeEdit.ForeColor = System.Drawing.Color.Red;
                lstStartHours.BorderStyle = BorderStyle.Dotted;
                lstStartHours.BorderColor = System.Drawing.Color.Red;
                lstStartMinutes.BorderStyle = BorderStyle.Dotted;
                lstStartMinutes.BorderColor = System.Drawing.Color.Red;

            }

            if ((strtTime >= endTime) && (lstStartHours.Text != " "))
            {
                lblStrtTimeEdit.Text = "*Please choose valid time.";
                lstStartHours.BorderStyle = BorderStyle.Dotted;
                lstStartHours.BorderColor = System.Drawing.Color.Red;
                lstStartMinutes.BorderStyle = BorderStyle.Dotted;
                lstStartMinutes.BorderColor = System.Drawing.Color.Red; lblStrtTimeEdit.ForeColor = System.Drawing.Color.Red;
            }


            if ((lstStartHours.Text != " ") && (lstEndHours.Text == " " || lstEndMinutes.Text == " "))
            {
                lblStrtTimeEdit.Text = "*Please complete selection.";
                lblStrtTimeEdit.ForeColor = System.Drawing.Color.Red;
                lstStartHours.BorderStyle = BorderStyle.Dotted;
                lstStartHours.BorderColor = System.Drawing.Color.Red;
                lstStartMinutes.BorderStyle = BorderStyle.Dotted;
                lstStartMinutes.BorderColor = System.Drawing.Color.Red;
            }

        }
        else
        {
            insert_schedule(staffName, strJob, strtTime, endTime, lstShift.SelectedItem.Text);
            mpeScheduleInput.Hide();

        }
    }

    public string GetJobs(string name)
    {
        StringBuilder jobs = new StringBuilder();
        List<Employee> full = (List<Employee>)Session["Full"];
        var emps = full.Where(x => x.Name == name).ToList();
        for (int i = 0; i < emps.Count; i++)
        {
            if (i == 0)
            {
                jobs.Append(emps[i].Title);
            }
            else
            {
                jobs.Append(" / " + emps[i].Title);
            }
        }
        return jobs.ToString();
    }



    public void GetShifts()
    {
        DateTime[] range = GetDay(Calendar1.SelectedDate);
        sqlController sqc = new sqlController();
        List<SqlParameter> sqlParams = new List<SqlParameter>();
        sqlParams.Add(new SqlParameter("@Start", range[0]));
        sqlParams.Add(new SqlParameter("@End", range[1]));
        DataTable table = sqc.GetShifts(sqlParams);
        sqlParams.Clear();
        DataTable empTable = sqc.GetScheduleNames();
        foreach (DataRow row in empTable.Rows)
        {
            var s = new Employee(row["Name"].ToString());
            s.Title = row["Job"].ToString();
            if (!empList.Any(x => x.Name == row["Name"].ToString()))
            {

                empList.Add(s);
            }
            fullList.Add(s);
        }
        lstShifts = new List<Shift>();
        foreach (DataRow row in table.Rows)
        {
            Employee Employee = empList.First(x => x.Name == row["Name"].ToString());
            Shift shift = new Shift();
            shift.ID = (int)row["ID"];
            shift.Name = row["Name"].ToString().Trim();
            shift.Start = (DateTime)row["Start_Time"];
            shift.End = (DateTime)row["End_Time"];
            shift.Job = row["Job"].ToString().Trim();
            //Employee.Title = row["Job"].ToString().Trim();
            shift.ShiftName = row["Shift"].ToString().Trim();
            Employee.Schedule.Shifts.Add(shift);
            lstShifts.Add(shift);
        }
        Session["Shifts"] = null;
        Session["Schedule"] = null;
        Session["Full"] = null;
        Session["Shifts"] = lstShifts;
        Session["Schedule"] = empList;
        Session["Full"] = fullList;
        Get_ScheduleNames();
    }

    public System.Drawing.Color GetColor(Shift shift)
    {
        if (shift == null)
        {
            return System.Drawing.Color.Black;
        }
        else if (shift.Start >= DateTime.Now)
        {
            return System.Drawing.Color.Blue;
        }
        else
        {
            return System.Drawing.Color.Black;
        }
    }

    public bool GetState(Shift shift)
    {
        if (shift == null)
        {
            return false;
        }
        else if (shift.Start > DateTime.Now)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public enum Shifts
    {
        Lunch,
        Dinner
    }

    public enum Days
    {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday


    }

    public System.Drawing.Color DinnerHoursColor(Schedule shift)
    {
        if( shift == null)
        {
            return System.Drawing.Color.Black;
        }

        if (shift.DinnerHoursTime > 40)
        {
            return System.Drawing.Color.Red;
        }
        else if ( shift.DinnerHoursTime > 35 && shift.DinnerHoursTime <= 40)
        {
            return System.Drawing.Color.Orange;
        }
        else
        {
            return System.Drawing.Color.Black;
        }
    }

    public System.Drawing.Color TotalHoursColor(Schedule shift)
    {
        if (shift == null)
        {
            return System.Drawing.Color.Black;
        }

        if (shift.TotalHoursTime> 40)
        {
            return System.Drawing.Color.Red;
        }
        else if (shift.TotalHoursTime > 35 && shift.TotalHoursTime <= 40)
        {
            return System.Drawing.Color.Orange;
        }
        else
        {
            return System.Drawing.Color.Black;
        }
    }

    public System.Drawing.Color LunchHoursColor(Schedule shift)
    {
        if (shift == null)
        {
            return System.Drawing.Color.Black;
        }

        if (shift.LunchHoursTime > 40)
        {
            return System.Drawing.Color.Red;
        }
        else if (shift.LunchHoursTime > 35 && shift.LunchHoursTime <= 40)
        {
            return System.Drawing.Color.Orange;
        }
        else
        {
            return System.Drawing.Color.Black;
        }
    }



    protected void chkServer_CheckedChanged(object sender, EventArgs e)
    {

        Get_ScheduleNames();
        Repeater3.DataBind();


    }

    bool Check_Shift(string name, DateTime shift, string strshift)
    {
        var schedule = (List<Employee>)Session["Schedule"];
        if (schedule.Any(x => x.Name == name))
        {
            Employee Employee = schedule.First(x => x.Name == name);
            if (Employee.Schedule.Shifts.Any(x => x.ShiftName == strshift && x.Start.Day == shift.Day))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return true;
        }


    }

    private void insert_schedule(string staffName, string strJob, DateTime strtTime, DateTime endTime, string strShift)
    {

        Shift shift = new Shift();
        shift.Name = staffName;
        shift.Job = strJob;
        shift.ShiftName = strShift;
        shift.Start = strtTime;
        shift.End = endTime;
        shift.PostDate = DateTime.Now;
        sqlController sqc = new sqlController();
        try
        {
            if(sqc.Check_Shift(shift.Name, shift.Start, shift.ShiftName) > 0)
            {
                lblStrtTimeEdit.Text = "*Shift is unavailable.";
                lblStrtTimeEdit.ForeColor = System.Drawing.Color.Red;
                lstStartHours.BorderStyle = BorderStyle.Dotted;
                lstStartHours.BorderColor = System.Drawing.Color.Red;
                lstStartMinutes.BorderStyle = BorderStyle.Dotted;
                lstStartMinutes.BorderColor = System.Drawing.Color.Red;
                return;
            }


            if (sqc.InsertShift(shift) > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
                lblMessage.Text = "Shift was added successfully.";
                lstStaffType.Text = " ";
                lstStaff.Items.Clear();
                lstShift.Text = "Lunch";
                lstStartMinutes.Text = " ";
                lstStartHours.Text = " ";
                lstEndHours.Text = " ";
                lstEndMinutes.Text = " ";
                lblStrtTimeEdit.Text = "";
                lblStaffTypeEdit.Text = "";
                lblStaffEdit.Text = "";
                lblShiftEdit.Text = "";
                lstStaffType.BorderStyle = BorderStyle.NotSet;
                lstStartMinutes.BorderStyle = BorderStyle.NotSet;
                lstStartHours.BorderStyle = BorderStyle.NotSet;
                lstEndHours.BorderStyle = BorderStyle.NotSet;
                lstEndMinutes.BorderStyle = BorderStyle.NotSet;
                lstStaffType.BorderColor = System.Drawing.Color.Empty;
                lstStartMinutes.BorderColor = System.Drawing.Color.Empty;
                lstStartHours.BorderColor = System.Drawing.Color.Empty;
                lstEndHours.BorderColor = System.Drawing.Color.Empty;
                lstEndMinutes.BorderColor = System.Drawing.Color.Empty;
                lstStartHours.DataSource = strtLunchHours;
                lstStartHours.DataBind();
                lstEndHours.DataSource = strtLunchHours;
                lstEndHours.DataBind();
                GetShifts();

            }
        }

        catch (Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }
        sqc = null;
    }

    public void Get_ScheduleNames()
    {
        List<string> roles = new List<string>();

        if (chkServer.Checked)
        {
            roles.Add("Server");

        }

        if (chkBar.Checked)
        {
            roles.Add("Bartender");
        }

        if (chkHost.Checked)
        {
            roles.Add("Host");

        }

        if (chkManagement.Checked)
        {
            roles.Add("Management");
        }

        if (chkDish.Checked)
        {
            roles.Add("Dish");
        }

        if (chkPrep.Checked)
        {
            roles.Add("Prep");

        }


        if (chkCook.Checked)
        {
            roles.Add("Cook");
        }


        if (chkBackwait.Checked)
        {
            roles.Add("Backwaiter");

        }

        if (chkToGo.Checked)
        {
            roles.Add("ToGo");

        }

        var schedule = (List<Employee>)Session["Schedule"];
        var full = (List<Employee>)Session["Full"];
        var filter = full.Where(x => roles.Contains(x.Title)).ToList();
        List<string> names = new List<string>();
        foreach ( Employee Employee in filter)
        {
            names.Add(Employee.Name);
        }

        var list = schedule.Where(x => names.Contains(x.Name)).ToList();
        Repeater3.DataSource = list;
        Repeater3.DataBind();
    }
    protected void chkHost_CheckedChanged(object sender, EventArgs e)
    {

        Get_ScheduleNames();
    }
    protected void chkBar_CheckedChanged(object sender, EventArgs e)
    {
        Get_ScheduleNames();
    }
    protected void chkBackwait_CheckedChanged(object sender, EventArgs e)
    {
        Get_ScheduleNames();
    }
    protected void chkToGo_CheckedChanged(object sender, EventArgs e)
    {
        Get_ScheduleNames();
    }
    protected void chkManagement_CheckedChanged(object sender, EventArgs e)
    {
        Get_ScheduleNames();
    }
    protected void chkDish_CheckedChanged(object sender, EventArgs e)
    {
        Get_ScheduleNames();
    }
    protected void chkPrep_CheckedChanged(object sender, EventArgs e)
    {
        Get_ScheduleNames();
    }
    protected void chkCook_CheckedChanged(object sender, EventArgs e)
    {
        Get_ScheduleNames();
    }


    protected void LinkButtonPopUp(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        if (Session["Shifts"] != null)
        {
            lstShifts = (List<Shift>)Session["Shifts"];
        }

        int shiftID = int.Parse(btn.Attributes["CustomParameter"]);
        Shift shift = lstShifts.First(x => x.ID == shiftID);
        shftDate.Text = shift.Start.ToLongDateString();
        lblShftDetailsName.Text = shift.Name;
        lblShiftDetailsShift.Text = String.Format("{0:t}", shift.Start) + "-" + String.Format("{0:t}", shift.End);
        lblShiftDetailsJob.Text = shift.Job;
        showScheduleDetailsPopUp();
    }
    public void showScheduleDetailsPopUp()
    {
        scheduleDetails.Show();
    }

    public void DeleteShift()
    {
        string strShift = "";
        string detailsShift = lblShiftDetailsShift.Text.Trim();
        string Name = lblShftDetailsName.Text.Trim();
        string Job = lblShiftDetailsJob.Text.Trim();
        string Date = shftDate.Text.Trim();
        string fullStartDate = Date + "," + detailsShift;



        string[] strt = fullStartDate.Split('-');
        DateTime startTime = DateTime.Parse(strt[0]);
        TimeSpan four = new TimeSpan(16, 0, 0);
        TimeSpan shiftStart = startTime.TimeOfDay;
        if (shiftStart < four)
        {
            strShift = "Lunch";

        }
        else
        {
            strShift = "Dinner";
        }
        //Begin Delete Values
        Shift shift = new Shift();
        shift.Name = Name;
        shift.Job = Job;
        shift.Start = startTime;
        shift.ShiftName = strShift;
        sqlController sqc = new sqlController();
        try
        {

            if (sqc.DeleteShift(shift) > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
                lblMessage.Text = "Shift was deleted successfully."; 
                GetShifts();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
        }
        sqc = null;
        scheduleDetails.Hide();
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        lstStaffType.Text = " ";
        lstStartMinutes.Text = " ";
        lstStartHours.Text = " ";
        lstEndHours.Text = " ";
        lstEndMinutes.Text = " ";
        lstStaff.Items.Clear();
        lstShift.Text = "Lunch";
        lstStaffType.BorderStyle = BorderStyle.NotSet;
        lstStartMinutes.BorderStyle = BorderStyle.NotSet;
        lstStartHours.BorderStyle = BorderStyle.NotSet;
        lstEndHours.BorderStyle = BorderStyle.NotSet;
        lstEndMinutes.BorderStyle = BorderStyle.NotSet;
        lstStaff.BorderStyle = BorderStyle.NotSet;
        lstStaff.BorderColor = System.Drawing.Color.Empty;
        lstStaffType.BorderColor = System.Drawing.Color.Empty;
        lstStartMinutes.BorderColor = System.Drawing.Color.Empty;
        lstStartHours.BorderColor = System.Drawing.Color.Empty;
        lstEndHours.BorderColor = System.Drawing.Color.Empty;
        lstEndMinutes.BorderColor = System.Drawing.Color.Empty;
        lblStrtTimeEdit.Text = "";
        lblStaffEdit.Text = "";
        lblStaffTypeEdit.Text = "";
        lblShiftEdit.Text = "";
        lblMain.Text = " ";
        lstStartHours.DataSource = strtLunchHours;
        lstStartHours.DataBind();
        lstEndHours.DataSource = strtLunchHours;
        lstEndHours.DataBind();

        mpeScheduleInput.Hide();
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        DeleteShift();
    }

    protected void popStaffList(EmployeeRoles role)
    {
        sqlController sqc = new sqlController();
        lstStaff.DataSource = sqc.GetNamesInJob(role.ToString());
        lstStaff.DataTextField = "Name";
        lstStaff.DataValueField = "Name";
        lstStaff.DataBind();
        sqc = null;
    }

    protected void lstShift_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (lstShift.SelectedItem.Text.Equals("Dinner"))
        {
            lstStartHours.DataSource = strtDinnerHours;
            lstStartHours.DataBind();
            lstEndHours.DataSource = strtDinnerHours;
            lstEndHours.DataBind();

        }

        else
        {
            lstStartHours.DataSource = strtLunchHours;
            lstStartHours.DataBind();
            lstEndHours.DataSource = strtLunchHours;
            lstEndHours.DataBind();

        }
    }
}