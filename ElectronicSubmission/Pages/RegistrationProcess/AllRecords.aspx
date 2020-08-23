<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="AllRecords.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.AllRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("AllRecords-Title", "All Student") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-header">
                    <h5><span>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        <% = ElectronicSubmission.FieldNames.getFieldName("ListView-ListofStudents", "List of Students") %> </span></h5>
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
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Expand", "Expand") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Actions", "Actions") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Status", "Status") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-AssignTo", "Assign To") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-EnglishName", "English Name") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-ArabicName", "Arabic Name") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Phone", "Phone") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Email", "Email") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Address", "Address") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Country", "Country") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("ListView-CreationDate", "Creation Date") %></th>
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
