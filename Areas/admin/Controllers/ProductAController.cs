using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLShopASP.Models;
using System.IO;

namespace DBLShopASP.Areas.admin.Controllers
{
    public class ProductAController : Controller
    {
        private DbModelDataContext db = new DbModelDataContext();
        // GET: admin/ProductA
        public ActionResult Index()
        {
            return View(db.Products.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Category_Id = new SelectList(db.Categories.ToList().OrderBy(n => n.Name), "Id", "Name");
            return View();
        }

        [HttpPost]
        public ActionResult Create(Product product, HttpPostedFileBase Image)
        {
            ViewBag.Category_Id = new SelectList(db.Categories.ToList().OrderBy(n => n.Name), "Id", "Name");
            if (Image == null)
            {
                ViewBag.message = "Vui lòng chọn ảnh";
                return View();
            }
            else if (ModelState.IsValid)
            {
                var file = Path.GetFileName(Image.FileName);

                var path = Path.Combine(Server.MapPath("~/Content/images/shoes"), file);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.load = "Hình đã tốn tại";
                }
                else
                {
                    Image.SaveAs(path);
                }
                product.Image = file;
                db.Products.InsertOnSubmit(product);
                db.SubmitChanges();
                ViewBag.message = "Thêm thành công";
                return RedirectToAction("index", "ProductA");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            Product product = db.Products.SingleOrDefault(a => a.Id == id);
            ViewBag.Category_Id = new SelectList(db.Categories.ToList().OrderBy(n => n.Name), "Id", "Name", product.Category_Id);
            return View(product);
        }

        [HttpPost]
        public ActionResult Edit(Product product, int id, HttpPostedFileBase Image)
        {
            ViewBag.Category_Id = new SelectList(db.Categories.ToList().OrderBy(n => n.Name), "Id", "Name", product.Category_Id);

            if (ModelState.IsValid)
            {
                var file = Path.GetFileName(Image.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/images/shoes"), file);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.load = "Hình đã tồn tại";
                }
                else
                {
                    Image.SaveAs(path);
                }
                product.Image = file;
                UpdateModel(product);
                db.SubmitChanges();
                return RedirectToAction("index", "ProductA");
            }
            return View();
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            Product product = db.Products.SingleOrDefault(a => a.Id == id);
            return View(product);
        }


        [HttpPost]
        public ActionResult Delete(Product product, int id)
        {
            Product x = db.Products.SingleOrDefault(a => a.Id == id);
            db.Products.DeleteOnSubmit(x);
            db.SubmitChanges();
            return RedirectToAction("index", "ProductA");
        }
    }
}