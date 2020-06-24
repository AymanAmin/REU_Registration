<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="OtherInfo.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.OtherInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-Title", "Other Info") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-header">
                    <h5><span>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        <% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-OtherInformations", "Other Informations") %> </span></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather full-card icon-maximize"></i></li>
                            <li><i class="feather icon-minus minimize-card"></i></li>
                        </ul>

                    </div>
                </div>
                <!-- start of table -->
                <div class="table-responsive" style="padding: 2%;">
                    <table id="issue-list-table" class="table dt-responsive width-100">
                        <thead class="text-left">
                            <tr>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-Expand", "Expand") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-Actions", "Actions") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-TrackId", "Track Id") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-Status", "Status") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-EnglishName", "English Name") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-ArabicName", "Arabic Name") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-Phone", "Phone") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-Email", "Email") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-NationalID", "National ID") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-MessageType", "Message Type") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-Message", "Message") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("OtherInfo-DateCreation", "Date Creation") %></th>
                            </tr>
                        </thead>
                        <tbody class="text-left">
                            <asp:Literal ID="txtStudentList" runat="server"></asp:Literal>
                        </tbody>
                    </table>
                </div>
                <!-- end of table -->
            </div>
        </div>

    </div>
</asp:Content>
