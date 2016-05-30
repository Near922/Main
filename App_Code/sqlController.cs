using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for sqlController
/// </summary>
public class sqlController : IDisposable
{
    //private SqlConnection conn;
    private SqlDataAdapter da;
    private DataTable dt;
    private SqlCommand comm;
    private string connString = ConfigurationManager.ConnectionStrings["RestaurantConnectionString"].ConnectionString;

    public sqlController()
	{
		//
		// TODO: Add constructor logic here
		//
        //conn = new SqlConnection(@"Data Source=Jim-PC;Initial Catalog=Restaurant;Integrated Security=True");
	}

    public int GetWebSiteCount()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select count(ID) from tblWebsiteVisits", conn);
                conn.Open();
                int count = (int)da.SelectCommand.ExecuteScalar();
                return count;
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public void InsertVisit(HitCounter counter)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("Insert into tblWebsiteVisits VALUES(@IPAddress, @VisitDate)", conn);
                comm.Parameters.AddWithValue("@IPAddress", counter.IPAddress);
                comm.Parameters.AddWithValue("@VisitDate", counter.VisitDate);
                conn.Open();
                comm.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    public int insertOrders(Order order)
    {
        int modified;
        try
        {
            
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("Insert into Orders OUTPUT INSERTED.ID VALUES(@ProductID, @EmployeeID, @Status, @timestamp, @TableNum, @BillID)", conn);
                comm.Parameters.AddWithValue("@ProductID", order.ProductID);
                comm.Parameters.AddWithValue("@EmployeeID", order.ServerID);
                comm.Parameters.AddWithValue("@Status", (int)order.Status);
                comm.Parameters.AddWithValue("@Timestamp", DateTime.Now);
                comm.Parameters.AddWithValue("@TableNum", order.TableNumber);
                comm.Parameters.AddWithValue("@BillID", order.BillID);
                conn.Open();
                modified = (int)comm.ExecuteScalar();
                conn.Close();
            }
            return modified;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public void updateOrder(Order order)
    {
        try
        { 
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("Update Orders set status = @Status where id = @id", conn);
                comm.Parameters.AddWithValue("@Status", order.Status);
                comm.Parameters.AddWithValue("@id", order.ID);
                conn.Open();
                comm.ExecuteNonQuery();
                //conn.Close();
            }
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
        }

    }

    public void DeleteOrder(Order order)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("delete from Orders where id = @id", conn);
                comm.Parameters.AddWithValue("@id", order.ID);
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }

    }

    public int insertTable(Table table)
    {
        int modified;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {

                comm = new SqlCommand("Insert into tblTables OUTPUT INSERTED.ID VALUES(@TableNumber, @Status, @ServerID, @timestamp, @guests)", conn);
                comm.Parameters.AddWithValue("@TableNumber", table.TableNumber);
                comm.Parameters.AddWithValue("@Status", (int)table.Status);
                comm.Parameters.AddWithValue("@ServerID", table.ServerID);
                comm.Parameters.AddWithValue("@Timestamp", DateTime.Now);
                comm.Parameters.AddWithValue("@guests", table.Guests);
                conn.Open();
                modified = (int)comm.ExecuteScalar();
                conn.Close();
            }
            return modified;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public int insertBill(Bill bill)
    {
        int modified;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("Insert into Bill OUTPUT INSERTED.ID VALUES(@CheckNum, @OrderID, @TableNumber, @Amount, @Payment)", conn);
                comm.Parameters.AddWithValue("@CheckNum", bill.CheckNum); //bill.CheckNum
                comm.Parameters.AddWithValue("@TableNumber", bill.TableID);
                comm.Parameters.AddWithValue("@OrderID", 0); //may remove orderid
                comm.Parameters.AddWithValue("@Amount", bill.FinalTotal);
                comm.Parameters.AddWithValue("@Payment", bill.Payment);
                conn.Open();
                modified = (int)comm.ExecuteScalar();
                conn.Close();
            }
            return modified;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public DataTable getOpenTables(Employee employee)
    {
        try
        {
            string sql;

            if (employee is Server)
            {
                sql = "select distinct id, TableNumber, NumGuests from tblTables where serverid = @serverid and tblTables.status = 0";
            }
            else if (employee is Manager)
            {
               sql = "select distinct id, TableNumber, NumGuests from tblTables where tblTables.status = 0";
            }
            else
            {
                sql = "";
            }


            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter(sql, conn);
                if (employee is Server)
                {
                    da.SelectCommand.Parameters.AddWithValue("@serverid", employee.ID);
                }
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;

    }

    public bool IsTableAvailable(string tableNumer)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select count(TableNumber) from tblTables where TableNumber = @tableNumber and tblTables.status = 0", conn);
                da.SelectCommand.Parameters.AddWithValue("@tableNumber", tableNumer);
                conn.Open();
                int count = (int)da.SelectCommand.ExecuteScalar();
                if ( count >= 1)
                {
                    return false;
                }
                else
                {
                    return true;
                }

            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return false;
        }
        

    }

    public DataTable GetCredentials(string userid)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select id, userid, password, isadmin, name from login where userid = @userid", conn);
                da.SelectCommand.Parameters.AddWithValue("@userid", userid);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;

    }

    public void CloseTable(Table table)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("update tblTables set status = 1 where id = @id", conn);
                comm.Parameters.AddWithValue("@id", table.ID);
                conn.Open();
                comm.ExecuteNonQuery();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    public int getBillCount(Table table)
    {
        int bills;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                //da = new SqlDataAdapter("select count( distinct billid) from tblTables inner join Orders on tblTables.ID = Orders.TableNumber inner join Product on Orders.ProductID = Product.id where tbltables.id = @tableid and tblTables.status = 0", conn);
                da = new SqlDataAdapter("select count( distinct id) from bill where tablenumber = @tableid", conn);
                da.SelectCommand.Parameters.AddWithValue("@tableid", table.ID);
                conn.Open();
                bills = (int)da.SelectCommand.ExecuteScalar();
            }
            return bills - 1;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }

    }

    public DataTable getBills(Table table)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select * from Bill where tablenumber = @tableid", conn);
                da.SelectCommand.Parameters.AddWithValue("@tableid", table.ID);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;

    }

    public void updateBill(Bill bill)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("UPDATE Bill set amount = @amount, payment = @payment where id = @BillID", conn);
                comm.Parameters.AddWithValue("@amount", bill.FinalTotal);
                comm.Parameters.AddWithValue("@payment", bill.Payment);
                comm.Parameters.AddWithValue("@BillID", bill.ID);
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }

    }

    public void updateOrderBillID(Order order)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("UPDATE Orders set billid = @Billid where id = @ID", conn);
                comm.Parameters.AddWithValue("@ID", order.ID);
                comm.Parameters.AddWithValue("@BillID", order.BillID);
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }

    }
    public DataTable getOpenTableOrders(Server server)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select Orders.TableNumber, Orders.ID as 'OrderID', ProductID, Orders.Status, price, Name, checknum, tblTables.TableNumber as 'TableNum' from tblTables inner join Orders on tblTables.ID = Orders.TableNumber inner join Bill on orders.BillID = Bill.ID inner join Product on Orders.ProductID = Product.id where serverid = @serverid and tblTables.status = 0", conn);
                da.SelectCommand.Parameters.AddWithValue("@serverid", server.ID);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;

    }

    public DataTable GetTotals(Server server)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select sum(case type when 1 then Price else 0  end) as 'Beverage', sum(case type when 2 then Price else 0  end) as 'Soup'," +
                "sum(case type when 3 then Price else 0  end) as 'Appetizer',   sum(case type when 4 then Price else 0  end) as 'Salad',  sum(case type when 5 then Price  else 0 end) as 'Sandwich'," +
                "sum(case type when 6 then Price else 0  end) as 'Entree', sum(case type when 7 then Price else 0  end) as 'Beer', sum(case type when 8 then Price else 0  end) as 'Wine', " +
                "sum(case type when 9 then Price else 0  end) as 'Dessert' from Product inner join Orders o on o.ProductID = Product.id where Timestamp >= CAST(GETDATE() AS DATE) and EmployeeID = @ID", conn);
                da.SelectCommand.Parameters.AddWithValue("ID", server.ID);
                dt = new DataTable();
                da.Fill(dt);

            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public void updateOrderStatus(Order order)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("Update Orders set status = @Status where id = @OrderID", conn);
                comm.Parameters.AddWithValue("@ProductID", order.ID);
                comm.Parameters.AddWithValue("@Status", order.Status);
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();

            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    public DataTable getBeverages()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '1'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getSoup()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '2'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getApps()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '3'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getSalads()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '4'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getSandwichs()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '5'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getEntree()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '6'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getBeer()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '7'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getWine()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '8'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable getDesserts()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select distinct id, name, price from product where type = '9'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public void InsertMessage(Message message)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("Insert into tblMessages VALUES(@Name, @Email, @Message, @IsActive, @SentDate)", conn);
                comm.Parameters.AddWithValue("@Name", message.Name); 
                comm.Parameters.AddWithValue("@Email", message.EmailAddress);
                comm.Parameters.AddWithValue("@Message", message.MessageBody);
                comm.Parameters.AddWithValue("@IsActive", message.IsActive);
                comm.Parameters.AddWithValue("@SentDate", message.SentDate);
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    public void UpdateMessageToInactive(Message message)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("Update tblMessages set isactive = 0 where id = @Id ", conn);
                comm.Parameters.AddWithValue("@Id", message.ID);
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
    }

    public DataTable GetMessages()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select * from tblMessages where isactive = '1'", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable GetShifts(List<SqlParameter> sqlParams)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string Query = "Select ID, Name, Start_Time, End_Time, Job, Shift FROM tblSchedule Where Start_Time between @Start and @End Order By Name";
                da = new SqlDataAdapter(Query, conn);
                foreach (SqlParameter p in sqlParams)
                {
                    da.SelectCommand.Parameters.Add(p);
                }
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch(Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public int Check_Shift(string name, DateTime shift, string strshift)
    {
        int shifts;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select Count(Start_Time) Job FROM tblSchedule Where Name = @Name AND DATEADD(day, DATEDIFF(day, 0, Start_Time), 0) = DATEADD(day, DATEDIFF(day, 0, @shift), 0) AND SHIFT = @STRSHIFT", conn);
                da.SelectCommand.Parameters.AddWithValue("@Name", name);
                da.SelectCommand.Parameters.AddWithValue("@shift", shift);
                da.SelectCommand.Parameters.AddWithValue("@strshift", strshift);
                conn.Open();
                shifts = (int)da.SelectCommand.ExecuteScalar();
            }
            return shifts;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }

    }

    public DataTable GetHours(List<SqlParameter> sqlParams)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string mSQL = "select Sum(DATEDIFF(hh, Start_Time, end_time)), Sum(DATEDIFF(mi,DATEADD(hh,DATEDIFF(hh, Start_Time, end_time),Start_Time),end_time))";
                mSQL += " from tblschedule where shift = @Shift and name = @Name and Start_Time between @date1 and @date2";
                da = new SqlDataAdapter(mSQL, conn);
                foreach( SqlParameter p in sqlParams)
                {
                    da.SelectCommand.Parameters.Add(p);
                }
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public int GetShiftCount(List<SqlParameter> sqlParams)
    {
        int shifts;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("select count(start_time) from tblschedule where name = @Name and shift = @Shift and Start_Time between @date1 and @date2", conn);
                foreach (SqlParameter p in sqlParams)
                {
                    da.SelectCommand.Parameters.Add(p);
                }
                conn.Open();
                shifts = (int)da.SelectCommand.ExecuteScalar();
            }
            return shifts;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }

    }

    public int InsertShift(Shift shift)
    {
        int modified;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("INSERT INTO tblSCHEDULE(NAME, JOB, POST_DATE, START_TIME, END_TIME, SHIFT) VALUES(@NAME, @JOB, @POST_DATE, @START_TIME, @END_TIME, @SHIFT)", conn);
                comm.Parameters.AddWithValue("@NAME", shift.Name);
                comm.Parameters.AddWithValue("@JOB", shift.Job);
                comm.Parameters.AddWithValue("@POST_DATE", shift.PostDate);
                comm.Parameters.AddWithValue("@START_TIME", shift.Start);
                comm.Parameters.AddWithValue("@END_TIME", shift.End);
                comm.Parameters.AddWithValue("@SHIFT", shift.ShiftName);

                conn.Open();
                modified = (int)comm.ExecuteNonQuery();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            modified = 0;
        }
        return modified;
    }

    public DataTable GetScheduleNames()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select Distinct Name, Job FROM Name", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public int DeleteShift(Shift shift)
    {
        int shifts;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("DELETE FROM tblSCHEDULE  WHERE NAME = @NAME AND JOB = @JOB AND START_TIME = @START_TIME AND SHIFT = @SHIFT", conn);
                comm.Parameters.AddWithValue("@NAME", shift.Name);
                comm.Parameters.AddWithValue("@JOB", shift.Job);
                comm.Parameters.AddWithValue("@START_TIME", shift.Start);
                comm.Parameters.AddWithValue("@SHIFT", shift.ShiftName);
                conn.Open();
                shifts = (int)comm.ExecuteNonQuery();
                conn.Close();
            }
            return shifts;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }

    }

    public DataTable GetNamesInJob(string job)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select Distinct Name FROM Name WHERE Job IN (@Job)", conn);
                da.SelectCommand.Parameters.AddWithValue("@Job", job);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable GetJob(string name)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select top 1 Job FROM Name WHERE Name = @Name", conn);
                da.SelectCommand.Parameters.AddWithValue("@Name", name);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public void Dispose()
    {
        throw new NotImplementedException();
    }

    public int InsertServer(Server server, DateTime date)
    {
        int success;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("INSERT INTO tblServer(Name, Section, Sales, Cash, ChargeTips, TotalOwed, BarTipout, TipsClaimed, Shift, Date, BWTipout, PostDate) VALUES(@Name, @Section, @Sales, @Cash, @ChargeTips, @TotalOwed, @BarTipout, @TipsClaimed, @Shift, @Date, @BWTipout, @PostDate)", conn);
                comm.Parameters.AddWithValue("@Name", server.Name);
                comm.Parameters.AddWithValue("@Section", server.Section);
                comm.Parameters.AddWithValue("@Sales", server.Sales);
                comm.Parameters.AddWithValue("@Cash", server.Cash);
                comm.Parameters.AddWithValue("@TotalOwed", server.CashToHouse);
                comm.Parameters.AddWithValue("@ChargeTips", server.ChargeTips);
                comm.Parameters.AddWithValue("@BarTipout", server.BarTipOut);
                comm.Parameters.AddWithValue("@TipsClaimed", server.Tips);
                comm.Parameters.AddWithValue("@Shift", server.Shift);
                comm.Parameters.AddWithValue("@Date", (date));
                comm.Parameters.AddWithValue("@BWTipout", server.TipOut);
                comm.Parameters.AddWithValue("@PostDate", (DateTime.Now));
                conn.Open();
                success = comm.ExecuteNonQuery();
                conn.Close();
            }

            return success;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public int InsertBackWait(Backwaiter backwait, DateTime date)
    {
        int success;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("INSERT INTO tblBackwait(Name, Hours, Shift, Date, PostDate) VALUES(@Name, @Hours, @Shift, @Date, @PostDate)", conn);
                comm.Parameters.AddWithValue("@Name", backwait.Name);
                comm.Parameters.AddWithValue("@Hours", backwait.Hours);
                comm.Parameters.AddWithValue("@Shift", backwait.Shift);
                comm.Parameters.AddWithValue("@Date", date);
                comm.Parameters.AddWithValue("@PostDate", (DateTime.Now));
                conn.Open();
                success = comm.ExecuteNonQuery();
                conn.Close();
            }

            return success;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public decimal GetBackWaitHours(string shift, DateTime date)
    {
        decimal success;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("SELECT Count(Hours) FROM tblBackwait WHERE Shift = @shift AND Date = @Date", conn);
                comm.Parameters.AddWithValue("@shift", shift);
                comm.Parameters.AddWithValue("@Date", date);
                conn.Open();
                success = (decimal)comm.ExecuteScalar();
                conn.Close();
            }

            return success;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public decimal GetBackWaitHoursSum(string shift, DateTime date)
    {
        decimal result;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("SELECT Sum(Hours) FROM tblBackwait WHERE Shift = @shift AND Date = @Date", conn);
                comm.Parameters.AddWithValue("@shift", shift);
                comm.Parameters.AddWithValue("@Date", date);
                conn.Open();
                result = Convert.ToDecimal(comm.ExecuteScalar());
                conn.Close();
            }

            return result;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0.00M;
        }
    }


    public int UpdateBackWaitTips(string shift, decimal tips, DateTime date)
    {
        int result;
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                comm = new SqlCommand("UPDATE tblBackwait SET Tips=@Tips WHERE Shift = @shift AND Date = @Date", conn);
                comm.Parameters.AddWithValue("@shift", shift);
                comm.Parameters.AddWithValue("@Tips", tips);
                comm.Parameters.AddWithValue("@Date", date);
                conn.Open();
                result = (int)comm.ExecuteNonQuery();
                conn.Close();
            }

            return result;
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
            return 0;
        }
    }

    public DataTable GetServerData(string shift, DateTime date)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                //da = new SqlDataAdapter("SELECT Name, Section, Sales, Cash, TotalOwed, ChargeTips, BWTipout, BarTipout, TipsClaimed, Shift FROM tblServer Where Shift = @Shift AND (DATEADD(day, DATEDIFF(day, 0, Date), 0) = DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0))", conn);
                da = new SqlDataAdapter("SELECT Name, Section, Sales, Cash, TotalOwed, ChargeTips, BWTipout, BarTipout, TipsClaimed, Shift, Date FROM tblServer Where Shift = @Shift AND Date = @Date", conn);
                da.SelectCommand.Parameters.AddWithValue("@Shift", shift);
                da.SelectCommand.Parameters.AddWithValue("@Date", date);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }


    public DataTable GetBackwaitData(string shift, DateTime date)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("SELECT Name, Hours, Shift, (Tips * Hours) AS Tips, Date FROM tblBackwait WHERE Shift = @Shift AND Date = @Date", conn);
                da.SelectCommand.Parameters.AddWithValue("@Shift", shift);
                da.SelectCommand.Parameters.AddWithValue("@Date", date);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }

    public DataTable GetServingStaff()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                da = new SqlDataAdapter("Select Distinct Name FROM Name WHERE Job IN ('Server', 'Bartender', 'ToGo')", conn);
                dt = new DataTable();
                da.Fill(dt);
            }
        }
        catch (Exception ex)
        {
            Logger.Log(ex);
        }
        return dt;
    }
}