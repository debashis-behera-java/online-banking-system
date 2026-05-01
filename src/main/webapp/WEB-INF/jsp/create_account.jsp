<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Open Account | DIGITAL BANK</title>
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
      font-family:'Poppins',sans-serif;
    }

    body{
      min-height:100vh;
      background:
        radial-gradient(circle at top left, rgba(255,255,255,0.15), transparent 25%),
        radial-gradient(circle at bottom right, rgba(0,212,255,0.15), transparent 20%),
        linear-gradient(135deg, #071739 0%, #0b2b5c 35%, #123c7a 65%, #3b82f6 100%);
      color:#fff;
      overflow-x:hidden;
    }

    .navbar{
      width:100%;
      padding:18px 7%;
      display:flex;
      justify-content:space-between;
      align-items:center;
      position:sticky;
      top:0;
      z-index:1000;
      background:rgba(255,255,255,0.08);
      backdrop-filter:blur(14px);
      border-bottom:1px solid rgba(255,255,255,0.12);
      box-shadow:0 10px 30px rgba(0,0,0,0.18);
    }

    .nav-logo a{
      text-decoration:none;
      font-size:30px;
      font-weight:800;
      color:#fff;
      letter-spacing:1px;
    }

    .text-primary{
      color:#7dd3fc;
    }

    .nav-items ul{
      display:flex;
      list-style:none;
      gap:12px;
    }

    .nav-items ul li a{
      text-decoration:none;
      color:#fff;
      font-weight:500;
      padding:10px 18px;
      border-radius:30px;
      transition:0.3s ease;
    }

    .nav-items ul li a:hover{
      background:rgba(255,255,255,0.14);
      box-shadow:0 8px 20px rgba(0,0,0,0.15);
    }

    #hamburger-menu,
    #hamburger-cross{
      display:none;
      font-size:30px;
      cursor:pointer;
      color:#fff;
    }

    #mobile-menu{
      display:none;
    }

    .hero{
      max-width:1200px;
      margin:35px auto 0;
      padding:0 20px;
      text-align:center;
    }

    .hero h1{
      font-size:42px;
      font-weight:800;
      margin-bottom:12px;
      text-shadow:0 6px 24px rgba(0,0,0,0.22);
    }

    .hero p{
      max-width:760px;
      margin:0 auto 26px;
      color:rgba(255,255,255,0.88);
      font-size:16px;
      line-height:1.7;
    }

    .container_form{
      width:100%;
      padding:10px 20px 60px;
      display:flex;
      justify-content:center;
      align-items:center;
    }

    .container{
      width:100%;
      max-width:1180px;
      padding:35px;
      border-radius:30px;
      background:rgba(255,255,255,0.10);
      border:1px solid rgba(255,255,255,0.18);
      backdrop-filter:blur(18px);
      -webkit-backdrop-filter:blur(18px);
      box-shadow:
        0 25px 70px rgba(0,0,0,0.28),
        inset 0 1px 0 rgba(255,255,255,0.18);
      position:relative;
      overflow:hidden;
    }

    .container::before{
      content:"";
      position:absolute;
      top:-100px;
      right:-100px;
      width:260px;
      height:260px;
      background:radial-gradient(circle, rgba(125,211,252,0.28), transparent 70%);
      pointer-events:none;
    }

    .container::after{
      content:"";
      position:absolute;
      bottom:-100px;
      left:-80px;
      width:260px;
      height:260px;
      background:radial-gradient(circle, rgba(167,139,250,0.22), transparent 70%);
      pointer-events:none;
    }

    form{
      position:relative;
      z-index:2;
    }

    form h2{
      text-align:center;
      font-size:32px;
      font-weight:700;
      margin-bottom:24px;
      color:#fff;
    }

    .error-msg {
  text-align: center;
  margin: 0 auto 14px;
  padding: 14px 18px;
  max-width: 650px;
  border-radius: 12px;

  background: linear-gradient(135deg, #ff4d4d, #b30000);
  color: #fff;

  border: 1px solid #ff1a1a;
  font-weight: 600;
  letter-spacing: 0.3px;

  box-shadow: 0 0 20px rgba(255, 0, 0, 0.4),
              0 10px 25px rgba(0, 0, 0, 0.3);

  animation: shake 0.3s ease-in-out;
}

@keyframes shake {
  0% { transform: translateX(0); }
  25% { transform: translateX(-5px); }
  50% { transform: translateX(5px); }
  75% { transform: translateX(-5px); }
  100% { transform: translateX(0); }
}

    .section-title{
      margin:26px 0 14px;
      font-size:18px;
      font-weight:700;
      color:#dbeafe;
      padding-left:4px;
    }

    .row{
      display:flex;
      flex-wrap:wrap;
      gap:20px;
      margin-bottom:12px;
    }

    .col-50{
      flex:1 1 calc(50% - 20px);
      min-width:250px;
    }

    label{
      display:block;
      margin-bottom:8px;
      font-size:14px;
      font-weight:600;
      color:#eef6ff;
      letter-spacing:0.2px;
    }

    input[type="text"],
    input[type="email"],
    input[type="date"],
    input[type="file"],
    select{
      width:100%;
      padding:15px 16px;
      border-radius:16px;
      border:1px solid rgba(255,255,255,0.18);
      background:rgba(255,255,255,0.14);
      color:#fff;
      outline:none;
      font-size:15px;
      transition:all 0.3s ease;
      box-shadow:inset 0 1px 0 rgba(255,255,255,0.06);
    }

    input::placeholder{
      color:rgba(255,255,255,0.72);
    }

    select option{
      color:#111;
    }

    input:focus,
    select:focus{
      border-color:#7dd3fc;
      background:rgba(255,255,255,0.18);
      box-shadow:0 0 0 4px rgba(125,211,252,0.14);
      transform:translateY(-1px);
    }

    input[type="file"]{
      padding:12px;
      cursor:pointer;
    }

    .btn{
      width:100%;
      margin-top:24px;
      padding:17px 20px;
      border:none;
      border-radius:18px;
      font-size:18px;
      font-weight:700;
      color:#fff;
      cursor:pointer;
      letter-spacing:0.5px;
      background:linear-gradient(135deg,#06b6d4,#2563eb,#7c3aed);
      box-shadow:
        0 18px 35px rgba(37,99,235,0.34),
        inset 0 1px 0 rgba(255,255,255,0.2);
      transition:0.35s ease;
    }

    .btn:hover{
      transform:translateY(-3px);
      box-shadow:
        0 24px 42px rgba(37,99,235,0.38),
        inset 0 1px 0 rgba(255,255,255,0.24);
    }

    .btn:active{
      transform:scale(0.99);
    }

    .top-badge{
      display:inline-flex;
      align-items:center;
      gap:8px;
      padding:10px 16px;
      border-radius:999px;
      background:rgba(255,255,255,0.10);
      border:1px solid rgba(255,255,255,0.16);
      color:#e0f2fe;
      font-size:14px;
      margin-bottom:16px;
      box-shadow:0 10px 25px rgba(0,0,0,0.10);
    }

    @media(max-width:900px){
      .nav-items{
        display:none;
      }

      #hamburger-menu{
        display:block;
      }

      #mobile-menu{
        display:none;
        position:fixed;
        top:0;
        right:0;
        width:280px;
        height:100%;
        background:rgba(8,18,45,0.97);
        backdrop-filter:blur(18px);
        padding:80px 25px 30px;
        z-index:1200;
        box-shadow:-8px 0 25px rgba(0,0,0,0.25);
      }

      #mobile-menu.active{
        display:block;
      }

      .mobile-nav-items ul{
        list-style:none;
      }

      .mobile-nav-items ul li{
        margin-bottom:18px;
      }

      .mobile-nav-items ul li a{
        text-decoration:none;
        color:#fff;
        font-size:18px;
        font-weight:500;
      }

      #hamburger-cross{
        display:block;
        position:absolute;
        top:18px;
        right:18px;
      }

      .hero h1{
        font-size:32px;
      }

      .container{
        padding:24px 18px;
      }

      .col-50{
        flex:1 1 100%;
      }
    }

    @media(max-width:500px){
      .navbar{
        padding:16px 5%;
      }

      .nav-logo a{
        font-size:23px;
      }

      .hero h1{
        font-size:26px;
      }

      .hero p{
        font-size:14px;
      }

      form h2{
        font-size:24px;
      }

      input[type="text"],
      input[type="email"],
      input[type="date"],
      input[type="file"],
      select{
        padding:13px 14px;
      }

      .btn{
        font-size:16px;
        padding:15px;
      }
    }
  </style>
</head>

<body>
 
  <div class="navbar">
    <div class="nav-logo">
      <a href="/">DIGITAL<span class="text-primary">BANK</span></a>
    </div>

    <div class="nav-items">
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/login">Login</a></li>
        <li><a href="/register">Register</a></li>
      </ul>
    </div>

    <div id="hamburger-menu"><i class='bx bx-menu'></i></div>
  </div>

  <div id="mobile-menu">
    <div class="mobile-nav-items">
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/login">Login</a></li>
        <li><a href="/register">Register</a></li>
      </ul>
    </div>
    <div id="hamburger-cross"><i class='bx bx-x'></i></div>
  </div>

  <div class="hero">
    <div class="top-badge">
      <i class='bx bxs-shield-plus'></i>
      Secure Digital Banking Registration
    </div>
    <h1>Open Your Account in Style</h1>
    <p>
      Join DIGITAL BANK with a modern, secure and smooth account opening experience.
      Fill in your details below and create your account with confidence.
    </p>
  </div>

  <div class="container_form">
    <div class="container">
      <form action="/create_account" method="post" onsubmit="return checkform()" enctype="multipart/form-data">
        <h2>Open Account With DIGITAL BANK</h2>

        <c:if test="${not empty sms}">
    <div class="msg">${sms}</div>
</c:if>

<c:if test="${not empty error}">
    <div class="error-msg">
    ⚠️ ERROR: ${error}
</div>
</c:if>

<!-- <c:if test="${not empty accountNo}">
    <div class="msg success-msg">${accountNo}</div>
</c:if> -->

        <div class="section-title">Personal Information</div>
        <div class="row">
          <div class="col-50">
            <label for="name">Customer Name</label>
            <input type="text" id="name" name="name" placeholder="Enter customer name">
          </div>
          <div class="col-50">
            <label for="account_type">Account Type</label>
            <select id="account_type" name="account_type">
              <option hidden="hidden">--Choose--</option>
              <option value="saving">Saving</option>
              <option value="current">Current</option>
            </select>
          </div>

          <div class="col-50">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter email address">
          </div>
          <div class="col-50">
            <label for="fathers_name">Father's Name</label>
            <input type="text" id="fathers_name" name="fathers_name" placeholder="Enter father's name">
          </div>
        </div>

        <div class="row">
          <div class="col-50">
            <label for="mothers_name">Mother's Name</label>
            <input type="text" id="mothers_name" name="mothers_name" placeholder="Enter mother's name">
          </div>
          <div class="col-50">
            <label for="dob">Date Of Birth</label>
            <input type="date" id="dob" name="dob">
          </div>
        </div>

        <div class="row">
          <div class="col-50">
            <label for="gender">Gender</label>
            <select id="gender" name="gender">
              <option hidden="hidden">--Choose--</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
          </div>
          <div class="col-50">
            <label for="occupation">Occupation</label>
            <select id="occupation" name="occupation">
              <option hidden="hidden">--Choose--</option>
              <option value="mployed">Employed</option>
              <option value="semployed">Self-employed</option>
              <option value="student">Student</option>
              <option value="business">Business</option>
              <option value="homemaker">Home Maker</option>
            </select>
          </div>
        </div>

        <div class="section-title">Identity & Contact Details</div>
        <div class="row">
          <div class="col-50">
            <label for="aadhar_no">Aadhaar No</label>
            <input type="text" id="aadhar_no" name="aadhar_no" placeholder="Enter Aadhaar number">
          </div>
          <div class="col-50">
            <label for="mobile_no">Mobile No</label>
            <input type="text" id="mobile_no" name="mobile_no" placeholder="Enter mobile number">
          </div>
        </div>

        <div class="row">
          <div class="col-50">
            <label for="marital_status">Marital Status</label>
            <select id="marital_status" name="marital_status">
              <option hidden="hidden">--Choose--</option>
              <option value="single">Single</option>
              <option value="married">Married</option>
              <option value="widowed">Widowed</option>
            </select>
          </div>
          <div class="col-50">
            <label for="pan_no">Pan Card No</label>
            <input type="text" id="pan_no" name="pan_no"
       placeholder="Enter PAN number"
       oninput="this.value = this.value.toUpperCase()">
          </div>
        </div>

        <div class="section-title">Additional Details</div>
        <div class="row">
          <div class="col-50">
            <label for="nationality">Nationality</label>
            <select id="nationality" name="nationality">
              <option hidden="hidden">--Choose--</option>
              <option value="indian">Indian</option>
              <option value="other">Other</option>
            </select>
          </div>
          <div class="col-50">
            <label for="religion">Religion</label>
            <select id="religion" name="religion">
              <option hidden="hidden">--Choose--</option>
              <option value="hinduism">Hinduism</option>
              <option value="muslim">Muslim</option>
              <option value="buddhism">Buddhism</option>
              <option value="christian">Christian</option>
            </select>
          </div>
        </div>

        <div class="row">
          <div class="col-50">
            <label for="qualification">Qualification</label>
            <select id="qualification" name="qualification">
              <option hidden="hidden">--Choose--</option>
              <option value="matric">Matriculation</option>
              <option value="Graduate">Graduate</option>
              <option value="Under-graduate">Under Graduate</option>
              <option value="Post-graduate">Post Graduate</option>
            </select>
          </div>
          <div class="col-50">
            <label for="category">Category</label>
            <select id="category" name="category">
              <option hidden="hidden">--Choose--</option>
              <option value="general">General</option>
              <option value="obc">OBC</option>
              <option value="sc">SC</option>
              <option value="st">ST</option>
            </select>
          </div>
        </div>

        <div class="section-title">Address & Upload</div>
        <div class="row">
          <div class="col-50">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" placeholder="Enter address">
          </div>
          <div class="col-50">
            <label for="city">City</label>
            <input type="text" id="city" name="city" placeholder="Enter city">
          </div>
          <div class="col-50">
            <label for="state">State</label>
           <select id="state" name="state">
  <option hidden>--Choose State--</option>
  <option>Andhra Pradesh</option>
  <option>Arunachal Pradesh</option>
  <option>Assam</option>
  <option>Bihar</option>
  <option>Chhattisgarh</option>
  <option>Goa</option>
  <option>Gujarat</option>
  <option>Haryana</option>
  <option>Himachal Pradesh</option>
  <option>Jharkhand</option>
  <option>Karnataka</option>
  <option>Kerala</option>
  <option>Madhya Pradesh</option>
  <option>Maharashtra</option>
  <option>Manipur</option>
  <option>Meghalaya</option>
  <option>Mizoram</option>
  <option>Nagaland</option>
  <option>Odisha</option>
  <option>Punjab</option>
  <option>Rajasthan</option>
  <option>Sikkim</option>
  <option>Tamil Nadu</option>
  <option>Telangana</option>
  <option>Tripura</option>
  <option>Uttar Pradesh</option>
  <option>Uttarakhand</option>
  <option>West Bengal</option>
</select>
          </div>
          <div class="col-50">
            <label for="pin">Pincode</label>
            <input type="text" id="pin" name="pin" maxlength="6" pattern="\d{6}" placeholder="Enter pincode">
          </div>
          <div class="col-50">
            <label for="photo">Upload Photo</label>
            <input type="file" id="photo" name="photo">
          </div>
        </div>

        <input type="submit" value="Create Account" class="btn">
      </form>
    </div>
  </div>

  <script>
    const hamburgerMenu = document.getElementById("hamburger-menu");
    const mobileMenu = document.getElementById("mobile-menu");
    const hamburgerCross = document.getElementById("hamburger-cross");

    hamburgerMenu.onclick = function () {
      mobileMenu.classList.add("active");
    };

    hamburgerCross.onclick = function () {
      mobileMenu.classList.remove("active");
    };

    function checkform() {
      var name = document.getElementById("name").value;
      var account_type = document.getElementById("account_type").value;
      var email = document.getElementById("email").value;
      var dob = document.getElementById("dob").value;
      var gender = document.getElementById("gender").value;
      var occupation = document.getElementById("occupation").value;
      var aadhar_no = document.getElementById("aadhar_no").value;
      var mobile_no = document.getElementById("mobile_no").value;
      var marital_status = document.getElementById("marital_status").value;
      var pan_no = document.getElementById("pan_no").value;
      var religion = document.getElementById("religion").value;
      var qualification = document.getElementById("qualification").value;
      var category = document.getElementById("category").value;
      var address = document.getElementById("address").value;
      var city = document.getElementById("city").value;
      var state = document.getElementById("state").value;
      var pin = document.getElementById("pin").value;

      if (name == null || name == "") {
        alert("Name can't be blank");
        return false;
      }
      if (account_type == "--Choose--") {
        alert("Choose Account Type");
        return false;
      }
      if (email == null || email == "") {
        alert("Email can't be blank");
        return false;
      }
      if (dob == "") {
        alert("DOB can't be blank");
        return false;
      }
      if (gender == "--Choose--") {
        alert("Choose Gender");
        return false;
      }
      if (occupation == "--Choose--") {
        alert("Choose Occupation");
        return false;
      }
      if (aadhar_no == "" || aadhar_no.length != 12) {
        alert("Aadhaar Number must be 12 digit");
        return false;
      }
      if (mobile_no == "" || mobile_no.length != 10) {
        alert("Mobile Number must be 10 digit");
        return false;
      }
      if (marital_status == "--Choose--") {
        alert("Choose Marital Status");
        return false;
      }
      if (pan_no == "" || pan_no.length != 10) {
        alert("PAN Number must be 10 digit");
        return false;
      }
      if (religion == "--Choose--") {
        alert("Choose Religion");
        return false;
      }
      if (qualification == "--Choose--") {
        alert("Choose Qualification");
        return false;
      }
      if (category == "--Choose--") {
        alert("Choose Category");
        return false;
      }
      if (address == "") {
        alert("Address can't be blank");
        return false;
      }
      if (city == "") {
        alert("City can't be blank");
        return false;
      }
      if (state == "--Choose State--") {
  alert("Please select a State");
  return false;
}
      if (!/^\d{6}$/.test(pin)) {
  alert("PIN Code must be exactly 6 digits");
  return false;
}
    }
  </script>
</body>
</html>