using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Restaurant
/// </summary>
public class Restaurant
{
    private List<Server> _employees;
    private List<Backwaiter> _backwaits;

    private decimal _lunchSales;
    private decimal _dinnerSales;
    private decimal _totalSales;
    private decimal _lunchCash;
    private decimal _dinnerCash;
    private decimal _totalCash;
    private decimal _lunchSATips;
    private decimal _dinnerSATips;
    private decimal _totalSATips;
    private decimal _lunchDeposit;
    private decimal _dinnerDeposit;
    private decimal _totalDeposit;
    private decimal _lunchBackWaitHours;
    private decimal _dinnerBackWaitHours;

    private enum Shift
    {
        Lunch,
        Dinner
    }

    private enum Categories
    {
        Sales,
        Cash,
        SATips,
        Deposit
    }

	public Restaurant()
	{
        _employees = new List<Server>();
        _backwaits = new List<Backwaiter>();
        Days = new List<DateTime>();
	}

    public List<Server> Servers
    {
        get
        {
            return _employees;
        }
    }

    public List<Backwaiter> Backwaiters
    {
        get
        {
            return _backwaits;
        }
    }

    public List<DateTime> Days { get; set; }
    public DateTime CurrentDate { get; set; }

    public void AddEmployee(Server server)
    {
        _employees.Add(server);
    }

    public void AddBackwait(Backwaiter backwait)
    {
        _backwaits.Add(backwait);
    }


    public decimal LunchSales
    {

        get
        {
            _lunchSales = GetTotal(Shift.Lunch.ToString(), Categories.Sales.ToString());
            return _lunchSales;
        }
    }

    public decimal DinnerSales
    {

        get
        {
            _dinnerSales = GetTotal(Shift.Dinner.ToString(), Categories.Sales.ToString());
            return _dinnerSales;
        }
    }

    public decimal TotalSales
    {
        get
        {
            _totalSales = LunchSales + DinnerSales;
            return _totalSales;
        }
    }

    public decimal LunchCash
    {

        get
        {
            _lunchCash = GetTotal(Shift.Lunch.ToString(), Categories.Cash.ToString());
            return _lunchCash;
        }
    }

    public decimal DinnerCash
    {

        get
        {
            _dinnerCash = GetTotal(Shift.Dinner.ToString(), Categories.Cash.ToString());
            return _dinnerCash;
        }
    }


    public decimal TotalCash
    {
        get
        {
            _totalCash = LunchCash + DinnerCash;
            return _totalCash;
        }
    }


    public decimal LunchSATips
    {

        get
        {
            _lunchSATips = GetTotal(Shift.Lunch.ToString(), Categories.SATips.ToString());
            return _lunchSATips;
        }
    }

    public decimal DinnerSATips
    {

        get
        {
            _dinnerSATips = GetTotal(Shift.Dinner.ToString(), Categories.SATips.ToString());
            return _dinnerSATips;
        }
    }


    public decimal TotalSATips
    {
        get
        {
            _totalSATips = LunchSATips + DinnerSATips;
            return _totalSATips;
        }
    }

    public decimal LunchDeposit
    {
        get
        {
            _lunchDeposit = LunchCash - LunchSATips;

            return _lunchDeposit;
        }
  
    }

    public decimal DinnerDeposit
    {
        get
        {
            _dinnerDeposit = DinnerCash - DinnerSATips;
            return _dinnerDeposit;
        }
    }

    public decimal TotalDeposit
    {
        get
        {
            _totalDeposit = TotalCash - TotalSATips;
            return _totalDeposit;
        }
    }

    public decimal LunchBackWaitHours
    {
        get
        {
            _lunchBackWaitHours = SumBackWaitHours(Shift.Lunch.ToString());
            return _lunchBackWaitHours;
        }
    }

    public decimal DinnerBackWaitHours
    {
        get
        {
            _dinnerBackWaitHours = SumBackWaitHours(Shift.Dinner.ToString());
            return _dinnerBackWaitHours;
        }
    }
    private decimal SumBackWaitHours(string shift)
    {
        decimal sum = 0.00M;
        var query = from mRow in _backwaits
                    where mRow.Shift == shift && mRow.ShiftDate == CurrentDate
                    select mRow;

        List<Backwaiter> lstBackwaiters = query.ToList<Backwaiter>();
        foreach (Backwaiter backwait in lstBackwaiters)
        {
            sum += backwait.Hours;
        }

        return sum;
    }
    private decimal GetTotal(string shift, string category)
    {
        decimal sum = 0.00M;

  
            var query = from mRow in _employees
                        where mRow.Shift == shift && mRow.ShiftDate == CurrentDate
                        select mRow;

            List<Server> lstEmployee = query.ToList<Server>();
            foreach (Server employee in lstEmployee)
            {
                switch (category)
                {
                    case "Sales":
                        sum += employee.Sales;
                        break;
                    case "Cash":
                        sum += employee.Cash;
                        break;
                    case "SATips":
                        sum += employee.TipOut;
                        break;
                }
            }

        return sum;
    }
}