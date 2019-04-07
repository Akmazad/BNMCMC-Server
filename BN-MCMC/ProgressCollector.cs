using System;
using System.Collections.Generic;
namespace BN_MCMC
{
    public class ProgressCollector
    {
        public Progress currentProgress = null;
        public System.Web.SessionState.HttpSessionState session = null;
        public ProgressCollector(object sessionObj)
        {
            currentProgress = new Progress();
            session = (System.Web.SessionState.HttpSessionState)sessionObj;
        }

        public void StoreCurrentStatusToSession(string method)
        {
            List<Progress> progressList = null;

            session["currentProgress_" + method] = currentProgress;

            if (session["progressList_" + method] != null)
                progressList = (List<Progress>)session["progressList_" + method];
            else
                progressList = new List<Progress>();

            progressList.Add(currentProgress);
            session["progressList_" + method] = progressList;


        }

        public Progress GetCurrentStatusFromSession(string method)
        {
            if (session["currentProgress_" + method] != null)
            {
                currentProgress = (Progress)session["currentProgress_" + method];
            }
            else
            {
                currentProgress.ProgressPercentage = 0;
                currentProgress.ProgressMessage = "Please Wait...";
            }

            return currentProgress;
        }

        public List<Progress> GetAllProgresses(string method)
        {
            List<Progress> progressList = null;
            try
            {
                progressList = (List<Progress>)session["progressList_" + method];

            }
            catch
            {
                progressList = new List<Progress>();
            }
            return progressList;
        }

        public void FlushSessionData()
        {
            session["currentProgress"] = null;
            session["progressList"] = null;
        }
    }
}