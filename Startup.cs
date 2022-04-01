using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DBLShopASP.Startup))]
namespace DBLShopASP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
