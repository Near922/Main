using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Backwaiter
/// </summary>
/// 
[Serializable]
public class Backwaiter : Employee
{
    public decimal Tips { get; set; }
	public Backwaiter(string name, string id)
	{
        Name = name;
        ID = id;
	}

    public Backwaiter(string name)
    {
        Name = name;
    }
}