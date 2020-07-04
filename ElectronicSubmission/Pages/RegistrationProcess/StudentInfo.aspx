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
            else { return true; }
        }

    </script>
        <script>
            function DefDate(obj) {

                if (this.id) obj = this;
                const date1 = Date.now();
                const date2 = new Date(obj.value);
                const diffTime = Math.abs(date2 - date1);
                const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                const diffYears = Math.ceil(diffTime / (365 * 1000 * 60 * 60 * 24));
                console.log(diffTime + " milliseconds");
                console.log(diffDays + " days");
                if (diffYears > 5) {
                    alert("The high school certificate must not exceed five years");
                    HighSchoolDate.value = null;
                    return false;
                } else {
                    return true;
                }
            }
    </script>
    <script>
            function StudType() {
                debugger;
                var ST_T_Id = document.getElementById("Body_Holder_StudentType").value;
                var Nat_Id = document.getElementById("Body_Holder_Nationality_ID").value;
                var E_Type = Nat_Id = document.getElementById("Body_Holder_EducationType").value;
            switch (ST_T_Id) {
                //----------------------- New student ------------------------------
                case "1":
                    document.getElementById("Body_Holder_HighSchool_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDateValidator"), true);
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDegreeValidator"), true);
                    document.getElementById("Body_Holder_EducationType_Div").style.display = 'block';
                    if (Nat_Id != "191") {
                        if (E_Type == "2") {
                            document.getElementById("Body_Holder_SAT_Div").style.display = 'block';

                            document.getElementById("Body_Holder_Capabilities_Div").style.display = 'none';
                            ValidatorEnable(document.getElementById("Body_Holder_CapabilitiesDegreeValidator"), false);

                            document.getElementById("Body_Holder_MyAchievement_Div").style.display = 'none';
                            ValidatorEnable(document.getElementById("Body_Holder_MyAchievementDegreeValidator"), false);
                        } else {
                            document.getElementById("Body_Holder_SAT_Div").style.display = 'none';

                            document.getElementById("Body_Holder_Capabilities_Div").style.display = 'block';
                            ValidatorEnable(document.getElementById("Body_Holder_CapabilitiesDegreeValidator"), true);

                            document.getElementById("Body_Holder_MyAchievement_Div").style.display = 'block';
                            ValidatorEnable(document.getElementById("Body_Holder_MyAchievementDegreeValidator"), true);
                        }
                    } else {
                        document.getElementById("Body_Holder_SAT_Div").style.display = 'none';
                    }
                    document.getElementById("Body_Holder_Diploma_Div").style.display = 'none';
                    document.getElementById("Body_Holder_AcadimecRegsteration_Div").style.display = 'none';
                    document.getElementById("Body_Holder_SAHSC_Div").style.display = 'none';
                    document.getElementById("Body_Holder_EnglishTest_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_EnglishTestDegreeValidator"), false);
                    document.getElementById("Body_Holder_Descriptionofcourses_Div").style.display = 'none';
                    document.getElementById("Body_Holder_GPA_Div").style.display = 'none';
                    break;
                //-----------------------End New student ------------------------------

                //----------------------- Tajseer student ------------------------------
                case "2":
                    document.getElementById("Body_Holder_HighSchool_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDateValidator"), true);
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDegreeValidator"), true);

                    document.getElementById("Body_Holder_Capabilities_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_CapabilitiesDegreeValidator"), false);
                    document.getElementById("Body_Holder_MyAchievement_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_MyAchievementDegreeValidator"), false);

                    document.getElementById("Body_Holder_SAT_Div").style.display = 'none';
                    document.getElementById("Body_Holder_Diploma_Div").style.display = 'block';
                    document.getElementById("Body_Holder_AcadimecRegsteration_Div").style.display = 'block';
                    document.getElementById("Body_Holder_SAHSC_Div").style.display = 'block';
                    document.getElementById("Body_Holder_EnglishTest_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("Body_Holder_EnglishTestDegreeValidator"), true);

                    document.getElementById("Body_Holder_Descriptionofcourses_Div").style.display = 'none';
                    document.getElementById("Body_Holder_GPA_Div").style.display = 'none';
                    break;
                //----------------------- End Tajseer student ------------------------------

                //----------------------- Mohawl student ------------------------------
                case "3":
                    document.getElementById("Body_Holder_HighSchool_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDateValidator"), false);
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDegreeValidator"), false);
                    document.getElementById("Body_Holder_Capabilities_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_CapabilitiesDegreeValidator"), false);
                    document.getElementById("Body_Holder_MyAchievement_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_MyAchievementDegreeValidator"), false);
                    document.getElementById("Body_Holder_SAT_Div").style.display = 'none';
                    document.getElementById("Body_Holder_Diploma_Div").style.display = 'none';
                    document.getElementById("Body_Holder_AcadimecRegsteration_Div").style.display = 'block';
                    document.getElementById("Body_Holder_SAHSC_Div").style.display = 'none';
                    document.getElementById("Body_Holder_EnglishTest_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_EnglishTestDegreeValidator"), false);
                    document.getElementById("Body_Holder_Descriptionofcourses_Div").style.display = 'block';
                    document.getElementById("Body_Holder_GPA_Div").style.display = 'block';;
                    break;
                //----------------------- End Mohwal student ------------------------------

                default:
                    document.getElementById("Body_Holder_HighSchool_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDateValidator"), false);
                    ValidatorEnable(document.getElementById("Body_Holder_HighSchoolDegreeValidator"), false);
                    document.getElementById("Body_Holder_Capabilities_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_CapabilitiesDegreeValidator"), false);
                    document.getElementById("Body_Holder_MyAchievement_Div").style.display = 'none';
                    document.getElementById("Body_Holder_SAT_Div").style.display = 'none';
                    document.getElementById("Body_Holder_Diploma_Div").style.display = 'none';
                    document.getElementById("Body_Holder_AcadimecRegsteration_Div").style.display = 'none';
                    document.getElementById("Body_Holder_SAHSC_Div").style.display = 'none';
                    document.getElementById("Body_Holder_EnglishTest_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("Body_Holder_EnglishTestDegreeValidator"), false);
                    document.getElementById("Body_Holder_Descriptionofcourses_Div").style.display = 'none';
                    document.getElementById("Body_Holder_GPA_Div").style.display = 'none';
                    break;
            }

            return true;
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
                        <div class="card rounded-card user-card" style="max-width: 165px">
                            <div class="card-block">
                                <div class="img-hover">
                                    <asp:Image ID="Stu_Profile" class="img-fluid img-radius" runat="server" alt="Profile.jpg" ImageUrl="~/media/StudentProfile/Profile.jpg" />
                                    <div class="img-overlay img-radius">
                                        <span>
                                            <asp:FileUpload ID="stuProfile" runat="server" class="form-control" />
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
                            <asp:TextBox ID="StudentPhone" runat="server" class="form-control" placeholder="9665xxxxxxxx" TextMode="Number" onkeyup="validatelimit(this,13"></asp:TextBox>
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
                                    <div class="form-group col-sm-3">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentType", "Student Type") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                                            <asp:DropDownList ID="StudentType" class="form-control" runat="server"  onchange="StudType();">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="StudentTypeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Student Type" ValidationGroup="valFormGroup" ControlToValidate="StudentType" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-sm-3">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Specialization", "Specialization") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-safety"></i></span>
                                            <asp:DropDownList ID="Specialization_ID" class="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="Specialization_IDValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Specialization" ValidationGroup="valFormGroup" ControlToValidate="Specialization_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-sm-3">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Resource", "Resource") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-stock-mobile"></i></span>
                                            <asp:DropDownList ID="Resource_ID" class="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="Resource_IDValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Resource" ValidationGroup="valFormGroup" ControlToValidate="Resource_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-sm-3">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Nationality", "Nationality") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-ui-tag"></i></span>
                                            <asp:DropDownList ID="Nationality_ID" class="form-control" runat="server" onchange="StudType();">
                                            </asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="Nationality_IDValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Nationality" ValidationGroup="valFormGroup" ControlToValidate="Nationality_ID" Display="Dynamic" CssClass="col-form-label" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="row" runat="server" id="HighSchool_Div" style="display:none">
                                      <div class="form-group col-sm-4">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-HighSchoolDate", "High School Date") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-calendar"></i></span>
                                            <input type="date" id="HighSchoolDate" runat="server" class="form-control" onchange="DefDate(this)" />
                                        </div>
                                        <asp:RequiredFieldValidator ID="HighSchoolDateValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student High School Date" ValidationGroup="valFormGroup" ControlToValidate="HighSchoolDate" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-sm-4">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-HighSchoolDegree", "High School Degree") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="HighSchoolDegree" runat="server" class="form-control" placeholder="Enter Student High School Degree" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="HighSchoolDegreeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student High School Degree" ValidationGroup="valFormGroup" ControlToValidate="HighSchoolDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck" Type="Double" ControlToValidate="HighSchoolDegree" ValidationGroup="valFormGroup" Text="Value must be a Number" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                                    </div>

                                    <div class="form-group col-sm-4">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddHighSchoolDegreeAttachments", "Add High School Degree Attachments") %></label>
                                        <asp:FileUpload ID="HighSchoolDegreeFile" runat="server" class="form-control" AllowMultiple="True" />                                    
                                    </div>
                                </div>

                                <div class="row" runat="server" id="EducationType_Div" style="display:none">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Education Type", "EducationType") %></label>
                                        <asp:DropDownList ID="EducationType" class="form-control" runat="server" onchange="StudType();">
                                            <asp:ListItem Value="1">Saudi Education</asp:ListItem>
                                            <asp:ListItem Value="2">Foreign Education</asp:ListItem>
                                       </asp:DropDownList>
                                    </div>
                               </div>

                                <div class="row" runat="server" id="Capabilities_Div" style="display:none">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-CapabilitiesDegree", "Capabilities Degree") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="CapabilitiesDegree" runat="server" class="form-control" placeholder="Enter Student Capabilities Degree" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="CapabilitiesDegreeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Capabilities Degree" ValidationGroup="valFormGroup" ControlToValidate="CapabilitiesDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck" Type="Double" ControlToValidate="CapabilitiesDegree" ValidationGroup="valFormGroup" Text="Value must be a Number" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddCapabilitiesDegreeAttachments", "Add Capabilities Degree Attachments") %></label>
                                        <asp:FileUpload ID="CapabilitiesDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>
                                </div>


                                <div class="row" runat="server" id="MyAchievement_Div" style="display:none">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-MyAchievementDegree", "My Achievement Degree") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="MyAchievementDegree" runat="server" class="form-control" placeholder="Enter Student My Achievement Degree" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="MyAchievementDegreeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter My Achievement Degree" ValidationGroup="valFormGroup" ControlToValidate="MyAchievementDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck" Type="Double" ControlToValidate="MyAchievementDegree" ValidationGroup="valFormGroup" Text="Value must be a Number" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddMyAchievementDegreeAttachments", "Add My Achievement Degree Attachments") %></label>
                                        <asp:FileUpload ID="MyAchievementDegreeFile" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>

                                </div>

                                 <div class="row" runat="server" id="SAT_Div" style="display:none">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-SAT1", "SAT-1") %></label>
                                        <asp:FileUpload ID="SAT1" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-SAT2", "SAT-2") %></label>
                                        <asp:FileUpload ID="SAT2" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>
                                </div>

                                <div class="row" runat="server" id="Diploma_Div" style="display:none">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Diploma", "Diploma") %></label>
                                        <asp:FileUpload ID="Diploma" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>
                                </div>

                                <div class="row" runat="server" id="AcadimecRegsteration_Div" style="display:none">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AcadimecRegsteration", "Acadimec Regsteration") %></label>
                                        <asp:FileUpload ID="AcadimecRegsteration" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>
                                </div>

                                 <div class="row" runat="server" id="SAHSC_Div" style="display:none">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-SaudiAuthorityforHealthSpecialtiesclassification", "Saudi Authority for Health Specialties classification") %></label>
                                        <asp:FileUpload ID="SAHSC" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>
                                </div>

                                 <div class="row" runat="server" id="EnglishTest_Div" style="display:none">
                                    <div class="form-group col-sm-4">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-EnglishTest", "English Test") %></label>
                                        <asp:DropDownList ID="EnglishTest" class="form-control" runat="server">
                                            <asp:ListItem Value="1">IELTS</asp:ListItem>
                                            <asp:ListItem Value="2">TOEFL Computer</asp:ListItem>
                                            <asp:ListItem Value="3">TOEFL Internet</asp:ListItem>
                                            <asp:ListItem Value="4">TOEFL Paper </asp:ListItem>
                                            <asp:ListItem Value="5">STEP (كفايات)</asp:ListItem>
                                       </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="EnglishTestValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add English Test Attachments" ValidationGroup="valFormGroup" ControlToValidate="EnglishTest" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                     <div class="form-group col-sm-4">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-EnglishTestDegree", "English Test Degree") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-numbered"></i></span>
                                            <asp:TextBox ID="EnglishTestDegree" runat="server" class="form-control" placeholder="Enter Student My Achievement Degree" TextMode="SingleLine"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="EnglishTestDegreeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter English Test Degree Degree" ValidationGroup="valFormGroup" ControlToValidate="EnglishTestDegree" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                         <asp:CompareValidator ID="CompareValidator4" runat="server" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck" Type="Double" ControlToValidate="EnglishTestDegree" ValidationGroup="valFormGroup" Text="Value must be a Number" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                                    </div>

                                      <div class="form-group col-sm-4">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-EnglishCertificate", "English Certificate") %></label>
                                        <asp:FileUpload ID="EnglishCertificate" runat="server" class="form-control" AllowMultiple="True" />
                                        <asp:RequiredFieldValidator ID="EnglishCertificateValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add English Certificate Attachments" ValidationGroup="valFormGroup" ControlToValidate="EnglishCertificate" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                  <div class="row" runat="server" id="Descriptionofcourses_Div" style="display:none">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Descriptionofcourses", "Description of courses") %></label>
                                        <asp:FileUpload ID="Descriptionofcourses" runat="server" class="form-control" AllowMultiple="True" />
                                    </div>
                                </div>

                                  <div class="row" runat="server" id="GPA_Div" style="display:none">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Cumulativeaverage", "Cumulative average (GPA)") %></label>
                                        <asp:DropDownList ID="GPA" class="form-control" runat="server">
                                            <asp:ListItem Value="1">Excellent</asp:ListItem>
                                            <asp:ListItem Value="2">very good</asp:ListItem>
                                            <asp:ListItem Value="3">good</asp:ListItem>
                                       </asp:DropDownList>
                                    </div>
                                </div>

                <div class="row">
                    <div class="form-group col-sm-12">
                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Note", "Note") %></label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icofont icofont-notepad"></i></span>
                            <textarea id="Note" runat="server" cols="20" rows="2" class="form-control"></textarea>
                        </div>
                    </div>
                </div>

                 <!-- start File Table-->
                <div class="row" runat="server" id="FileTable" visible="false">
                    <div class="col-sm-12 text-left">
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

                <div class="form-group col-sm-12 text-right">
                    <asp:Button ID="Save" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="Save_Click" />
                </div>
                <!-- End Student Form-->


               
            </div>
            <!-- Article Editor card end -->

        </div>
    </div>


    <!-- ckeditor.css-->
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\ckeditor.js"></script>
    <script src="..\..\..\..\Theme\files\bower_components\ckeditor\samples\js\sample.js"></script>
</asp:Content>
