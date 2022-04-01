using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLShopASP.Models;
using PagedList.Mvc;
using PagedList;

namespace DBLShopASP.Controllers
{
    public class SearchController : Controller
    {
        private DbModelDataContext db = new DbModelDataContext();
        // GET: Search
        public ActionResult SearchName(string keyword, int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            var list = db.Products.Where(n => n.Name.Contains(keyword));
            ViewBag.keyword = keyword;
            return View(list.OrderBy(n => n.Name).ToPagedList(pageNumber,pageSize));
        }
       
        public ActionResult PriceHigh(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            double price = 5500000;
            var list = db.Products.Where(n => n.Unit_Price > price );
                return View(list.OrderByDescending(n => n.Unit_Price).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult PriceMedium(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            double price = 5500000;
            var list = db.Products.Where(n => n.Unit_Price >= 3500000 && n.Unit_Price <= price);
            return View(list.OrderByDescending(n => n.Unit_Price).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult PriceSmall(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            double price = 3500000;
            var list = db.Products.Where(n => n.Unit_Price >= 1500000 && n.Unit_Price <= price);
            return View(list.OrderByDescending(n => n.Unit_Price).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult PriceStudent(int? page)
        {
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            double price = 1500000;
            var list = db.Products.Where(n => n.Unit_Price < price);
            return View(list.OrderByDescending(n => n.Unit_Price).ToPagedList(pageNumber, pageSize));
        }
    }
}