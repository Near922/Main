using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Employee
/// </summary>
/// 
[Serializable]
public abstract class BaseEmployee
{
    public string ID { get; set; }
    public string Name { get; set; }
    public string Shift { get; set; }
    public DateTime ShiftDate { get; set; }
    public string Title { get; set; }
    public decimal Hours { get; set; }
    public List<Shift> Shifts { get; set; }
    public Schedule Schedule { get; set; }
	public BaseEmployee()
	{
        Shifts = new List<Shift>();
        Schedule = new Schedule();
		//
		// TODO: Add constructor logic here
		//
	}
}