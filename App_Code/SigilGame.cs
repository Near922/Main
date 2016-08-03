using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Xml;
using System.Xml.Linq;

/// <summary>
/// Summary description for SigilGame
/// </summary>

[Serializable]
public class SigilGame
{
    public SigilGame()
    {
        CurrentSigils = new List<Sigil>();
        Sigils = new List<Sigil>();
        _usedSigils = new List<Sigil>();
        LoadSigils();
        _correctAnswers = 0;
        _totalRounds = 20;
        GameActive = true;
        CreateNextSetOfSigils();

    }

    private List<Sigil> _usedSigils;

    private int _numberOfRounds;

    private int _totalRounds;

    private int _correctAnswers;

    public bool GameActive;

    public List<Sigil> Sigils { get; private set; }

    public List<Sigil> CurrentSigils { get; private set; }

    public Sigil CurrentSigil { get; private set; }

    public int Score
    {
        get
        {
            return (int)Math.Round(( (decimal)_correctAnswers / (decimal)_totalRounds) * 100.00M);
        }
    }

    public bool SelectSigil(Sigil sigil)
    {
        bool isCorrect = IsCorrectSigil(sigil);
        if (isCorrect)
        {
            _correctAnswers += 1;
        }
        NextRound();
        return isCorrect;
    }

    private void NextRound()
    {
        _numberOfRounds += 1;
        _usedSigils.Add(CurrentSigil);
        CurrentSigils.Clear();
        CreateNextSetOfSigils();
        if (_numberOfRounds >= _totalRounds)
        {
            GameActive = false;
        }
    }

    private void CreateNextSetOfSigils()
    {
        List<Sigil> s = Sigils.Where(x => !_usedSigils.Contains(x) && !CurrentSigils.Contains(x)).ToList();
        CurrentSigil = s.OrderBy(x => Guid.NewGuid()).First();
        CurrentSigils.Add(CurrentSigil);
        _usedSigils.Add(CurrentSigil);
        for(int i = 0; i < 3; i++)
        {
            List<Sigil> sigils = Sigils.Where(x => !CurrentSigils.Contains(x)).ToList();
            CurrentSigils.Add(sigils[new Random().Next(sigils.Count)]);
        }

        CurrentSigils = CurrentSigils.OrderBy(x => Guid.NewGuid()).ToList(); ;
    }

    private bool IsCorrectSigil(Sigil sigil)

    {
        return sigil == CurrentSigil;
    }

    private void LoadSigils()
    {
        var path = HttpContext.Current.Server.MapPath("~/Sigils.xml");
        var doc = XDocument.Load(path).Element("sigils");
        var sigils = doc.Descendants("sigil").Select( x => new Sigil() { House = x.Element("house").Value.Trim(), ID = int.Parse(x.Element("id").Value.Trim()), Src = x.Element("src").Value.Trim() } );
        foreach (var sigil in sigils)
        {
           Sigils.Add(sigil);
        }

    }
}