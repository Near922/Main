﻿using System;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected bool Validate(string userid, string password)
    {
        sqlController sqC = new sqlController();
        DataTable dt = sqC.GetCredentials(userid);

        if (dt.Rows.Count > 0)
        {
            string passwordHash = dt.Rows[0]["password"].ToString();
            string userPassword = Hash.EncodePasswordToBase64(password.TrimStart().TrimEnd());
            if (dt.Rows[0]["userid"].ToString().Trim() == userid && passwordHash == userPassword)
            {
                User user = new User();
                user.ID = (int)dt.Rows[0]["id"];
                user.UserID = dt.Rows[0]["userid"].ToString().Trim();
                user.Name = dt.Rows[0]["name"].ToString().Trim();
                user.IsAdmin = (int)dt.Rows[0]["isadmin"] == 1;
                Session["User"] = user;
                return true;
            }
            else
            {
                return false;
            }
        }

        else
        {
            return false;
        }

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        txtPassword.BorderStyle = BorderStyle.Solid;
        txtPassword.BorderColor = System.Drawing.Color.Empty;
        txtUserID.BorderStyle = BorderStyle.Solid;
        txtUserID.BorderColor = System.Drawing.Color.Empty;

        if (string.IsNullOrEmpty(txtUserID.Text) || string.IsNullOrEmpty(txtPassword.Text))
        {
            if (string.IsNullOrEmpty(txtPassword.Text))
            {
                txtPassword.BorderStyle = BorderStyle.Dotted;

                txtPassword.BorderColor = System.Drawing.Color.Red;
            }

            if (string.IsNullOrEmpty(txtUserID.Text))
            {
                txtUserID.BorderStyle = BorderStyle.Dotted;

                txtUserID.BorderColor = System.Drawing.Color.Red;
            }
            return;
        }

        if (Validate(txtUserID.Text, txtPassword.Text))
        {
            
            FormsAuthentication.RedirectFromLoginPage(txtUserID.Text, false);
            Response.Redirect("~/Sales_App/PointOfSaleMain.aspx");
        }
        else
        {
            lblError.Text = "*The user ID or password is incorrect.";
        }
    }
    protected void txtUserID_Click(object sender, EventArgs e)
    {
        txtUserID.Text = "";
    }
}