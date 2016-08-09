using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Bill
/// </summary>
/// 
[Serializable]
public class Bill
{
        private decimal subTotal = 0;
        private decimal finalTotal = 0;
        private decimal taxTotal = 0;
        private const decimal tax = 0.07M;
        private int table_id;
        private int id;
        private int check_num;
        private decimal payment;
        private List<Order> orders;

        public Bill(int table_id, int check_num, bool existing, decimal payment = 0.00M)
        {
            this.table_id = table_id;
            this.payment = payment;
            this.check_num = check_num;
            orders = new List<Order>();
            if (!existing)
            {
                SaveBill();
            }
        }

        public List<Order> Orders
        {
            get
            {
                return orders;
            }
        }

        public void AddOrder(Order order)
        {
            orders.Add(order);
        }

        public void RemoveOrder(Order order)
        {
            orders.Remove(order);
            order = null;
        }

        public void  CalculateTotal()
        {
            subTotal = 0;
            taxTotal = 0;
            foreach(Order o in orders)
            {
                this.subTotal += o.GetPrice;
                this.taxTotal += o.GetPrice * tax;
            }
        
            this.finalTotal = this.subTotal + this.taxTotal;
            
        }


        public void SaveBill()
        {
           sqlController sqC = new sqlController();

           this.id = sqC.insertBill(this);
        }

        public int TableID
        {
            get
            {
                return table_id;
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

        public int CheckNum
        {
            get
            {
                return check_num;
            }
        }

        public decimal Payment
        {
            get
            {
                return payment;
            }
            set
            {
                payment = value;
            }
        }

        public decimal SubTotal
        {
            get
            {
                return subTotal;
            }
        }

        public decimal FinalTotal
        {
            get
            {
                return decimal.Round(finalTotal, 2, MidpointRounding.AwayFromZero);
            }
        }

        public decimal TaxTotal
        {
            get
            {
                return taxTotal;
            }
        }

        public void ApplyPayment(decimal payment)
        {
            this.payment += payment;
            Update();
        }

        public void Update()
        {
            sqlController sqC = new sqlController();
            sqC.updateBill(this);

        }

}