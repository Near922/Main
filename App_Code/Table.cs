using System;
using System.Collections.Generic;
using System.Linq;

/// <summary>
/// Summary description for Table
/// </summary>

[Serializable]
public class Table
{
    private int id;
    private int numberGuests = 0;
    private int tableNumber;
    private int employee_id;
    private List<Bill> bills;
    sqlController sqC;


    public Table(int numberGuests, int tableNumber, int employee, bool existing)
    {
        this.numberGuests = numberGuests;
        this.tableNumber = tableNumber;
        Status = TableStatus.Open;
        this.employee_id = employee;
        sqC = new sqlController();
        bills = new List<Bill>();
        if (!existing)
        {
            Save();
        }
        AddNewList();

        if (!existing)
        {
            bills[0].SaveBill();
        }
    }

    public TableStatus Status { get; set; }

    public int ID
    {
        get
        {
            return id;
        }
        set
        {
            id = value;
        }
    }

    public int Guests
    {
        get
        {
            return numberGuests;
        }
    }

    public int ServerID
    {
        get
        {
            return employee_id;
        }
    }

    public int BillCount
    {

        get
        {
            return bills.Count();
        }
    }

    public int TableNumber
    {
        get
        {
            return tableNumber;
        }

    }

    public void AddNewList()
    {
        bills.Add(new Bill(id, bills.Count));
    }

   public void PlaceOrder(Order order, int i)
    {
        try
        {
            order.BillID = bills[i].ID;
            bills[i].AddOrder(order);
            bills[i].CalculateTotal();
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
        }
    }

    public Bill tableBill(int i)
    {
  
       return this.bills[i];

    }

    public List<Bill> GetBills()
    {
        return bills;
    }

    public void Close()
    {
       sqC.CloseTable(this);
    }

    public void Save()
    {
        this.ID = sqC.insertTable(this);
    }
}