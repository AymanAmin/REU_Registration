<%@ Page Title="" Language="C#" MasterPageFile="~/MasterEn.Master" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="ElectronicSubmission.Pages.RegistrationProcess.StudentInfo" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Title", "ECMS -Student Info") %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body_Holder" runat="server">
    <!-- ckeditor.css-->
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\css\samples.css" />
    <link rel="stylesheet" href="~/Theme\files\bower_components\ckeditor\samples\toolbarconfigurator/lib/codemirror/neo.css" />

    
    <script type="text/javascript" language="javascript">

        function validatelimit(obj, maxchar) {

            if (this.id) obj = this;

            var remaningChar = maxchar - obj.value.length;

        if (remaningChar <= 0) {
            obj.value = obj.value.substring(maxchar, 0);
            return false;

        }
        else
        { return true; }
        }

    </script>

    <!-- Page-body start -->
    <div class="page-body">
        <!-- Article Editor card start -->
        <div class="card ScrollStyle">
            <div class="card-header">
                <div class="card-header-right">
                    <ul class="list-unstyled card-option">
                        <li><i class="feather icon-maximize full-card"></i></li>
                    </ul>
                </div>
            </div>
            <div class="card-block">
                <!-- Start Student Form-->

                <!-- Start Profile-->
                <div class="row users-card">
                    <div class="col-lg-6 col-xl-4 col-md-6">
                        <div class="card rounded-card user-card" style="max-width:165px">
                            <div class="card-block">
                                <div class="img-hover">
                                    <asp:Image ID="Stu_Profile" class="img-fluid img-radius"  runat="server"   alt="Profile.jpg"  ImageUrl="~/media/StudentProfile/Profile.jpg"  />
                                    <div class="img-overlay img-radius">
                                        <span>
                                            <asp:FileUpload ID="stuProfile" runat="server" class="form-control"  />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4 col-md-6">
                    </div>
                </div>
                <!-- End Profile-->

                <div class="row">
                    <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-RegistrationDate", "Registration Date") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-calendar"></i></span>
                            <asp:TextBox ID="RegistrationDate" runat="server" class="form-control" placeholder="Enter Registration Date" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="valRegistrationDate" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Registration Date" ValidationGroup="valFormGroup" ControlToValidate="RegistrationDate" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentID", "StudentID") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-edit-alt"></i></span>
                            <asp:TextBox ID="Student_ID" runat="server" class="form-control" placeholder="Enter StudentID" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                 
                </div>

                <div class="row">
                     <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentArabicName", "Student Arabic Name") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                            <asp:TextBox ID="StudentNameAr" runat="server" class="form-control" placeholder="Enter Student Name"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="StudentNameArValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Arabic Name" ValidationGroup="valFormGroup" ControlToValidate="StudentNameAr" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentEnglishName", "Student English Name") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                            <asp:TextBox ID="StudentNameEn" runat="server" class="form-control" placeholder="Enter Student Name"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="StudentNameEnValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student English Name" ValidationGroup="valFormGroup" ControlToValidate="StudentNameEn" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
               </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentPhone", "Student Phone") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                             <asp:TextBox ID="StudentPhone" runat="server" class="form-control" placeholder="05xxxxxxxx" TextMode="Number"  onkeyup="validatelimit(this,13"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="StudentPhoneValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Phone" ValidationGroup="valFormGroup" ControlToValidate="StudentPhone" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                     <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentEmail", "Student Email") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                            <asp:TextBox ID="StudentEmail" runat="server" class="form-control" placeholder="Enter Student Email" TextMode="Email"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="StudentEmailValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Email" ValidationGroup="valFormGroup" ControlToValidate="StudentEmail" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>

                  <div class="row">
                     <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-NationalityID", "Nationality ID") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-stamp"></i></span>
                            <asp:TextBox ID="Student_SSN" runat="server" class="form-control" placeholder="Enter Nationality ID"></asp:TextBox>
                        </div>
                         <asp:RequiredFieldValidator ID="Student_SSNValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Nationality ID" ValidationGroup="valFormGroup" ControlToValidate="Student_SSN" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                       <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddNationalityIDAttachments", "Add Nationality ID Attachments") %></label>
                        <asp:FileUpload ID="StudentSSNFile" runat="server" class="form-control" AllowMultiple="True" />
                    </div>
                  </div>

                 <div class="row">
                    <div class="form-group col-sm-12">
                           <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentAddress", "Student Address") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-address-book"></i></span>
                            <asp:TextBox ID="Address" runat="server" class="form-control" placeholder="Enter Student Address"></asp:TextBox>
                        </div>
                         <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Address" ValidationGroup="valFormGroup" ControlToValidate="Address" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    
                    <div class="form-group col-sm-4">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Specialization", "Specialization") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                            <asp:DropDownList ID="Specialization_ID" CssClass="js-example-basic-single col-sm-12" runat="server">
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="Specialization_IDValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Specialization" ValidationGroup="valFormGroup" ControlToValidate="Specialization_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-4">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Resource", "Resource") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-stock-mobile"></i></span>
                            <asp:DropDownList ID="Resource_ID" CssClass="js-example-basic-single col-sm-12" runat="server" >
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="Resource_IDValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Resource" ValidationGroup="valFormGroup" ControlToValidate="Resource_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group col-sm-4">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Nationality", "Nationality") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-ui-tag"></i></span>
                            <asp:DropDownList ID="Nationality_ID" CssClass="js-example-basic-single col-sm-12" runat="server" >
                            </asp:DropDownList>
                        </div>
                         <asp:RequiredFieldValidator ID="Nationality_IDValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Nationality" ValidationGroup="valFormGroup" ControlToValidate="Nationality_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                </div>

                 <div class="row">
                    <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-HighSchoolDegree", "High School Degree") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                            <asp:TextBox ID="HighSchoolDegree" runat="server" class="form-control" placeholder="Enter Student High School Degree"></asp:TextBox>
                        </div>
                         <asp:RequiredFieldValidator ID="HighSchoolDegreeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student High School Degree" ValidationGroup="valFormGroup" ControlToValidate="HighSchoolDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                     <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddHighSchoolDegreeAttachments", "Add High School Degree Attachments") %></label>
                        <asp:FileUpload ID="HighSchoolDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                    </div>
                </div>

               <div class="row">
                    <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-CapabilitiesDegree", "Capabilities Degree") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                            <asp:TextBox ID="CapabilitiesDegree" runat="server" class="form-control" placeholder="Enter Student Capabilities Degree"></asp:TextBox>
                        </div>
                          <asp:RequiredFieldValidator ID="CapabilitiesDegreeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Capabilities Degree" ValidationGroup="valFormGroup" ControlToValidate="CapabilitiesDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                     <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddCapabilitiesDegreeAttachments", "Add Capabilities Degree Attachments") %></label>
                        <asp:FileUpload ID="CapabilitiesDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                    </div>
                </div> 
                

               <div class="row">
                     <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-MyAchievementDegree", "My Achievement Degree") %></label><i class="icofont icofont-star-alt-1 text-danger"></i>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                            <asp:TextBox ID="MyAchievementDegree" runat="server" class="form-control" placeholder="Enter Student My Achievement Degree"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="MyAchievementDegreeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter My Achievement Degree" ValidationGroup="valFormGroup" ControlToValidate="MyAchievementDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </div>

                     <div class="form-group col-sm-6">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddMyAchievementDegreeAttachments", "Add My Achievement Degree Attachments") %></label>
                        <asp:FileUpload ID="MyAchievementDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                    </div>

                </div>

                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Note", "Note") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-notepad"></i></span>
                                <textarea ID="Note" runat="server" cols="20" rows="2" class="form-control"></textarea>
                        </div>
                    </div>
                </div>
  

                <div class="form-group col-sm-12 text-right">
                    <asp:Button ID="Save" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="Save_Click" />
                </div>
                <!-- End Student Form-->


                <!-- start File Table-->
                    <div class="row" runat="server" id="FileTable" visible="false">
                        <div class="col-sm-12">
                            <div class="table-responsive">
                                <table class="table  invoice-detail-table">
                                    <thead>
                                        <tr class="thead-default">
                                            <th class="view-table"><% = ElectronicSubmission.FieldNames.getFieldName("View-FileName", "File Name") %></th>
                                            <th><% = ElectronicSubmission.FieldNames.getFieldName("View-Type", "Type") %></th>
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
               <!-- End file Table-->
            </div>
            <!-- Article Editor card end -->

        </div>
    </div>


    <!-- ckeditor.css-->
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\ckeditor.js"></script>
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\samples\js\sample.js"></script>
</asp:Content>
