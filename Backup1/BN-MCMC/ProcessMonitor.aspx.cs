using System;
using System.Web;

namespace BN_MCMC
{
    public partial class ProcessMonitor : System.Web.UI.Page
    {
        ProgressCollector progressCollector = null;
        string methodName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            bool operationCalceled = Request.QueryString["cancel"] != null ? Convert.ToBoolean(Request.QueryString["cancel"].ToString()) : false;
            methodName = (string) Request.QueryString["method"];

            
            if (!operationCalceled)
            {
                GetProgress();
            }
            else //Operation is cancled from the client
            {
                TerminateLongProcess();                
            }
        }
        
        public void GetProgress()
        {   
            progressCollector = new ProgressCollector(Session);
            Progress currentProgress = progressCollector.GetCurrentStatusFromSession(methodName);
            if (currentProgress.ProgressPercentage == 111)
            {
                Response.Write(currentProgress.ProgressPercentage + "$" + currentProgress.ProgressMessage + "$");
            }
            else
            {
                Response.Write(currentProgress.ProgressPercentage + "$" + currentProgress.ProgressMessage + " : " + currentProgress.ProgressPercentage + "%" + "$");
            }
        }

        public void TerminateLongProcess()
        {
            //Terminate the process with the help of process controller
            ProcessController pController = new ProcessController(Session);
            pController.TerminateProcess(); //terminate all the process, not just a single one            
            GetProgress();
        }
    }
}