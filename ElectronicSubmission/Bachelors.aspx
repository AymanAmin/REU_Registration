<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bachelors.aspx.cs" Inherits="ElectronicSubmission.Bachelors" %>

<!DOCTYPE html>
<html lang="<%= ElectronicSubmission.FieldNames.getLangHome() %>" dir="<%= ElectronicSubmission.FieldNames.getDirRTLHome() %>">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Favicon icon -->
    <link rel="icon" href="Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><% = ElectronicSubmission.FieldNames.getFieldName("Bachelors-title", "REU - Bachelors") %></title>

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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
                                        <li><a href="Bachelors.aspx?lang=2">English</a></li>
                                        <li><a href="Bachelors.aspx?lang=1" style="font-size: 130%; font-weight: bold;">عربي</a></li>
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
                                <h1 id="headerBachelors" runat="server"></h1>
                            </div>
                            <div class="wm-breadcrumb">
                                <ul>
                                    <li><a href="homepage.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-home", "Home") %></a></li>
                                    <li><a href="homepage.aspx#colleges"><% = ElectronicSubmission.FieldNames.getFieldName("Bachelors-Bachelors", "Bachelors") %></a></li>
                                    <li id="detailedBachelors" runat="server"></li>
                                </ul>
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
                        <div class="row">

                            <div class="col-md-12">
                                <div class="row">

                                    <aside class="col-md-3">
                                        <div class="widget widget_our-professors">
                                            <figure>
                                                <a href="#"><img src="Template/extra-images/dental-surgery.jpg" alt="" id="bachelorsImage" runat="server"/></a>
                                                
                                            </figure>
                                        </div>
                                    </aside>
                                    <div class="col-md-9">
                                        <div class="wm-professor-info">
                                            <h2 id="headerBody" runat="server"></h2>
                                            <ul class="row">
                                                <li class="col-md-4">
                                                    <div class="wm-professor-contact">
                                                        <div class="wm-professor-icon">
                                                            <a href="#" class="icon-hidden"><i class="wmicon-technology4" aria-hidden="true"></i></a>
                                                        </div>
                                                        <h6><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Phone", "Phone") %>:</h6>
                                                        <span>920-000-842</span>
                                                    </div>
                                                </li>
                                                <li class="col-md-4">
                                                    <div class="wm-professor-contact">
                                                        <div class="wm-professor-icon">
                                                            <a href="#"><i class="wmicon-web2" aria-hidden="true"></i></a>
                                                        </div>
                                                        <h6><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Email", "E-mail") %>:</h6>
                                                        <span>info@riyadh.edu.sa</span>
                                                    </div>
                                                </li>
                                                <li class="col-md-4">
                                                    <div class="wm-professor-contact">
                                                        <div class="wm-professor-icon">
                                                            <a href="StudentSubmitting.aspx"><i class="wmicon-pen" aria-hidden="true"></i></a>
                                                        </div>
                                                        <h6><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %>:</h6>
                                                        <span><% = ElectronicSubmission.FieldNames.getFieldName("homepage-FormRequest", "Form Request") %></span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="wm-rich-aditor">
                                            <div id="bachelorsDescription" runat="server">
                                                <!--// Code behene \\-->
                                            </div><br/>
                                            <h3><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admissionrequirements", "Admission requirements") %></h3>

                                            <div id="bachelorsReque" runat="server">
                                                <!--// Code behene \\-->
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
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
                                <input type="text" readonly="readonly" id="AdmissionFormButton" runat="server" style="width: 77%;" >
                                <a href="StudentSubmitting.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-AdmissionFormRequest", "Admission Form Request") %></a>
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

</body>

<!-- index18:22  -->
</html>

