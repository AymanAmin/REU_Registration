<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitingClosed.aspx.cs" Inherits="ElectronicSubmission.SubmitingClosed" %>

<!DOCTYPE html>
<html lang="<%= ElectronicSubmission.FieldNames.getLangHome() %>" dir="<%= ElectronicSubmission.FieldNames.getDirRTLHome() %>">
<head runat="server">
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

    <!-- Google Tag Manager -->

    <script>(function (w, d, s, l, i) {
    w[l] = w[l] || []; w[l].push({
        'gtm.start':

        new Date().getTime(), event: 'gtm.js'
    }); var f = d.getElementsByTagName(s)[0],

    j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =

    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);

})(window, document, 'script', 'dataLayer', 'GTM-NSFDCLN');</script>

    <!-- End Google Tag Manager -->

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-164487020-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-164487020-2');
    </script>

    <!-- End Google Tag Manager  -->


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

         function AlertNotify(messageHeader, messageBody, messageType) {
             setTimeout(function () { swal(messageHeader, messageBody, messageType); }, 1000);
             // Click on the checkbox
         }

    </script>
    <script type="text/javascript" language="javascript">

        function validatelimit(obj, maxchar) {

            if (this.id) obj = this;
            var remaningChar = maxchar - obj.value.length;

            if (remaningChar != 0) {
                //obj.value = obj.value.substring(maxchar, 0);
                obj.value = null;
                return false;

            }
            else { return true; }
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
                                    <li><a href="SubmitingClosed.aspx?lang=2">English</a></li>
                                    <li><a href="SubmitingClosed.aspx?lang=1" style="font-size: 130%; font-weight: bold;">عربي</a></li>
                                </ul>
                            </div>
                            <ul class="wm-stripinfo">
                                <li><i class="wmicon-location"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></a></li>
                                <li><i class="wmicon-technology4"></i><a href="tel:920000842" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-PhoneNumber", "920-000-842") %></a></li>
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
                            <a href="SubmitingClosed.aspx" class="wm-header-btn"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %></a>
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
                            <!-- Start Contract-->
                                <div class="row" runat="server" id="Contract_Div">
                                    <div class="row">
                                        <div class="alert alert-success" role="alert">
                                            <h4 class="alert-heading"><% = ElectronicSubmission.FieldNames.getFieldName("SubmitingClosed-MessageOne", "Attention !") %></h4>
                                            <p><% = ElectronicSubmission.FieldNames.getFieldName("SubmitingClosed-MessageTwo", "Thank you for your interest in registering on the Riyadh Elm university Website. We inform you that registration closed") %></p>
                                            <hr>
                                            <p class="mb-0"><% = ElectronicSubmission.FieldNames.getFieldName("SubmitingClosed-MessageThree", "We ask you to fill in your information and we will contact you when the opening opens") %></p>
                                        </div>
                                    </div>

                                    <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentName", "Student Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                            <asp:TextBox ID="StudentName" runat="server" class="form-control" placeholder="Enter Student Name" required ="required"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentEmail", "Student Email") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                            <asp:TextBox ID="StudentEmail" runat="server" class="form-control" placeholder="Enter Student Email" required ="required"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                    <div class="row">
                                    <div class="form-group col-sm-4">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("StudentInfo-StudentPhone", "Student Phone") %></label>
                                            <div class="input-group">
                                            <span class="input-group-addon"><i class="icofont icofont-ui-call"></i></span>
                                            <asp:TextBox ID="StudentPhone" runat="server" class="form-control" placeholder="9665xxxxxxxx" TextMode="Number" required ="required"  onchange="validatelimit(this,12)"></asp:TextBox>
                                        </div>
                                     </div>
                                    </div>
                                      <!--// Save Button \\-->
                                   <div class="form-group col-sm-12 text-right">
                                     <asp:Button ID="Save" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="Save_Click"  />
                                    </div>
                                <!--// Save Button t \\-->

                                </div>
                            <!-- End Contract-->
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
                                <li><i class="wm-color wmicon-phone"></i><a href="tel:920000842" style="color: black;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-PhoneNumber", "920-000-842") %></a></li>
                                <li><i class="wm-color wmicon-letter"></i><a href="mailto:info@riyadh.edu.sa"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-EmailAddress","info@riyadh.edu.sa")%></a></li>
                            </ul>
                            <div class="wm-footer-icons">
                                <a href="https://www.facebook.com/riyadhelmu"><i class="fa fa-facebook-square"></i></a>
                                <a href="https://twitter.com/RiyadhElmU"><i class="fa fa-twitter-square"></i></a>
                                <a href="https://www.youtube.com/user/RiyadhColleges"><i class="fa fa-youtube-play"></i></a>
                                <a href="https://www.instagram.com/riyadhelmu/"><i class="fa fa-instagram"></i></a>

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
                            <ul>
                                <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalOne", "Graduate competent professionals to meet the needs of the labor market.") %></li>
                                <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalTwo", "Engage in community service.") %></li>
                                <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalThree", "Conduct scientific research.") %></li>
                                <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalFour", "Provide competitive postgraduate programs.") %></li>
                                <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalFive", "Provide health care and promote health awareness to the public.") %></li>
                                <li><% = ElectronicSubmission.FieldNames.getFieldName("homepage-GoalSix", "Encourage lifelong learning through accredited continuous education programs.") %></li>
                            </ul>
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
</html>
