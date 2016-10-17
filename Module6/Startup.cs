using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Module6.Startup))]
namespace Module6
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
