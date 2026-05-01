<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    

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

        .forgot-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 20px;
            width: 350px;
            text-align: center;
            box-shadow: 0 25px 50px rgba(0,0,0,0.3);
            animation: fadeIn 0.6s ease;
            color: #fff;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(25px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .title {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .subtitle {
            font-size: 14px;
            color: #ddd;
            margin-bottom: 25px;
        }

        .input-box {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: none;
            outline: none;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border-radius: 12px;
            border: none;
            background: linear-gradient(135deg, #00c853, #2ecc71);
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .msg {
            margin-top: 15px;
            color: #ffcccc;
            font-size: 13px;
        }

        .back {
            margin-top: 15px;
            display: block;
            color: #ddd;
            text-decoration: none;
            font-size: 13px;
        }

        .back:hover {
            color: #fff;
        }

    </style>
</head>

<body>
    

    <div class="forgot-card">
        <div class="title">Forgot Password &#128272;</div>
        <div class="subtitle">Enter your registered email</div>

        <form action="/send-reset" method="post">
            <input type="email" name="email" class="input-box" placeholder="Enter your email" required>
            <button type="submit" class="btn">Send OTP</button>
        </form>

        <div class="msg">${msg}</div>

        <a href="/login" class="back">&#8592; Back to Login</a>
    </div>

</body>
</html>