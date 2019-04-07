<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemInterface.aspx.cs" Async="true" Inherits="BN_MCMC.SystemInterface" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Realtime Progressbar</title>
    <script type="text/javascript" src="Scripts/Progress.js"></script>
</head>
<body style="padding:0px; margin:0px;">
    <div id="dvOverlay" style="height:100%; width:100%; background-color:#000000; opacity:0.2; position:absolute; display:none;"></div>
    <div id="dvProgressBar" style="height:115px; width:275px;z-index:999999; top:140px; left:40%; position:absolute; background-color:#ffffff; border:1px solid lightsteelblue; display:none;">
        <center>
            <div style="height:25px;background-color:lightsteelblue; color: White; text-align:left; font-family:Trebuchet MS;"><b>&nbsp;&nbsp;Real Time Progress</b></div>
            <div id="dvStatus_MH" style="width:100%; font-family:Verdana; font-size:10px; color:Black; margin:7px 0 0 0;" >Waiting for server response....</div>
            <div style="height:10px;"></div>
            <div id="dvTest_MH" style="height:16px; width:200px; border:1px solid lightgray;">                
                <table style="width:200px; height:16px; border-spacing:0px;">
                    <tr id="trMain_MH"></tr>
                </table>
            </div> 
            <div style="height:10px;"></div>
            <div id="dvStatus_NS" style="width:100%; font-family:Verdana; font-size:10px; color:Black; margin:7px 0 0 0;" >Waiting for server response....</div>
            <div style="height:10px;"></div>
            <div id="dvTest_NS" style="height:16px; width:200px; border:1px solid lightgray;">                
                <table style="width:200px; height:16px; border-spacing:0px;">
                    <tr id="trMain_NS"></tr>
                </table>
            </div> 
            <div style="height:10px;"></div>
            
            <div id="dvStatus_HAR" style="width:100%; font-family:Verdana; font-size:10px; color:Black; margin:7px 0 0 0;" >Waiting for server response....</div>
            <div style="height:10px;"></div>
            <div id="dvTest_HAR" style="height:16px; width:200px; border:1px solid lightgray;">                
                <table style="width:200px; height:16px; border-spacing:0px;">
                    <tr id="trMain_HAR"></tr>
                </table>
            </div> 
            <div style="height:10px;"></div>
            
            <div>
                <center>
                    <input type="button" value="Terminate Process" onclick="TerminateLongProcess()" />
                </center>
            </div>     
        </center>  
    </div>
    <center>
    <div style="width:50%; overflow:hidden;">
        <form action="" runat="server">
            <table id="Table1" runat="server">
                <tr>
                    <td style="height:200px;"></td>
                    <td style="text-align:left;">
                        <asp:Button runat="server" Text="Start Process" 
                            onclick="btnStartTask_Click"/>
                    </td>
                </tr>
            </table>            
            <div id="dvReport" runat="server"></div>
        </form>
    </div>
    </center>
</body>
</html>
