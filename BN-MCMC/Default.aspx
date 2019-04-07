<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BN_MCMC._Default" Async="true" EnableSessionState="True"
    EnableViewState="true" %>

<%--<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBox" TagPrefix="FreeTextBox"  %>--%>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>BNMCMC</title>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript" src="Scripts/Progress.js"></script>
    
    <h2>
        Welcome to BNMCMC!
    </h2>
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell Width="100%" VerticalAlign="Top" HorizontalAlign="Left">
                <asp:Table runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                    <asp:TableRow>
                        <asp:TableHeaderCell> Input Settings </asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell> <asp:Label runat="server"> No. of Nodes</asp:Label></asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:TextBox ID="txt_nNodes" runat="server"> </asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label2" runat="server"> No. of Iterations</asp:Label></asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:TextBox ID="txt_nIteration" runat="server"> </asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label3" runat="server"> Max Out-Degree </asp:Label></asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:TextBox ID="txt_maxOutDegree" runat="server"> </asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label4" runat="server"> Max In-Degree </asp:Label></asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:TextBox ID="txt_maxInDegree" runat="server"> </asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label5" runat="server"> No. of Burn-in samples </asp:Label></asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:TextBox ID="txt_nBurnIn" runat="server"> </asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="Label6" runat="server"> Input File </asp:Label></asp:TableCell>
                                    <asp:TableCell HorizontalAlign="Right">
                                        <asp:FileUpload ID="FileUpload1" runat="server" /></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Button runat="server" ID="btn_UploadFile" Text="Upload" OnClick="btn_UploadFile_click" />
                                        <asp:Label ID="lbl_fileUploadStatus" runat="server" Font-Italic="True"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:LinkButton ID="hlExample" runat="server" Text="Run an Example" OnClick="hlExample_Click"></asp:LinkButton>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableHeaderCell> Methods Settings </asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableHeaderCell HorizontalAlign="Left">MCMC Methods</asp:TableHeaderCell>
                        <asp:TableHeaderCell HorizontalAlign="Left">Initial Network</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <%--<asp:RadioButtonList ID="radioButton_MCMC_methods" runat="server" RepeatDirection="Vertical"
                                RepeatLayout="Table">
                                <asp:ListItem Text="Metropolis-Hastings" Value="Metropolis-Hastings" Selected="False"></asp:ListItem>
                                <asp:ListItem Text="Neighbourhood" Value="Neighbourhood" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Hit-and-Run" Value="Hit-and-Run" Selected="False"></asp:ListItem>
                            </asp:RadioButtonList>--%>
                            <p><asp:CheckBox ID="chk_method_MH" runat="server" Text="Metropolis-Hastings" Checked="false"/></p>
                            <p><asp:CheckBox ID="chk_method_NS" runat="server" Text="Neighbourhood" Checked="false"/></p>
                            <p><asp:CheckBox ID="chk_method_HAR" runat="server" Text="Hit-and-Run" Checked="false"/></p>

                            <%--<asp:CheckBox ID="chk_multiMode" runat="server" Text="Multi-Mode" Checked="false" OnCheckedChanged="chk_multiMode_checkChanged"/>--%>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="radioButton_InitNet_FixedorRandom" runat="server" RepeatDirection="Vertical"
                                RepeatLayout="Table">
                                <asp:ListItem Text="Fixed" Value="Fixed" Selected="False"></asp:ListItem>
                                <asp:ListItem Text="Random" Value="Random" Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                    </asp:TableRow>
                    <asp:TableRow>
                        <%--<asp:TableCell>
                        <asp:RadioButtonList ID="radioButton_MCMC_methods" runat="server" RepeatDirection="Vertical">
                        <asp:ListItem Text="Metropolis-Hastings" Value="Metropolis-Hastings" Selected="False"></asp:ListItem>
                        <asp:ListItem Text="Neighbourhood" Value="Neighbourhood" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Hit-and-Run" Value="Hit-and-Run" Selected="False"></asp:ListItem>
                        </asp:RadioButtonList>
                            </asp:TableCell>--%></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lbl"> Run Scaled Value</asp:Label></asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="txt_HAR_lambda" runat="server" Visible="True"></asp:TextBox></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableHeaderCell> Output Settings </asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Table runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableHeaderCell HorizontalAlign="Center">Numerical Outputs </asp:TableHeaderCell>
                                    <asp:TableHeaderCell HorizontalAlign="Center">Graphical Outputs </asp:TableHeaderCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:CheckBox ID="checkBox_SelectedNets_with_Freq" Text="Sampled Networks and their frequencies"
                                            Checked="true" runat="server" /></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:CheckBox ID="checkBox_LogPosterior_VS_iteration" Text="Log-posterior function VS iterations"
                                            Checked="true" runat="server" /></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:CheckBox ID="checkBox_LogPosterior" Text="Log-posterior function" Checked="true"
                                            runat="server" /></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:CheckBox ID="checkBox_MeanPosteriorNet" Text="Mean-Posterior network" Checked="true"
                                            runat="server" /></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:CheckBox ID="checkBox_MeanPosterior" Text="Mean-posterior at threshold:" Checked="true"
                                            runat="server" /></asp:TableCell>
                                    <asp:TableCell>
                                        <asp:CheckBox ID="checkBox_HighestFreqNet" Text="Highest frequency network" Checked="true"
                                            runat="server" /></asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txt_MeanPosterior_Th" runat="server" Text="0.5"></asp:TextBox></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:Button ID="btn_SubmitaJob" runat="server" Text="Submit a Job" OnClick="btn_SubmitaJob_click" /></asp:TableCell></asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell Width="20%" VerticalAlign="Top" HorizontalAlign="Right">
                <asp:Table runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">
                    <asp:TableRow>
                        <asp:TableHeaderCell Font-Overline="False" HorizontalAlign="Center">Feedback on BN-MCMC</asp:TableHeaderCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:TextBox runat="server" ID="txt_FeedbackText" TextMode="MultiLine" BorderStyle="Inset"
                                Width="100%" Height="100%" /></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:Button runat="server" ID="Button1" Text="Submit Feedback" /></asp:TableCell>
                        <%--<asp:TableCell><asp:Button runat="server" ID="btn_Submit_Feedback" Text="Submit Feedback" /></asp:TableCell>--%>
                    </asp:TableRow>
                    <asp:TableRow>
                        <%--<asp:TableCell HorizontalAlign="Center">
                            <asp:Label runat="server" ID="lable1" Text="Run Progress" Visible="true" Enabled="true" /></asp:TableCell>--%>
                        <%--<asp:TableCell><asp:Button runat="server" ID="btn_Submit_Feedback" Text="Submit Feedback" /></asp:TableCell>--%>
                    </asp:TableRow>
                    <asp:TableRow>
                        <%--<asp:TableCell HorizontalAlign="Center">
                                
                        </asp:TableCell>--%>
                        <%--<asp:TableCell><asp:Button runat="server" ID="btn_Submit_Feedback" Text="Submit Feedback" /></asp:TableCell>--%>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <center> <div id="dvOverlay" style="background-color:#393a2d; opacity:0.2; position:fixed; display:none; width: 100%; height: 100%; left: 0; right:0; top: 0; left:0;"></div></center>
    
             <div id="dvProgressBar" style="height:62px; width:275px;z-index:999999; top:140px; left:40%; position:fixed; background-color:#ffffff; border:1px solid lightsteelblue; display:none;">
        <center>
            <div style="height:25px;background-color:lightsteelblue; color: White; text-align:center; font-family:Tahoma;"><b>&nbsp;&nbsp;Run Progress</b></div>
            <div id="dvStatus_MH" style="display:none; width:100%; font-family:Tahoma; font-size:12px; color:Black; margin:7px 0 0 0;" >Waiting for server response....</div>
            <div id="dv_MH_gap1" style="display:none; height:10px;"></div>
            <div id="dvTest_MH" style="display:none; height:16px; width:200px; border:1px solid lightgray;">                
                <table style="width:200px; height:16px; border-spacing:0px;">
                <%--<tr id="trMain_MH"></tr>--%>
                <tr id="trMain_MH"></tr>
                    </table>
            </div> 
            <div id="dv_MH_gap2" style="display:none; height:15px;"></div>
            
            <div id="dvStatus_NS" style="display:none; width:100%; font-family:Tahoma; font-size:12px; color:Black; margin:7px 0 0 0;" >Waiting for server response....</div>
            <div id="dv_NS_gap1" style="display:none; height:10px;"></div>
            <div id="dvTest_NS" style="display:none; height:16px; width:200px; border:1px solid lightgray;">                
                <table style="width:200px; height:16px; border-spacing:0px;">
                <%--<tr id="trMain_NS"></tr>--%>
                <tr id="trMain_NS"></tr>
                    </table>
            </div> 
            <div id="dv_NS_gap2" style="display:none; height:15px;"></div>
            
            <div id="dvStatus_HAR" style="display:none; width:100%; font-family:Tahoma; font-size:12px; color:Black; margin:7px 0 0 0;" >Waiting for server response....</div>
            <div id="dv_HAR_gap1" style="display:none; height:10px;"></div>
            <div id="dvTest_HAR" style="display:none; height:16px; width:200px; border:1px solid lightgray;">                
                <table style="width:200px; height:16px; border-spacing:0px;">
                <%--<tr id="trMain_HAR"></tr>--%>
                <tr id="trMain_HAR"></tr>
                    </table>
            </div> 
            <div id="dv_HAR_gap2" style="display:none; height:20px;"></div>
            
            <div>
                <center>
                    <input type="button" value="Terminate all Processes" onclick="TerminateLongProcess()" />
                </center>
            </div>     
            <div id="Div1" style="display:none; height:60px;"></div>
            
        </center>  
    </div>

                            <div id="dvReport" runat="server"></div>

</asp:Content>
