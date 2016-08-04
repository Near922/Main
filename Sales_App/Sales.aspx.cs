using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Sales_App_Sales : System.Web.UI.Page
{
    Server server;
    sqlController SQC;

    private decimal Sum(DataTable dt)
    {
        decimal sum = 0.00M;
        foreach(DataRow r in dt.Rows)
        {
            foreach (DataColumn c in dt.Columns)
            {
                if (r[c] != null && r[c].ToString() != "")
                {
                    sum += (decimal)r[c];
                }
            }
        }
        return sum;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null || !Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/login.aspx");
        }
        //Response.Cache.SetExpires(DateTime.Now);
        //Response.Cache.SetValidUntilExpires(false);
        //Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //Response.Cache.SetNoStore();
        server = (Server)Session["Employee"];
        SQC = new sqlController();
        DataTable dt = SQC.GetTotals(server);
        if (dt != null)
        {
            if (dt.Rows[0]["Appetizer"].ToString() != "")
            {
                lblAppTotal.Text = String.Format("{0:C}", dt.Rows[0]["Appetizer"]);
            }
            if (dt.Rows[0]["Soup"].ToString() != "")
            {
                lblSoupTotal.Text = String.Format("{0:C}", dt.Rows[0]["Soup"]);
            }
            if (dt.Rows[0]["Beverage"].ToString() != "")
            {
                lblBeverageTotal.Text = String.Format("{0:C}", dt.Rows[0]["Beverage"]);
            }
            if (dt.Rows[0]["Sandwich"].ToString() != "")
            {
                lblSandwichTotal.Text = String.Format("{0:C}", dt.Rows[0]["Sandwich"]);
            }
            if (dt.Rows[0]["Salad"].ToString() != "")
            {
                lblSaladTotal.Text = String.Format("{0:C}", dt.Rows[0]["Salad"]);
            }
            if (dt.Rows[0]["Entree"].ToString() != "")
            {
                lblEntreeTotal.Text = String.Format("{0:C}", dt.Rows[0]["Entree"]);
            }
            if (dt.Rows[0]["Beer"].ToString() != "")
            {
                lblBeerTotal.Text = String.Format("{0:C}", dt.Rows[0]["Beer"]);
            }
            if (dt.Rows[0]["Wine"].ToString() != "")
            {
                lblWineTotal.Text = String.Format("{0:C}", dt.Rows[0]["Wine"]);
            }

            if (dt.Rows[0]["Dessert"].ToString() != "")
            {
                lblDessertTotal.Text = String.Format("{0:C}", dt.Rows[0]["Dessert"]);
            }

            lblSalesTotal.Text = String.Format("{0:C}", Sum(dt));
        }

    }
}