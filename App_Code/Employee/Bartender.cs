using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Bartender
/// </summary>
///
[Serializable]
public class Bartender : Server
{
    public Bartender(string name, int number) : base(name,  number)
    {
    }
}