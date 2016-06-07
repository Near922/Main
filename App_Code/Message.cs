using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Message
/// </summary>
public class Message
{
    public int ID { get; set; }
    public string Name { get; set; }
    public string EmailAddress { get; set; }
    public string MessageBody { get; set; }
    public DateTime SentDate { get; set; }
    public bool IsActive { get; set; }

    public Message(string name, string email, string message)
    {
        Name = name;
        EmailAddress = email;
        MessageBody = message;
        IsActive = true;
    }

    public void Save()
    {
        SentDate = DateTime.Now;
        sqlController sqc = new sqlController();
        sqc.InsertMessage(this);
        sqc = null;
    }
}

public enum TogglePage
{
    Previous,
    Next
}



public class MessageManager
{
    private List<Message> Messages { get; set; }
    public int TotalMessages
    {
        get
        {
            if (Messages.Count == 0)
            {
                LoadMessages();
            }
            return Messages.Count;
        }
    }
    private List<List<Message>> _pagedMessages;

    public int[] PagesArray { get; set; }

    private int _currentPageIndex = 0;

    public List<Message> CurrentPage
    {
        get
        {
            if (Messages.Count == 0)
            {
                LoadMessages();
            }

            _pagedMessages[_currentPageIndex].Reverse();
            return _pagedMessages[_currentPageIndex];
        }
    }

    public void ChangePage(int page)
    {
        _currentPageIndex = (page - 1);
    }

    public void TogglePage(TogglePage toggle)
    {
        if (toggle == global::TogglePage.Previous)
        {
            if ((_currentPageIndex - 1) >= 0)
            {
                _currentPageIndex -= 1;
            }
        }
        else if ((_currentPageIndex + 1) < _pagedMessages.Count)
        {
            _currentPageIndex += 1;
        }
    }

    //public List<List<Message>> PagedMessages
    //{
    //    get
    //    {
    //        if (Messages.Count == 0)
    //        {
    //            LoadMessages();
    //        }
    //        SetNumberOfPages();
    //        LoadPages();
    //        return _pagedMessages;
    //    }      
    //}

    public MessageManager()
    {
        Messages = new List<Message>();
        LoadMessages();
        MessagesPerPage = Messages.Count;
    }

    public int Pages { get; set; }

    private int _messagesPerPage;

    public int MessagesPerPage
    {
        get
        {
            return _messagesPerPage;
        }
        set
        {
            _messagesPerPage = value;
            SetNumberOfPages();
            LoadPages();
        }
    }

    public void DeleteMessages()
    {
        sqlController sqc = new sqlController();
        foreach (Message message in Messages)
        {
            if (!message.IsActive)
            {
                sqc.UpdateMessageToInactive(message);
            }

            CurrentPage.Remove(message);
        }
        sqc = null;
        LoadMessages();
    }

    private void SetNumberOfPages()
    {
        _currentPageIndex = 0;
        if (Messages.Count < _messagesPerPage)
        {
            Pages = 1;
        }
        else
        {
            Pages = (int)Math.Ceiling(((double)Messages.Count / (double)_messagesPerPage));
        }
        PagesArray = new int[Pages];
        for (int i = 1; i <= Pages; i++)
        {
            PagesArray[i - 1] = i;
        }
    }

    private void LoadMessages()
    {
        sqlController sqc = new sqlController();
        var results = sqc.GetMessages();
        Messages.Clear();
        foreach (DataRow row in results.Rows)
        {
            Message message = new Message(row["name"].ToString(), row["email_address"].ToString(), row["message"].ToString());
            message.IsActive = (int)row["isactive"] == 1;
            message.SentDate = (DateTime)row["sentdate"];
            message.ID = (int)row["id"];
            Messages.Add(message);
        }
    }

    private void LoadPages()
    {
        int currentMessage = 0;
        _pagedMessages = new List<List<Message>>();
        for (int i = 0; i <= Pages; i++)
        {
            var page = new List<Message>();

            for (int y = 0;  y <= _messagesPerPage - 1; y++)
            {
                if (currentMessage < Messages.Count)
                {
                    page.Add(Messages[currentMessage]);
                    currentMessage += 1;
                }
            }
            _pagedMessages.Add(page);
        }
    }
}
