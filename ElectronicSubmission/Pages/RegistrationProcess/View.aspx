<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("View-Title", "View Student File") %></title>
    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.1.1" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">

    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <% = ElectronicSubmission.FieldNames.getFieldName("View-DeleteHeader", "Delete File") %>
                </div>
                <div class="modal-body">
                    <% = ElectronicSubmission.FieldNames.getFieldName("View-DeleteMessage", "Are you sure you want to delete this File?") %>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><% = ElectronicSubmission.FieldNames.getFieldName("View-Cancel", "Cancel") %></button>
                    <a class="btn btn-danger btn-ok" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("View-Delete", "Delete") %></a>
                </div>
            </div>
        </div>
    </div>

    <!-- All View cards start -->
    <div class="row">
        <!-- left View cards start -->
        <div class="col-sm-8">
            <!-- Assign card  -->
            <div class="card" id="DivAssign" runat="server" visible="false">
                <div class="row" style="padding: 2%">
                    <div class="col-sm-12">
                        <div class="form-group col-md-6 j-unit">
                            <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("View-Employees", "Employees") %></label>
                            <div class="input-group">
                                <span class="input-group-addon" id="basic-addon3"><i class="icofont icofont-tree"></i></span>
                                <asp:DropDownList ID="txtEmployees" runat="server" AutoPostBack="false" class="form-control form-control-primary"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-12" style="">
                            <asp:Button ID="btnAssign" class="btn btn-info btn-print-invoice m-b-10 btn-sm waves-effect waves-light m-r-20" runat="server" Text="Assign" OnClick="btnAssign_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Student Details card  -->
            <div class="card">
                <div class="row invoice-contact" style="margin-bottom: 2%; overflow-y: hidden;">
                    <div class="col-md-12">
                        <div class="invoice-box row">
                            <div class="col-sm-12">
                                <table class="table table-responsive invoice-table table-borderless" style="overflow-y: hidden;">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Image ID="txtProfileImage" runat="server" Style="width: 25%" class="m-b-10" alt="Profile Image" ImageUrl="/Theme/files/assets/images/user-profile/follower/f-1.jpg" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("View-SSN", "SSN") %> : </strong>
                                                <asp:Label ID="txtStudent_SSN" runat="server" Text="Student_SSN"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("View-StudentName", "Student Name") %> : </strong>
                                                <asp:Label ID="txtStudent_Name" runat="server" Text="Student_Name"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("View-Nationality", "Nationality") %> : </strong>
                                                <asp:Label ID="txtStudent_Nationality" runat="server" Text="Student_Nationality"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("View-Specialization", "Specialization") %> : </strong>
                                                <asp:Label ID="txtSpecialization" runat="server" Text="Student_Resource"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("View-OptionalSpecialization", "Optional Specialization") %> : </strong>
                                                <asp:Label ID="txtSpecializationOptional" runat="server" Text="Student_Resource"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("View-Resource", "Resource") %> : </strong>
                                                <asp:Label ID="txtStudent_Resource" runat="server" Text="Student_Resource"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("View-TypeofAdmission", "Type of Admission") %> : </strong>
                                                <asp:Label ID="txtTypeofSubmission" runat="server" Text="Student_Resource"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-block">
                    <div class="row invoive-info">
                        <div class="col-md-4 col-xs-12 invoice-client-info">
                            <h6><% = ElectronicSubmission.FieldNames.getFieldName("View-ContactInfo", "Contact Info") %></h6>
                            <h6 class="m-0">
                                <asp:Label ID="txtStudent_Phone" runat="server" Text="+966 550 932 548"></asp:Label></h6>
                            <p class="m-0">
                                <asp:Label ID="txtStudent_Address" runat="server" Text="Saudi Arabia, Riyadh , Almalaz 60 street."></asp:Label>
                            </p>
                            <p>
                                <a href="#" class="__cf_email__">
                                    <asp:Label ID="txtStudent_Email" runat="server" Text="Ayman@softwarecornerit.com"></asp:Label></a>
                            </p>
                        </div>
                        <div class="col-md-4 col-sm-6 ">
                            <h6><% = ElectronicSubmission.FieldNames.getFieldName("View-AdditionalInformation", "Additional Information") %></h6>
                            <table class="table table-responsive invoice-table invoice-order table-borderless" style="overflow-y: hidden;">
                                <tbody>
                                    <tr>
                                        <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-IdTrack", "Id Track") %> : </th>
                                        <td class="view-table">#<asp:Label ID="txtStudent_Id" runat="server" Text="Pedding"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-Date", "Date") %> : </th>
                                        <td class="view-table">
                                            <asp:Label ID="txtStudent_CreationDate" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-Status", "Status") %> : </th>
                                        <td class="view-table">
                                            <asp:Label ID="txtStatus" runat="server" Text="Pedding"></asp:Label>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <h6><% = ElectronicSubmission.FieldNames.getFieldName("View-DegreesInformation", "Degrees Information") %></h6>
                            <table class="table table-responsive invoice-table invoice-order table-borderless">
                                <tbody>
                                    <tr>
                                        <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-HighSchool", "High School") %> : </th>
                                        <td class="view-table">
                                            <asp:Label ID="txtStudent_High_School_Degree" runat="server" Text="30%"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-Capabilities", "Capabilities") %> : </th>
                                        <td class="view-table">
                                            <asp:Label ID="txtStudent_Capabilities_Degree" runat="server" Text="30%"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-Achievement", "Achievement") %> : </th>
                                        <td class="view-table">
                                            <asp:Label ID="txtStudent_My_Achievement_Degree" runat="server" Text="40%"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-Total", "Total") %> : </th>
                                        <td class="view-table">
                                            <asp:Label ID="txtStudent_Total" runat="server" Text="70%"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="table-responsive">
                                <table class="table  invoice-detail-table">
                                    <thead>
                                        <tr class="thead-default">
                                            <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-FileName", "File Name") %></th>
                                            <th><% = ElectronicSubmission.FieldNames.getFieldName("View-Type", "Type") %></th>
                                            <th><% = ElectronicSubmission.FieldNames.getFieldName("View-Delete", "Delete") %></th>
                                            <th><% = ElectronicSubmission.FieldNames.getFieldName("View-View", "View") %></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Literal ID="txtFiles" runat="server"></asp:Literal>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action card  -->
            <div class="row" id="DivAction" runat="server" visible="false">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <div class="row text-left">
                                <div class="col-md-12" id="txtSetMeetingInfo" runat="server" visible="false">
                                    <div class="col-md-12">
                                        <div class="col-sm-12"><% = ElectronicSubmission.FieldNames.getFieldName("View-URLVideoLink", "URL Video Link") %></div>
                                        <div class="col-sm-12">
                                            <asp:TextBox ID="txtURL_Video" runat="server" class="form-control" TextMode="SingleLine" Style="width: 100%"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-sm-6">
                                            <div class="col-sm-12"><% = ElectronicSubmission.FieldNames.getFieldName("View-MeetingDate", "Meeting Date") %></div>
                                            <input type="date" id="txtMeeting_Date" runat="server" class="form-control" />
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="col-sm-12"><% = ElectronicSubmission.FieldNames.getFieldName("View-MeetingTime", "Meeting Time") %></div>
                                            <input type="time" id="txtMeeting_Time" runat="server" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12" id="txtContract_Label" runat="server" visible="false">
                                    <div class="col-sm-12"><% = ElectronicSubmission.FieldNames.getFieldName("View-ContractAttachments", "Contract Attachments") %></div>
                                    <div class="col-md-12">
                                        <asp:FileUpload ID="txtContracts" runat="server" class="form-control" AllowMultiple="True"  />
                                    </div>
                                </div>
                                <div class="col-md-12" id="txtTypeOfCash_Label" runat="server">
                                    <div class="col-sm-12"><% = ElectronicSubmission.FieldNames.getFieldName("View-InCaseOfCash", "In Case Of Cash") %></div>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="txtTypeOfCash" class="form-control"  runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <br />
                                    <asp:TextBox ID="txtNote" runat="server" class="form-control" TextMode="MultiLine" Style="width: 100%"></asp:TextBox>
                                </div>

                                <div class="col-sm-12 invoice-btn-group text-center">
                                    <br />
                                    <asp:Button ID="btnApprove" class="btn btn-success btn-print-invoice m-b-10 btn-sm waves-effect waves-light m-r-20" runat="server" Text="Approve" OnClick="btnApprove_Click" />
                                    <asp:Button ID="btnBranch2" class="btn btn-info btn-print-invoice m-b-10 btn-sm waves-effect waves-light m-r-20" runat="server" Text="Approve" OnClick="btnBranch2_Click" />
                                    <asp:Button ID="btnReject" class="btn btn-danger waves-effect m-b-10 btn-sm waves-light" runat="server" Text="Reject" OnClick="btnReject_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right View cards start -->
        <div class="col-md-4">
            <!-- Sequence card -->
            <div class="card latest-update-card ScrollStyle">
                <div class="card-header">
                    <h5><% = ElectronicSubmission.FieldNames.getFieldName("View-SequenceOfOperations", "Sequence Of Operations") %></h5>
                    <div class="card-header-right">
                        <ul class="list-unstyled card-option">
                            <!--<li><i class="fa fa fa-wrench open-card-option"></i></li>
                            <li><i class="fa fa-window-maximize full-card"></i></li>
                            <li><i class="fa fa-minus minimize-card"></i></li>
                            <li>
                                <asp:LinkButton ID="Refresh" runat="server" OnClick="Refresh_Click"><i class="fa fa-refresh reload-card"></i></asp:LinkButton></li>-->
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

    <script>
        $('#confirm-delete').on('show.bs.modal', function (e) {
            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));

            $('.debug-url').html('Delete URL: <strong>' + $(this).find('.btn-ok').attr('href') + '</strong>');
        });
    </script>

    <!-- End View cards start -->

</asp:Content>
