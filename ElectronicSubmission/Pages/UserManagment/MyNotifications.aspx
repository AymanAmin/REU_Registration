<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="MyNotifications.aspx.cs" Inherits="ElectronicSubmission.Pages.Setting.UserManagment.MyNotifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("MyNotifications-Title", "ECMS - My Notification") %></title>
    <script>setTimeout(function () { document.getElementById("header-div").style.display = "none"; }, 1);</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <!-- Activity -->
        <div class="col-md-6">
            <div class="card latest-update-card ScrollStyle">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("MyNotifications-MyActivites", "My Activites") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <!--<li><i class="fa fa fa-wrench open-card-option"></i></li>-->
                            <li><i class="fa fa-window-maximize full-card"></i></li>
                            <li><i class="fa fa-minus minimize-card"></i></li>
                            <li>
                                <asp:LinkButton ID="Refresh" runat="server" OnClick="Refresh_Click"><i class="fa fa-refresh reload-card"></i></asp:LinkButton></li>
                            <!--<li><i class="fa fa-trash close-card"></i></li>-->
                        </ul>
                    </div>
                </div>

                <div class="card-block user-activity-card feed-card">
                    <asp:Literal ID="Activity" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
