using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for HitCountHelper
/// </summary>
/// 
[Serializable]
public class HitCounter
{
    public HitCounter()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private int count = 0;

    public string IPAddress { get; set; }

    public DateTime VisitDate { get; set; }

    public void AddCount()
    {
        sqlController sqc = new sqlController();
        sqc.InsertVisit(this);
        sqc = null;
    }

    public int Count
    {
        get
        {
            sqlController sqc = new sqlController();
            int sqlCount = sqc.GetWebSiteCount();
            if ( sqlCount > count)
            {
                count = sqlCount;
            }
            sqc = null;
            return count;

        }
    }
}