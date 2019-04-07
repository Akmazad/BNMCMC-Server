using System;
using System.Collections.Generic;
using System.Web;

namespace BN_MCMC
{
    public partial class SystemInterface : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            if (!IsPostBack)
            {
                try
                {
                    ProgressCollector pCollector = new ProgressCollector(Session);
                    List<Progress> progressList = pCollector.GetAllProgresses();
                    GenerateHtml(progressList);
                }
                catch
                {}
            }            
        }

        protected void btnStartTask_Click(object sender, EventArgs e)
        {
            ProcessController pController = new ProcessController(Session);
            string message = pController.InitializeAndStartProcess();
            Response.Write(message);
        }

        private void GenerateHtml(List<Progress> progressList)
        {
            string html = string.Empty;
            try
            {
                if (progressList != null && progressList.Count > 0)
                {
                    html = @"<table>
                        <tr><th colspan='3' style='text-align:center; color:green;'>Process Execution Log</th></tr>
                        <tr>
                            <th style='text-align:left;'>Time</th>
                            <th style='text-align:center;'>Completed(%)</th>
                            <th style='text-align:left;'>Message</th>
                        </tr>";
                    foreach (Progress progress in progressList)
                    {
                        string row = @"<tr>
                                 <td style='text-align:left;'>{0}</td>
                                 <td style='text-align:center;'>{1}</td>
                                 <td style='text-align:left;'>{2}</td>
                            </tr>";
                        string prctg = "N/A";
                        if (progress.ProgressPercentage != 111 && progress.ProgressPercentage != -1)
                        {
                            prctg = progress.ProgressPercentage.ToString()+"%";
                        }
                        html += string.Format(row, progress.Time.ToString(), prctg, progress.ProgressMessage);
                    }
                    html += "</table>";
                    dvReport.InnerHtml = html;
                }
            }
            catch
            { }
        }
    }
}