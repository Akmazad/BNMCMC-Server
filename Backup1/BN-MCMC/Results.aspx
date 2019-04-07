<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resuls.aspx.cs" Inherits="BN_MCMC.Resuls" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.Glee" Namespace="Microsoft.Glee" TagPrefix="GLEE"  %>
<%@ Register TagPrefix="Drawing" Namespace="Microsoft.Glee.Drawing" Assembly="Microsoft.Glee.Drawing" %>
<%@ Register Assembly="Microsoft.GLEE.GraphViewerGDI" Namespace="Microsoft.Glee.GraphViewerGdi" TagPrefix="gv"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Results
    </h2>

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <%--<link rel="stylesheet" href="/resources/demos/style.css">--%>
  <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/jscript"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" type="text/jscript"></script>
  <script type="text/jscript">
      $(function () {
          $("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
          $("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
      });
  </script>
  
  <style type="text/css">
  .ui-tabs-vertical { width: 72em; }
  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 15em; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; }
  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: left; width: 40em;}
  </style>


  <div id="tabs">
  <ul>
    <li><a href="#tabs_1">Log f(X) vs Iterations</a></li>
    <li><a href="#tabs_2">Mean posterior network</a></li>
    <li><a href="#tabs_3">Highest frequency network</a></li>
  </ul>
  <div id="tabs_1" >
    <h2>Log f(X) vs Iteration</h2>

    <p id="p_Chart_MH" runat="server" style="display:none; background-color: LightGoldenRodYellow;  border: 1px; border-color:Black;"> <strong> Metropolis-Hasting Sampler </strong>
      <asp:Chart ID="ChartLogFx_MH" runat="server" Width="502px" BackColor="Transparent">
          <Series>
              <asp:Series Name="Series_LogFx_MH"  YValueType="Int32" ChartType="Point" Color="Black">

			<Points>
			</Points>
		</asp:Series>
          </Series>
          <ChartAreas>
              <asp:ChartArea Name="ChartArea1_MH" BackColor="Transparent">
               <AxisY Title="Log f(X)">
     
                </AxisY>
                <AxisX Title="MH Iteration" IsLabelAutoFit="True" >
                
                </AxisX>
              </asp:ChartArea>
          </ChartAreas>
          
      </asp:Chart>
    </p>

    <p id="p_Chart_NS" runat="server" style="display:none; background-color: MintCream;  border: 1px; border-color:Black;"><strong> Neighborhood Sampler </strong> 
    
      <asp:Chart ID="ChartLogFx_NS" runat="server" Width="502px" BackColor="Transparent">
          <Series>
              <asp:Series Name="Series_LogFx_NS"  YValueType="Int32" ChartType="Point" Color="Black">

			<Points>
			</Points>
		</asp:Series>
          </Series>
          <ChartAreas>
              <asp:ChartArea Name="ChartArea1_NS" BackColor="Transparent">
              <AxisY Title="Log f(X)">
                    
                </AxisY>
                <AxisX Title="NS Iteration" IsLabelAutoFit="True">
                
                </AxisX>
              </asp:ChartArea>
          </ChartAreas>
          
      </asp:Chart>
      
    </p>

    <p id="p_Chart_HAR" runat="server" style="display:none; background-color: LemonChiffon; border: 1px; border-color:Black;"><strong> Hit-and-Run Sampler </strong> 
      <asp:Chart ID="ChartLogFx_HAR" runat="server" Width="502px" BackColor="Transparent">
          <Series>
              <asp:Series Name="Series_LogFx_HAR"  YValueType="Int32" ChartType="Point" Color="Black">

			<Points>
			</Points>
		</asp:Series>
          </Series>
          <ChartAreas>
              <asp:ChartArea Name="ChartArea1_HAR" BackColor="Transparent">
              <AxisY Title="Log f(X)" >
                    
                </AxisY>
                <AxisX Title="HAR Iteration" IsLabelAutoFit="True" >
                
                </AxisX>
              </asp:ChartArea>
          </ChartAreas>
          
      </asp:Chart>
    </p>
  </div>
  
  <div id="tabs_2">
  <h2>Mean Posterior Network</h2>
    <p id="p_imgMP_MH" runat="server" style="display:none;"> <strong> Metropolis-Hasting Sampler </strong> 
    <asp:Image ID="img_MeanPostNet_MH" runat="server" Height="100%" Width="100%" />
    </p>

    <p id="p_imgMP_NS" runat="server" style="display:none;"> <strong> Neighborhood Sampler </strong> 
    <asp:Image ID="img_MeanPostNet_NS" runat="server" Height="100%" Width="100%" />
    </p>
    
    <p id="p_imgMP_HAR" runat="server" style="display:none;"> <strong> Hit-and-Run Sampler </strong> 
    <asp:Image ID="img_MeanPostNet_HAR" runat="server" Height="100%" Width="100%" />
    </p>
  </div>
      
  <div id="tabs_3">
    <h2>Highest Frequency Network</h2>
    <p id="p_imgHF_MH" runat="server" style="display:none;"> <strong> Metropolis-Hasting Sampler </strong> 
    <asp:Image ID="img_HighestFreqNet_MH" runat="server" Height="100%" Width="100%" />
    </p>

    <p id="p_imgHF_NS" runat="server" style="display:none;"> <strong> Neighborhood Sampler </strong> 
    <asp:Image ID="img_HighestFreqNet_NS" runat="server" Height="100%" Width="100%" />
    </p>

    <p id="p_imgHF_HAR" runat="server" style="display:none;"> <strong> Hit-and-Run Sampler </strong> 
    <asp:Image ID="img_HighestFreqNet_HAR" runat="server" Height="100%" Width="100%" />
    </p>

  </div>
</div>
</asp:Content>

