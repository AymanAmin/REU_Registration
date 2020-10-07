<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="NewStudentsFile.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.NewStudentsFile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("NewStudentsFile-Title", "New Students File") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-header">
                    <h5><span>
                        <asp:literal id="Literal1" runat="server"></asp:literal>
                        <% = ElectronicSubmission.FieldNames.getFieldName("NewStudentsFile-ListofStudents", "List of Students") %> </span></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <li><i class="feather full-card icon-maximize"></i></li>
                            <li><i class="feather icon-minus minimize-card"></i></li>
                        </ul>

                    </div>
                </div>
                <div class="col-md-12"><hr /></div>
                
                <!-- start of table -->
                <div class="table-responsive" style="padding: 2%;">
                    <table id="issue-list-table" class="table dt-responsive width-100">
                        <thead class="text-left">
                            <tr>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("NewStudentsFile-ID", "ID") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("NewStudentsFile-StudentName", "Student Name") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("NewStudentsFile-Phone", "Phone") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("NewStudentsFile-Email", "Email") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("NewStudentsFile-Date", "Date") %></th>
                            </tr>
                        </thead>
                        <tbody class="text-left">
                             <div runat="server" id="txtListofStudentsData">
                                            <!-- Create Table Send Treatment in Code behind Function loadListViewTreatment()-->
                                        </div>
                            <asp:literal id="txtListofStudents" runat="server"></asp:literal>
                        </tbody>
                    </table>
                </div>
                <!-- end of table -->
            </div>
        </div>

    </div>
</asp:Content>
