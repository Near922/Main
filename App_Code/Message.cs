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


public class MessageManager
{
    public List<Message> Messages { get; set; }

    public MessageManager()
    {
        Messages = new List<Message>();
        LoadMessages();
    }

    public void DeleteMessages()
    {
        sqlController sqc = new sqlController();
        foreach(Message message in Messages)
        {
            if (!message.IsActive)
            {
                sqc.UpdateMessageToInactive(message);
            }
        }
        sqc = null;
        LoadMessages();
    }

    private void LoadMessages()
    {
        sqlController sqc = new sqlController();
        var results = sqc.GetMessages();
        Messages.Clear();
        foreach(DataRow row in results.Rows)
        {
            Message message = new Message(row["name"].ToString(), row["email_address"].ToString(), row["message"].ToString());
            message.IsActive = (int)row["isactive"] == 1;
            message.SentDate = (DateTime)row["sentdate"];
            message.ID = (int)row["id"];
            Messages.Add(message);
        }
    }
}
