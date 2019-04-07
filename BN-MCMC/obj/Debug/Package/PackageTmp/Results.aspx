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

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
  .ui-tabs-vertical { width: 55em; }
  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; }
  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
  </style>


  <div id="tabs">
  <ul>
    <li><a href="#tabs_1">Log f(X) vs Iterations</a></li>
    <li><a href="#tabs_2">Mean posterior network</a></li>
    <li><a href="#tabs_3">Highest frequency network</a></li>
  </ul>
  <div id="tabs_1" >
    <h2>Log f(X) vs Iteration</h2>
      <asp:Chart ID="ChartLogFx" runat="server">
          <Series>
              <asp:Series Name="Series_LogFx"  YValueType="Int32" ChartType="Point" Color="Black">

			<Points>
			</Points>
		</asp:Series>
          </Series>
          <ChartAreas>
              <asp:ChartArea Name="ChartArea1">
              </asp:ChartArea>
          </ChartAreas>
      </asp:Chart>
  </div>
  <div id="tabs_2">
  <h2>Mean Posterior Network</h2>
   <p>
    
    <asp:Image ID="img_MeanPostNet" runat="server" Height="100%" Width="100%" />
    </p>
  </div>
      
  <div id="tabs_3">
    <h2>Highest Frequency Network</h2>
    <asp:Image ID="img_HighestFreqNet" runat="server" Height="100%" Width="100%" />
  </div>
</div>
</asp:Content>

