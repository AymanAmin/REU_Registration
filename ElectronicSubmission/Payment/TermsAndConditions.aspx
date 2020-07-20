<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TermsAndConditions.aspx.cs" Inherits="ElectronicSubmission.Payment.TermsAndConditions" %>

<!DOCTYPE html>

<html lang="ar" dir="rtl>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" href="Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-title", "الأحكام والشروط") %></title>

    <!-- Css Files -->
    <link href="../Template/css/bootstrap.css" rel="stylesheet">
    <link href="../Template/css/font-awesome.css" rel="stylesheet">
    <link href="../Template/css/flaticon.css" rel="stylesheet">
    <link href="../Template/css/slick-slider.css" rel="stylesheet">
    <link href="../Template/css/prettyphoto.css" rel="stylesheet">
    <link href="../Template/build/mediaelementplayer.css" rel="stylesheet">

    <link href="../Template/style.css" rel="stylesheet">
    <link href="../Template/css/color.css" rel="stylesheet">
    <link href="../Template/css/color-two.css" rel="stylesheet">
    <link href="../Template/css/color-three.css" rel="stylesheet">
    <link href="../Template/css/color-four.css" rel="stylesheet">
    <link href="../Template/css/responsive.css" rel="stylesheet">


    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!--<script src="https://test.oppwa.com/v1/paymentWidgets.js?checkoutId="></script>-->
    <asp:Literal ID="render_Payment" runat="server"></asp:Literal>

    <script>
        var wpwlOptions = { style: "card", paymentTarget: "_top" }

        function DisplayDiv(Id) {
            setTimeout(function () {
                if (Id == 1) {
                    document.getElementById("paymentWidgets").style.display = "block";
                }
                else if (Id == 2) {
                    document.getElementById("Div_Sucessful").style.display = "block";
                }
                else if (Id == 3) {
                    document.getElementById("Div_Failed").style.display = "block";
                }
                else {
                    document.getElementById("Div_InValid").style.display = "block";
                }
            }, 1);

        }
    </script>
    <style>
        .wm-courses-info ul li, .wm-certification-listing ul li{
            width: 100% !important;
            font-size:large;  
            text-align: justify;
            text-justify: inter-word;
        }
        .wm-certification-listing a{
            font-size:large;
        }
    </style>
</head>
<body>
    <form id="form" runat="server">
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
                                        <li><a href="TermsAndConditions.aspx?lang=2">English</a></li>
                                        <li><a href="TermsAndConditions.aspx?lang=1" style="font-size: 130%; font-weight: bold;">عربي</a></li>
                                    </ul>
                                </div>
                                <ul class="wm-stripinfo">
                                    <li><i class="wmicon-location"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></a></li>
                                    <li><i class="wmicon-technology4"></i>+920-000-842</li>
                                    <li><i class="wmicon-clock2"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-work", "sat - fri: 7:00am - 6:00pm") %></li>
                                </ul>
                                <ul class="wm-adminuser-section">
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#ModalLogin"></a>
                                    </li>
                                    <li>
                                        <a href="#" class="wm-search-btn" data-toggle="modal" data-target="#ModalSearch"><i class="wmicon-search"></i></a>
                                    </li>
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
                                    <img src="../Template/images/logo-5.png" alt="" style="height: 62px;"></a>
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
                                    </div>
                                </nav>
                                <!--// Navigation \\-->
                                <a href="../StudentSubmitting.aspx" class="wm-header-btn"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--// MainHeader \\-->

            </header>
            <!--// Header \\-->

            <!--// Main Banner \\-->
            <div class="wm-main-banner" id="home">


                <div class="container">
                    <hr>
                    <div class="row" style="direction:rtl;text-align:right">
                        <aside class="col-sm-2"></aside>
                        <aside class="col-sm-8">

                            <div class="wm-our-course-detail">
                                <!--<div class="wm-title-full">
                                    <h2><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-title", "الأحكام والشروط") %></h2>
                                </div>
                                <p class="wm-text">Architecture and engineering have a history where research and practice go hand in hand, where many great practices have grown as a result of fundamental research and where many research projects arise from ground-breaking design. This is especially true during periods of economic inactivity when recent modes of working are called into question and new modes (sometimes based on rediscovered historical precedent) are established.</p>
                                <p>The programme encourages students to develop advanced and speculative approaches to the design of cities, landscape and territories. It promotes high design values and the integration of new and innovative technologies to address the challenges facing contemporary cities, such as urban growth, climate change, globalisation and social inequality. The programme is designed for students of architecture, landscape architecture, engineering and related disciplines, who wish to enhance their academic, intellectual and professional skills. </p>
                                <div class="wm-course-blockquote-two">
                                    <blockquote>Training is everything. The peach was once a bitter almond; cauliflower is nothing but cabbage with an education.</blockquote>
                                    <span>- Mark Twain</span>
                                </div>
                                <div class="wm-courses-info">
                                    <div class="wm-title-full">
                                        <h2>What You’ll Study</h2>
                                    </div>
                                    <ul>
                                        <li><a href="#" class="wmicon-lock"></a>Landscape architecture</li>
                                        <li><a href="#" class="wmicon-lock"></a>Classical Archaeology and Ancient History</li>
                                        <li><a href="#" class="wmicon-lock"></a>Engineering</li>
                                        <li><a href="#" class="wmicon-lock"></a>Mathematics</li>
                                        <li><a href="#" class="wmicon-lock"></a>Planning or all of related discipline</li>
                                        <li><a href="#" class="wmicon-lock"></a>Mathematics and Computer Science</li>
                                        <li><a href="#" class="wmicon-lock"></a>Exceptionally, applicants from geography </li>
                                        <li><a href="#" class="wmicon-lock"></a>Philosophy, Politics and Economics(PPE)</li>
                                        <li><a href="#" class="wmicon-lock"></a>Ecology & social sciences will also be considered</li>
                                        <li><a href="#" class="wmicon-lock"></a>Mathematics and Statistics</li>
                                    </ul>
                                </div>-->
                                <div class="wm-certification-listing">
                                    <div class="wm-title-full">
                                        <h2><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-Title", "الأحكام والشروط") %></h2>
                                    </div>
                                    <p><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-SubTitle", "اقر بأنني قد أطلعت على البنود الموضحة أدناه وهذا إقرار مني بالموافقة عليها والتقيد بموجبها وعلى ذلك أوقع وهي :-") %> </p>
                                    <ul>
                                        <li><a href="#" class="wmicon-lock"></a><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-1", "أولاً: التقيد والإلتزام بالتعليمات والأنظمة واللوائح المعمول بها في الجامعة وأن سنة الأمتياز جزء لايتجزأ من الخطة الدراسية وإتمام المرحلة الدراسية لنيل الشهادة.") %></li>
                                        <li><a href="#" class="wmicon-lock"></a><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-2", "ثانياً: إحتساب الغياب يبدأ من أول يوم من الفصل الدراسي وإذا قلت نسبة الحضور عن 75% من المحاضرات والدروس العملية والسريرية لأي مقرر فيعتبر الطالب محروم من دخول الإختبار النهائي كما يعتبر راسباً في المقرر وليس له حق الإعتراض.") %> </li>
                                        <li><a href="#" class="wmicon-lock"></a><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-3", "ثالثاً: الإلتزام بتسديد الرسوم الدراسية قبل بداية الفصل الدراسي بأسبوع هي مسؤولية الطالب حتى يتم إنهاء إجراءات التسجيل لذلك الفصل ولايحق له التسجيل بعد نهاية الأسبوع الأول من الدراسة إذا لم تدفع الرسوم الدراسية المستحقة للفصل الدراسي مع العلم أن حصول الطالب على منحة أو بعثة دراسية من أي جهة وتأخر دفع الرسوم عن الموعد المحدد فأن المسؤول أمام الجامعة هو الطالب نفسه.") %></li>
                                        <li><a href="#" class="wmicon-lock"></a><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-4", "رابعاً: دفع رسوم التسجيل لمرة واحدة مع بداية التسجيل ولا تسترد بأي حال من الأحوال.") %></li>
                                        <li><a href="#" class="wmicon-lock"></a><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-5", "خامساً: الإلتزام بالشروط المنظمة لإسترداد الرسوم الدراسية في حالة الإنسحاب أو الإعتذار عن الدراسة (إذا إنسحب أو إعتذر الطالب / الطالبة قبل بدء الدراسة تعاد له 80% من الرسوم الدراسية وبعد بدأ أول يوم دراسي لايستحق للطالب / الطالبة استرداد لأي مبلغ).") %></li>
                                        <li><a href="#" class="wmicon-lock"></a><% = ElectronicSubmission.FieldNames.getFieldName("TermsAndConditions-6", "سادساً: بعد إنتهاء إجراءات القبول وإكمال جميع المتطلبات سيتم الإتفاق والتوقيع على العقد المنظم لعلاقة الطرفين (الجامعة- الطالب/الطالبة) ويزود كل طرف بنسخة منه.") %></li> 
                                    </ul>
                                </div>
                            </div>

                        </aside>
                        <aside class="col-sm-2"></aside>
                        </div>
                     <div class="row">
                            <aside class="col-md-3"></aside>
                            <aside class="col-md-3">
                                <asp:Button ID="Disagree" runat="server" Text="لا أوافق" CssClass="subscribe btn btn-danger btn-block" OnClick="Disagree_Click" />
                                </aside>
                        
                            <aside class="col-md-3">
                            <asp:Button ID="Agree" runat="server" Text="أوافق" CssClass="subscribe btn btn-success btn-block" OnClick="Agree_Click" />
                           </aside>
                            <aside class="col-md-3"></aside>
                        <!-- col.// -->
                    </div>

                    <!-- row.// -->

                </div>
                <!--container end.//-->
                <br />
                <br />

            </div>
            <!--// Main Banner \\-->

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
                                    <img src="../../Template/images/logo-5.png" alt="" style="height: 77px;"></a>
                                <ul>
                                    <li><i class="wm-color wmicon-pin"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641">
                                        <p><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></p>
                                    </a></li>
                                    <li><i class="wm-color wmicon-phone"></i><a href="tel:920000842" style="color:black;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-PhoneNumber", "920-000-842") %></a></li>
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
                                    <li class="active"><a href="../../homepage.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-home", "Home") %></a></li>
                                    <li><a href="../../homepage.aspx#colleges"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Colleges", "Colleges") %></a></li>
                                    <li><a href="../../homepage.aspx#steps"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Steps", "Steps") %></a></li>
                                    <li><a href="../../homepage.aspx#contactas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Contact", "Contact") %></a></li>
                                    <li><a href="../../homepage.aspx#aboutas"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-About", "About") %></a></li>
                                    <li><a href="../../StudentSubmitting.aspx"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Admission", "Admission") %></a></li>
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

    </form>


    <!-- jQuery (necessary for JavaScript plugins) -->
    <script type="text/javascript" src="../Template/script/jquery.js"></script>
    <script type="text/javascript" src="../Template/script/modernizr.js"></script>
    <script type="text/javascript" src="../Template/script/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Template/script/jquery.prettyphoto.js"></script>
    <script type="text/javascript" src="../Template/script/jquery.countdown.min.js"></script>
    <script type="text/javascript" src="../Template/script/fitvideo.js"></script>
    <script type="text/javascript" src="../Template/script/skills.js"></script>
    <script type="text/javascript" src="../Template/script/slick.slider.min.js"></script>
    <script type="text/javascript" src="../Template/script/waypoints-min.js"></script>
    <script type="text/javascript" src="../Template/build/mediaelement-and-player.min.js"></script>
    <script type="text/javascript" src="../Template/script/isotope.min.js"></script>
    <script type="text/javascript" src="../Template/script/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
    <script type="text/javascript" src="../Template/script/functions.js"></script>

</body>

<!-- index18:22  -->
</html>
