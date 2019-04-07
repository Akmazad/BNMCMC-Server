using System;
using System.Collections.Generic;
using System.Web;
using System.ComponentModel;
using System.Threading;

namespace BN_MCMC
{
    public class ProcessController:IController
    {
        ProgressCollector progressCollector = null;
        BackgroundWorker bgWorker1 = null;
        BackgroundWorker bgWorker2 = null;
        public System.Web.SessionState.HttpSessionState Session = null;

        public ProcessController(object sessionObj)
        {
            Session = (System.Web.SessionState.HttpSessionState)sessionObj;
        }

        //Implement IController.CheckIfAnyIncompleteProcess
        public object CheckIfAnyIncompleteProcess()
        {
            return new object();
        }

        //Implement IController.InitializeResources
        public string InitializeAndStartProcess()
        {
            progressCollector = new ProgressCollector(Session);
            progressCollector.FlushSessionData();

            Session["InnerBGWorker"] = null;
            Session["OuterBGWorker"] = null;

            bgWorker1 = new BackgroundWorker();
            bgWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(StartProcessAsynchronously);
            bgWorker1.RunWorkerAsync();
            return "<script>window.onload=function(){ShowProgressbar();}</script>";
        }

        //Implement IController.StartProcessAsynchronously
        public void StartProcessAsynchronously(object sender, System.ComponentModel.DoWorkEventArgs e)
        {
            Session["Worker1"] = bgWorker1;
            bgWorker2 = new BackgroundWorker();
            bgWorker2.WorkerReportsProgress = true;
            bgWorker2.WorkerSupportsCancellation = true;
            bgWorker2.DoWork += new System.ComponentModel.DoWorkEventHandler(StartLongProcessExecution);
            bgWorker2.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(ChangeProgress);
            bgWorker2.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(CompleteLongProcess);
            bgWorker2.RunWorkerAsync();           
        }

        //Implement IController.StartLongProcess
        public void StartLongProcessExecution(object sender, System.ComponentModel.DoWorkEventArgs e)
        {
            Session["InnerWorker"] = bgWorker2;
            bgWorker2.ReportProgress(0, "Process Started....");

            for (int i = 1; i <= 25; i++)
            {
                if ((bgWorker2.CancellationPending == true))
                {
                    e.Cancel = true;
                    break;
                }
                else
                {
                    // Perform a time consuming operation and report progress.
                    System.Threading.Thread.Sleep(3000);
                    bgWorker2.ReportProgress(i * 4, "Process " + i + " Completed");
                }
            }
            if (!bgWorker2.CancellationPending)
            {
                System.Threading.Thread.Sleep(5000);
                bgWorker2.ReportProgress(100, "Task completed successfully");
                bgWorker2.ReportProgress(111, "Task completed successfully");
            }
            else
            {
                bgWorker2.ReportProgress(-1, "Operation Cancelled");
            }
        }

        //Implement IController.ChangeProgress
        public void ChangeProgress(object sender, ProgressChangedEventArgs e)
        {
            //progressCollector = new ProgressCollector(Session);
            //progressCollector.currentProgress.Time = DateTime.Now;
            //progressCollector.currentProgress.ProgressPercentage = e.ProgressPercentage;
            //progressCollector.currentProgress.ProgressMessage = e.UserState.ToString();
            //progressCollector.StoreCurrentStatusToSession();
        }

        //Implement IController.CompleteLongProcess
        public void CompleteLongProcess(object sender, System.ComponentModel.RunWorkerCompletedEventArgs e)
        {
            bgWorker2.Dispose();
            bgWorker2.Dispose();
        }

        //Implement IController.PauseProcess
        public void PauseProcess()
        { }
        
        //Implement IController.ResumeIncompleteOperation
        public void ResumeIncompleteOperation()
        { }

        //Implement IController.TerminateProcess
        public void TerminateProcess()
        {
            //Stop background and abrot its current operation
            BackgroundWorker InnerWorker_MH = Session["InnerWorker_MH"] != null ? (BackgroundWorker)Session["InnerWorker_MH"] : null;
            BackgroundWorker InnerWorker_NS = Session["InnerWorker_NS"] != null ? (BackgroundWorker)Session["InnerWorker_NS"] : null;
            BackgroundWorker InnerWorker_HAR = Session["InnerWorker_HAR"] != null ? (BackgroundWorker)Session["InnerWorker_HAR"] : null;
            BackgroundWorker OuterWorker = Session["OuterWorker"] != null ? (BackgroundWorker)Session["OuterWorker"] : null;

            if (InnerWorker_MH != null)
                InnerWorker_MH.CancelAsync();
            if (InnerWorker_NS != null)
                InnerWorker_NS.CancelAsync();
            if (InnerWorker_HAR != null)
                InnerWorker_HAR.CancelAsync();

            if (OuterWorker != null)
            {
                OuterWorker.CancelAsync();
            }
        }
        
        //Implement IController.RollbackIncompleteOperation
        public void RollbackIncompleteOperation()
        { }
    }
}