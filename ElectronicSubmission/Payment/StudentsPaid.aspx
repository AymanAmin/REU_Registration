<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="StudentsPaid.aspx.cs" Inherits="ElectronicSubmission.Payment.StudentsPaid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-Title", "Students Paid") %></title>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row" onload="exportdata()">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-header">
                    <h5><span>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        <% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-ListofStudents", "List of Students") %> </span></h5>
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
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-Expand", "Expand") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-Actions", "Actions") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-Status", "Status") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-FileNo", "File No") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-EnglishName", "English Name") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-ArabicName", "Arabic Name") %></th>
                                
                                
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-NationalID", "National ID") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-TypeOfPayment", "Type Of Payment") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-Amount", "Amount") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-NationalName", "National Name") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-PaymentFor", "Payment For") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-UUID", "UUID") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-CreationDate", "Creation Date") %></th>

                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-Phone", "Phone") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPaid-Email", "Email") %></th>
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
