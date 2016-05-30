using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SigilQuiz : System.Web.UI.Page
{
    private SigilGame _game;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session.Remove("Game");
            _game = new SigilGame();
            Session["Game"] = _game;
            SetImages();
        }
        else
        {
            _game = (SigilGame)Session["Game"];
        }
    }

    private void SetImages()
    {
        _game = (SigilGame)Session["Game"];
        lblHouse.Text = _game.CurrentSigil.House;
        sigil1.ImageUrl = _game.CurrentSigils[0].Src;
        sigil2.ImageUrl = _game.CurrentSigils[1].Src;
        sigil3.ImageUrl = _game.CurrentSigils[2].Src;
        sigil4.ImageUrl = _game.CurrentSigils[3].Src;
    }

    protected void sigil1_Click(object sender, ImageClickEventArgs e)
    {
        SelectSigil(0);

    }

    protected void sigil2_Click(object sender, ImageClickEventArgs e)
    {
        SelectSigil(1);
    }

    protected void sigil3_Click(object sender, ImageClickEventArgs e)
    {
        SelectSigil(2);
    }

    protected void sigil4_Click(object sender, ImageClickEventArgs e)
    {
        SelectSigil(3);
    }

    private void SelectSigil(int index)
    {
        try {
            _game = (SigilGame)Session["Game"];
            bool isCorrect = _game.SelectSigil(_game.CurrentSigils[index]);
            Session["Game"] = _game;
            if (isCorrect)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccessMessage", "showSuccessMessage();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showErrorMessage", "showErrorMessage();", true);
            }

            if (_game.GameActive)
            {
                SetImages();
            }
            else
            {
                lblScore.Text = _game.Score.ToString() + "%";
                if (_game.Score > 90)
                {
                    lblScore.ForeColor = System.Drawing.Color.LimeGreen;
                }

                if (_game.Score < 65)
                {
                    lblScore.ForeColor = System.Drawing.Color.Red;
                }
                mpe.Show();
            }
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
        }
    }

    protected void btnRestart_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SigilQuiz.aspx");
    }


    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }
}