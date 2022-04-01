using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLShopASP.Models;

namespace DBLShopASP.Areas.admin.Controllers
{
    public class HomeAController : Controller
    {
        private DbModelDataContext db = new DbModelDataContext();
        // GET: admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Refresh()
        {
            return View(db.Categories.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Category cate)
        {
            db.Categories.InsertOnSubmit(cate);
            db.SubmitChanges();
            return RedirectToAction("refresh", "HomeA");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var name = db.Categories.SingleOrDefault(a => a.Id == id);
            return View(name);
        }

        [HttpPost]
        public ActionResult Edit(Category cate)
        {
            var name = db.Categories.SingleOrDefault(a => a.Id == cate.Id);
            name.Name = cate.Name;
            db.SubmitChanges();
            return RedirectToAction("refresh", "HomeA");
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var name = db.Categories.SingleOrDefault(a => a.Id == id);
            return View(name);
        }


        [HttpPost]
        public ActionResult Delete(Category cate)
        {
            var name = db.Categories.SingleOrDefault(a => a.Id == cate.Id);
            db.Categories.DeleteOnSubmit(name);
            db.SubmitChanges();
            return RedirectToAction("refresh", "HomeA");
        }
    }
}