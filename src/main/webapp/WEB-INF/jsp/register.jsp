<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register | Digital Bank</title>
  <link rel="stylesheet" href="css2/styles.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
 

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 30px 15px;
      background:
        radial-gradient(circle at top left, rgba(255,255,255,0.35), transparent 28%),
        radial-gradient(circle at bottom right, rgba(255,255,255,0.22), transparent 30%),
        linear-gradient(135deg, #091c43 0%, #0f2f6b 35%, #1f56b3 70%, #65a8ff 100%);
      overflow-x: hidden;
      position: relative;
    }

    body::before,
    body::after {
      content: "";
      position: absolute;
      border-radius: 50%;
      background: rgba(255,255,255,0.10);
      backdrop-filter: blur(8px);
      z-index: 0;
    }

    body::before {
      width: 260px;
      height: 260px;
      top: 40px;
      left: 40px;
    }

    body::after {
      width: 320px;
      height: 320px;
      bottom: 30px;
      right: 30px;
    }

    .center {
      position: relative;
      z-index: 2;
      width: 100%;
      max-width: 470px;
      padding: 40px 34px 30px;
      border-radius: 30px;
      background: rgba(255, 255, 255, 0.16);
      border: 1px solid rgba(255,255,255,0.22);
      box-shadow:
        0 20px 60px rgba(0,0,0,0.25),
        inset 0 1px 0 rgba(255,255,255,0.25);
      backdrop-filter: blur(18px);
      -webkit-backdrop-filter: blur(18px);
    }

    .bank-badge {
      width: 78px;
      height: 78px;
      margin: 0 auto 16px;
      border-radius: 22px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: linear-gradient(135deg, rgba(255,255,255,0.95), rgba(230,240,255,0.85));
      box-shadow: 0 12px 25px rgba(0,0,0,0.15);
      color: #0A2558;
      font-size: 36px;
    }

    .center h1 {
      text-align: center;
      color: #ffffff;
      font-size: 34px;
      font-weight: 800;
      letter-spacing: 0.5px;
      margin-bottom: 8px;
    }

    .subtitle {
      text-align: center;
      color: rgba(255,255,255,0.82);
      font-size: 14px;
      margin-bottom: 28px;
    }

    form {
      width: 100%;
    }

    .txt_field {
      position: relative;
      margin-bottom: 22px;
    }

    .txt_field input {
      width: 100%;
      height: 58px;
      padding: 18px 16px 18px 48px;
      border: 1px solid rgba(255,255,255,0.22);
      outline: none;
      border-radius: 16px;
      background: rgba(255,255,255,0.18);
      color: #ffffff;
      font-size: 15px;
      font-weight: 500;
      box-shadow: inset 0 1px 0 rgba(255,255,255,0.18);
      transition: 0.3s ease;
    }

    .txt_field input:focus {
      border-color: rgba(255,255,255,0.55);
      background: rgba(255,255,255,0.22);
      box-shadow: 0 0 0 4px rgba(255,255,255,0.10);
    }

    .txt_field input::placeholder {
      color: transparent;
    }

    .txt_field label {
      position: absolute;
      top: 50%;
      left: 48px;
      transform: translateY(-50%);
      color: rgba(255,255,255,0.75);
      font-size: 15px;
      pointer-events: none;
      transition: 0.25s ease;
      background: transparent;
      padding: 0 6px;
    }

    .txt_field input:focus ~ label,
    .txt_field input:valid ~ label {
      top: 0;
      left: 14px;
      font-size: 12px;
      color: #ffffff;
      background: rgba(10, 37, 88, 0.80);
      border-radius: 8px;
      padding: 4px 8px;
    }

    .txt_field i {
      position: absolute;
      top: 50%;
      left: 16px;
      transform: translateY(-50%);
      color: rgba(255,255,255,0.85);
      font-size: 20px;
    }

    input[type="submit"] {
      width: 100%;
      height: 56px;
      border: none;
      outline: none;
      border-radius: 16px;
      cursor: pointer;
      font-size: 17px;
      font-weight: 800;
      letter-spacing: 0.5px;
      color: #0A2558;
      background: linear-gradient(135deg, #ffffff 0%, #d9e9ff 100%);
      box-shadow: 0 14px 30px rgba(0,0,0,0.16);
      transition: all 0.3s ease;
      margin-top: 6px;
    }

    input[type="submit"]:hover {
      transform: translateY(-2px);
      box-shadow: 0 18px 35px rgba(0,0,0,0.20);
      background: linear-gradient(135deg, #ffffff 0%, #c9dfff 100%);
    }

    .signup_link {
      text-align: center;
      margin-top: 18px;
      color: rgba(255,255,255,0.85);
      font-size: 14px;
    }

    .signup_link a {
      color: #ffffff;
      text-decoration: none;
      font-weight: 700;
    }

    .signup_link a:hover {
      text-decoration: underline;
    }

    .msg {
      margin-top: 18px;
      text-align: center;
      color: #ffffff;
      font-size: 14px;
      font-weight: 600;
      background: rgba(255,255,255,0.12);
      border: 1px solid rgba(255,255,255,0.16);
      padding: 12px 14px;
      border-radius: 14px;
      min-height: 20px;
    }

    @media (max-width: 520px) {
      .center {
        padding: 30px 20px 24px;
        border-radius: 22px;
      }

      .center h1 {
        font-size: 28px;
      }

      .txt_field input {
        height: 54px;
      }

      input[type="submit"] {
        height: 52px;
      }
    }
  </style>
</head>

<body>
  
  <div class="center">
    <div class="bank-badge">
      <i class='bx bxs-bank'></i>
    </div>

    <h1>Registration</h1>
    <p class="subtitle">Create your Digital Bank account in a secure and premium way</p>

    <form method="post" action="/register" name="reg" onsubmit="return chk()">

      <div class="txt_field">
        <i class='bx bx-credit-card'></i>
        <input type="number" name="accountno" id="accountno" required>
        <label>Account No</label>
      </div>

      <div class="txt_field">
        <i class='bx bx-user'></i>
        <input type="text" id="name" name="name" required>
        <label>Name</label>
      </div>

      <div class="txt_field">
        <i class='bx bx-envelope'></i>
        <input type="email" id="email" name="email" required>
        <label>User Id</label>
      </div>

      <div class="txt_field">
        <i class='bx bx-lock-alt'></i>
        <input type="password" name="password" id="password" required>
        <label>Password</label>
      </div>

      <div class="txt_field">
        <i class='bx bx-shield-quarter'></i>
        <input type="password" name="cpassword" id="cpassword" required>
        <label>Confirm Password</label>
      </div>

      <input type="submit" value="Register">

      <div class="signup_link">
        Already have an account? <a href="/login">Login</a>
      </div>

      <!-- <div class="msg">
        ${sms}
      </div> -->
    </form>
  </div>

  <script>
    function chk() {
      let accountno = document.forms["reg"]["accountno"].value;
      if (accountno == "") {
        alert("Accountno must be filled out");
        return false;
      }

      let name = document.forms["reg"]["name"].value;
      if (name == "") {
        alert("Name must be filled out");
        return false;
      }

      let email = document.forms["reg"]["email"].value;
      if (email == "") {
        alert("Email must be filled out");
        return false;
      }

      let password = document.forms["reg"]["password"].value;
      if (password == "") {
        alert("Please enter password");
        return false;
      }

      let cpassword = document.forms["reg"]["cpassword"].value;
      if (cpassword == "") {
        alert("Confirm your password");
        return false;
      }

      if (password !== cpassword) {
        alert("Password and Confirm Password do not match");
        return false;
      }

      return true;
    }
  </script>
</body>
</html>