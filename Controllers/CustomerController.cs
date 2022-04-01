using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBLShopASP.Models;

namespace DBLShopASP.Controllers
{
    public class CustomerController : Controller
    {
        private DbModelDataContext  db = new DbModelDataContext();
        
        // GET: Customer
        [HttpGet]
        public ActionResult Login()
        { 
            return View();
        }

        [HttpPost]

        public ActionResult Login(FormCollection collection)
        {   
            //Gán các giá trị người dùng nhập liệu cho các biến
            var userName = collection["userName"];
            var password = collection["password"];
            if (string.IsNullOrEmpty(userName))
            {
                ViewData["Error1"] = "Nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(password))
            {
                ViewData["Error2"] = "Nhập mật khẩu";
            }
            else
            {

                Customer cus = db.Customers.SingleOrDefault(n => n.User_Name == userName && n.Password == password );
                 if (cus != null)
                {
                    Session["user"] = cus;
                    //ViewData["Message"] = "Đăng Nhập Thành Công";
                    return RedirectToAction("index", "Product");
                    
                }
                else 
                {
                    ViewData["Message"] = "Tên Đăng Nhập và Mật Khẩu không đúng";
                }

            } 
               return View();
          }
        



        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Register(FormCollection collection, Customer cus)
        {
            var userName = collection["userName"];
            var pwd = collection["password"];
            var confirmpwd = collection["confirmpass"];
            var fullName = collection["fullName"];
            var phone = collection["phone"];
            var email = collection["email"];
            if (String.IsNullOrEmpty(userName))
            {
                ViewData["Error1"] = "Tên tài khoản không được để trống";
            }
            else if (String.IsNullOrEmpty(pwd))
            {
                ViewData["Error2"] = "Mật khẩu không được để trống";
            }
            else if (String.IsNullOrEmpty(confirmpwd))
            {
                ViewData["Error3"] = "Phải nhập lại mật khẩu";
            }
            else if (pwd != confirmpwd)
            {
                ViewData["Error3"] = "Mật khẩu nhập lại không giống";
            }
            else if (String.IsNullOrEmpty(fullName))
            {
                ViewData["Error4"] = "Họ tên không được để trống";
            }
            else if (String.IsNullOrEmpty(fullName))
            {
                ViewData["Error5"] = "Số điện thoại không được để trống";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Error6"] = "Email không được để trống";
            }
            else
            {
                cus.User_Name = userName;
                cus.Password = pwd;
                cus.Full_Name = fullName;
                cus.Phone = phone;
                cus.Email = email;
                db.Customers.InsertOnSubmit(cus);
                db.SubmitChanges();
                ViewData["message"] = "Đăng kí thành công";
            }

            return this.Register();
        }

        public ActionResult logoff()
        {
            Session.Clear();
            return RedirectToAction("index", "Product");
        }

    }
}