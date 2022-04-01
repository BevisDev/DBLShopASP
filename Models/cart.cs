using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBLShopASP.Models;

namespace DBLShopASP.Models
{
    public class cart
    {
       private DbModelDataContext db = new DbModelDataContext();
        public int id { get; set; }
        public string name { get; set; }
        public string image { get; set; }
        public double unit_Price { get; set; }
        public int quantity { get; set; }
        public double amount {
            get { return quantity * unit_Price; }
        }

        public cart (int Id)
        {
            id = Id;
            Product product = db.Products.Single(n => n.Id == Id);
            name = product.Name;
            image = product.Image;
            unit_Price = double.Parse(product.Unit_Price.ToString());
            quantity = 1;
        }
    }
}