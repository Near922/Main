using System;
using System.Collections.Generic;
/// <summary>
/// Summary description for Server
/// </summary>
/// 
[Serializable]
public class Server : Employee
{
    public decimal Sales { get; set; }
    public decimal Tips { get; set; }
    public decimal TipOut { get; set; }
    public decimal Cash { get; set; }
    public string Section { get; set; }
    public decimal CashToHouse { get; set; }
    public decimal BarTipOut { get; set; }
    public decimal ChargeTips { get; set; }
    public List<Table> Tables { get; set; }

    public Server(string name, int number)
    {
        this.Name = name;
        this.ID = number.ToString();
        Tables = new List<Table>();

    }

    public Server(string name)
    {
        this.Name = name;
        Tables = new List<Table>();
    }

    public void EnterNewTable(int number, int guests)
    {
        Table table = new Table(guests, number, Int32.Parse(ID), false);
        Tables.Add(table);
    }

    public void EnterExistingTable(int number, int guests)
    {
        Table table = new Table(guests, number, Int32.Parse(ID), true);
        Tables.Add(table);
    }

    public void CloseTable(Table table)
    {
        table.Close();
        table = null;
    }

    public Table getTable(int tablenumber)
    {
        foreach (Table table in Tables)
        {
            if (table.TableNumber == tablenumber)
            {
                return table;
            }
        }

        return null;
        //return new Table(0, tablenumber, Int32.Parse(ID), false);
    }


    public void ApplyPayment(Bill bill, decimal payment)
    {
        bill.ApplyPayment(payment);
    }


    public void DeleteOrder(Order order, Table table)
    {

        if (order.Status == OrderStatus.OnHold)
        {
            order.Delete();
        }

        List<Bill> bills = table.GetBills();
        foreach (Bill bill in bills)
        {
            bill.RemoveOrder(order);
            bill.CalculateTotal();
        }
    }

    public void TakeOrder(Order order, int BillIndex)
    {
        foreach (Table table in Tables)
        {
            if (table.ID == order.TableNumber)
            {
                table.PlaceOrder(order, BillIndex);
            }
        }
    }

    public void HoldOrder(Order order)
    {

        order.Status = OrderStatus.OnHold;
        order.SendOrder();
    }

    public void SendOrder(Order order)
    {
        if (order.Status == 0)
        {
            order.SendOrder();
        }
        else if (order.Status == OrderStatus.OnHold)
        {
            order.UpdateOrderToOrdered();
        }
    }

    public void SendOrders(Table table)
    {
        foreach (Bill bill in table.GetBills())
        {
            foreach (Order o in bill.Orders)
            {
                o.SendOrder();
            }
        }
    }
}