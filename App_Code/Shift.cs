using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Shift
/// </summary>
/// 
[Serializable]
public class Shift
{
    public DateTime Start { get; set; }
    public DateTime End { get; set; }
    public int ID { get; set; }
    public string ShiftName { get; set; }
    public string Name { get; set; }
    public string Job { get; set; }
    public DateTime PostDate { get; set; }
    public DateTime ShiftLength { get; set; }
    public TimeSpan Hours
    {
        get
        {
            return End.Subtract(Start);
        }
    }
	public Shift()
	{
	}

    public string ShiftString
    {
        get
        {
            return String.Format("{0:t}", this.Start) + "-" + "<br />" + String.Format("{0:t}", this.End) + "<br />" + this.Job;
        }
    }

}