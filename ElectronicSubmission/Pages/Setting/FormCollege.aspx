<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="FormCollege.aspx.cs" Inherits="ElectronicSubmission.Pages.Setting.FormCollege" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("FormCollege-Title", "REU - College") %></title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- Page-body start -->
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card ScrollStyle ">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">

                <div class="row col-sm-12">
                    <div id="add-model" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <div class="login-card card-block login-card-modal">

                                <div class="text-center">
                                    <img src="..\..\..\..\Theme\files\assets\images\auth\logo.png" alt="logo.png" />
                                </div>
                                <div class="card m-t-15">
                                    <div class="auth-box card-block">
                                        <div class="row m-b-20">
                                            <div class="col-md-12">
                                                <h3 class="text-center txt-primary"><% = ElectronicSubmission.FieldNames.getFieldName("FormCollege-AddCollege", "Add College") %></h3>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 ">
                                            <div class="form-group col-sm-12 j-unit" style="margin-top: 5%">
                                                <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormCollege-ArabicName", "Arabic Name") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1"><i class="icofont icofont-underline"></i></span>
                                                    <asp:TextBox ID="txtCollege_Name" runat="server" class="form-control" placeholder="Enter Name in Arabic" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-12" style="">
                                                    <asp:RequiredFieldValidator ID="RFVtxtCollege_Name" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" ValidationGroup="College" ControlToValidate="txtCollege_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-12 j-unit">
                                                <label class="j-label"><% = ElectronicSubmission.FieldNames.getFieldName("FormCollege-EnglishName", "English Name") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                                                <div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon2"><i class="icofont icofont-underline"></i></span>
                                                    <asp:TextBox ID="txtCollege_Name_En" runat="server" class="form-control" placeholder="Enter Name in English" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="col-sm-12" style="">
                                                    <asp:RequiredFieldValidator ID="RFVtxtCollege_Name_En" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Name" ValidationGroup="College" ControlToValidate="txtCollege_Name_En" Display="Dynamic"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-12" style="text-align: center; margin-top: -2%">
                                                <asp:Button ID="Save" runat="server" class="btn btn-primary" ValidationGroup="College" OnClick="Save_Click" />

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <!-- end of form -->
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-sm-12 <%= ElectronicSubmission.FieldNames.getTextRTL() %>" style="margin-top: -2%">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-model"><% = ElectronicSubmission.FieldNames.getFieldName("FormCollege-AddCollege", "Add College") %></button>
                    </div>
                    <div class="form-group col-sm-12 blockquote">
                        <div class="dt-responsive table-responsive">
                            <dx:ASPxGridView ID="CollegeGridView" Style="width: 100%; text-align: center; margin-top: 0%" runat="server" AutoGenerateColumns="False" DataSourceID="CollegeDataSource" KeyFieldName="Collage_ID" Theme="Mulberry">
                                <Settings />
                                <SettingsCommandButton>
                                    <EditButton Text=" ">
                                        <Styles>
                                            <Style CssClass=" icofont icofont-ui-edit text-primary h5">
                                            </Style>
                                        </Styles>
                                    </EditButton>
                                    <DeleteButton Text=" ">
                                        <Styles>
                                            <Style CssClass="icofont icofont-ui-delete text-danger h5">
                                            </Style>
                                        </Styles>
                                    </DeleteButton>
                                    <UpdateButton Text=" ">
                                        <Styles>
                                            <Style CssClass="icofont icofont-save text-primary h5" VerticalAlign="Middle">
                                </Style>
                                        </Styles>
                                    </UpdateButton>

                                    <CancelButton Text=" ">
                                        <Styles>
                                            <Style CssClass="icofont icofont-ui-close text-warning h5" VerticalAlign="Middle">
                                </Style>
                                        </Styles>
                                    </CancelButton>
                                </SettingsCommandButton>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Collage_ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Caption="ID">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Collage_Name_Ar" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Arabic Name">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="3" ButtonRenderMode="Link" ButtonType="Link" Caption="Action">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="English Name" FieldName="Collage_Name_En" Name="English Name" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                        <asp:EntityDataSource ID="CollegeDataSource" runat="server" ConnectionString="name=REU_RegistrationEntities" DefaultContainerName="REU_RegistrationEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Collages">
                        </asp:EntityDataSource>
                    </div>
                    <hr />
                </div>

            </div>
            <!-- Article Editor card end -->
        </div>
        <!-- Page-body end -->

    </div>
</asp:Content>
