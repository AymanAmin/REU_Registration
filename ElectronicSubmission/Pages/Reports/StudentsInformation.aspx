<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="StudentsInformation.aspx.cs" Inherits="ElectronicSubmission.Pages.Reports.StudentsInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Title", "Students Information") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-header">
                    <h5><span>
                        <asp:literal id="Literal1" runat="server"></asp:literal>
                        <% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-StudentsInformation", "Students Information") %> </span></h5>
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
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-IdTrack", "Id Track") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-IDNumber", "ID Number") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-StudentName", "Student Name") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Nationality", "Nationality") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Specialization", "Specialization") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Specialization2", "Specialization2") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-TypeofAdmission", "Type of Admission") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Phone", "Phone") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Email", "Email") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Address", "Address") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Status", "Status") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-HighSchool", "High School") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Capabilities", "Capabilities") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Achievement", "Achievement") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Total", "Total") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("StudentsInformation-Date", "Date") %></th>
                            </tr>
                        </thead>
                        <tbody class="text-left">
                            <div runat="server" id="txtStudentListData">
                                            <!-- Create Table Send Treatment in Code behind Function loadListViewTreatment()-->
                              </div>
                            <asp:literal id="txtStudentsList" runat="server"></asp:literal>
                        </tbody>
                    </table>
                </div>
                <!-- end of table -->
            </div>
        </div>

    </div>
</asp:Content>
