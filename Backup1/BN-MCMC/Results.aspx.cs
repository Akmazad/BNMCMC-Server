using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


using Microsoft.Glee;
using Microsoft.Glee.Drawing;
using Microsoft.Glee.GraphViewerGdi;
using System.Drawing;
using System.Drawing.Imaging;

namespace BN_MCMC
{
    public partial class Resuls : System.Web.UI.Page
    {
        public List<double> ListLogFx_MH = new List<double>();
        public List<double> ListLogFx_NS = new List<double>();
        public List<double> ListLogFx_HAR = new List<double>();

        public DataTable MeanPostNetwork_MH = null;
        public DataTable MeanPostNetwork_NS = null;
        public DataTable MeanPostNetwork_HAR = null;

        public DataTable HighestFreqNetwork_MH = null;
        public DataTable HighestFreqNetwork_NS = null;
        public DataTable HighestFreqNetwork_HAR = null;
        
        public string mcmc_method = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListLogFx_MH = (List<double>)Session["logFx_MH"];
                ListLogFx_NS = (List<double>)Session["logFx_NS"];
                ListLogFx_HAR = (List<double>)Session["logFx_HAR"];

                MeanPostNetwork_MH = (DataTable)Session["MeanPostNet_MH"];
                MeanPostNetwork_NS = (DataTable)Session["MeanPostNet_NS"];
                MeanPostNetwork_HAR = (DataTable)Session["MeanPostNet_HAR"];

                HighestFreqNetwork_MH = (DataTable)Session["HighestPostNet_MH"];
                HighestFreqNetwork_NS = (DataTable)Session["HighestPostNet_NS"];
                HighestFreqNetwork_HAR = (DataTable)Session["HighestPostNet_HAR"];

                //mcmc_method = (string) Session["MCMC_method"];

                #region LogFX
                if (ListLogFx_MH != null)
                {
                    p_Chart_MH.Style["display"] = "block";

                    for (ulong it = 0; it < (ulong)ListLogFx_MH.Count; it++)
                    {
                        this.ChartLogFx_MH.Series["Series_LogFx_MH"].Points.AddXY(it, ListLogFx_MH[(int)it]);
                    }
                }
                if (ListLogFx_NS != null)
                {
                    p_Chart_NS.Style["display"] = "block";

                    for (ulong it = 0; it < (ulong)ListLogFx_NS.Count; it++)
                    {
                        this.ChartLogFx_NS.Series["Series_LogFx_NS"].Points.AddXY(it, ListLogFx_NS[(int)it]);
                    }
                }
                if (ListLogFx_HAR != null)
                {
                    p_Chart_HAR.Style["display"] = "block";

                    for (ulong it = 0; it < (ulong)ListLogFx_HAR.Count; it++)
                    {
                        this.ChartLogFx_HAR.Series["Series_LogFx_HAR"].Points.AddXY(it, ListLogFx_HAR[(int)it]);
                    }
                }
                #endregion

                #region Mean Posteriori Network
                if (MeanPostNetwork_MH != null)
                {
                    p_imgMP_MH.Style["display"] = "block";

                    Graph graph = new Graph("graph");

                    //create the graph content 
                    foreach (DataRow row in MeanPostNetwork_MH.Rows)
                    {
                        graph.AddEdge((string)row.ItemArray[0], (string)row.ItemArray[1]);
                    }

                    GraphRenderer renderer = new GraphRenderer(graph);
                    renderer.CalculateLayout();
                    int width = 900;
                    Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)), PixelFormat.Format32bppPArgb);
                    renderer.Render(bitmap);
                    bitmap.Save((string)Session["path"] + "MH_MeanPostNetwork.bmp");


                    if (((string)Session["runExample"]).Equals("true"))
                        this.img_MeanPostNet_MH.ImageUrl = @"Data/MH_MeanPostNetwork.bmp";
                    else
                        this.img_MeanPostNet_MH.ImageUrl = @"Data/" + (string)Session["guid"] + "/MH_MeanPostNetwork.bmp";
                }
                if (MeanPostNetwork_NS != null)
                {
                    p_imgMP_NS.Style["display"] = "block";

                    Graph graph = new Graph("graph");

                    //create the graph content 
                    foreach (DataRow row in MeanPostNetwork_NS.Rows)
                    {
                        graph.AddEdge((string)row.ItemArray[0], (string)row.ItemArray[1]);
                    }

                    GraphRenderer renderer = new GraphRenderer(graph);
                    renderer.CalculateLayout();
                    int width = 900;
                    Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)), PixelFormat.Format32bppPArgb);
                    renderer.Render(bitmap);
                    bitmap.Save((string)Session["path"] + "NS_MeanPostNetwork.bmp");


                    if (((string)Session["runExample"]).Equals("true"))
                        this.img_MeanPostNet_NS.ImageUrl = @"Data/NS_MeanPostNetwork.bmp";
                    else
                        this.img_MeanPostNet_NS.ImageUrl = @"Data/" + (string)Session["guid"] + "/NS_MeanPostNetwork.bmp";
                }
                if (MeanPostNetwork_HAR != null)
                {
                    p_imgMP_HAR.Style["display"] = "block";

                    Graph graph = new Graph("graph");

                    //create the graph content 
                    foreach (DataRow row in MeanPostNetwork_HAR.Rows)
                    {
                        graph.AddEdge((string)row.ItemArray[0], (string)row.ItemArray[1]);
                    }

                    GraphRenderer renderer = new GraphRenderer(graph);
                    renderer.CalculateLayout();
                    int width = 900;
                    Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)), PixelFormat.Format32bppPArgb);
                    renderer.Render(bitmap);
                    bitmap.Save((string)Session["path"] + "HAR_MeanPostNetwork.bmp");


                    if (((string)Session["runExample"]).Equals("true"))
                        this.img_MeanPostNet_HAR.ImageUrl = @"Data/HAR_MeanPostNetwork.bmp";
                    else
                        this.img_MeanPostNet_HAR.ImageUrl = @"Data/" + (string)Session["guid"] + "/HAR_MeanPostNetwork.bmp";
                }
                #endregion

                #region Highest Frequency Network
                if (HighestFreqNetwork_MH != null)
                {
                    p_imgHF_MH.Style["display"] = "block";

                    Graph graph = new Graph("graph");

                    //create the graph content 
                    foreach (DataRow row in HighestFreqNetwork_MH.Rows)
                    {
                        graph.AddEdge((string)row.ItemArray[0], (string)row.ItemArray[1]);
                    }

                    GraphRenderer renderer = new GraphRenderer(graph);
                    renderer.CalculateLayout();
                    int width = 1600;

                    //Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)), PixelFormat.Format32bppPArgb);
                    
                    Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)));
                    renderer.Render(bitmap);
                    bitmap.Save((string)Session["path"] + "MH_HighestFreqNetwork.bmp");

                    if (((string)Session["runExample"]).Equals("true"))
                        this.img_HighestFreqNet_MH.ImageUrl = @"Data/MH_HighestFreqNetwork.bmp";
                    else
                        this.img_HighestFreqNet_MH.ImageUrl = @"Data/" + (string)Session["guid"] + "/MH_HighestFreqNetwork.bmp";
                }
                if (HighestFreqNetwork_NS != null)
                {
                    p_imgHF_NS.Style["display"] = "block";

                    Graph graph = new Graph("graph");

                    //create the graph content 
                    foreach (DataRow row in HighestFreqNetwork_NS.Rows)
                    {
                        graph.AddEdge((string)row.ItemArray[0], (string)row.ItemArray[1]);
                    }

                    GraphRenderer renderer = new GraphRenderer(graph);
                    renderer.CalculateLayout();
                    int width = 1600;

                    //Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)), PixelFormat.Format32bppPArgb);

                    Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)));
                    renderer.Render(bitmap);
                    bitmap.Save((string)Session["path"] + "NS_HighestFreqNetwork.bmp");

                    if (((string)Session["runExample"]).Equals("true"))
                        this.img_HighestFreqNet_NS.ImageUrl = @"Data/NS_HighestFreqNetwork.bmp";
                    else
                        this.img_HighestFreqNet_NS.ImageUrl = @"Data/" + (string)Session["guid"] + "/NS_HighestFreqNetwork.bmp";
                }
                if (HighestFreqNetwork_HAR != null)
                {
                    p_imgHF_HAR.Style["display"] = "block";

                    Graph graph = new Graph("graph");

                    //create the graph content 
                    foreach (DataRow row in HighestFreqNetwork_HAR.Rows)
                    {
                        graph.AddEdge((string)row.ItemArray[0], (string)row.ItemArray[1]);
                    }

                    GraphRenderer renderer = new GraphRenderer(graph);
                    renderer.CalculateLayout();
                    int width = 1600;

                    //Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)), PixelFormat.Format32bppPArgb);

                    Bitmap bitmap = new Bitmap(width, (int)(graph.Height * (width / graph.Width)));
                    renderer.Render(bitmap);
                    bitmap.Save((string)Session["path"] + "HAR_HighestFreqNetwork.bmp");

                    if (((string)Session["runExample"]).Equals("true"))
                        this.img_HighestFreqNet_HAR.ImageUrl = @"Data/HAR_HighestFreqNetwork.bmp";
                    else
                        this.img_HighestFreqNet_HAR.ImageUrl = @"Data/" + (string)Session["guid"] + "/HAR_HighestFreqNetwork.bmp";
                }
                #endregion
            }
        }
    }
}