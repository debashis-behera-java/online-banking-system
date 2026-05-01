<!DOCTYPE html>
<html>
<head>
    <title>Transaction Success</title>
    
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

        .success-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 50px 40px;
            border-radius: 25px;
            text-align: center;
            width: 380px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.3);
            animation: fadeIn 0.7s ease;
            color: #fff;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .icon {
            font-size: 60px;
            margin-bottom: 15px;
        }

        .title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .subtitle {
            font-size: 14px;
            color: #ddd;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 12px;
            background: linear-gradient(135deg, #00c853, #2ecc71);
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .details {
            margin-top: 20px;
            font-size: 13px;
            color: #ccc;
        }

    </style>
</head>

<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="success-card">
    <div class="icon">&#9989;</div>

    <!-- ✅ TITLE -->
    <div class="title">
        <c:choose>
            <c:when test="${type == 'profile'}">
                Profile Updated Successfully
            </c:when>
            <c:otherwise>
                Transaction Successful
            </c:otherwise>
        </c:choose>
    </div>

    <!-- ✅ SUBTITLE -->
    <div class="subtitle">
        <c:choose>
            <c:when test="${type == 'profile'}">
                Your profile has been updated successfully
            </c:when>
            <c:otherwise>
                Your money has been transferred securely
            </c:otherwise>
        </c:choose>
    </div>

    <!-- ✅ BUTTON -->
    <a href="/customerdashboard" class="btn">Go to Dashboard</a>

    <!-- ✅ FOOTER -->
    <div class="details">
        Thank you for banking with us &#128153;
    </div>
</div>

<!-- 🔥 AUTO REDIRECT (OPTIONAL) -->
<script>
    setTimeout(() => {
        window.location.href = "/customerdashboard";
    }, 4000);
</script>

</body>
</html>