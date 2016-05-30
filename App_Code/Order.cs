public class Order
{
    private int id;
    private string name;
    private decimal price;
    private int product_id;
    private int tableNum;
    private int employee_id;
    private int bill_id;
    sqlController sqC;

    public Order(int prod_id, string name, decimal price, int table_number)
    {
        this.product_id = prod_id;
        this.name = name;
        this.price = price;
        Status = OrderStatus.UnOrdered;
        this.tableNum = table_number;
        //this.employee_id = employee_id;
        sqC = new sqlController();
    }

    public OrderStatus Status { get; set; }

    public int ServerID
    {
        get
        {
            return employee_id;
        }

        set
        {
            employee_id = value;
        }
    }

    public int TableNumber
    {
        get
        {
            return tableNum;
        }
    }

    public int ProductID
    {
        get
        {
            return product_id;
        }
    }

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

    public int BillID
    {
        get
        {
            return bill_id;
        }
        set
        {
            bill_id = value;
        }
    }

    public string GetName
    {
        get
        {
            return name;
        }
    }


    public decimal GetPrice
    {
        get
        {
            return price;
        }
    }

    public void Delete()
    {
        sqC.DeleteOrder(this);
    }

    public void UpdateOrderToOrdered()
    {
        Status = OrderStatus.Ordered;
        sqC.updateOrder(this);
    }

    public void SendOrder()
    {

        if (this.Status == OrderStatus.UnOrdered)
        {
            this.Status = OrderStatus.Ordered;
            this.id = sqC.insertOrders(this);
            
        }
        else if(this.Status == OrderStatus.OnHold)
        {
            this.ID = sqC.insertOrders(this);
        }
        sqC = null;

    }
}