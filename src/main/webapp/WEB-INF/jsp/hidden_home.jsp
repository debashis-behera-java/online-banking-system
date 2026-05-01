<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Hidden Wallet</title>

<style>

/* ===== BODY ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: radial-gradient(circle at top,#0a1f44,#020617,#000);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* ===== CARD ===== */
.card {
    width: 380px;
    padding: 35px;
    border-radius: 25px;
    background: rgba(0,0,0,0.6);
    backdrop-filter: blur(20px);
    box-shadow: 
        0 0 30px rgba(0,229,255,0.2),
        0 25px 60px rgba(0,0,0,0.8);
    text-align: center;
    color: white;
    border: 1px solid rgba(0,229,255,0.2);
    animation: float 4s ease-in-out infinite;
}

/* FLOAT EFFECT */
@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0px); }
}

/* ===== TITLE ===== */
h2 {
    color: #00e5ff;
    text-shadow: 0 0 10px #00e5ff;
}

/* ===== BALANCE SECTION ===== */
.balance-box {
    display: flex;
    gap: 15px;
    margin-top: 25px;
}

/* ===== CARD BOX ===== */
.box {
    flex: 1;
    padding: 18px;
    border-radius: 18px;
    background: rgba(255,255,255,0.05);
    border: 1px solid rgba(255,255,255,0.1);
    transition: 0.3s;
}

/* HOVER EFFECT */
.box:hover {
    transform: scale(1.05);
    box-shadow: 0 0 15px rgba(0,255,255,0.4);
}

/* LABEL */
.box h4 {
    font-size: 13px;
    color: #aaa;
}

/* VALUE */
.box p {
    font-size: 22px;
    font-weight: bold;
}

/* ===== BUTTON BASE ===== */
.btn {
    width: 100%;
    padding: 15px;
    margin-top: 20px;
    border: none;
    border-radius: 18px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

/* ADD BUTTON */
.add {
    background: linear-gradient(135deg,#ff9800,#ff5722);
    box-shadow: 0 0 15px rgba(255,100,0,0.5);
}

/* WITHDRAW BUTTON */
.withdraw {
    background: linear-gradient(135deg,#00c853,#2ecc71);
    box-shadow: 0 0 15px rgba(0,255,150,0.5);
}

/* HOVER */
.btn:hover {
    transform: scale(1.05);
}

</style>
</head>

<body>

<div class="card">

    <h2>&#128374; Hidden Wallet</h2>

    <!-- BALANCE -->
    <div class="balance-box">

        <div class="box">
            <h4>Main Balance</h4>
            <p>&#8377;${main_balance}</p>
        </div>

        <div class="box">
            <h4>Hidden Balance</h4>
            <p style="color:#00ffcc;">&#8377;${hidden}</p>
        </div>

    </div>

    <!-- ACTION BUTTONS -->
    <button class="btn add" onclick="location.href='/hidden_deposit'">
        &#128176; Add Money
    </button>

    <button class="btn withdraw" onclick="location.href='/hidden_dashboard'">
        &#128184 Withdraw Money
    </button>

</div>

</body>
</html>