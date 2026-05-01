<!doctype html>
<html lang="en">

<head>
  <title>DIGITALBANK</title>
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
    html {
      scroll-behavior: smooth;
    }

    body {
      font-family: 'Open Sans', sans-serif;
      background: linear-gradient(180deg, #eef4ff 0%, #f8fbff 40%, #ffffff 100%);
      color: #0b1f4d;
      overflow-x: hidden;
    }

    #nsms,
    #esms,
    #ssms,
    #msms {
      color: #ff4d6d;
      font-size: 13px;
      font-weight: 600;
      margin-top: 6px;
      display: block;
    }

    .site-navbar {
      background: rgba(8, 25, 61, 0.82);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      box-shadow: 0 10px 35px rgba(11, 37, 88, 0.18);
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
      transition: all 0.3s ease;
    }

    .site-logo a {
      font-weight: 800 !important;
      font-size: 30px !important;
      color: #ffffff !important;
      letter-spacing: 1px;
      text-decoration: none;
    }

    .site-logo .text-primary {
      color: #7db7ff !important;
      text-shadow: 0 0 16px rgba(125, 183, 255, 0.45);
    }

    .site-menu > li > a {
      color: rgba(255, 255, 255, 0.92) !important;
      font-weight: 700;
      font-size: 14px;
      border-radius: 14px;
      padding: 10px 16px !important;
      transition: 0.3s ease;
    }

    .site-menu > li > a:hover {
      background: rgba(255, 255, 255, 0.10);
      color: #fff !important;
      transform: translateY(-1px);
    }

    .site-navigation .has-children .dropdown {
      border: none;
      border-radius: 18px;
      overflow: hidden;
      background: rgba(255, 255, 255, 0.95);
      box-shadow: 0 20px 45px rgba(10, 37, 88, 0.20);
      padding: 10px;
    }

    .site-navigation .has-children .dropdown li a {
      border-radius: 12px;
      font-weight: 700;
      color: #0A2558 !important;
      transition: 0.3s ease;
    }

    .site-navigation .has-children .dropdown li a:hover {
      background: linear-gradient(135deg, #edf4ff, #f8fbff);
      color: #2463eb !important;
      transform: translateX(4px);
    }

    .btn.btn-primary {
      background: linear-gradient(135deg, #2d5fd3, #7db7ff) !important;
      border: none !important;
      border-radius: 30px !important;
      padding: 11px 26px !important;
      font-weight: 700 !important;
      box-shadow: 0 12px 24px rgba(45, 95, 211, 0.25);
      transition: 0.3s ease;
    }

    .btn.btn-primary:hover {
      transform: translateY(-2px) scale(1.02);
      box-shadow: 0 18px 30px rgba(45, 95, 211, 0.35);
    }

    .site-blocks-cover {
      position: relative;
      min-height: 100vh;
      background-size: cover;
      background-position: center center;
    }

    .site-blocks-cover.overlay:before {
      background: linear-gradient(135deg, rgba(4, 20, 53, 0.82), rgba(19, 62, 148, 0.62));
    }

    .site-blocks-cover .slide {
      padding: 45px 35px;
      background: rgba(255, 255, 255, 0.10);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border-radius: 28px;
      box-shadow: 0 20px 50px rgba(0, 0, 0, 0.18);
      border: 1px solid rgba(255, 255, 255, 0.12);
    }

    .site-blocks-cover h1 {
      font-size: 54px;
      font-weight: 800;
      letter-spacing: 1px;
      text-shadow: 0 8px 24px rgba(0, 0, 0, 0.30);
    }

    .site-blocks-cover .desc {
      font-size: 17px;
      line-height: 1.9;
      color: rgba(255, 255, 255, 0.92);
    }

    .section-title,
    .faq,
    h2.section-title {
      font-weight: 800 !important;
      color: #0A2558 !important;
    }

    .site-section,
    .faq_area {
      padding-top: 90px;
      padding-bottom: 90px;
    }

    .unit-4,
    .card,
    .contact-card,
    .feature-box,
    .service-glass {
      background: rgba(255, 255, 255, 0.88);
      border-radius: 24px;
      box-shadow: 0 12px 35px rgba(18, 52, 110, 0.10);
      border: 1px solid rgba(180, 206, 255, 0.35);
      transition: 0.35s ease;
    }

    .unit-4:hover,
    .card:hover,
    .feature-box:hover,
    .service-glass:hover {
      transform: translateY(-8px);
      box-shadow: 0 20px 45px rgba(18, 52, 110, 0.16);
    }

    .unit-4 {
      padding: 32px 24px;
      height: 100%;
    }

    .unit-4 h3,
    .card-title {
      color: #0A2558;
      font-weight: 800;
      font-size: 22px;
      margin-bottom: 14px;
    }

    .unit-4 p,
    .lead,
    .card-body p {
      color: #5a6786;
      line-height: 1.8;
    }

    .circle-bg img,
    .img-fluid {
      border-radius: 26px;
      box-shadow: 0 20px 45px rgba(16, 44, 104, 0.14);
    }

    .faq_area {
      background: linear-gradient(135deg, #edf4ff, #f9fbff);
      border-radius: 34px;
      margin: 40px auto;
      width: calc(100% - 40px);
      box-shadow: 0 20px 60px rgba(20, 54, 120, 0.08);
    }

    .faq_area .card {
      margin-bottom: 18px;
      overflow: hidden;
    }

    .faq_area .card-header {
      background: transparent;
      border: none;
      padding: 0;
    }

    .faq_area .card-header h6 {
      padding: 22px 24px;
      margin: 0;
      font-size: 17px;
      font-weight: 700;
      color: #0A2558;
      cursor: pointer;
    }

    .faq_area .card-body {
      padding: 0 24px 24px 24px;
      color: #5d6883;
      line-height: 1.8;
    }

    #contact-section .bg-white {
      background: rgba(255, 255, 255, 0.92) !important;
      border-radius: 28px;
      box-shadow: 0 16px 40px rgba(13, 45, 104, 0.10);
      border: 1px solid rgba(185, 210, 255, 0.40);
    }

    .form-control {
      border-radius: 14px;
      border: 1px solid #dbe6ff;
      padding: 14px 16px;
      height: auto;
      box-shadow: none !important;
      transition: 0.3s ease;
    }

    .form-control:focus {
      border-color: #6aa8ff;
      box-shadow: 0 0 0 4px rgba(106, 168, 255, 0.15) !important;
    }

    iframe {
      border-radius: 24px;
      box-shadow: 0 16px 40px rgba(13, 45, 104, 0.12);
      overflow: hidden;
      width: 100%;
      max-width: 100%;
    }

    .site-footer {
      background: linear-gradient(135deg, #081938, #0f2d68);
      color: rgba(255, 255, 255, 0.85);
      border-top-left-radius: 36px;
      border-top-right-radius: 36px;
      margin-top: 60px;
      padding-top: 70px;
      box-shadow: 0 -10px 30px rgba(0, 0, 0, 0.08);
    }

    .site-footer .footer-heading,
    .site-footer h4,
    .site-footer a,
    .site-footer .copyright a {
      color: #ffffff !important;
    }

    .site-footer a:hover {
      color: #7db7ff !important;
      text-decoration: none;
    }

    .footer-social a {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 42px;
      height: 42px;
      background: rgba(255, 255, 255, 0.12);
      border-radius: 50%;
      margin-right: 8px;
      transition: 0.3s ease;
    }

    .footer-social a:hover {
      background: rgba(125, 183, 255, 0.25);
      transform: translateY(-3px);
    }

    .app-logo img {
      border-radius: 14px;
      transition: 0.3s ease;
    }

    .app-logo img:hover {
      transform: scale(1.04);
    }

    .copyright {
      padding: 18px 0 28px;
      color: rgba(255, 255, 255, 0.82);
      margin-bottom: 0;
    }

    .glass-badge {
      display: inline-block;
      padding: 10px 18px;
      border-radius: 30px;
      background: rgba(255, 255, 255, 0.16);
      color: #fff;
      font-size: 13px;
      font-weight: 700;
      letter-spacing: 1px;
      margin-bottom: 20px;
      border: 1px solid rgba(255, 255, 255, 0.18);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
    }

    .hero-actions a {
      margin: 8px;
    }

    @media (max-width: 991px) {
      .site-blocks-cover h1 {
        font-size: 38px;
      }

      .site-blocks-cover .slide {
        padding: 30px 20px;
      }

      .faq_area {
        width: calc(100% - 20px);
      }
    }

    @media (max-width: 767px) {
      .site-blocks-cover h1 {
        font-size: 30px;
      }

      .site-section,
      .faq_area {
        padding-top: 70px;
        padding-bottom: 70px;
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
              <a href="/" class="h2 mb-0">DIGITAL<span class="text-primary">BANK</span></a>
            </h1>
          </div>

          <div class="col-12 col-md-10 d-none d-xl-block">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="/" class="nav-link">Home</a></li>
                <li><a href="#services-section" class="nav-link">Services</a></li>
                <li class="has-children">
                  <a href="#" class="nav-link">Apply Now</a>
                  <ul class="dropdown">
                    <li><a href="/create_account" class="nav-link">New Account</a></li>
                    <li><a href="/register" class="nav-link">Register Account</a></li>
                  </ul>
                </li>
                <li><a href="#faq" class="nav-link">FAQs</a></li>
                <li><a href="#about-section" class="nav-link">About Us</a></li>
                <li><a href="#contact-section" class="nav-link">Contact Us</a></li>
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

    <div class="site-blocks-cover overlay" style="background-image: url(images/hero_2.jpg);" data-aos="fade" id="home-section">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-10 mt-lg-5 text-center">
            <div class="single-text owl-carousel">

              <div class="slide">
                <span class="glass-badge">SMART & SECURE & MODERN BANKING</span>
                <h1 class="text-uppercase" data-aos="fade-up">Banking Solutions</h1>
                <p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">
                  At DIGITALBANK We empower your financial journey with secure digital services, fast account access,
                  easy fund transfers, and a smooth online banking experience built for modern users.
                </p>
                <div class="hero-actions" data-aos="fade-up" data-aos-delay="100">
                  <a href="/create_account" class="btn btn-primary mr-2 mb-2">Open Account</a>
                  <a href="#contact-section" class="btn btn-primary mr-2 mb-2">Get In Touch</a>
                </div>
              </div>

              <div class="slide">
                <span class="glass-badge">FAST APPROVAL & EASY ACCESS</span>
                <h1 class="text-uppercase" data-aos="fade-up">Financing Solutions</h1>
                <p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">
                  Explore digital banking made simple with flexible accounts, modern transaction tools, responsive support,
                  and features that help you manage money with confidence and convenience.
                </p>
                <div data-aos="fade-up" data-aos-delay="100">
                  <a href="/login" class="btn btn-primary mr-2 mb-2">Login Now</a>
                </div>
              </div>

              <div class="slide">
                <span class="glass-badge">SAVE MORE & STRESS LESS</span>
                <h1 class="text-uppercase" data-aos="fade-up">Savings Accounts</h1>
                <p class="mb-5 desc" data-aos="fade-up" data-aos-delay="100">
                  Join DIGITALBANK today and experience a polished, secure, and customer-friendly banking platform
                  designed to support your goals from account opening to everyday transactions.
                </p>
                <div data-aos="fade-up" data-aos-delay="100">
                  <a href="/register" class="btn btn-primary mr-2 mb-2">Register</a>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>

      <a href="#next" class="mouse smoothscroll">
        <span class="mouse-icon">
          <span class="mouse-wheel"></span>
        </span>
      </a>
    </div>

    <div class="site-section cta-big-image" id="about-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-md-8 text-center">
            <h2 class="section-title mb-3" data-aos="fade-up">About Us</h2>
            <p class="lead" data-aos="fade-up" data-aos-delay="100">
              At DIGITALBANK, we believe in simple, secure, and reliable digital banking for everyone.
              Our mission is to provide modern financial services with trust, speed, and convenience.
            </p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-6 mb-5" data-aos="fade-up">
            <figure class="circle-bg">
              <img src="images/img_2.jpg" alt="About DigitalBank" class="img-fluid">
            </figure>
          </div>
          <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="100">
            <h3 class="text-black mb-4">We Solve Your Financial Problem</h3>
            <p>
              Our platform is built to make account opening, registration, profile access, transactions,
              and balance checking smooth and convenient for every user.
            </p>
            <p>
              Join DIGITALBANK and experience a better way to manage your money with confidence.
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section" id="next">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4 text-center" data-aos="fade-up">
            <div class="feature-box p-4">
              <img src="images/flaticon-svg/svg/001-wallet.svg" class="img-fluid w-25 mb-4" alt="">
              <h3 class="card-title">Money Savings</h3>
              <p>Smart saving options to help you secure your future and manage your income wisely.</p>
            </div>
          </div>
          <div class="col-md-4 text-center" data-aos="fade-up" data-aos-delay="100">
            <div class="feature-box p-4">
              <img src="images/flaticon-svg/svg/004-cart.svg" class="img-fluid w-25 mb-4" alt="">
              <h3 class="card-title">Digital Banking</h3>
              <p>Access your banking services online anytime with a convenient and secure digital platform.</p>
            </div>
          </div>
          <div class="col-md-4 text-center" data-aos="fade-up" data-aos-delay="200">
            <div class="feature-box p-4">
              <img src="images/flaticon-svg/svg/006-credit-card.svg" class="img-fluid w-25 mb-4" alt="">
              <h3 class="card-title">Credit / Debit Cards</h3>
              <p>Enjoy seamless payments, secure transactions, and easy access to your money everywhere.</p>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-6 mb-5" data-aos="fade-up">
            <figure class="circle-bg">
              <img src="images/about_2.jpg" alt="Priority Banking" class="img-fluid">
            </figure>
          </div>
          <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="100">
            <div class="mb-4">
              <h3 class="h3 mb-4 text-black">Banking Solutions Are Our Priority</h3>
              <p>
                At DIGITALBANK, integrity, transparency, and trust are the pillars of our service.
              </p>
            </div>
            <div class="mb-4">
              <ul class="list-unstyled ul-check success">
                <li>Current Accounts</li>
                <li>Savings Accounts</li>
                <li>Deposit Accounts</li>
                <li>Recurring Deposit</li>
                <li>Loan Approval</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <section class="site-section">
      <div class="container">
        <div class="row mb-5 justify-content-center">
          <div class="col-md-7 text-center">
            <h2 class="section-title mb-3" data-aos="fade-up">How It Works</h2>
            <p class="lead" data-aos="fade-up" data-aos-delay="100">
              Open your account, get approval, and start using banking services quickly through our easy online workflow.
            </p>
          </div>
        </div>

        <div class="row align-items-lg-center">
          <div class="col-lg-6 mb-5" data-aos="fade-up">
            <div class="owl-carousel slide-one-item-alt">
              <img src="images/img2.jpg" alt="Image" class="img-fluid">
              <img src="images/img_2.jpg" alt="Image" class="img-fluid">
              <img src="images/img3.jpg" alt="Image" class="img-fluid">
            </div>
            <div class="custom-direction">
              <a href="#" class="custom-prev"><span><span class="icon-keyboard_backspace"></span></span></a>
              <a href="#" class="custom-next"><span><span class="icon-keyboard_backspace"></span></span></a>
            </div>
          </div>

          <div class="col-lg-5 ml-auto" data-aos="fade-up" data-aos-delay="100">
            <div class="owl-carousel slide-one-item-alt-text">
              <div>
                <h2 class="section-title mb-3">01. Online Applications</h2>
                <p>Submit your account application through our digital platform with simple and secure steps.</p>
                <p><a href="/create_account" class="btn btn-primary mr-2 mb-2">Learn More</a></p>
              </div>
              <div>
                <h2 class="section-title mb-3">02. Get Approval</h2>
                <p>Your request is verified and approved so you can continue your banking registration smoothly.</p>
                <p><a href="/register" class="btn btn-primary mr-2 mb-2">Learn More</a></p>
              </div>
              <div>
                <h2 class="section-title mb-3">03. Start Banking</h2>
                <p>Log in to your account, manage funds, check balance, and enjoy quick digital banking services.</p>
                <p><a href="/login" class="btn btn-primary mr-2 mb-2">Learn More</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="site-section border-bottom bg-light" id="services-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center" data-aos="fade">
            <h2 class="section-title mb-3">Our Services</h2>
          </div>
        </div>

        <div class="row align-items-stretch">
          <div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up">
            <div class="unit-4 service-glass">
              <div class="unit-4-icon">
                <img src="images/flaticon-svg/svg/001-wallet.svg" class="img-fluid w-25 mb-4" alt="">
              </div>
              <div>
                <h3>Business Consulting</h3>
                <p>Professional guidance and support to help customers and businesses manage finance better.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="100">
            <div class="unit-4 service-glass">
              <div class="unit-4-icon">
                <img src="images/flaticon-svg/svg/006-credit-card.svg" class="img-fluid w-25 mb-4" alt="">
              </div>
              <div>
                <h3>Credit Card</h3>
                <p>Flexible card-based banking with secure usage, digital convenience, and fast transactions.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="200">
            <div class="unit-4 service-glass">
              <div class="unit-4-icon">
                <img src="images/flaticon-svg/svg/002-rich.svg" class="img-fluid w-25 mb-4" alt="">
              </div>
              <div>
                <h3>Income Monitoring</h3>
                <p>Track your financial activity and manage money flow more effectively with digital tools.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up">
            <div class="unit-4 service-glass">
              <div class="unit-4-icon">
                <img src="images/flaticon-svg/svg/003-notes.svg" class="img-fluid w-25 mb-4" alt="">
              </div>
              <div>
                <h3>Insurance Consulting</h3>
                <p>Helpful support and advice for choosing suitable financial protection plans and services.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="100">
            <div class="unit-4 service-glass">
              <div class="unit-4-icon">
                <img src="images/flaticon-svg/svg/004-cart.svg" class="img-fluid w-25 mb-4" alt="">
              </div>
              <div>
                <h3>Financial Investment</h3>
                <p>Grow your money wisely with smart financial planning and digital banking convenience.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>

          <div class="col-md-6 col-lg-4 mb-4" data-aos="fade-up" data-aos-delay="200">
            <div class="unit-4 service-glass">
              <div class="unit-4-icon">
                <img src="images/flaticon-svg/svg/005-megaphone.svg" class="img-fluid w-25 mb-4" alt="">
              </div>
              <div>
                <h3>Financial Management</h3>
                <p>Manage transactions, balances, payments, and financial records through one clean platform.</p>
                <p><a href="#">Learn More</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <div class="faq_area section_padding_130" id="faq">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-sm-8 col-lg-6">
            <div class="section_heading text-center">
              <h1 class="faq"><span>Frequently</span> Asked Questions</h1>
              <p class="faq">Find quick answers about account opening, transfers, online banking, and account access.</p>
              <div class="line"></div>
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-12 col-sm-10 col-lg-8">
            <div class="accordion faq-accordian" id="faqAccordion">

              <div class="card border-0">
                <div class="card-header" id="headingOne">
                  <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    How do I open an account with your bank?
                  </h6>
                </div>
                <div class="collapse" id="collapseOne" aria-labelledby="headingOne" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>You can open an account by filling out the account creation form online and waiting for admin approval.</p>
                  </div>
                </div>
              </div>

              <div class="card border-0">
                <div class="card-header" id="headingTwo">
                  <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    Can I transfer money between accounts?
                  </h6>
                </div>
                <div class="collapse" id="collapseTwo" aria-labelledby="headingTwo" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>Yes, after login you can transfer money, add beneficiaries, and check mini statements easily.</p>
                  </div>
                </div>
              </div>

              <div class="card border-0">
                <div class="card-header" id="headingThree">
                  <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                    How can I access my account online?
                  </h6>
                </div>
                <div class="collapse" id="collapseThree" aria-labelledby="headingThree" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>You can access your account online by registering after approval and logging in using your email and password.</p>
                  </div>
                </div>
              </div>

              <div class="card border-0">
                <div class="card-header" id="headingFour">
                  <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                    Can I check my balance online?
                  </h6>
                </div>
                <div class="collapse" id="collapseFour" aria-labelledby="headingFour" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>Yes, your balance can be checked from the customer dashboard through the check account section.</p>
                  </div>
                </div>
              </div>

              <div class="card border-0">
                <div class="card-header" id="headingFive">
                  <h6 class="mb-0 collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
                    Is DIGITALBANK secure?
                  </h6>
                </div>
                <div class="collapse" id="collapseFive" aria-labelledby="headingFive" data-parent="#faqAccordion">
                  <div class="card-body">
                    <p>Yes, DIGITALBANK is designed with secure login, controlled approval, and protected banking operations.</p>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </div>

    <section class="site-section bg-light" id="contact-section" data-aos="fade">
      <div class="container">
        <div class="row mb-5">
          <div class="col-12 text-center">
            <h2 class="section-title mb-3">Contact Us</h2>
          </div>
        </div>

        <div class="row mb-5">
          <div class="col-md-4 text-center">
            <p class="mb-4">
              <span class="icon-room d-block h2 text-primary"></span>
              <span>MYBANK, ODISHA, INDIA.</span>
            </p>
          </div>
          <div class="col-md-4 text-center">
            <p class="mb-4">
              <span class="icon-phone d-block h2 text-primary"></span>
              <a href="#">7752033508</a>
            </p>
          </div>
          <div class="col-md-4 text-center">
            <p class="mb-0">
              <span class="icon-mail_outline d-block h2 text-primary"></span>
              <a href="#">debubehera168@gmail.com</a>
            </p>
          </div>
        </div>

        <script>
          window.onload = function () {
            msg = "${sms}";
            if (msg) {
              alert(msg);
            }
          }
        </script>

        <div class="row">
          <div class="col-md-6 mb-5">
            <form action="/contact" class="p-5 bg-white" method="post" onsubmit="return chk()">
              <h2 class="h4 text-black mb-5">Contact Form</h2>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="name">Full Name</label>
                  <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name">
                  <span id="nsms"></span>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="email">Email</label>
                  <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email">
                  <span id="esms"></span>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="subject">Subject</label>
                  <input type="text" id="subject" name="subject" class="form-control" placeholder="Enter subject">
                  <span id="ssms"></span>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-black" for="message">Message</label>
                  <textarea name="message" id="message" cols="30" rows="4" class="form-control"
                    placeholder="Write your message here..."></textarea>
                  <span id="msms"></span>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Send Message" class="btn btn-primary btn-md text-white">
                </div>
              </div>

              ${sms}
            </form>
          </div>

          <div class="col-md-6 mb-5">
            <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3712.6250100469983!2d83.88225447472662!3d21.483225472015423!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a213c368309af57%3A0xdcd4d19c95624841!2sSambalpur%20University%20Institute%20of%20Information%20Technology%20(SUIIT)%2C%20Burla!5e0!3m2!1sen!2sin!4v1715923889743!5m2!1sen!2sin"
              width="600" height="550" style="border:0;" allowfullscreen="" loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
        </div>
      </div>
    </section>

    <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-5">
                <h2 class="footer-heading mb-4">About Us</h2>
                <h4>Registered Office</h4>
                <address class="address">
                  MYBANK, ODISHA, INDIA.
                </address>
                <h4>Head Office</h4>
                <address class="address">
                  MYBANK, ODISHA, INDIA.
                </address>
              </div>

              <div class="col-md-3 ml-auto">
                <h2 class="footer-heading mb-4">Quick Links</h2>
                <ul class="list-unstyled">
                  <li><a href="#" class="smoothscroll">Terms</a></li>
                  <li><a href="#" class="smoothscroll">Policy</a></li>
                  <li><a href="#about-section" class="smoothscroll">About Us</a></li>
                  <li><a href="#services-section" class="smoothscroll">Services</a></li>
                  <li><a href="#faq" class="smoothscroll">FAQs</a></li>
                  <li><a href="#contact-section" class="smoothscroll">Contact Us</a></li>
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
            <h2 class="footer-heading mb-4">Download the App</h2>
            <a href="#" class="app-logo">
              <div class="image1">
                <img src="images/a12.png" alt="play store">
              </div>
              <br>
              <div class="image2">
                <img src="images/aa1.png" alt="app store">
              </div>
            </a><br>
            <p style="color: white;">Main Jahan Meri Bank Wahan</p>
            <p style="color: white;">Download The App Now</p>
            <p style="color: white; font-size: 10px;">MADE BY - Seeree</p>
          </div>
        </div>
      </div>

      <p class="copyright" style="text-align: center;">
        &copy; 2026 <a href="#" style="text-decoration: none;">MYBANK</a> Ltd. All Rights Reserved
      </p>
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

  <script>
    function chk() {
      let nameError = validName();
      let emailError = validEmail();
      let subjectError = validSubject();
      let messageError = validMessage();

      if (nameError && emailError && subjectError && messageError) {
        return true;
      } else {
        return false;
      }
    }

    function validName() {
      let name = $("#name").val();
      if (name == "") {
        $("#nsms").html("Name should not be blank");
        return false;
      } else {
        $("#nsms").html("");
        return true;
      }
    }

    function validEmail() {
      let email = $("#email").val();
      if (email == "") {
        $("#esms").html("Email should not be blank");
        return false;
      } else {
        $("#esms").html("");
        return true;
      }
    }

    function validSubject() {
      let subject = $("#subject").val();
      if (subject == "") {
        $("#ssms").html("Subject should not be blank");
        return false;
      } else {
        $("#ssms").html("");
        return true;
      }
    }

    function validMessage() {
      let message = $("#message").val();
      if (message == "") {
        $("#msms").html("Message should not be blank");
        return false;
      } else {
        $("#msms").html("");
        return true;
      }
    }
  </script>

</body>

</html>