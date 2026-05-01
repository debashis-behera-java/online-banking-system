<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Login | DIGITALBANK</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css2/styles.css">
  

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background:
        linear-gradient(135deg, rgba(10, 37, 88, 0.88), rgba(36, 99, 235, 0.72)),
        url('images/hero_2.jpg') no-repeat center center/cover;
      position: relative;
      overflow: hidden;
    }

    body::before {
      content: "";
      position: absolute;
      width: 420px;
      height: 420px;
      background: rgba(255, 255, 255, 0.10);
      border-radius: 50%;
      top: -120px;
      left: -120px;
      filter: blur(10px);
    }

    body::after {
      content: "";
      position: absolute;
      width: 360px;
      height: 360px;
      background: rgba(125, 183, 255, 0.16);
      border-radius: 50%;
      bottom: -110px;
      right: -100px;
      filter: blur(10px);
    }

    .center {
  width: 420px;
  max-width: 92%;
  padding: 40px 30px;
  border-radius: 24px;
  background: rgba(255,255,255,0.12);
  backdrop-filter: blur(16px);
  box-shadow: 0 20px 50px rgba(0,0,0,0.25);
}

    .brand {
      text-align: center;
      margin-bottom: 14px;
      color: #ffffff;
      font-size: 15px;
      font-weight: 700;
      letter-spacing: 2px;
      text-transform: uppercase;
      opacity: 0.9;
    }

    .center h1 {
      text-align: center;
      color: #ffffff;
      margin-bottom: 28px;
      font-size: 34px;
      font-weight: 800;
      letter-spacing: 0.5px;
      text-shadow: 0 8px 24px rgba(0, 0, 0, 0.18);
    }

    form {
      width: 100%;
    }

    .txt_field {
      position: relative;
      margin-bottom: 24px;
    }

    .txt_field input {
      width: 100%;
      padding: 16px 14px 16px 14px;
      font-size: 15px;
      color: #ffffff;
      background: rgba(255, 255, 255, 0.10);
      border: 1px solid rgba(255, 255, 255, 0.18);
      border-radius: 16px;
      outline: none;
      transition: all 0.3s ease;
    }

    .txt_field input:focus {
      border-color: rgba(125, 183, 255, 0.95);
      box-shadow: 0 0 0 4px rgba(125, 183, 255, 0.18);
      background: rgba(255, 255, 255, 0.16);
    }

    .txt_field input::placeholder {
      color: transparent;
    }

    .txt_field label {
      position: absolute;
      top: 50%;
      left: 14px;
      color: rgba(255, 255, 255, 0.78);
      transform: translateY(-50%);
      font-size: 15px;
      pointer-events: none;
      transition: 0.25s ease;
      background: transparent;
      padding: 0 6px;
    }

    .txt_field input:focus ~ label,
    .txt_field input:valid ~ label {
      top: -8px;
      left: 12px;
      font-size: 12px;
      color: #dbeafe;
      background: rgba(10, 37, 88, 0.88);
      border-radius: 8px;
    }

    .txt_field span {
      display: none;
    }

    input[type="submit"] {
      width: 100%;
      border: none;
      outline: none;
      padding: 15px;
      border-radius: 18px;
      background: linear-gradient(135deg, #7db7ff, #2d5fd3);
      color: #ffffff;
      font-size: 17px;
      font-weight: 800;
      letter-spacing: 0.3px;
      cursor: pointer;
      box-shadow: 0 14px 30px rgba(45, 95, 211, 0.35);
      transition: all 0.3s ease;
      margin-top: 4px;
    }

    input[type="submit"]:hover {
      transform: translateY(-2px);
      box-shadow: 0 18px 34px rgba(45, 95, 211, 0.42);
    }

    .extra-links {
      margin-top: 22px;
      text-align: center;
    }

    .signup_link {
      color: rgba(255, 255, 255, 0.92);
      font-size: 14px;
      margin-top: 12px;
      text-align: center;
    }

    .signup_link a,
    .pass {
      color: #beddff;
      font-weight: 700;
      text-decoration: none;
      transition: 0.3s ease;
    }

    .signup_link a:hover,
    .pass:hover {
      color: #ffffff;
      text-decoration: underline;
    }

    .msg {
      margin-top: 18px;
      padding: 12px 14px;
      text-align: center;
      color: #fff;
      font-size: 14px;
      font-weight: 600;
      border-radius: 14px;
      background: rgba(255, 77, 109, 0.16);
      border: 1px solid rgba(255, 255, 255, 0.14);
      min-height: 20px;
    }

    .top-home {
      position: absolute;
      top: 24px;
      left: 24px;
      z-index: 3;
    }

    .top-home a {
      display: inline-block;
      padding: 10px 18px;
      border-radius: 30px;
      background: rgba(255, 255, 255, 0.14);
      color: #ffffff;
      text-decoration: none;
      font-weight: 700;
      font-size: 14px;
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.16);
      transition: 0.3s ease;
    }

    .top-home a:hover {
      background: rgba(255, 255, 255, 0.22);
      transform: translateY(-2px);
    }

    @media (max-width: 480px) {
      .center {
        padding: 32px 22px 26px;
        border-radius: 22px;
      }

      .center h1 {
        font-size: 28px;
      }

      .txt_field input {
        padding: 14px 12px;
      }
    }
  </style>
</head>

<body>
 

  <div class="top-home">
    <a href="/"> Back to Home</a>
  </div>

  <div class="center">
    <div class="brand">DIGITALBANK</div>
    <h1>Welcome Back</h1>

    <form action="/login" method="post" name="login" onsubmit="return chk()">
      <div class="txt_field">
        <input type="email" name="email" id="email" required>
        <span></span>
        <label>User Id</label>
      </div>

      <div class="txt_field">
        <input type="password" name="password" id="password" required>
        <span></span>
        <label>Password</label>
      </div>

      <input type="submit" value="Login">

      <div class="extra-links">
        <div class="signup_link">
          Don't have an account? <a href="/register">Signup</a>
        </div>

        <div class="signup_link">
          <a href="/forgot" style="color:#1d4fa8;">Forgot Password?</a>
        </div>
      </div>

     
<c:if test="${not empty sms}">
  <div class="msg">${sms}</div>
</c:if>
    </form>
  </div>

</body>

</html>

<script>
  function chk() {
    let email = document.forms["login"]["email"].value;
    if (email == "") {
      alert("Email must be filled out");
      return false;
    }

    let password = document.forms["login"]["password"].value;
    if (password == "") {
      alert("Please enter your password");
      return false;
    }

    return true;
  }
</script>