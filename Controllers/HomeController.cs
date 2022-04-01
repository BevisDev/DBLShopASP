using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLShopASP.Models;

namespace DBLShopASP.Controllers
{
    public class HomeController : Controller
    {
        private DbModelDataContext data = new DbModelDataContext();
        private List<Product> newProducts(int count)
        {
            return data.Products.OrderByDescending(a => a.Product_Date).Take(count).ToList();
        }
        // GET: Home
        public ActionResult Index()
        {
            var list = newProducts(8);
            return View(list);
        }
      
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Blog()
        {
            return View();
        }
    }
}