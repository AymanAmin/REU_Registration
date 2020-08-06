<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="PaymentProcessDetails.aspx.cs" Inherits="ElectronicSubmission.Payment.PaymentProcessDetails" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon icon -->
    <link rel="icon" href="..\Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title><% = ElectronicSubmission.FieldNames.getFieldName("homepage-title", "REU - Admission") %></title>

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

    <link href="../Template/css/icofont/css/icofont.css" rel="stylesheet">
    <!-- ico font -->

    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type='text/javascript'>
        function scrollToElement() {
            //Get target
            setTimeout(function () {
                var target = document.getElementById("colleges").offsetTop;

                //Scrolls to that target location
                window.scrollTo(0, target);
            }, 1);
        }
    </script>
</head>
<body>
    <form runat="server">
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
                                        <li><a href="../PaymentProcess.aspx?lang=2">English</a></li>
                                        <li><a href="../PaymentProcess.aspx?lang=1" style="font-size: 130%; font-weight: bold;">عربي</a></li>
                                    </ul>
                                </div>
                                <ul class="wm-stripinfo">
                                    <li><i class="wmicon-location"></i><a href="https://www.google.com.sa/maps/place/Riyadh+Elm+University/@24.7595734,46.4668287,11z/data=!4m8!1m2!2m1!1sriyadh+colleges+of+dentistry+and+pharmacy!3m4!1s0x3e2efc51ecffffff:0x654f534d5c948f2e!8m2!3d24.6580528!4d46.7005641" style="color: white;"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-Address", "King Fahd Branch Road, An Namudhajiyah, Riyadh 12734, Saudi Arabia") %></a></li>
                                    <li><i class="wmicon-technology4"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-PhoneNumber", "920-000-842") %></li>
                                    <li><i class="wmicon-clock2"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-work", "sat - fri: 7:00am - 6:00pm") %></li>
                                </ul>
                                <ul class="wm-adminuser-section">
                                    <li>
                                        <a href="#" data-toggle="modal" data-target="#ModalLogin"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-login", "Login") %></a>
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
                                <a href="../../homepage.aspx" class="wm-logo">
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
                    <div id="Div_payment" runat="server" class="row" visible="false">
                        <aside class="col-sm-3"></aside>
                        <aside class="col-sm-6">
                            <!--<p>Payment form1</p>-->

                            <article class="card" style="border: 1px solid gray; border-radius: 10px; padding: 5%">
                                <div class="card-body p-5">
                                    <!--<p>
                                        <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-visa.png">
                                        <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-mastercard.png">
                                        <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-american-ex.png">
                                    </p>-->
                            <p class="alert alert-success" style="display: none">Some text success or error</p>

                            
                                 <div class="row">
                                      
                                           <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-PaymentType", "Payment Type") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:DropDownList ID="PaymentType" class="form-control" runat="server" OnSelectedIndexChanged="PaymentType_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Value="1">VISA</asp:ListItem>
                                                    <asp:ListItem Value="2">MASTER</asp:ListItem>
                                                    <asp:ListItem Value="3">MADA</asp:ListItem>
                                                    
                                                </asp:DropDownList> 
                                                 <!--<asp:ListItem Value="4">SADAD</asp:ListItem>-->
                                            </div>
                                            <asp:RequiredFieldValidator ID="PaymentTypeValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Select Payment Type" ValidationGroup="valFormGroup" ControlToValidate="PaymentType" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    <div runat="server" id="Visa">
                                         <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentName", "Student Name") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentName" runat="server" class="form-control" placeholder="Enter Student Name"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentNameValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Name" ValidationGroup="valFormGroup" ControlToValidate="StudentName" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                  
                                       <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-Studentsurname", "Student surname") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="Studentsurname" runat="server" class="form-control" placeholder="Enter surname"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentsurnameValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student surname" ValidationGroup="valFormGroup" ControlToValidate="Studentsurname" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>

                                         <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentEmail", "Student Email") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentEmail" runat="server" class="form-control" placeholder="Enter Student Email"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentEmailValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Email" ValidationGroup="valFormGroup" ControlToValidate="StudentEmail" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>

                                          <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentCountry", "Student Country") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:DropDownList ID="StudentCountry" runat="server" ></asp:DropDownList>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentCountryValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Country" ValidationGroup="valFormGroup" ControlToValidate="StudentCountry" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>

                                           <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentState ", "Student State ") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentState" runat="server" class="form-control" placeholder="Enter Student State"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentStateValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student State" ValidationGroup="valFormGroup" ControlToValidate="StudentState" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>

                                           <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentCity", "Student City") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentCity" runat="server" class="form-control" placeholder="Enter Student City"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentCityValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student City " ValidationGroup="valFormGroup" ControlToValidate="StudentCity" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>

                                         <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentStreet", "Student Street") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentAddress" runat="server" class="form-control" placeholder="Enter Student Address"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentAddressValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Address" ValidationGroup="valFormGroup" ControlToValidate="StudentAddress" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>

                                         <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentPostcode", "Student Postcode") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                            
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentPostcode" runat="server" class="form-control" placeholder="Enter Student Postcode"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="StudentPostcodeValidator" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student Postcode" ValidationGroup="valFormGroup" ControlToValidate="StudentPostcode" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                     <div runat="server" id="SADAD" visible="false">
                                         <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentGender", "Student Gender") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:DropDownList ID="StudentGender" class="form-control" runat="server" OnSelectedIndexChanged="PaymentType_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                                    <asp:ListItem Value="2">Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student FirstName" ValidationGroup="valFormGroup" ControlToValidate="StudentFirstName" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>

                                         <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentFirstName", "Student FirstName") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentFirstName" runat="server" class="form-control" placeholder="Enter Student FirstName"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student FirstName" ValidationGroup="valFormGroup" ControlToValidate="StudentFirstName" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>

                                         <div class="form-group col-sm-12">
                                            <label><% = ElectronicSubmission.FieldNames.getFieldName("PaymentProcessDetails-StudentLastName", "Student LastName") %><i class="icofont icofont-star-alt-1 text-danger"></i></label>
                                            <div class="input-group">
                                            
                                                <span class="input-group-addon"><i class="icofont icofont-underline"></i></span>
                                                <asp:TextBox ID="StudentLastName" runat="server" class="form-control" placeholder="Enter Student LastName"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" Text="Enter Student LastName" ValidationGroup="valFormGroup" ControlToValidate="StudentLastName" Display="Dynamic" CssClass="col-form-label" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </div>
                                   </div>

                                </div>
                            <!-- row.// -->


                                    <asp:Button ID="confirm" runat="server" Text="confirm" CssClass="subscribe btn btn-primary btn-block" ValidationGroup="valFormGroup" OnClick="confirm_Click" />
                            </div>
                                <!-- card-body.// -->
                            </article>
                            <!-- card.// -->


                        </aside>
                        <aside class="col-sm-3"></aside>
                        <!-- col.// -->
                    </div>

                    <div id="Div_invalid" runat="server" class="row" visible="false">
                        <aside class="col-sm-3"></aside>
                        <aside class="col-sm-6">
                            <asp:Image ID="image" runat="server" style="width:100%" ImageUrl="~/Template/images/notfound.png" /></aside>
                        <aside class="col-sm-3"></aside>
                    </div>

                       <div id="Div_NotFound" runat="server" class="row" visible="false">
                        <aside class="col-sm-3"></aside>
                        <aside class="col-sm-6">
                            <asp:Image ID="image2" runat="server" style="width:100%" ImageUrl="~/Template/images/notfound2.jpg" /></aside>
                        <aside class="col-sm-3"></aside>
                    </div>

                     <div id="Div_Sucess" runat="server" class="row" visible="false" >
                         
                        <aside class="col-sm-4"></aside>
                        <aside class="col-sm-4" style="text-align:center">
                            <asp:Image ID="image1" runat="server" style="width:70%" ImageUrl="~/Template/images/success.png" /></aside>
                        <aside class="col-sm-4"></aside>
                         <aside class="col-sm-12" style="text-align:center;color:#4fa7a0"><h1 runat="server" id="SDADNumber"></h1></aside>
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
                                    <li><i class="wm-color wmicon-phone"></i><% = ElectronicSubmission.FieldNames.getFieldName("homepage-PhoneNumber", "920-000-842") %></li>
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

        <!-- ModalLogin Box -->
        <div class="modal fade" id="ModalLogin" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">

                        <div class="wm-modallogin-form wm-login-popup">
                            <span class="wm-color"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-login", "Login") %></span>
                            <ul>
                                <li>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Your Email"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Your Password" TextMode="Password"></asp:TextBox>
                                </li>
                                <li><a href="Pages/Auth/ResetPassword.aspx" class="wm-forgot-btn"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-ForgotPassword", "Forgot Password?") %></a> </li>
                                <li>
                                    <asp:Button ID="LoginAcc" runat="server" Text="LogIn" />
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- ModalLogin Box -->

        <!-- ModalSearch Box -->
        <div class="modal fade" id="ModalSearch" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="wm-modallogin-form">
                            <span class="wm-color"><% = ElectronicSubmission.FieldNames.getFieldName("homepage-FindYourBachelors", "Find Your Bachelors") %></span>
                            <ul>
                                <li>
                                    <input type="text" placeholder="Bachelors..." id="keywordBachelors" runat="server" /></li>
                                <li>
                                    <asp:Button ID="SearchkeyWord" runat="server" Text="Button" /></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- ModalSearch Box -->
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

