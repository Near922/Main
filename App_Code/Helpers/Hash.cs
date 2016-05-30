using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Hash
/// </summary>
public class Hash
{
    public Hash()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static string EncodePasswordToBase64(string password)
    {
        byte[] bytes = Encoding.Unicode.GetBytes(password);
        byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
        return Convert.ToBase64String(inArray);
    }
}