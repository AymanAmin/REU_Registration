<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="ListView.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.ListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Title", "Student List") %></title>
    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      /*  setTimeout(function () {
            location = '../../Pages/RegistrationProcess/ListView.aspx'
        }, 60000)*/
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <% = ElectronicSubmission.FieldNames.getFieldName("ListView-DeleteHeader", "Delete Student") %>
                </div>
                <div class="modal-body">
                    <% = ElectronicSubmission.FieldNames.getFieldName("ListView-DeleteMessage", "Are you sure you want to delete this Student?") %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Cancel", "Cancel") %></button>
                    <a class="btn btn-danger btn-ok" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("ListView-Delete", "Delete") %></a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- statustic with progressbar  start -->
        <div class="col-xl-3 col-md-6">
            <div class="card statustic-progress-card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("ListView-AllRecords", "All Records") %></h5>
                </div>
                <div class="card-block">
                    <div class="row align-items-center">
                        <div class="col">
                            <label class="label bg-c-lite-green">
                                <asp:Literal ID="txtFirstPercentage" runat="server"></asp:Literal><i class="m-l-10 feather icon-arrow-up"></i>
                            </label>
                        </div>
                        <div class="col text-right">
                            <h5 class="">
                                <asp:Literal ID="txtFirst" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                    <div class="progress m-t-15">
                        <asp:Literal ID="txtFirstPercentageCss" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card statustic-progress-card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("ListView-InProgress", "In Progress") %></h5>
                </div>
                <div class="card-block">
                    <div class="row align-items-center">
                        <div class="col">
                            <label class="label label-warning">
                                <asp:Literal ID="txtSecondPercentage" runat="server"></asp:Literal>
                                <i class="m-l-10 feather icon-arrow-up"></i>
                            </label>
                        </div>
                        <div class="col text-right">
                            <h5 class="">
                                <asp:Literal ID="txtSecond" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                    <div class="progress m-t-15">
                        <asp:Literal ID="txtSecondPercentageCss" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card statustic-progress-card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("ListView-CompletedSuccessfully", "Completed Successfully") %></h5>
                </div>
                <div class="card-block">
                    <div class="row align-items-center">
                        <div class="col">
                            <label class="label label-success">
                                <asp:Literal ID="txtThirdPercentage" runat="server"></asp:Literal>
                                <i class="m-l-10 feather icon-arrow-up"></i>
                            </label>
                        </div>
                        <div class="col text-right">
                            <h5 class="">
                                <asp:Literal ID="txtThird" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                    <div class="progress m-t-15">
                        <asp:Literal ID="txtThirdPercentageCss" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card statustic-progress-card">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("ListView-EndinFailure", "End in Failure") %></h5>
                </div>
                <div class="card-block">
                    <div class="row align-items-center">
                        <div class="col">
                            <label class="label label-danger">
                                <asp:Literal ID="txtFourPercentage" runat="server"></asp:Literal>
                                <i class="m-l-10 feather icon-arrow-up"></i>
                            </label>
                        </div>
                        <div class="col text-right">
                            <h5 class="">
                                <asp:Literal ID="txtFour" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                    <div class="progress m-t-15">
                        <asp:Literal ID="txtFourPercentageCss" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
        <!-- statustic with progressbar  end -->
    </div>

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
        $('#confirm-delete').on('show.bs.modal', function (e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));

            $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
        });
    </script>
</asp:Content>
