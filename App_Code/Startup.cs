using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SamyStoreApp.Startup))]
namespace SamyStoreApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
