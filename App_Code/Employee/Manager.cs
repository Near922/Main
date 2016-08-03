using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Manager
/// </summary>
/// 
[Serializable]
public class Manager : Employee
{
    public Manager(string name) : base (name)
    {

    }

    public List<Employee> Employees { get; set; }
}