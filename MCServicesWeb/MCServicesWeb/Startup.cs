using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MCServicesWeb.Startup))]
namespace MCServicesWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
