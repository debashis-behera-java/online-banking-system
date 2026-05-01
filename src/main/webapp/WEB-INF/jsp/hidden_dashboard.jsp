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
    background: linear-gradient(135deg,#0a1f44,#163b88,#2d5fd3);
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
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(25px);
    box-shadow: 0 25px 60px rgba(0,0,0,0.5);
    text-align: center;
    color: white;
    position: relative;
    overflow: hidden;
}

/* GLOSS EFFECT */
.card::before {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: linear-gradient(120deg, transparent, rgba(255,255,255,0.3), transparent);
    transform: rotate(25deg);
    animation: shine 4s infinite;
}

@keyframes shine {
    0% { transform: translateX(-100%) rotate(25deg); }
    100% { transform: translateX(100%) rotate(25deg); }
}

/* ===== TITLE ===== */
.title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #00e5ff; /* 🔥 neon blue */
    letter-spacing: 1px;
}

/* ===== BALANCE ===== */
.balance {
    font-size: 42px;
    font-weight: bold;
    margin: 15px 0;
    letter-spacing: 2px;
    color: #ffffff;
    text-shadow: 0 0 10px rgba(255,255,255,0.6);
}

/* ===== MESSAGE ===== */
.msg {
    margin-top: 10px;
    font-size: 14px;
}

/* ===== INPUT ===== */
input {
    width: 100%;
    padding: 14px;
    margin-top: 20px;
    border-radius: 15px;
    border: 1px solid rgba(0,255,200,0.5);
    outline: none;
    font-size: 15px;
    background: rgba(0,0,0,0.3);
    color: #00ffcc;
    text-align: center;
    transition: 0.3s;
}

input::placeholder {
    color: rgba(255,255,255,0.5);
}

input:focus {
    border: 1px solid #00ffcc;
    box-shadow: 0 0 10px #00ffcc;
}

/* ===== BUTTON ===== */
button {
    width: 100%;
    padding: 15px;
    margin-top: 20px;
    border: none;
    border-radius: 18px;
    font-size: 16px;
    font-weight: bold;
    background: linear-gradient(135deg,#00c853,#2ecc71);
    color: white;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 10px 25px rgba(0,255,100,0.4);
}

button:hover {
    transform: scale(1.05);
}

/* ===== BACK BUTTON ===== */
.back {
    display: inline-block;
    margin-top: 15px;
    font-size: 13px;
    color: #ddd;
    text-decoration: none;
}

.back:hover {
    color: white;
}

</style>
</head>

<body>

<div class="card">

    <div class="title">&#128374; Hidden Balance</div>

    <div style="margin-top:25px; display:flex; gap:15px;">

    <!-- MAIN BALANCE CARD -->
    <div style="
        flex:1;
        padding:18px;
        border-radius:18px;
        background: linear-gradient(145deg, rgba(255,255,255,0.15), rgba(255,255,255,0.05));
        backdrop-filter: blur(15px);
        box-shadow: 
            inset 0 0 10px rgba(255,255,255,0.2),
            0 10px 25px rgba(0,0,0,0.4);
        border: 1px solid rgba(0,255,255,0.2);
        text-align:center;
        transition:0.3s;
    " onmouseover="this.style.transform='scale(1.05)'" 
       onmouseout="this.style.transform='scale(1)'">

        <div style="font-size:13px; color:#bbb; margin-bottom:5px;">
            Main Balance
        </div>

        <div style="
            font-size:24px;
            font-weight:bold;
            color:#00e5ff;
            text-shadow:0 0 10px rgba(0,229,255,0.8);
        ">
            &#8377;${main_balance}
        </div>

    </div>

    <!-- HIDDEN BALANCE CARD -->
    <div style="
        flex:1;
        padding:18px;
        border-radius:18px;
        background: linear-gradient(145deg, rgba(255,255,255,0.15), rgba(255,255,255,0.05));
        backdrop-filter: blur(15px);
        box-shadow: 
            inset 0 0 10px rgba(255,255,255,0.2),
            0 10px 25px rgba(0,0,0,0.4);
        border: 1px solid rgba(0,255,150,0.2);
        text-align:center;
        transition:0.3s;
    " onmouseover="this.style.transform='scale(1.05)'" 
       onmouseout="this.style.transform='scale(1)'">

        <div style="font-size:13px; color:#bbb; margin-bottom:5px;">
            Hidden Balance
        </div>

        <div style="
            font-size:24px;
            font-weight:bold;
            color:#00ffcc;
            text-shadow:0 0 10px rgba(0,255,200,0.8);
        ">
            &#8377;${hidden}
        </div>

    </div>

</div>

   <c:if test="${not empty msg}">

    <c:choose>

        <c:when test="${status == 'error'}">
            <div class="msg" style="color:#ff4d4d;">
                ${msg}
            </div>
        </c:when>

        <c:otherwise>
            <div class="msg" style="color:#00ffcc;">
                ${msg}
            </div>
        </c:otherwise>

    </c:choose>

</c:if>



    <form action="/unhide_money" method="post">
        <input type="number" name="amount" placeholder="Enter withdraw amount" required>
        <button>Withdraw Money</button>
    </form>

    <div style="margin-top:20px; display:flex; gap:10px;">

    <!-- 💰 ADD MONEY BUTTON -->
    <a href="/hidden_deposit" style="
        flex:1;
        padding:12px;
        border-radius:12px;
        text-decoration:none;
        text-align:center;
        background: rgba(255,150,0,0.1);
        border: 1px solid rgba(255,150,0,0.3);
        color:#ffcc80;
        transition:0.3s;
    ">
        &#128176; Add Money
    </a>

    <!-- 🏠 DASHBOARD -->
    <a href="/customerdashboard" style="
        flex:1;
        padding:12px;
        border-radius:12px;
        text-decoration:none;
        text-align:center;
        background: rgba(255,255,255,0.1);
        border: 1px solid rgba(255,255,255,0.2);
        color:#ccc;
        transition:0.3s;
    ">
        &#127968; Dashboard
    </a>

</div>

</div>

</body>
</html>