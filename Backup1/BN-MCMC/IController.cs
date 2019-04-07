using System;
using System.ComponentModel;
namespace BN_MCMC
{
    interface IController
    {
        object CheckIfAnyIncompleteProcess();
        string InitializeAndStartProcess();
        void StartLongProcessExecution(object sender, System.ComponentModel.DoWorkEventArgs e);
        void ChangeProgress(object sender, ProgressChangedEventArgs e);
        void CompleteLongProcess(object sender, System.ComponentModel.RunWorkerCompletedEventArgs e);
        void PauseProcess();
        void ResumeIncompleteOperation();
        void TerminateProcess();
        void RollbackIncompleteOperation();
    }
}