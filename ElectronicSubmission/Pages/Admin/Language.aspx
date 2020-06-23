<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="Language.aspx.cs" Inherits="ElectronicSubmission.Pages.Admin.Language" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("Language-Title", "Admission - Language") %></title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <div class="box-list" style="background-color: white;">
        <div class="row">
    <div class="p-10 z-depth-3 waves-effect dt-responsive table-responsive">
        <dx:ASPxGridView Style="width: 100%" ID="LanguageGridView" runat="server" AutoGenerateColumns="False" DataSourceID="LanguageDataSource" EnableTheming="True" KeyFieldName="Language_Detial_Id" Theme="MetropolisBlue" OnRowDeleted="LanguageGridView_RowDeleted" OnRowInserted="LanguageGridView_RowInserted" OnRowUpdated="LanguageGridView_RowUpdated">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsSearchPanel Visible="True" />
            <SettingsCommandButton>
                <NewButton Text=" ">
                    <Styles>
                        <Style CssClass="icofont icofont-ui-add text-primary h6" VerticalAlign="Middle">
                                </Style>
                    </Styles>
                </NewButton>
                <EditButton Text=" ">
                    <Styles>
                        <Style CssClass=" icofont icofont-ui-edit text-primary h6">
                                </Style>
                    </Styles>
                </EditButton>
                <DeleteButton Text=" ">
                    <Styles>
                        <Style CssClass="icofont icofont-ui-delete text-danger h6">
                                </Style>
                    </Styles>
                </DeleteButton>
                <UpdateButton Text=" ">
                    <Styles>
                        <Style CssClass="icofont icofont-save text-primary h6" VerticalAlign="Middle">
                                </Style>
                    </Styles>
                </UpdateButton>

                <CancelButton Text=" ">
                    <Styles>
                        <Style CssClass="icofont icofont-ui-close text-warning h6" VerticalAlign="Middle">
                                </Style>
                    </Styles>
                </CancelButton>
            </SettingsCommandButton>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="4" Caption="Action">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Language_Detial_Id" ReadOnly="True" VisibleIndex="0" Caption="ID" Width="10%" Name="LangID">
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Language_Detial_FieldName" VisibleIndex="2" Caption="Field Name" Name="LangFieldName">
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Language_Detial_Value" VisibleIndex="3" Caption="Value" Name="LangValue">
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Language Name" FieldName="Language_Master_Id" VisibleIndex="1" Name="LangName">
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                    <PropertiesComboBox DataSourceID="LanguageMasterDataSource" TextField="Language_Name" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
            </div>
        </div>
    <asp:EntityDataSource ID="LanguageDataSource" runat="server" ConnectionString="name=REU_RegistrationEntities" DefaultContainerName="REU_RegistrationEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Lanuage_Detials" EntityTypeFilter="Lanuage_Detials">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="LanguageMasterDataSource" runat="server" ConnectionString="name=REU_RegistrationEntities" DefaultContainerName="REU_RegistrationEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LanguageMasters" EntityTypeFilter="LanguageMaster">
    </asp:EntityDataSource>
</asp:Content>
