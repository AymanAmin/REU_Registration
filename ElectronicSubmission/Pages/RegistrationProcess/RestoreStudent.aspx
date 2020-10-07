<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="RestoreStudent.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.RestoreStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("RestoreStudent-Title", "Restore Student") %></title>
    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                     <% = ElectronicSubmission.FieldNames.getFieldName("RestoreStudent-DeleteHeader", "Restore Student") %>
                </div>
                <div class="modal-body">
                    <% = ElectronicSubmission.FieldNames.getFieldName("RestoreStudent-DeleteMessage", "Are you sure you want to restore this student?") %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><% = ElectronicSubmission.FieldNames.getFieldName("RestoreStudent-Cancel", "Cancel") %></button>
                    <a class="btn btn-success btn-ok" style="color:white;"><% = ElectronicSubmission.FieldNames.getFieldName("RestoreStudent-Restore", "Restore") %></a>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="col-md-6">
                    <asp:RadioButton ID="New" runat="server" Checked="true" AutoPostBack="true" GroupName="Old_New" OnCheckedChanged="New_CheckedChanged" />
                     <% = ElectronicSubmission.FieldNames.getFieldName("ListView-NewFiles", "New Files") %>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="col-md-6">
                    <asp:RadioButton ID="Old" runat="server" Checked="false" AutoPostBack="true" GroupName="Old_New" OnCheckedChanged="Old_CheckedChanged" />
                    <% = ElectronicSubmission.FieldNames.getFieldName("ListView-OldFiles", "Old Files") %>
                </div>
            </div>
        </div>
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
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Expand", "Expand") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Actions", "Actions") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Status", "Status") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-AssignTo", "Assign To") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-EnglishName", "English Name") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-ArabicName", "Arabic Name") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Phone", "Phone") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Email", "Email") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Address", "Address") %></th>
                                <th><% = ElectronicSubmission.FieldNames.getFieldName("ListView-CreationDate", "Creation Date") %></th>
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

    <!-- Delete file -->
    <script>
        $('#confirm-delete').on('show.bs.modal', function(e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            
            $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
        });
    </script>
</asp:Content>
