using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Logger
/// </summary>
public class Logger
{
    public Logger()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void Log(Exception ex)
    {
        //using (StreamWriter writer = new StreamWriter(@"C:\Temp\error_log.txt", true))
        //{
          //  writer.WriteLine(string.Format("{0} - {1} - {2}", DateTime.Now, ex.Message, ex.StackTrace));
        //}
    }
}