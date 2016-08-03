using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[Serializable]
public class Employee : BaseEmployee
{
    public Employee()
    {

    }

    public Employee(string name)
    {
        this.Name = name;
    }
}