using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BN_MCMC.Account
{
    
    public partial class Login : System.Web.UI.Page
    {
        public string userSession = Guid.NewGuid().ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = userSession;
            DataTable dtUser = new DataTable();

            
            //dtUser = checkUserLogin(userSession, "LOGIN");  
  
        }
    }
}
