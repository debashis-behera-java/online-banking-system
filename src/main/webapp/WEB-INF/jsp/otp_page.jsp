<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>
   

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0A2558, #1d4fa8);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .otp-card {
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            width: 350px;
            text-align: center;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .otp-title {
            font-size: 22px;
            font-weight: 600;
            color: #0A2558;
            margin-bottom: 10px;
        }

        .otp-sub {
            font-size: 14px;
            color: #777;
            margin-bottom: 25px;
        }

        .otp-input {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 18px;
            text-align: center;
            letter-spacing: 4px;
            outline: none;
            transition: 0.3s;
        }

        .otp-input:focus {
            border-color: #1d4fa8;
            box-shadow: 0 0 8px rgba(29,79,168,0.3);
        }

        .otp-btn {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #1d4fa8, #0A2558);
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .otp-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .error {
            margin-top: 15px;
            color: red;
            font-size: 14px;
        }

        .resend {
            margin-top: 15px;
            font-size: 13px;
            color: #555;
        }

        .resend a {
            color: #1d4fa8;
            text-decoration: none;
            font-weight: 500;
        }

    </style>
</head>

<body>
   

    <div class="otp-card">
        <div class="otp-title">OTP Verification </div>
        <div class="otp-sub">Enter the OTP sent to your email</div>

       <form action="${actionUrl != null ? actionUrl : '/verify-profile-otp'}" method="post">
    <input type="text" name="otp" class="otp-input" maxlength="6"
           oninput="this.value=this.value.replace(/[^0-9]/g,'')"
           placeholder="enter your otp here" required>

    <button type="submit" class="otp-btn">Verify OTP</button>
</form>

        <div class="error">${msg}</div>

        <div class="resend">
    Didn't receive OTP? <a href="/resend-otp">Resend</a>
</div>
    </div>

</body>
</html>