<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
  <title>MYBANK | FAQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icomoon/style.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="css/aos.css">
  <link rel="stylesheet" href="css/style.css">
 

  <style>
    * {
      box-sizing: border-box;
    }

    body {
      font-family: 'Open Sans', sans-serif;
      background: linear-gradient(135deg, #eef4ff 0%, #f6f9ff 45%, #eaf1ff 100%);
      color: #0f172a;
    }

    .site-navbar {
      background: rgba(8, 25, 61, 0.88);
      backdrop-filter: blur(14px);
      -webkit-backdrop-filter: blur(14px);
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.18);
    }

    .site-logo a {
      font-weight: 800;
      letter-spacing: 1px;
      color: #ffffff !important;
    }

    .site-logo .text-primary {
      color: #7db7ff !important;
    }

    .site-menu li a {
      color: rgba(255, 255, 255, 0.88) !important;
      font-weight: 600;
      transition: 0.3s ease;
    }

    .site-menu li a:hover {
      color: #9bc4ff !important;
    }

    .site-menu .btn.btn-primary {
      background: linear-gradient(135deg, #2d5fd3, #6ea8ff);
      border: none;
      border-radius: 30px;
      padding: 10px 24px;
      font-weight: 700;
      box-shadow: 0 8px 20px rgba(45, 95, 211, 0.28);
    }

    .faq-section {
      padding: 130px 0 90px;
      position: relative;
      overflow: hidden;
    }

    .faq-section::before {
      content: "";
      position: absolute;
      top: -100px;
      right: -100px;
      width: 280px;
      height: 280px;
      border-radius: 50%;
      background: rgba(74, 128, 240, 0.12);
    }

    .faq-section::after {
      content: "";
      position: absolute;
      bottom: -120px;
      left: -120px;
      width: 320px;
      height: 320px;
      border-radius: 50%;
      background: rgba(10, 37, 88, 0.07);
    }

    .faq-hero {
      background: linear-gradient(135deg, #081f4d 0%, #0f3279 55%, #2f67e0 100%);
      border-radius: 32px;
      padding: 50px 40px;
      color: #fff;
      margin-bottom: 50px;
      box-shadow: 0 24px 60px rgba(10, 37, 88, 0.24);
      position: relative;
      overflow: hidden;
    }

    .faq-hero::before {
      content: "";
      position: absolute;
      width: 220px;
      height: 220px;
      top: -70px;
      right: -50px;
      background: rgba(255, 255, 255, 0.08);
      border-radius: 50%;
    }

    .faq-hero::after {
      content: "";
      position: absolute;
      width: 200px;
      height: 200px;
      bottom: -80px;
      left: -60px;
      background: rgba(255, 255, 255, 0.05);
      border-radius: 50%;
    }

    .faq-hero-content {
      position: relative;
      z-index: 2;
      text-align: center;
    }

    .faq-hero-content h1 {
      font-size: 42px;
      font-weight: 800;
      margin-bottom: 14px;
      color: #fff;
    }

    .faq-hero-content h1 span {
      color: #9bc4ff;
    }

    .faq-hero-content p {
      font-size: 16px;
      color: rgba(255, 255, 255, 0.88);
      line-height: 1.8;
      max-width: 780px;
      margin: 0 auto;
    }

    .line {
      width: 90px;
      height: 5px;
      border-radius: 20px;
      margin: 24px auto 0;
      background: linear-gradient(90deg, #ffffff, #8fbeff);
    }

    .faq-wrapper {
      max-width: 950px;
      margin: 0 auto;
      position: relative;
      z-index: 2;
    }

    .faq-accordian .card {
      border: none;
      border-radius: 24px;
      margin-bottom: 22px;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.82);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      box-shadow: 0 16px 40px rgba(10, 37, 88, 0.10);
      transition: all 0.3s ease;
    }

    .faq-accordian .card:hover {
      transform: translateY(-4px);
      box-shadow: 0 22px 50px rgba(10, 37, 88, 0.14);
    }

    .faq-accordian .card-header {
      border: none;
      background: transparent;
      padding: 0;
    }

    .faq-accordian .card-header h6 {
      margin: 0;
      padding: 22px 28px;
      font-size: 17px;
      font-weight: 700;
      color: #0A2558;
      cursor: pointer;
      position: relative;
      line-height: 1.6;
      background: linear-gradient(135deg, rgba(255,255,255,0.95), rgba(240,246,255,0.92));
      transition: all 0.3s ease;
    }

    .faq-accordian .card-header h6:hover {
      color: #1748a0;
    }

    .faq-accordian .card-header h6 span {
      position: absolute;
      right: 24px;
      top: 22px;
      font-size: 20px;
      color: #2d5fd3;
    }

    .faq-accordian .card-body {
      padding: 0 28px 24px 28px;
      background: rgba(255, 255, 255, 0.86);
    }

    .faq-accordian .card-body p {
      margin: 0;
      font-size: 15px;
      line-height: 1.9;
      color: #5b667a;
    }

    .empty-faq {
      max-width: 850px;
      margin: 0 auto;
      text-align: center;
      background: rgba(255,255,255,0.82);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border-radius: 24px;
      padding: 45px 25px;
      box-shadow: 0 16px 40px rgba(10, 37, 88, 0.10);
    }

    .empty-faq h3 {
      color: #0A2558;
      font-weight: 800;
      margin-bottom: 10px;
    }

    .empty-faq p {
      color: #667085;
      margin: 0;
      font-size: 15px;
    }

    .footer-glossy {
      background: linear-gradient(135deg, #081b42 0%, #0b2558 100%);
      color: rgba(255, 255, 255, 0.86);
      padding: 70px 0 35px;
      margin-top: 70px;
      position: relative;
      overflow: hidden;
    }

    .footer-glossy::before {
      content: "";
      position: absolute;
      top: -60px;
      right: -60px;
      width: 180px;
      height: 180px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.05);
    }

    .footer-glossy h2,
    .footer-glossy h4 {
      color: #ffffff;
      font-weight: 700;
      margin-bottom: 18px;
    }

    .footer-glossy .footer-heading {
      color: #ffffff;
      font-weight: 800;
      margin-bottom: 18px;
    }

    .footer-glossy a {
      color: rgba(255, 255, 255, 0.78);
      transition: 0.3s ease;
    }

    .footer-glossy a:hover {
      color: #9bc4ff;
      text-decoration: none;
    }

    .footer-social a {
      font-size: 20px;
      margin-right: 8px;
    }

    .footer-subscribe .form-control {
      height: 48px;
      border-radius: 30px 0 0 30px;
      border: 1px solid rgba(255,255,255,0.18);
      background: rgba(255,255,255,0.08);
      color: white;
    }

    .footer-subscribe .form-control::placeholder {
      color: rgba(255,255,255,0.6);
    }

    .footer-subscribe .btn {
      border-radius: 0 30px 30px 0;
      background: linear-gradient(135deg, #2d5fd3, #7db7ff);
      border: none;
      color: #fff;
      font-weight: 700;
      padding-left: 20px;
      padding-right: 20px;
    }

    @media (max-width: 991px) {
      .faq-hero-content h1 {
        font-size: 34px;
      }

      .faq-hero {
        padding: 36px 22px;
      }
    }

    @media (max-width: 767px) {
      .faq-section {
        padding: 110px 0 70px;
      }

      .faq-hero-content h1 {
        font-size: 28px;
      }

      .faq-hero-content p {
        font-size: 14px;
      }

      .faq-accordian .card-header h6 {
        padding: 18px 20px;
        font-size: 15px;
      }

      .faq-accordian .card-header h6 span {
        right: 18px;
        top: 18px;
      }

      .faq-accordian .card-body {
        padding: 0 20px 20px 20px;
      }
    }
  </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
   

  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>

  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">
      <div class="container">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2">
            <h1 class="mb-0 site-logo">
              <a href="/" class="h2 mb-0">MY<span class="text-primary">BANK</span></a>
            </h1>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="/" class="nav-link">Home</a></li>
                <li><a href="/create_account" class="nav-link">Open Account</a></li>
                <li><a href="/register" class="nav-link">Register</a></li>
                <li><a href="/faq" class="nav-link">FAQs</a></li>
                <li><a href="/contact" class="nav-link">Contact Us</a></li>
                <li><a href="/login"><button class="btn btn-primary">Login</button></a></li>
              </ul>
            </nav>
          </div>

          <div class="col-6 d-inline-block d-xl-none ml-md-0 py-3" style="position: relative; top: 3px;">
            <a href="#" class="site-menu-toggle js-menu-toggle float-right">
              <span class="icon-menu h3"></span>
            </a>
          </div>

        </div>
      </div>
    </header>

    <section class="faq-section" id="faq-sec">
      <div class="container">

        <div class="faq-hero">
          <div class="faq-hero-content">
            <h1><span>Frequently</span> Asked Questions</h1>
            <p>
              Find quick answers to the most common banking questions in a premium, modern and glossy FAQ section.
            </p>
            <div class="line"></div>
          </div>
        </div>

        <c:choose>
          <c:when test="${not empty faqlist}">
            <div class="faq-wrapper">
              <div class="accordion faq-accordian" id="faqAccordion">

                <c:forEach var="faq" items="${faqlist}" varStatus="loop">
                  <div class="card">
                    <div class="card-header" id="heading${loop.index}">
                      <h6 class="mb-0 collapsed"
                          data-toggle="collapse"
                          data-target="#collapse${loop.index}"
                          aria-expanded="false"
                          aria-controls="collapse${loop.index}">
                        ${faq.question}
                        <span class="icon-plus"></span>
                      </h6>
                    </div>
                    <div class="collapse"
                         id="collapse${loop.index}"
                         aria-labelledby="heading${loop.index}"
                         data-parent="#faqAccordion">
                      <div class="card-body">
                        <p>${faq.answer}</p>
                      </div>
                    </div>
                  </div>
                </c:forEach>

              </div>
            </div>
          </c:when>

          <c:otherwise>
            <div class="empty-faq">
              <h3>No FAQs Available</h3>
              <p>FAQs have not been added yet. Please check again later.</p>
            </div>
          </c:otherwise>
        </c:choose>

      </div>
    </section>

    <footer class="footer-glossy">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-5">
                <h2 class="footer-heading mb-4">About Us</h2>
                <h4>Registered Office</h4>
                <address class="address">
                  MYBANK, SDI<br>
                  BHUBANESWAR, TARABOI, KHORDHA, 752050, ODISHA, INDIA.<br>
                  Tel : 8249669907, 7787977529
                </address>
              </div>

              <div class="col-md-3 ml-auto">
                <h2 class="footer-heading mb-4">Quick Links</h2>
                <ul class="list-unstyled">
                  <li><a href="/">Home</a></li>
                  <li><a href="/create_account">Open Account</a></li>
                  <li><a href="/register">Register</a></li>
                  <li><a href="/login">Login</a></li>
                  <li><a href="/faq">FAQ</a></li>
                </ul>
              </div>

              <div class="col-md-3 footer-social">
                <h2 class="footer-heading mb-4">Follow Us</h2>
                <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
                <a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <h2 class="footer-heading mb-4">Subscribe Newsletter</h2>
            <form action="#" method="post" class="footer-subscribe">
              <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Enter Email" aria-label="Enter Email" aria-describedby="button-addon2">
                <div class="input-group-append">
                  <button class="btn" type="button" id="button-addon2">Send</button>
                </div>
              </div>
            </form>
          </div>

        </div>
      </div>
    </footer>

  </div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/isotope.pkgd.min.js"></script>
  <script src="js/main.js"></script>

</body>
</html>