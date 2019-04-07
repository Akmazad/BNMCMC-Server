using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FreeTextBoxControls;
using System.IO;
using System.Collections.Specialized;
using System.Threading.Tasks;
using System.Threading;
using System.ComponentModel;

namespace BN_MCMC
{
    public partial class _Default : System.Web.UI.Page
    {
        List<string> inputFileInfo = new List<string>();
        string path = "";
        string guid = "";
        //string outputDirectory = "";
        //BackgroundWorker backgroundWorker1 = new BackgroundWorker();
        BackgroundWorker bgWorker1 = null;
        ProgressCollector progressCollector = null;
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                FlushSessionData();
            }
        }

        private void FlushSessionData()
        {
            Session["currentProgress_MH"] = null;
            Session["currentProgress_NS"] = null;
            Session["currentProgress_HAR"] = null;

            Session["progressList_MH"] = null;
            Session["progressList_NS"] = null;
            Session["progressList_HAR"] = null;

            Session["logFx_MH"] = null;
            Session["logFx_NS"] = null;
            Session["logFx_HAR"] = null;

            Session["MeanPostNet_MH"] = null;
            Session["MeanPostNet_NS"] = null;
            Session["MeanPostNet_HAR"] = null;

            Session["HighestPostNet_MH"] = null;
            Session["HighestPostNet_NS"] = null;
            Session["HighestPostNet_HAR"] = null;
        }

        protected void btn_UploadFile_click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            //string guid = Guid.NewGuid().ToString();

            guid = (string)Session["UserSession"];
            path = Server.MapPath("~/Data/" + guid + "/");
            //outputDirectory = path;
            Session["path"] = path;
            Session["guid"] = guid;
            

            if (FileUpload1.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                String[] allowedExtensions = { ".txt" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

            if (fileOK)
            {
                try
                {

                    inputFileInfo.Add(path + FileUpload1.FileName);
                    inputFileInfo.Add(FileUpload1.FileName);

                    Session["inputFileInfo"] = inputFileInfo;

                    if (Directory.Exists(path))
                    {

                        FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                    }
                    else
                    {
                        Directory.CreateDirectory(path);
                        FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                    }
                    lbl_fileUploadStatus.Text = "File uploaded!";
                }
                catch (Exception ex)
                {
                    lbl_fileUploadStatus.Text = "File could not be uploaded.";
                }
            }
            else
            {
                lbl_fileUploadStatus.Text = "Cannot accept files of this type.";
            }
        }

        
        protected void btn_SubmitaJob_click(object sender, EventArgs e)
        {
            progressCollector = new ProgressCollector(Session);
            progressCollector.FlushSessionData();

            Session["InnerWorker_MH"] = null;
            Session["InnerWorker_NS"] = null;
            Session["InnerWorker_HAR"] = null;
            
            Session["OuterWorker"] = null;
            
            bgWorker1 = new BackgroundWorker();
            bgWorker1.WorkerSupportsCancellation = true;
            bgWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(DO_Operation);
            //bgWorker1.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(CompleteLongProcess);
            bgWorker1.RunWorkerAsync();
            //Response.Write("<script>window.onload=function(){ShowProgressbar();}</script>");
            ClientScript.RegisterStartupScript(typeof(Page), "keyOne", "<script type=\"text/javascript\"> ShowProgressbar(); </script>", false);
        }

        public void DO_Operation(object sender, DoWorkEventArgs e)
        {
            Session["OuterWorker"] = bgWorker1;
            
            #region Prepare input settings and call the required analysis function constructor
            NameValueCollection inputSettings = new NameValueCollection();
            inputSettings.Add("nNodes", txt_nNodes.Text);
            inputSettings.Add("nIteration", txt_nIteration.Text);
            inputSettings.Add("nBurnIn", txt_nBurnIn.Text);
            inputSettings.Add("nMaxOutdegree", txt_maxOutDegree.Text);
            inputSettings.Add("nMaxIndegree", txt_maxInDegree.Text);
            //inputSettings.Add("nSSDstepsize", txt_SSD_Step.Text);
            Session["iterationCount"] = txt_nIteration.Text.ToString().Trim();
            #endregion

            #region Prepare Method settings and call the required analysis function constructor
            List<string> MethodSettings = new List<string>();
            string initialNetwork = "";
            string SamplingDistribution = "";
            string AcceptanceRatio = "";
            List<string> MCMC_methods = new List<string>();

            if (radioButton_InitNet_FixedorRandom.SelectedIndex > -1)
            {
                if (radioButton_InitNet_FixedorRandom.SelectedIndex == 0)
                    initialNetwork = "Fixed";
                else if (radioButton_InitNet_FixedorRandom.SelectedIndex == 1)
                    initialNetwork = "Random";
            }

            SamplingDistribution = "DirMul";
            AcceptanceRatio = "MH";

            //if (radioButton_SamplingDist_Uniform.Checked)
            //    SamplingDistribution = "Uniform";
            //else if (radioButton_SamplingDist_DirMul.Checked)
            //    SamplingDistribution = "DirMul";

            //if (radioButton_AccepRatio_Approximation.Checked)
            //    AcceptanceRatio = "Approximation";
            //else if (radioButton_AccepRatio_MH.Checked)
            //    AcceptanceRatio = "MH";

            //if (radioButton_MCMC_MetroPolish.Checked)
            //    MCMC_methods = "Metropolis";
            if (chk_method_MH.Checked)
                MCMC_methods.Add("MH");
            if (chk_method_NS.Checked)
                MCMC_methods.Add("NS");
            if (chk_method_HAR.Checked)
                MCMC_methods.Add("HAR");
            
            MethodSettings.Add(initialNetwork);
            MethodSettings.Add(SamplingDistribution);
            MethodSettings.Add(AcceptanceRatio);
            #endregion

            #region Prepare Numerical Output settings
            List<string> NumerialOutputSettings = new List<string>();
            string SampledNetwithFreq = "false";
            string LogPosteriorFunction = "false";
            string SSD_values = "false";
            string Mean_Posterior = "false";

            if (checkBox_SelectedNets_with_Freq.Checked)
                SampledNetwithFreq = "true";

            if (checkBox_LogPosterior.Checked)
                LogPosteriorFunction = "true";

            //if (checkBox_SSD_values.Checked)
            //    SSD_values = "true";

            if (checkBox_MeanPosterior.Checked)
                Mean_Posterior = "true:" + txt_MeanPosterior_Th.Text;

            NumerialOutputSettings.Add(SampledNetwithFreq);
            NumerialOutputSettings.Add(LogPosteriorFunction);
            NumerialOutputSettings.Add(SSD_values);
            NumerialOutputSettings.Add(Mean_Posterior);
            #endregion

            #region Prepare Graphical Output settings
            List<string> GraphicalOutputSettings = new List<string>();
            string LogPosterior_VS_iteration = "false";
            string SSD_VS_StepSize = "false";
            string TrueDist_VS_EstimatedDist = "false";
            string Mean_Posterior_Net = "false";
            string Highest_Freq_Net = "false";

            if (checkBox_LogPosterior_VS_iteration.Checked)
                LogPosterior_VS_iteration = "true";

            //if (checkBox_SSD_VS_stepSize.Checked)
            //    SSD_VS_StepSize = "true";

            //if (checkBox_TrueDist_VS_EstimatedDist.Checked)
            //    TrueDist_VS_EstimatedDist = "true";

            if (checkBox_MeanPosteriorNet.Checked)
                Mean_Posterior_Net = "true";

            if (checkBox_HighestFreqNet.Checked)
                Highest_Freq_Net = "true";

            GraphicalOutputSettings.Add(LogPosterior_VS_iteration);
            GraphicalOutputSettings.Add(SSD_VS_StepSize);
            GraphicalOutputSettings.Add(TrueDist_VS_EstimatedDist);
            GraphicalOutputSettings.Add(Mean_Posterior_Net);
            GraphicalOutputSettings.Add(Highest_Freq_Net);
            #endregion

            #region Call proper Class

            inputFileInfo = (List<string>)Session["inputFileInfo"];
            string outputDirectory = (string)Session["path"];

            #region For Metropolis-Hastings Sampler
            if (MCMC_methods.Contains("MH"))
            {
                Session["MCMC_method_MH"] = "true";
                //Response.Write("<script type='text/javascript' src='Scripts/Progress.js'> GetStatus('MH');</script>");
                //Response.Write("<script type='text/javascript' src='Scripts/Progress.js'> GetStatus_1();</script>");
                //Response.Write("<script> window.onload=function(){GetStatus('MH');}</script>");
                //Response.Write("<script> window.onload=function(){GetStatus_1();}</script>");
                ClientScript.RegisterStartupScript(typeof(Page), "keyMH", "<script type=\"text/javascript\"> GetStatus_1(); </script>",false);
                //Response.Write("<script> window.GetStatus('MH');</script>");
                /* THE SAMPLER CLASS RUNNING STARTS HERE */

                Adaptive_MH obj_MH = new Adaptive_MH(inputFileInfo, inputSettings, outputDirectory, MethodSettings, NumerialOutputSettings, GraphicalOutputSettings);
                obj_MH.StartAnalysis(Session);

            }
            #endregion

            #region For Neighbourhood Sampler

            if (MCMC_methods.Contains("NS"))
            {
                Session["MCMC_method_NS"] = "true";
                //Response.Write("<script type='text/javascript' src='Scripts/Progress.js'> GetStatus('NS'); </script>");
                //Response.Write("<script type='text/javascript' src='Scripts/Progress.js'> GetStatus_2(); </script>");
                //Response.Write("<script> window.onload=function(){GetStatus('NS');}</script>");
                //Response.Write("<script> window.onload=function(){GetStatus_2();}</script>");
                //Response.Write("<script> window.GetStatus('NS');</script>");
                ClientScript.RegisterStartupScript(typeof(Page), "keyNS", "<script type=\"text/javascript\"> GetStatus_2(); </script>",false);
                /* THE SAMPLER CLASS RUNNING STARTS HERE */
                Adaptive_NS obj_NS = new Adaptive_NS(inputFileInfo, inputSettings, outputDirectory, MethodSettings, NumerialOutputSettings, GraphicalOutputSettings);
                obj_NS.StartAnalysis(Session);
            }
            #endregion

            #region For Hit-n-Run Sampler

            if (MCMC_methods.Contains("HAR"))
            {
                Session["MCMC_method_HAR"] = "true";
                //Response.Write("<script type='text/javascript' src='Scripts/Progress.js'> GetStatus('HAR');</script>");
                //Response.Write("<script type='text/javascript' src='Scripts/Progress.js'> GetStatus_3();</script>");
                //Response.Write("<script> window.onload=function(){GetStatus('HAR');}</script>");
                //Response.Write("<script> window.onload=function(){GetStatus_3();}</script>");
                //.Write("<script> window.GetStatus('HAR');</script>");
                ClientScript.RegisterStartupScript(typeof(Page), "keyHAR", "<script type=\"text/javascript\"> GetStatus_3(); </script>",false);
                /* THE SAMPLER CLASS RUNNING STARTS HERE */
                Adaptive_HAR obj_HAR = new Adaptive_HAR(inputFileInfo, inputSettings, outputDirectory, MethodSettings, NumerialOutputSettings, GraphicalOutputSettings, txt_HAR_lambda.Text);
                obj_HAR.StartAnalysis(Session);
            }
            #endregion

            
            #endregion

        }

        protected void hlExample_Click(object sender, EventArgs e)
        {
            txt_nNodes.Text = "6";
            txt_nIteration.Text = "110";
            txt_nBurnIn.Text = "10";
            txt_maxOutDegree.Text = "3";
            txt_maxInDegree.Text = "3";
            //txt_nNodes.Text = "6";

            path = Server.MapPath("~/Data/");
            //outputDirectory = path;
            Session["path"] = path;
            Session["guid"] = "";

            Session["runExample"] = "true";

            inputFileInfo.Add(path + "Mendal_6_nodes_5000_Transposed_Example.txt");
            inputFileInfo.Add("Mendal_6_nodes_5000_Transposed_Example.txt");

            Session["inputFileInfo"] = inputFileInfo;

            lbl_fileUploadStatus.Text = "Example File uploaded!";

            //FileUpload1.FileName = "Mendal_6_nodes_5000_Transposed_Example.txt";

        }
        // Back on the 'UI' thread so we can update the progress bar
        void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            //// The progress percentage is a property of e
            ////progressBar1.Value = e.ProgressPercentage;
            //this.txtProgress.Text = "Iteration completed: " + ((ulong)e.UserState).ToString();

            //var elapsedMs = watch.ElapsedMilliseconds;
            //double eMS = ((double)elapsedMs) / 1000.0;
            ////string msgText = "number of Node: " + nNodes.ToString() + "\n"
            ////    + "number of Iteration: " + nMaxIteration.ToString() + "\n"
            ////    + "Excution time: " + eMS.ToString() + " sec";
            //label2.Text = "Time elapsed: " + eMS.ToString() + " sec";
            //label3.Text = "Z-count (all): " + nZ.ToString();
            //label5.Text = "Z-count (rejected): " + nZ_rejected.ToString();

            //label4.Text = "number of changed node: " + L_conditionalProb.Count;

            //tw_LogFile.WriteLine(((ulong)e.UserState).ToString() + "," + eMS.ToString() + "," + nZ.ToString() + "," + nZ_rejected.ToString() + "," + L_conditionalProb.Count);
        }


        
    }
}
