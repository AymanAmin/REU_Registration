<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ElectronicSubmission.Pages.Setting.UserManagment.Profile" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Title", "User Management - Profile") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">


    <div class="page-body">
        <!-- Article Editor card start -->
        <%--<div class="card" runat="server">--%>
         
            <div class="card-block">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cover-profile">
                            <div class="profile-bg-img">
                                <img class="profile-bg-img img-fluid"  src="..\..\..\..\Theme\files\assets\images\user-profile\bg-img1.jpg" alt="bg-img">
                                <div class="card-block user-info">
                                    <div class="col-md-12">
                                        <div class="media-left"  style="max-width:165px;">
                                             <div class="img-hover">
                                                <asp:Image ID="Emp_Profile1" class="img-fluid img-radius"  runat="server"   alt="Profile.jpg"  ImageUrl="~/media/Profile/Profile.jpg"  />
                                                <div class="img-overlay img-radius">
                                                    <span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="media-body row">
                                            <div class="col-lg-12">
                                                <div class="user-title">
                                                    <h2><label id="Name" runat="server" ></label></h2>
                                                    <span class="text-white"><label id="Position" runat="server" ></label></span>
                                                </div>
                                            </div>
                                            <div>
                                                <div class="pull-right cover-btn">
                                               </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--profile cover end-->
                <div class="row">
                    <div class="col-lg-12">
                        <!-- tab header start -->
                        <div class="tab-header card">
                            <ul class="nav nav-tabs md-tabs tab-timeline" role="tablist" id="mytab">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#personal" role="tab"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Personal", "Personal Info") %></a>
                                    <div class="slide"></div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#changePassWord" role="tab"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-changePassWord", "Change Password") %></a>
                                    <div class="slide"></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- tab header end -->
                <!-- tab header end -->
                <!-- tab content start -->
                <div class="tab-content">
                    <!-- tab panel personal start -->
                    <div class="tab-pane active" id="personal" role="tabpanel">
                        <!-- personal card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-header-text"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-AboutMe", "About Me") %></h5>
                                <button id="edit-btn" type="button" class="btn btn-sm btn-primary waves-effect waves-light f-right">
                                    <i class="icofont icofont-edit"></i>
                                </button>
                            </div>
                            <div class="card-block">
                                <div class="view-info">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="general-info">
                                                <div class="row">
                                                    <div class="col-lg-12 col-xl-6">
                                                        <div class="table-responsive">
                                                            <table class="table m-0">
                                                                <tbody>
                                                                    <tr>
                                                                        <th scope="row"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-ArabicName", "Arabic Name") %></th>
                                                                        <td><label runat="server" id="ArabicName"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Email", "Email") %></th>
                                                                        <td><label runat="server" id="Email"> </label></td>
                                                                    </tr>
                                                                     <tr>
                                                                        <th scope="row"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Language", "Language") %></th>
                                                                        <td><label runat="server" id="EmpLanguage"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Active", "Active") %></th>
                                                                        <td><label runat="server" id="ActiveL"> </label></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                    <div class="col-lg-12 col-xl-6">
                                                        <div class="table-responsive">
                                                            <table class="table">
                                                                <tbody>
                                                                    <tr>
                                                                        <th scope="row"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-EnglishName", "English Name") %></th>
                                                                        <td><label runat="server" id="EnglishName"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Phone", "Phone") %></th>
                                                                        <td><label runat="server" id="Phone"> </label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Group", "Group") %></th>
                                                                        <td><label runat="server" id="Group"> </label></td>
                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <th scope="row"></th>
                                                                        <td></td>
                                                                    </tr>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                </div>
                                                <!-- end of row -->
                                            </div>
                                            <!-- end of general info -->
                                        </div>
                                        <!-- end of col-lg-12 -->
                                    </div>
                                    <!-- end of row -->
                                </div>
                                <!-- end of view-info -->
                                <div class="edit-info">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="general-info">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Profile", "Profile") %></label>
                                                                        <div class="card-block" style="max-width:250px;">
                                                                            <div class="img-hover">
                                                                                <asp:Image ID="Emp_Profile" class="img-fluid img-radius" alt="Profile.jpg" runat="server" ImageUrl="~/media/Profile/Profile.jpg" />
                                                                                <div class="img-overlay img-radius">
                                                                                    <span>
                                                                                        <asp:FileUpload ID="EmpProfile" runat="server" class="form-control" />
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                    <div class="col-lg-6">
                                                        <table class="table">
                                                            <tbody>
                                                                    <tr>
                                                                    <td>
                                                                        <label ><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Phone", "Phone") %></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                                                            <asp:TextBox ID="Employee_Phone" runat="server" class="form-control" placeholder="Enter Employee Phone" TextMode="SingleLine"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="Employee_PhoneValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Employee Phone" ValidationGroup="Per" ControlToValidate="Employee_Phone" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>
                                                                        <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Email", "Email") %></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                                                                            <asp:TextBox ID="Employee_Email" runat="server" class="form-control" placeholder="Enter Employee Email" TextMode="SingleLine"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="Employee_EmailValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Email" ValidationGroup="Per" ControlToValidate="Employee_Email" Display="Dynamic" SetFocusOnError="True">
                                                                            </asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                      <label><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Language", "Language") %></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-chart-flow-alt-1"></i></span>
                                                                             <asp:DropDownList ID="Language" runat="server" class="form-control" DataSourceID="LangDataSource" DataTextField="Language_Name" DataValueField="ID"  ></asp:DropDownList>
                                                                            <asp:EntityDataSource ID="LangDataSource" runat="server" ConnectionString="name=REU_RegistrationEntities" DefaultContainerName="REU_RegistrationEntities" EnableFlattening="False" EntitySetName="LanguageMasters" EntityTypeFilter="LanguageMaster">
                                                                            </asp:EntityDataSource>
                                                                        </div>
                                                                         <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="LanguageValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Language" ValidationGroup="Per" ControlToValidate="Language" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                          </div>
                                                                    </td>
                                                                </tr>                                                         
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!-- end of table col-lg-6 -->
                                                </div>
                                                <!-- end of row -->
                                                <div class="text-center">
                                                    <asp:Button  ID="EmpUpdate"  runat="server" Text="Save" class="btn btn-primary waves-effect waves-light m-r-20" ValidationGroup="Per" OnClick="EmpUpdate_Click"  />
                                                    <a href="#!" id="edit-cancel" class="btn btn-default waves-effect btn-outline-danger"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Cancel", "Cancel") %></a>
                                                </div>
                                            </div>
                                            <!-- end of edit info -->
                                        </div>
                                        <!-- end of col-lg-12 -->
                                    </div>
                                    <!-- end of row -->
                                </div>
                                <!-- end of edit-info -->
                            </div>
                            <!-- end of card-block -->
                        </div>
                        <!-- personal card end-->
                    </div>
                    <!-- tab pane personal end -->

                    <div class="tab-pane" id="changePassWord" role="tabpanel">
                        <!-- info card start -->
                         <div class="card">
                            <div class="card-header">
                                <h5 class="card-header-text"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Change Password", "Change Password") %></h5>
                            </div>
                                <!-- end of view-info -->
                                <div class="edit-info-11">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="general-info">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                       <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-OldPassword", "Old Password") %></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                                            <asp:TextBox ID="OldPassWord" runat="server" class="form-control" placeholder="Enter Old Password" TextMode="SingleLine" type="password"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="OldPassWordValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Old Password" ValidationGroup="Per2" ControlToValidate="OldPassWord" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                      <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-NewPassword", "New Password") %></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                                            <asp:TextBox ID="NewPassWord" runat="server" class="form-control" placeholder="Enter New Password" TextMode="SingleLine" type="password"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="NewPassWordValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter New Password" ValidationGroup="Per2" ControlToValidate="NewPassWord" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                              <tr>
                                                                    <td>
                                                                         <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-TryNewPassword", "Try New Password") %></label>
                                                                        <div class="input-group">
                                                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                                            <asp:TextBox ID="TryNewPassWord" runat="server" class="form-control" placeholder="Try New Password" TextMode="SingleLine" type="password" ValidationGroup="Per2"></asp:TextBox>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <asp:RequiredFieldValidator ID="TryNewPassWordValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Try New Password" ValidationGroup="Per2" ControlToValidate="TryNewPassWord" Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <!-- end of row -->
                                                <div class="text-center">
                                                    <asp:Button  ID="ChangeButton"  runat="server" Text="Save" class="btn btn-primary waves-effect waves-light m-r-20" ValidationGroup="Per2" OnClick="ChangeButton_Click"  />
                                                    <a href="#!" id="edit-cancel2" class="btn btn-default waves-effect btn-outline-danger"><% = ElectronicSubmission.FieldNames.getFieldName("Profile-Cancel", "Cancel") %></a>
                                                </div>
                                                <br /><br />
                                            </div>
                                            <!-- end of edit info -->
                                        </div>
                                        <!-- end of col-lg-12 -->
                                    </div>
                                    <!-- end of row -->
                                </div>
                         </div>
                        <!-- end Change PassWord-->
                    </div>
            </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->
    </div>
</asp:Content>
