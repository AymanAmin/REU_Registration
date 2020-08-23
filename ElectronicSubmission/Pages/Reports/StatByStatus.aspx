<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="StatByStatus.aspx.cs" Inherits="ElectronicSubmission.Pages.Reports.StatByStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("StatByStatus-Title", "Statistics Per Status") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-header">
                    <h5><span>
                        <asp:literal id="Literal1" runat="server"></asp:literal>
                        <% = ElectronicSubmission.FieldNames.getFieldName("StatByStatus-ListofSpecialization", "Statistics Per Status") %> </span></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather full-card icon-maximize"></i></li>
                            <li><i class="feather icon-minus minimize-card"></i></li>
                        </ul>

                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-sm-6">
                        <div class="col-sm-12"><% = ElectronicSubmission.FieldNames.getFieldName("StatByStatus-Date", "Date") %></div>
                        <div class="col-sm-8"><input type="date" id="txtDate" runat="server" class="form-control" /></div>
                        <div class="col-sm-4"><asp:Button ID="btnSubmit" class="btn btn-success btn-print-invoice m-b-10 btn-sm waves-effect waves-light m-r-20" runat="server" Text="Search" OnClick="btnSubmit_Click" /></div>
                    </div>
                    <div class="col-sm-6">
                        
                    </div>
                    
                </div>
                <div class="col-md-12"><hr /></div>
                
                <!-- start of table -->
                <div class="table-responsive" style="padding: 2%;">
                    <table id="issue-list-table" class="table dt-responsive width-100">
                        <thead class="text-left">
                            <tr>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StatByStatus-Status", "Status") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StatByStatus-Count", "Count") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StatByStatus-Date", "Date") %></th>
                            </tr>
                        </thead>
                        <tbody class="text-left">
                            <asp:literal id="txtSpecializationList" runat="server"></asp:literal>
                        </tbody>
                    </table>
                </div>
                <!-- end of table -->
            </div>
        </div>

    </div>
</asp:Content>
