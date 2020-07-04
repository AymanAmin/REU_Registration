<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSubmitting.aspx.cs" Inherits="ElectronicSubmission.StudentSubmitting" %>

<!DOCTYPE html>
<html lang="<%= ElectronicSubmission.FieldNames.getLangHome() %>" dir="<%= ElectronicSubmission.FieldNames.getDirRTLHome() %>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Favicon icon -->
    <link rel="icon" href="Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><% = ElectronicSubmission.FieldNames.getFieldName("homepage-title", "REU - Admission") %></title>

     
    <!-- Css Files -->
    <link href="Template/css/bootstrap.css" rel="stylesheet">
    <link href="Template/css/font-awesome.css" rel="stylesheet">
    <link href="Template/css/flaticon.css" rel="stylesheet">
    <link href="Template/css/prettyphoto.css" rel="stylesheet">
    <link href="Template/build/mediaelementplayer.css" rel="stylesheet">

    <asp:Literal ID="StyleRTL" runat="server"></asp:Literal>

    <link href="Template/css/color.css" rel="stylesheet">
    <link href="Template/css/color-two.css" rel="stylesheet">
    <link href="Template/css/color-three.css" rel="stylesheet">
    <link href="Template/css/color-four.css" rel="stylesheet">

    <link href="Template/css/icofont/css/icofont.css" rel="stylesheet">
    <!-- ico font -->

    <!-- sweet alert framework -->
    <link rel="stylesheet" type="text/css" href="Theme\files\bower_components\sweetalert\css\sweetalert.css">

    

    <style>
        .sweet-alert input {
            display: none !important;
        }
        </style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <style>
        .form-control {
            height: 43px !important;
            border: 2px solid #eaeaea !important;
            font-size: 15px !important;
            color: black !important;
            padding: 7px 20px !important;
            background-color: #ffffff !important;
            font-style: italic !important;
        }
    </style>
    <script>
        
        /* Close Model */
        function SuccessAr() {
            setTimeout(function () { document.getElementById("Success-btn-Ar").click(); }, 1000);
            // Click on the checkbox
        }

        function SuccessEn() {
            setTimeout(function () { document.getElementById("Success-btn-En").click(); }, 1000);
            // Click on the checkbox
        }

        function WarningAr() {
            setTimeout(function () { document.getElementById("Warning-btn-Ar").click(); }, 1000);
            // Click on the checkbox
        }

        function WarningEn() {
            setTimeout(function () { document.getElementById("Warning-btn-En").click(); }, 1000);
            // Click on the checkbox
        }
        /*--------------------------------------*/
    </script>

     <script>

         function AlertNotify(messageHeader, messageBody, messageType) {
             setTimeout(function () { swal(messageHeader, messageBody, messageType); }, 1000);
             // Click on the checkbox
         }

    </script>

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

    <script>
        function DefDate(obj) {

            if (this.id) obj = this;
            const date1 = Date.now();
            const date2 =new Date(obj.value);
            const diffTime = Math.abs(date2 - date1);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
            const diffYears = Math.ceil(diffTime / (365*1000 * 60 * 60 * 24));
            console.log(diffTime + " milliseconds");
            console.log(diffDays + " days");
            if (diffYears > 5)
            {
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
            var ST_T_Id = document.getElementById("StudentType").value;
            var Nat_Id = document.getElementById("Nationality_ID").value;
            var E_Type = Nat_Id = document.getElementById("EducationType").value;
            debugger;
            switch (ST_T_Id) {
                //----------------------- New student ------------------------------
                case "1":
                    document.getElementById("HighSchool_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("HighSchoolDateValidator"), true);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeValidator"), true);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeFileValidator"), true);

                    document.getElementById("EducationType_Div").style.display = 'block';

                    if (Nat_Id != "191") {
                        if (E_Type == "2") {
                            document.getElementById("SAT_Div").style.display = 'block';
                            ValidatorEnable(document.getElementById("SAT1Validator"), true);
                            ValidatorEnable(document.getElementById("SAT2Validator"), true);

                            document.getElementById("Capabilities_Div").style.display = 'none';
                            ValidatorEnable(document.getElementById("CapabilitiesDegreeValidator"), false);
                            ValidatorEnable(document.getElementById("CapabilitiesDegreeFileValidator"), false);

                            document.getElementById("MyAchievement_Div").style.display = 'none';
                            ValidatorEnable(document.getElementById("MyAchievementDegreeValidator"), false);
                            ValidatorEnable(document.getElementById("MyAchievementDegreeFileValidator"), false);
                        } else {
                            document.getElementById("SAT_Div").style.display = 'none';
                            ValidatorEnable(document.getElementById("SAT1Validator"), false);
                            ValidatorEnable(document.getElementById("SAT2Validator"), false);

                            document.getElementById("Capabilities_Div").style.display = 'block';
                            ValidatorEnable(document.getElementById("CapabilitiesDegreeValidator"), true);
                            ValidatorEnable(document.getElementById("CapabilitiesDegreeFileValidator"), true);

                            document.getElementById("MyAchievement_Div").style.display = 'block';
                            ValidatorEnable(document.getElementById("MyAchievementDegreeValidator"), true);
                            ValidatorEnable(document.getElementById("MyAchievementDegreeFileValidator"), true);
                        }
                        
                    } else {
                        document.getElementById("SAT_Div").style.display = 'none';
                        ValidatorEnable(document.getElementById("SAT1Validator"), false);
                        ValidatorEnable(document.getElementById("SAT2Validator"), false);
                    }
                    document.getElementById("Diploma_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("DiplomaValidator"), false);

                    document.getElementById("AcadimecRegsteration_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("AcadimecRegsterationValidator"), false);

                    document.getElementById("SAHSC_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("SAHSCValidator"), false);

                    document.getElementById("EnglishTest_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("EnglishTestValidator"), false);
                    ValidatorEnable(document.getElementById("EnglishTestDegreeValidator"), false); 
                    ValidatorEnable(document.getElementById("EnglishCertificateValidator"), false);

                    document.getElementById("Descriptionofcourses_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("DescriptionofcoursesValidator"), false);

                    document.getElementById("GPA_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("GPAValidator"), false);
                    break;
                //-----------------------End New student ------------------------------

                //----------------------- Tajseer student ------------------------------
                case "2":
                    document.getElementById("HighSchool_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("HighSchoolDateValidator"), true);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeValidator"), true);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeFileValidator"), true);

                    document.getElementById("Capabilities_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("CapabilitiesDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("CapabilitiesDegreeFileValidator"), false);

                    document.getElementById("MyAchievement_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("MyAchievementDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("MyAchievementDegreeFileValidator"), false);

                    document.getElementById("SAT_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("SAT1Validator"), false);
                    ValidatorEnable(document.getElementById("SAT2Validator"), false);

                    document.getElementById("Diploma_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("DiplomaValidator"), true);

                    document.getElementById("AcadimecRegsteration_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("AcadimecRegsterationValidator"), true);

                    document.getElementById("SAHSC_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("SAHSCValidator"), true);

                    document.getElementById("EnglishTest_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("EnglishTestValidator"), true);
                    ValidatorEnable(document.getElementById("EnglishTestDegreeValidator"), true);
                    ValidatorEnable(document.getElementById("EnglishCertificateValidator"), true);

                    document.getElementById("Descriptionofcourses_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("DescriptionofcoursesValidator"), false);

                    document.getElementById("GPA_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("GPAValidator"), false);
                    break;
                //----------------------- End Tajseer student ------------------------------

                //----------------------- Mohawl student ------------------------------
                case "3":
                    document.getElementById("HighSchool_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("HighSchoolDateValidator"), false);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeFileValidator"), false);

                    document.getElementById("Capabilities_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("CapabilitiesDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("CapabilitiesDegreeFileValidator"), false);

                    document.getElementById("MyAchievement_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("MyAchievementDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("MyAchievementDegreeFileValidator"), false);

                    document.getElementById("SAT_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("SAT1Validator"), false);
                    ValidatorEnable(document.getElementById("SAT2Validator"), false);

                    document.getElementById("Diploma_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("DiplomaValidator"), false);

                    document.getElementById("AcadimecRegsteration_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("AcadimecRegsterationValidator"), true);

                    document.getElementById("SAHSC_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("SAHSCValidator"), false);

                    document.getElementById("EnglishTest_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("EnglishTestValidator"), false);
                    ValidatorEnable(document.getElementById("EnglishTestDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("EnglishCertificateValidator"), false);

                    document.getElementById("Descriptionofcourses_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("DescriptionofcoursesValidator"), true);

                    document.getElementById("GPA_Div").style.display = 'block';
                    ValidatorEnable(document.getElementById("GPAValidator"), true);
                    break;
                //----------------------- End Mohwal student ------------------------------

                default:
                    document.getElementById("HighSchool_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("HighSchoolDateValidator"), false);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("HighSchoolDegreeFileValidator"), false);
                    document.getElementById("Capabilities_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("CapabilitiesDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("CapabilitiesDegreeFileValidator"), false);
                    document.getElementById("MyAchievement_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("MyAchievementDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("MyAchievementDegreeFileValidator"), false);
                    document.getElementById("SAT_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("SAT1Validator"), false);
                    ValidatorEnable(document.getElementById("SAT2Validator"), false);
                    document.getElementById("Diploma_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("DiplomaValidator"), false);
                    document.getElementById("AcadimecRegsteration_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("AcadimecRegsterationValidator"), false);
                    document.getElementById("SAHSC_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("SAHSCValidator"), false);
                    document.getElementById("EnglishTest_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("EnglishTestValidator"), false);
                    ValidatorEnable(document.getElementById("EnglishTestDegreeValidator"), false);
                    ValidatorEnable(document.getElementById("EnglishCertificateValidator"), false);
                    document.getElementById("Descriptionofcourses_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("DescriptionofcoursesValidator"), false);
                    document.getElementById("GPA_Div").style.display = 'none';
                    ValidatorEnable(document.getElementById("GPAValidator"), false);
                    break;
            }

            return true;  
        }
    </script>
</head>
<body>

    <!--// Main Wrapper \\-->
    <div class="wm-main-wrapper">

        <!--// Header \\-->
        <header id="wm-header" class="wm-header-one">

            <!--// TopStrip \\-->
                <div class="wm-topstrip">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="wm-language">
                                    <ul>
                                        <li><a href="StudentSubmitting.aspx?lang=2">English</a></li>
                                        <li><a href="StudentSubmitting.aspx?lang=1" style="font-size: 130%; font-weight: bold;">عربي</a></li>
                                    </ul>
                                </div>
                                <ul class="wm-stripinfo">
                                    <li><i class="wmicon-location"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></a></li>
                                    <li><i class="wmicon-technology4"></i>920-000-842</li>
                                    <li><i class="wmicon-clock2"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-work", "sat - fri: 7:00am - 6:00pm") %></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// TopStrip \\-->

                <!--// MainHeader \\-->
                <div class="wm-main-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <a href="../../../homepage.aspx" class="wm-logo">
                                    <img src="Template/images/logo-5.png" alt="" style="height: 62px;"></a>
                            </div>
                            <div class="col-md-9">
                                <!--// Navigation \\-->
                                <nav class="navbar navbar-default">
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="true">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                    </div>
                                    <div class="collapse navbar-collapse" id="navbar-collapse-1">
                                        <ul class="nav navbar-nav">
                                            <li class="active"><a href="homepage.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-home", "Home") %></a></li>
                                            <li><a href="homepage.aspx#colleges"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Colleges", "Colleges") %></a></li>
                                            <li><a href="homepage.aspx#steps"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Steps", "Steps") %></a></li>
                                            <li><a href="homepage.aspx#contactas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Contact", "Contact") %></a></li>
                                            <li><a href="homepage.aspx#aboutas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-About", "About") %></a></li>

                                        </ul>
                                    </div>
                                </nav>
                                <!--// Navigation \\-->
                                <a href="StudentSubmitting.aspx" class="wm-header-btn"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// MainHeader \\-->

            <!--// Mini Header \\-->
            <div class="wm-pro-mini-header">
                <span class="wm-blue-transparent"></span>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="wm-mini-title">
                                <h1 id="headerBachelors" runat="server"><% = ElectronicSubmission.FieldNames.getFieldName("StudentSubmitting-Applicationform", "Application Form") %></h1>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!--// Mini Header \\-->



            <!--// Main Content \\-->
            <div class="wm-main-content ">

                <!--// Main Section \\-->
                <div class="wm-main-section">
                    <div class="container">
                        <form id="form1" runat="server">
                            <div class="card-block" id="SubmittingForm" runat="server">
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
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentArabicName", "Student Arabic Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                            <asp:TextBox ID="StudentNameAr" runat="server" class="form-control" placeholder="Enter Student Arabic Name"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="StudentNameArValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Arabic Name" ValidationGroup="valFormGroup" ControlToValidate="StudentNameAr" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentEnglishName", "Student English Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                            <asp:TextBox ID="StudentNameEn" runat="server" class="form-control" placeholder="Enter Student English Name"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="StudentNameEnValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student English Name" ValidationGroup="valFormGroup" ControlToValidate="StudentNameEn" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentPhone", "Student Phone") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                            <asp:TextBox ID="StudentPhone" runat="server" class="form-control" placeholder="9665xxxxxxxx" TextMode="Number"  onkeyup="validatelimit(this,13"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="StudentPhoneValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Phone" ValidationGroup="valFormGroup" ControlToValidate="StudentPhone" ValidationExpression = "^[\s\S]{0,10}$"   Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentEmail", "Student Email") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-email"></i></span>
                                            <asp:TextBox ID="StudentEmail" runat="server" class="form-control" placeholder="Enter Student Email" TextMode="Email"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="StudentEmailValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Email" ValidationGroup="valFormGroup" ControlToValidate="StudentEmail" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-sm-4">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-NationalityID", "Nationality ID") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-stamp"></i></span>
                                            <asp:TextBox ID="Student_SSN" runat="server" class="form-control" placeholder="Enter Nationality ID"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="Student_SSNValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Nationality ID" ValidationGroup="valFormGroup" ControlToValidate="Student_SSN" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AddStudentSSNAttachments", "Add Nationality ID Attachments") %></label>
                                        <asp:FileUpload ID="StudentSSNFile" runat="server" class="form-control" AllowMultiple="True" />
                                        <asp:RequiredFieldValidator ID="StudentSSNFileValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Nationality ID Attachments" ValidationGroup="valFormGroup" ControlToValidate="StudentSSNFile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentAddress", "Student Address") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
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
                                        <asp:RequiredFieldValidator ID="HighSchoolDegreeFileValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add High School Degree Attachments" ValidationGroup="valFormGroup" ControlToValidate="HighSchoolDegreeFile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    
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
                                        <asp:RequiredFieldValidator ID="CapabilitiesDegreeFileValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Capabilities Degree Attachments" ValidationGroup="valFormGroup" ControlToValidate="CapabilitiesDegreeFile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                        <asp:RequiredFieldValidator ID="MyAchievementDegreeFileValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add My Achievement Degree Attachments" ValidationGroup="valFormGroup" ControlToValidate="MyAchievementDegreeFile" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                 <div class="row" runat="server" id="SAT_Div" style="display:none">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-SAT1", "SAT-1") %></label>
                                        <asp:FileUpload ID="SAT1" runat="server" class="form-control" AllowMultiple="True" />
                                        <asp:RequiredFieldValidator ID="SAT1Validator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add SAT-1 Attachments" ValidationGroup="valFormGroup" ControlToValidate="SAT1" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-SAT2", "SAT-2") %></label>
                                        <asp:FileUpload ID="SAT2" runat="server" class="form-control" AllowMultiple="True" />
                                        <asp:RequiredFieldValidator ID="SAT2Validator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add SAT-2 Attachments" ValidationGroup="valFormGroup" ControlToValidate="SAT2" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row" runat="server" id="Diploma_Div" style="display:none">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-Diploma", "Diploma") %></label>
                                        <asp:FileUpload ID="Diploma" runat="server" class="form-control" AllowMultiple="True" />
                                        <asp:RequiredFieldValidator ID="DiplomaValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Diploma Attachments" ValidationGroup="valFormGroup" ControlToValidate="Diploma" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row" runat="server" id="AcadimecRegsteration_Div" style="display:none">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-AcadimecRegsteration", "Acadimec Regsteration") %></label>
                                        <asp:FileUpload ID="AcadimecRegsteration" runat="server" class="form-control" AllowMultiple="True" />
                                        <asp:RequiredFieldValidator ID="AcadimecRegsterationValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Acadimec Regsteration Attachments" ValidationGroup="valFormGroup" ControlToValidate="AcadimecRegsteration" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                 <div class="row" runat="server" id="SAHSC_Div" style="display:none">
                                    <div class="form-group col-sm-12">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-SaudiAuthorityforHealthSpecialtiesclassification", "Saudi Authority for Health Specialties classification") %></label>
                                        <asp:FileUpload ID="SAHSC" runat="server" class="form-control" AllowMultiple="True" />
                                        <asp:RequiredFieldValidator ID="SAHSCValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Saudi Authority for Health Specialties classification Attachments" ValidationGroup="valFormGroup" ControlToValidate="SAHSC" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                        <asp:RequiredFieldValidator ID="DescriptionofcoursesValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Description of courses Attachments" ValidationGroup="valFormGroup" ControlToValidate="Descriptionofcourses" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                        <asp:RequiredFieldValidator ID="GPAValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Cumulative average Attachments" ValidationGroup="valFormGroup" ControlToValidate="GPA" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                

                                <!--// Save Button \\-->
                                   <div class="form-group col-sm-12 text-right">
                                     <asp:Button ID="Save" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroup" OnClick="Save_Click" />
                                    </div>
                                <!--// Save Button t \\-->

                                    <!--// FooterCopyRight \\-->
                                    <!-- Page body start -->
                                    <button type="button" style="display:none;" id="Warning-btn-Ar" class="btn btn-primary Warning-Ar m-b-10" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Warning-Ar']);">Basic</button>
                                    <button type="button" style="display:none;" id="Warning-btn-En" class="btn btn-primary Warning-En m-b-10" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Warning-En']);">Basic</button>
                                
                                    <button type="button" style="display:none;" id="Success-btn-Ar"  class="btn btn-success success-Ar m-b-10" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'success-Ar']);">Success</button>
                                    <button type="button" style="display:none;" id="Success-btn-En"  class="btn btn-success success-En m-b-10" onclick="_gaq.push(['_trackEvent', 'example', 'try', 'success-En']);">Success</button>
                            </div>
                             <!-- End Student Form-->

                            <!-- Start Contract-->
                                <div class="row" runat="server" id="Contract_Div" visible="false">

                                    <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentArabicName", "Student Arabic Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                            <asp:TextBox ID="A_Name" runat="server" class="form-control" placeholder="Enter Student Arabic Name" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentEnglishName", "Student English Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                            <asp:TextBox ID="E_Name" runat="server" class="form-control" placeholder="Enter Student English Name" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                    <div class="row">
                                    <div class="form-group col-sm-4">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-ContractFiles", "Contract Files") %></label>
                                            <asp:FileUpload ID="ContractFiles" runat="server" class="form-control" AllowMultiple="True" />
                                            <asp:RequiredFieldValidator ID="ContractFilesValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Add Contract Files Attachments" ValidationGroup="valFormGroupContracta" ControlToValidate="ContractFiles" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                     </div>
                                    </div>
                                      <!--// Save Button \\-->
                                   <div class="form-group col-sm-12 text-right">
                                     <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="valFormGroupContracta" OnClick="Button1_Click"  />
                                    </div>
                                <!--// Save Button t \\-->

                                </div>
                            <!-- End Contract-->

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

                            <!-- Start notfound Form-->
                             <div id="Div_invalid" runat="server" class="row" visible="false">
                                <aside class="col-sm-3"></aside>
                                <aside class="col-sm-6">
                                    <asp:Image ID="image" runat="server" style="width:100%" ImageUrl="~/Template/images/notfound.png" /></aside>
                                <aside class="col-sm-3"></aside>
                            </div>
                            <!-- End notfound Form-->
                        </form>
                    </div>
                </div>
                <!--// Main Section \\-->

            </div>
            <!--// Main Content \\-->
            
        </header>
        <!--// Header \\-->

        <!--// Footer \\-->
            <footer id="wm-footer" class="wm-footer-one">

                <!--// FooterNewsLatter \\-->
                <div class="wm-footer-newslatter">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <i class="wmicon-pen"></i>
                                <input type="text" readonly="readonly" style="width: 77%;" id="AdmissionFormButton" runat="server">
                            </div>
                        </div>
                    </div>
                </div>
                <!--// FooterNewsLatter \\-->

                <!--// FooterWidgets \\-->
                <div class="wm-footer-widget" id="aboutas">
                    <div class="container">
                        <div class="row">
                            <aside class="widget widget_contact_info col-md-3">
                                <a href="../../../homepage.aspx" class="wm-footer-logo">
                                    <img src="Template/images/logo-5.png" alt="" style="height: 77px;"></a>
                                <ul>
                                    <li><i class="wm-color wmicon-pin"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641">
                                        <p><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></p>
                                    </a></li>
                                    <li><i class="wm-color wmicon-phone"></i>920-000-842</li>
                                    <li><i class="wm-color wmicon-letter"></i><a href="mailto:info@riyadh.edu.sa">info@riyadh.edu.sa</a></li>
                                </ul>
                                <div class="wm-footer-icons">
                                    <a href="https://www.facebook.com/RiyadhColleges"><i class="fa fa-facebook-square"></i></a>
                                    <a href="https://twitter.com/RiyadhElmU"><i class="fa fa-twitter-square"></i></a>
                                    <a href="https://www.youtube.com/user/RiyadhColleges"><i class="fa fa-youtube-play"></i></a>
                                    <a href="https://www.instagram.com/riyadhelmu/"><i class="fa fa-instagram"></i></a>
                                    <a href="https://www.flickr.com/photos/riyadhcolleges"><i class="fa fa-flickr"></i></a>
                                    <a href="https://snapchat.com/add/Riyadh.elmu"><i class="fa fa-snapchat-square"></i></a>
                                </div>
                            </aside>
                            <aside class="widget widget_archive col-md-2">
                                <div class="wm-footer-widget-title">
                                    <h5><i class="fa fa-link"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-QuickLinks", "Quick Links") %></h5>
                                </div>
                                <ul>
                                    <li class="active"><a href="homepage.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-home", "Home") %></a></li>
                                    <li><a href="homepage.aspx#colleges"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Colleges", "Colleges") %></a></li>
                                    <li><a href="homepage.aspx#steps"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Steps", "Steps") %></a></li>
                                    <li><a href="homepage.aspx#contactas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Contact", "Contact") %></a></li>
                                    <li><a href="homepage.aspx#aboutas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-About", "About") %></a></li>
                                    <li><a href="StudentSubmitting.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %></a></li>
                                </ul>
                            </aside>
                            <aside class="widget widget_twitter col-md-3">
                                <div class="wm-footer-widget-title">
                                    <h5><i class="fa fa-eye"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurVisionHead", "Our Vision") %></h5>
                                </div>
                                <ul>
                                    <li>
                                        <p><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurVisionDetail", "To become a preeminent educational institution locally, regionally, and internationally.") %></p>
                                    </li>
                                </ul>
                                <div class="wm-footer-widget-title">
                                    <h5><i class="fa fa-paper-plane-o"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurMissionHead", "Our Mission") %></h5>
                                </div>
                                <ul>
                                    <li>
                                        <p><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurMissionDetail", "Effective education and training with active contribution to scientific research and community service.") %></p>
                                    </li>
                                </ul>
                            </aside>
                            <aside class="widget widget_archive col-md-4">
                                <div class="wm-footer-widget-title">
                                    <h5><i class="fa fa-google-wallet"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-OurGoals", "Our Goals") %></h5>
                                </div>
                                <ol>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalOne", "Graduate competent professionals to meet the needs of the labor market.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalTwo", "Engage in community service.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalThree", "Conduct scientific research.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalFour", "Provide competitive postgraduate programs.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalFive", "Provide health care and promote health awareness to the public.") %></li>
                                    <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalSix", "Encourage lifelong learning through accredited continuous education programs.") %></li>
                                </ol>
                            </aside>
                        </div>
                    </div>
                </div>
                <!--// FooterWidgets \\-->

                <!--// FooterCopyRight \\-->
                <div class="wm-copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-8">
                                <span><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Copyright", "© Riyadh Elm University, Formerly Riyadh Colleges of Dentistry and Pharmacy | All Rights Reserved") %></span>
                            </div>

                            <div class="col-md-4">
                                <p><a target="_blank" href="http://www.home.riyadh.edu.sa/"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-RiyadhElmUniversity", "Riyadh Elm University") %></a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// FooterCopyRight \\-->
                <!-- Page body start -->
                
            </footer>
            <!--// Footer \\-->

        <div class="clearfix"></div>
    </div>
    <!--// Main Wrapper \\-->
       <!-- jQuery (necessary for JavaScript plugins) -->
    <script type="text/javascript" src="Template/script/jquery.js"></script>
    <script type="text/javascript" src="Template/script/modernizr.js"></script>
    <script type="text/javascript" src="Template/script/bootstrap.min.js"></script>
    <script type="text/javascript" src="Template/script/jquery.prettyphoto.js"></script>
    <script type="text/javascript" src="Template/script/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="Template/script/fitvideo.js"></script>
    <script type="text/javascript" src="Template/script/skills.js"></script>
    <script type="text/javascript" src="Template/script/slick.slider.min.js"></script>
    <script type="text/javascript" src="Template/script/waypoints-min.js"></script>
    <script type="text/javascript" src="Template/build/mediaelement-and-player.min.js"></script>
    <script type="text/javascript" src="Template/script/isotope.min.js"></script>
    <script type="text/javascript" src="Template/script/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
    <asp:Literal ID="ScriptRTL" runat="server"></asp:Literal>


    <!-- sweet alert js -->
    <script type="text/javascript" src="Theme\files\bower_components\sweetalert\js\sweetalert.min.js"></script>
    <script type="text/javascript" src="Theme\files\assets\js\modal.js"></script>
    <!-- sweet alert modal.js intialize js -->
    <!-- Custom js -->
    <script type="text/javascript" src="Theme\files\assets\js\script.js"></script>
</body>

<!-- index18:22  -->
</html>


