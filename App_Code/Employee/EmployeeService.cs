using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for EmployeeService
/// </summary>
/// 
[Serializable]
public class EmployeeService
{

    public EmployeeService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static Employee GetEmployee(string name, string role)
    {
        Employee employee;
        switch (((EmployeeRoles)Enum.Parse(typeof(EmployeeRoles), role)))
        {
            case EmployeeRoles.Server:
                employee = new Server(name);
                break;
            case EmployeeRoles.Backwaiter:
                employee = new Backwaiter(name);
                break;
            case EmployeeRoles.Management:
                employee = new Manager(name);
                break;
            default:
                employee = new Employee(name);
                break;
        }
        employee.Title = role;
        return employee;
    }

    public static Employee GetSubclass(Employee employee)
    {
        if (employee is Manager)
        {
            return (Manager)employee;
        }
        else if (employee is Server)
        {
            return (Server)employee;
        }
        else if (employee is Backwaiter)
        {
            return (Backwaiter)employee;
        }
        else
        {
            return (Employee)employee;
        }
    }

    public static void LoadObjects(Employee employee, DataTable openTables)
    {
        try
        {
            sqlController sqc = new sqlController();
            
            if (employee is Server)
            {
                LoadTables((Server)employee, openTables, sqc);
                LoadOrders((Server)employee,sqc);
            }
            else if (employee is Manager)
            {
                LoadEmployees((Manager)employee, openTables, sqc);
            }
        }

        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    private static void LoadTables(Server server, DataTable openTables, sqlController sqc)
    {
        foreach (DataRow r in openTables.Rows)
        {

            server.EnterExistingTable((int)r["TableNumber"], (int)r["NumGuests"]);
            Table table = server.getTable((int)r["TableNumber"]);
            table.ID = (int)r["ID"];
            int billsCount = sqc.getBillCount(table);
            while (billsCount > 0)
            {
                table.AddNewList(true);
                billsCount -= 1;
            }

            DataTable billDT = sqc.getBills(table);
            int count = billDT.Rows.Count;
            List<Bill> bills = table.GetBills();
            foreach (Bill bill in bills)
            {
                var query = from mRow in billDT.AsEnumerable()
                            where mRow.Field<int>("CheckNum") == bill.CheckNum
                            select mRow;
                DataView njview = query.AsDataView();
                bill.ID = Int32.Parse(njview[0]["ID"].ToString());
                bill.Payment = Decimal.Parse(njview[0]["Payment"].ToString());

            }
        }
    }

    private static void LoadOrders(Server server, sqlController sqc)
    {
        DataTable orders = sqc.getOpenTableOrders(server);
        foreach (DataRow row in orders.Rows)
        {
            Order order = new Order((int)row["ProductID"], row["Name"].ToString(), (decimal)row["Price"], (int)row["TableNumber"]);
            order.ServerID = Int32.Parse(server.ID);
            order.Status = (OrderStatus)row["Status"];
            order.ID = (int)row["OrderID"];
            server.TakeOrder(order, (int)row["CheckNum"]);
        }
    }

    private static void LoadEmployees(Manager manager, DataTable openTables, sqlController sqc)
    {
        //load each employee  and tables and orders for employee
    }
}