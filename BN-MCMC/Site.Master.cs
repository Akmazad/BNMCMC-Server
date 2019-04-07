using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


namespace BN_MCMC
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginStatus1_LoggedOut(Object sender, System.EventArgs e)
        {
            // Perform any post-logout processing, such as setting the
            // user's last logout time or clearing a per-user cache of
            // objects here.

            try
            {

                string guid = (string)Session["UserSession"];
                string path = Server.MapPath("~/Data/" + guid);

                if (Directory.Exists(path))
                {
                    DeleteDirectory(path);
                }

                Session.Clear();
            }
            catch (Exception ex)
            {
                
            }
        }

        private void DeleteDirectory(string path)
        {
            // Delete all files from the Directory
            foreach (string filename in Directory.GetFiles(path))
            {
                File.Delete(filename);
            }
            // Check all child Directories and delete files
            foreach (string subfolder in Directory.GetDirectories(path))
            {
                DeleteDirectory(subfolder);
            }
            Directory.Delete(path);
        }

    }
}
