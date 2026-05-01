<!doctype html>
<html lang="en">

<head>
  <title>DIGITALBANK</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800" rel="stylesheet">
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
    body {
      margin: 0;
      padding: 0;
      font-family: 'Open Sans', sans-serif;
      background: #f5f9ff;
    }

    .site-navbar {
      position: sticky;
      top: 0;
      z-index: 999;
      background: rgba(8, 25, 61, 0.82);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
      box-shadow: 0 10px 35px rgba(11, 37, 88, 0.18);
      padding: 14px 0;
      transition: all 0.3s ease;
    }

    .site-logo a {
      font-size: 30px;
      font-weight: 800;
      color: #ffffff !important;
      text-decoration: none;
      letter-spacing: 1px;
      text-shadow: 0 2px 10px rgba(0, 0, 0, 0.18);
    }

    .site-logo .text-primary {
      color: #7db7ff !important;
      text-shadow: 0 0 18px rgba(125, 183, 255, 0.45);
    }

    .site-navigation .site-menu {
      display: flex;
      align-items: center;
      justify-content: flex-end;
      gap: 10px;
      margin: 0;
      padding: 0;
    }

    .site-navigation .site-menu > li {
      list-style: none;
      position: relative;
    }

    .site-navigation .site-menu > li > a.nav-link {
      color: rgba(255, 255, 255, 0.9) !important;
      font-size: 15px;
      font-weight: 700;
      padding: 12px 16px;
      border-radius: 14px;
      text-decoration: none;
      transition: all 0.3s ease;
      display: inline-block;
    }

    .site-navigation .site-menu > li > a.nav-link:hover {
      color: #ffffff !important;
      background: rgba(255, 255, 255, 0.08);
      box-shadow: inset 0 0 0 1px rgba(255,255,255,0.08);
      transform: translateY(-1px);
    }

    .site-navigation .has-children .dropdown {
      position: absolute;
      top: 100%;
      left: 0;
      min-width: 230px;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border-radius: 18px;
      padding: 12px 0;
      box-shadow: 0 20px 45px rgba(10, 37, 88, 0.18);
      opacity: 0;
      visibility: hidden;
      transform: translateY(12px);
      transition: all 0.3s ease;
      z-index: 999;
    }

    .site-navigation .has-children:hover .dropdown {
      opacity: 1;
      visibility: visible;
      transform: translateY(8px);
    }

    .site-navigation .has-children .dropdown li {
      list-style: none;
    }

    .site-navigation .has-children .dropdown li a {
      display: block;
      padding: 12px 18px;
      color: #0A2558 !important;
      font-weight: 700;
      text-decoration: none;
      transition: all 0.3s ease;
      border-radius: 10px;
      margin: 0 8px;
    }

    .site-navigation .has-children .dropdown li a:hover {
      background: linear-gradient(135deg, #eaf2ff, #f5f9ff);
      color: #1b4fb8 !important;
      transform: translateX(4px);
    }

    .login-btn {
      margin-left: 12px;
      background: linear-gradient(135deg, #2d5fd3, #7db7ff);
      color: #fff !important;
      border: none;
      border-radius: 30px;
      padding: 11px 26px;
      font-size: 14px;
      font-weight: 800;
      letter-spacing: 0.4px;
      box-shadow: 0 10px 24px rgba(45, 95, 211, 0.30);
      transition: all 0.3s ease;
      outline: none;
    }

    .login-btn:hover {
      transform: translateY(-2px) scale(1.02);
      box-shadow: 0 14px 30px rgba(45, 95, 211, 0.38);
      background: linear-gradient(135deg, #1f4fc0, #6ca8ff);
    }

    .site-menu-toggle {
      color: #ffffff !important;
      text-decoration: none;
    }

    .site-menu-toggle span {
      font-size: 30px;
      color: #ffffff;
    }

    @media (max-width: 991px) {
      .site-navbar {
        padding: 12px 0;
      }

      .site-logo a {
        font-size: 26px;
      }
    }
  </style>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
 

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
              <li><a href="#services-section" class="nav-link">Services</a></li>

              <li class="has-children">
                <a href="#" class="nav-link">Create Account</a>
                <ul class="dropdown">
                  <li><a href="/create_account">Open Account</a></li>
                  <li><a href="/register">Register Account</a></li>
                </ul>
              </li>

              <li><a href="/faq" class="nav-link">FAQ</a></li>
              <li><a href="#about-section" class="nav-link">About Us</a></li>
              <li><a href="#contact-section" class="nav-link">Contact Us</a></li>
              <li>
                <a href="/login">
                  <button class="login-btn">Login</button>
                </a>
              </li>
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

</body>
</html>