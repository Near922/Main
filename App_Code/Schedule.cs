using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Schedule
/// </summary>
public class Schedule
{
    public List<Shift> Shifts { get; set; }
    public Schedule()
    {
        //
        // TODO: Add constructor logic here
        //
        Shifts = new List<Shift>();
    }

    public Shift MondayLunch
    {
        get
        {
            return GetShift(DayOfWeek.Monday, "Lunch");
        }
    }

    public Shift TuesdayLunch
    {
        get
        {
            return GetShift(DayOfWeek.Tuesday, "Lunch");
        }
    }

    public Shift WednesdayLunch
    {
        get
        {
            return GetShift(DayOfWeek.Wednesday, "Lunch");
        }
    }

    public Shift ThursdayLunch
    {
        get
        {
            return GetShift(DayOfWeek.Thursday, "Lunch");
        }
    }

    public Shift FridayLunch
    {
        get
        {
            return GetShift(DayOfWeek.Friday, "Lunch");
        }
    }

    public Shift SaturdayLunch
    {
        get
        {
            return GetShift(DayOfWeek.Saturday, "Lunch");
        }
    }

    public Shift SundayLunch
    {
        get
        {
           return GetShift(DayOfWeek.Sunday, "Lunch");
        }
    }

    public Shift MondayDinner
    {
        get
        {
            return GetShift(DayOfWeek.Monday, "Dinner");
        }
    }

    public Shift TuesdayDinner
    {
        get
        {
            return GetShift(DayOfWeek.Tuesday, "Dinner");
        }
    }

    public Shift WednesdayDinner
    {
        get
        {
            return GetShift(DayOfWeek.Wednesday, "Dinner");
        }
    }

    public Shift ThursdayDinner
    {
        get
        {
            return GetShift(DayOfWeek.Thursday, "Dinner");
        }
    }

    public Shift FridayDinner
    {
        get
        {
            return GetShift(DayOfWeek.Friday, "Dinner");
        }
    }

    public Shift SaturdayDinner
    {
        get
        {
            return GetShift(DayOfWeek.Saturday, "Dinner");
        }
    }

    public Shift SundayDinner
    {
        get
        {
            return GetShift(DayOfWeek.Sunday, "Dinner");
        }
    }

    public int LunchShifts
    {
        get
        {
            if (!Shifts.Any(x => x.ShiftName.Trim() == "Lunch"))
            {
                return 0;
            }

            return Shifts.Where(x => x.ShiftName.Trim() == "Lunch").Count();
        }
    }

    public int DinnerShifts
    {
        get
        {
            if (!Shifts.Any(x => x.ShiftName.Trim() == "Dinner"))
            {
                return 0;
            }

            return Shifts.Where(x => x.ShiftName.Trim() == "Dinner").Count();
        }
    }

    public string LunchHours
    {
        get
        {
            var shifts = Shifts.Where(x => x.ShiftName.Trim() == "Lunch");
            double span = shifts.Sum(x => x.Hours.TotalHours);
            return span.ToString() + " hrs";
        }
    }

    public double LunchHoursTime
    {
        get
        {
            var shifts = Shifts.Where(x => x.ShiftName.Trim() == "Lunch");
            double span = shifts.Sum(x => x.Hours.TotalHours);
            return span;
        }
    }

    public string DinnerHours
    {
        get
        {
            var shifts = Shifts.Where(x => x.ShiftName.Trim() == "Dinner");
            double span = shifts.Sum(x => x.Hours.TotalHours);
            return span.ToString() + " hrs";
        }
    }

    public double DinnerHoursTime
    {
        get
        {
            var shifts = Shifts.Where(x => x.ShiftName.Trim() == "Dinner");
            double span = shifts.Sum(x => x.Hours.TotalHours);
            return span;
        }
    }

    public string TotalHours
    {
        get
        {
            double span = Shifts.Sum(x => x.Hours.TotalHours);
            return span.ToString() + " hrs";
        }
    }

    public double TotalHoursTime
    {
        get
        {
            double span = Shifts.Sum(x => x.Hours.TotalHours);
            return span;
        }
    }



    private Shift GetShift(DayOfWeek day, string strShift)
    {
        if (!Shifts.Any(x => x.Start.DayOfWeek == day && x.ShiftName.Trim() == strShift))
        {
            return null;
        }
        Shift shift = Shifts.First(x => x.Start.DayOfWeek == day && x.ShiftName.Trim() == strShift);
        return shift;
    }
}