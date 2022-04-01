using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLShopASP.Models;
using PagedList;
using PagedList.Mvc;


namespace DBLShopASP.Controllers
{
    public class ProductController : Controller
    {
        private DbModelDataContext data = new DbModelDataContext();
        private List<Product> newProducts(int count)
        {
            return data.Products.OrderByDescending(a => a.Product_Date).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var list = newProducts(8);
          
            return View(list);
        }

        public ActionResult Category()
        {
            var cate = from dm in data.Categories select dm;
            return PartialView(cate);
        }
        
        public ActionResult listProduct(int id, int? page)
        {
            var list = from s in data.Products where s.Category_Id == id select s;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(list.ToPagedList(pageNumber,pageSize));

        }
     
        public ActionResult Details(int id)
        {
            var detail = from s in data.Products
                       where s.Id == id
                       select s;
   
            return View(detail.Single());

        }
     
        public ActionResult Random()
        {
            var product = data.Products.OrderByDescending(p => Guid.NewGuid())
                .Take(4).ToList();
            return PartialView(product);
        }


    }

}