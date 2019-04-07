<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="BN_MCMC._Default" %>

<%--<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBox" TagPrefix="FreeTextBox"  %>--%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to BN-MCMC!
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
                        <asp:TableCell><asp:Label runat="server" Font-Bold="True"> Initial Network </asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:RadioButton ID="radioButton_InitNet_Fixed" runat="server" Text="Fixed" Checked="false" />
                            <asp:RadioButton ID="radioButton_InitNet_Random" runat="server" Text="Random" Checked = "true" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label1" runat="server" Font-Bold="True"> MCMC Methods </asp:Label></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:RadioButton ID="radioButton_MCMC_MH" runat="server" Text="Metropolis-Hastings" /></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:RadioButton ID="radioButton_MCMC_NS" runat="server" Text="Neighbourhood" Checked="true" /></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:RadioButton ID="radioButton_MCMC_HAR" runat="server" Text="Hit-n-Run" /></asp:TableCell></asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lbl"> Run Scaled Value</asp:Label></asp:TableCell><asp:TableCell></asp:TableCell></asp:TableRow>
                    <asp:TableRow><asp:TableCell><asp:TextBox ID="txt_HAR_lambda" runat="server" Visible="True"></asp:TextBox></asp:TableCell></asp:TableRow>
                   
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
                    <asp:TableCell><asp:CheckBox ID="checkBox_SelectedNets_with_Freq" Text="Sampled Networks and their frequencies" Checked="true" runat="server" /></asp:TableCell>
                    <asp:TableCell><asp:CheckBox ID="checkBox_LogPosterior_VS_iteration" Text="Log-posterior function VS iterations" Checked="true" runat="server" /></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                    <asp:TableCell><asp:CheckBox ID="checkBox_LogPosterior" Text="Log-posterior function" Checked="true" runat="server" /></asp:TableCell>
                    <asp:TableCell><asp:CheckBox ID="checkBox_MeanPosteriorNet" Text="Mean-Posterior network" Checked="true" runat="server" /></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                    <asp:TableCell><asp:CheckBox ID="checkBox_MeanPosterior" Text="Mean-posterior at threshold:" Checked="true" runat="server" /></asp:TableCell>
                    <asp:TableCell><asp:CheckBox ID="checkBox_HighestFreqNet" Text="Highest frequency network" Checked="true" runat="server" /></asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                    <asp:TableCell><asp:TextBox ID="txt_MeanPosterior_Th" runat="server" Text="0.5"></asp:TextBox></asp:TableCell>
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

                    <asp:TableRow><asp:TableCell HorizontalAlign="Center"><asp:Button ID="btn_SubmitaJob" runat="server" Text="Submit a Job" OnClick="btn_SubmitaJob_click" /></asp:TableCell></asp:TableRow>
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
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
