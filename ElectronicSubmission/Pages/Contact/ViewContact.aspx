<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="ViewContact.aspx.cs" Inherits="ElectronicSubmission.Pages.Contact.ViewContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-Title", "View Student File") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- All View cards start -->
    <div class="row">
        <!-- left View cards start -->
        <div class="col-sm-8">
            <!-- Student Details card  -->
            <div class="card <%= ElectronicSubmission.FieldNames.getBoardColor() %>">
                <div class="row invoice-contact" style="margin-bottom:2%">
                    <div class="col-md-12">
                        <div class="invoice-box row">
                            <div class="col-sm-12">
                                <table class="table table-responsive invoice-table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-Id", "Student Id") %> : </strong>
                                                <asp:Label ID="txtStudent_SSN" runat="server" Text="Student_SSN"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-Name", "Student Name") %> : </strong>
                                                <asp:Label ID="txtStudent_Name" runat="server" Text="Student Name"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-Phone", "Student Phone") %> : </strong>
                                                <asp:Label ID="txtStudent_Phone" runat="server" Text="Student Phone"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-Email", "Student E-mail") %> : </strong>
                                                <asp:Label ID="txtStudent_Email" runat="server" Text="Student E-mail"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-CreationDate", "Creation Date") %> : </strong>
                                                <asp:Label ID="txtCreationDate" runat="server" Text="Creation Date"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-Status", "Status") %> : </strong>
                                                <asp:Label ID="txtStatus" runat="server" Text="Status"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td><strong>
                                                <% = ElectronicSubmission.FieldNames.getFieldName("ViewContact-Message", "Message") %> : </strong>
                                                <asp:Label ID="txtMessage" runat="server" Text="Message"></asp:Label></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action card  -->
            <div class="row" id="DivAction" runat="server" visible="true">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-block">
                            <div class="row text-center">
                                <div class="col-sm-12 invoice-btn-group text-center">
                                    <br />
                                    <asp:Button ID="btnApprove" class="btn btn-success btn-print-invoice m-b-10 btn-sm waves-effect waves-light m-r-20" runat="server" Text="Completed Successfully" OnClick="btnApprove_Click" />
                                    <asp:Button ID="btnReject" class="btn btn-danger waves-effect m-b-10 btn-sm waves-light" runat="server" Text="Complete with Failure" OnClick="btnReject_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- End View cards start -->


</asp:Content>
