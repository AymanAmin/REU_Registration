<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="StudentsPerSpecialization.aspx.cs" Inherits="ElectronicSubmission.Pages.Reports.StudentsPerSpecialization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPerSpecialization-Title", "Students Per Specialization") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
     <div class="row">
        <div class="col-md-12">
            <div class="card user-activity-card feed-card">
                <div class="card-header">
                    <h5><span>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        <% = ElectronicSubmission.FieldNames.getFieldName("StudentsPerSpecialization-ListofSpecialization", "List of Specialization") %> </span></h5>
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
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPerSpecialization-Specialization", "Specialization") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPerSpecialization-CountPrimaryDesire", "Count Primary Desire") %></th>
                                <th ><% = ElectronicSubmission.FieldNames.getFieldName("StudentsPerSpecialization-CountSecondaryDesire", "Count Secondary Desire") %></th>
                            </tr>
                        </thead>
                        <tbody class="text-left">
                            <asp:Literal ID="txtSpecializationList" runat="server"></asp:Literal>
                        </tbody>
                    </table>
                </div>
                <!-- end of table -->
            </div>
        </div>

    </div>
</asp:Content>
