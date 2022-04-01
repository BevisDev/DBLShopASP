using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLShopASP.Models;

namespace DBLShopASP.Controllers
{
    public class CartController : Controller
    {
        private DbModelDataContext db = new DbModelDataContext();
        public List<cart> getCart()
        {
            List<cart> list = Session["cart"] as List<cart>;
            //neu gio hang chua co thi khoi tao
            if (list == null)
            {
                list = new List<cart>();
                Session["cart"] = list;
            }
            return list;
        }
        // GET: cart
        public ActionResult Create(int id, string strURL)
        {
            //lay ra session gio hang
            List<cart> list = getCart();
            //kiem tra sach da ton tai trong session chua
            cart carts = list.Find(n => n.id == id);
            if (carts == null)
            {
                carts = new cart(id);
                list.Add(carts);
                return Redirect(strURL);
            }
            else
            {
                carts.quantity++;
            }
            return Redirect(strURL);
        }
        
        //tong so luong
        private int Quantity()
        {
            int sTotal = 0;
            List<cart> list = Session["cart"] as List<cart>;
            if (list != null)
            {
                sTotal = list.Sum(n => n.quantity);
            }
            return sTotal;
        }

        //tong so tien
        private double Amount()
        {
            double total = 0;
            List<cart> list = Session["cart"] as List<cart>;
            if (list != null)
            {
                total = list.Sum(n => n.amount);
            }
            return total;

        }

        //page cart
        public ActionResult Cart()
        {
            List<cart> list = getCart();
            if (list.Count == 0)
            {
                return RedirectToAction("index", "Product");
            }

            ViewBag.Quantity = Quantity();
            ViewBag.Amount = Amount();
            return PartialView(list);
        }

        public ActionResult cartPartial()
        {
            List<cart> list = getCart();
            if (list.Count == 0)
            {
                ViewBag.message = "Giỏ hàng trống";
                //return RedirectToAction("index", "Product");
            }

            ViewBag.Quantity = Quantity();
            ViewBag.Amount = Amount();
            return PartialView(list);
        }
        public ActionResult Delete(int Id)
        {
            List<cart> list = getCart();
            cart x = list.SingleOrDefault(n => n.id == Id);
                if (x != null)
            {
                list.RemoveAll(n => n.id == Id);
                return RedirectToAction("Cart");
            }
                if (list.Count == 0)
            {
                return RedirectToAction("index", "Product");
            }
            return RedirectToAction("Cart");
        }
        public ActionResult Update(int id, FormCollection f) {
            List<cart> list = getCart();
            var quantity = f["quantity"];
            cart cproduct = list.SingleOrDefault(n => n.id == id);
            if (cproduct != null)
            {
                cproduct.quantity = int.Parse(f["quantity"].ToString());
            }
            return RedirectToAction("Cart", "Cart");
        }
        public ActionResult BuyNow(int id)
        {
            if (Session["user"] == null || Session["user"].ToString() == "")
            {
                return RedirectToAction("login", "Customer");
            }
            if (Session["cart"] == null)
            {
                return RedirectToAction("index", "Product");
            }
            //lay ra session gio hang
            List<cart> list = getCart();
            //kiem tra sp da ton tai trong session chua
            cart carts = list.Find(n => n.id == id);
            if (carts == null)
            {
                carts = new cart(id);
                list.Add(carts);

            }
            return RedirectToAction("Order", "Cart");

        }
        public ActionResult Order()
        {
            if (Session["user"] == null || Session["user"].ToString() == "")
            {
                return RedirectToAction("login", "Customer");
            }
            if (Session["cart"] == null)
            {
                return RedirectToAction("index", "Product");
            }
            List<cart> list = getCart();
            ViewBag.Quantity = Quantity();
            ViewBag.Amount = Amount();
            return View(list);
        }


        [HttpPost]
        public ActionResult Order(FormCollection collection)
        {
            Order orders = new Order();
            Customer cus = (Customer)Session["user"];
            List<cart> list = getCart();
            orders.Customer_Id = cus.User_Name;
            orders.Order_Date = DateTime.Now;
            var shipDate = String.Format("{0:MM/dd/yyyy}", collection["shipDate"]);
            var address = collection["address"];
            orders.Address = address;
            orders.Checkout = false;
            orders.Finished_Ship = false;
            orders.Ship_Date = DateTime.Parse(shipDate);
            db.Orders.InsertOnSubmit(orders);
            db.SubmitChanges();
            //chi tiet don dat hang
            foreach (var item in list)
            {
                Order_Detail details = new Order_Detail();
                details.Order_Id = orders.Id;
                details.Product_Id = item.id;
                details.Quantity = item.quantity;
                details.Unit_Price = item.amount;
                db.Order_Details.InsertOnSubmit(details);

            }
            db.SubmitChanges();
            Session["cart"] = null;
            return RedirectToAction("confirm", "Cart");
        }
        public ActionResult Confirm()
        {
            
            return View();
        }
    }
}