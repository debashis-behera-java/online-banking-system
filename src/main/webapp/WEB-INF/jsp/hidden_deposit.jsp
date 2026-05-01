<!DOCTYPE html>
<html>
<head>
<title>Add to Hidden Wallet</title>

<style>

/* ===== BODY ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: radial-gradient(circle at top,#1a1a2e,#0f3460,#000);
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
    box-shadow: 0 25px 60px rgba(0,0,0,0.8);
    text-align: center;
    color: white;
    border: 1px solid rgba(255,150,0,0.2);
}

/* ===== TITLE ===== */
.title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    color: #ff9800;
}

/* ===== SUBTITLE ===== */
.subtitle {
    font-size: 13px;
    color: #aaa;
    margin-bottom: 20px;
}

/* ===== INPUT ===== */
input {
    width: 100%;
    padding: 14px;
    margin-top: 15px;
    border-radius: 15px;
    border: 1px solid rgba(255,150,0,0.5);
    outline: none;
    font-size: 16px;
    background: rgba(0,0,0,0.5);
    color: #ffcc80;
    text-align: center;
    transition: 0.3s;
}

input:focus {
    border: 1px solid #ff9800;
    box-shadow: 0 0 12px #ff9800;
}

/* ===== MAIN BUTTON ===== */
.main-btn {
    width: 100%;
    padding: 15px;
    margin-top: 20px;
    border: none;
    border-radius: 18px;
    font-size: 16px;
    font-weight: bold;
    background: linear-gradient(135deg,#ff9800,#ff5722);
    color: white;
    cursor: pointer;
    transition: 0.3s;
    box-shadow: 0 10px 25px rgba(255,100,0,0.5);
}

.main-btn:hover {
    transform: scale(1.05);
}

/* ===== QUICK BUTTONS ===== */
.quick {
    margin-top: 15px;
    display: flex;
    gap: 10px;
}

.quick button {
    flex: 1;
    padding: 10px;
    border-radius: 10px;
    background: rgba(255,150,0,0.1);
    border: 1px solid rgba(255,150,0,0.3);
    color: #ffcc80;
    cursor: pointer;
}

/* ===== NAV BUTTONS ===== */
.nav {
    margin-top: 20px;
    display: flex;
    gap: 10px;
}

.nav a {
    flex: 1;
    padding: 10px;
    border-radius: 10px;
    text-decoration: none;
    font-size: 13px;
    text-align: center;
    transition: 0.3s;
}

/* Withdraw button */
.withdraw {
    background: rgba(0,255,150,0.1);
    color: #00ffcc;
    border: 1px solid rgba(0,255,150,0.3);
}

/* Dashboard button */
.dashboard {
    background: rgba(255,255,255,0.1);
    color: #ccc;
    border: 1px solid rgba(255,255,255,0.2);
}

.nav a:hover {
    transform: scale(1.05);
}

</style>
</head>

<body>

<div class="card">

    <div class="title">&#128176; Add to Hidden Wallet</div>
    <div class="subtitle">Securely move money to your hidden balance</div>

    <form action="/hide_money" method="post">

        <input type="number" id="amount" name="amount" placeholder="Enter amount" required>

        <div class="quick">
            <button type="button" onclick="setAmount(500)">+500</button>
            <button type="button" onclick="setAmount(1000)">+1000</button>
            <button type="button" onclick="setAmount(5000)">+5000</button>
        </div>

        <button class="main-btn">Add Money</button>

    </form>

    <!-- NAVIGATION -->
    <div class="nav">
        <a href="/hidden_dashboard" class="withdraw">&#128184; Withdraw</a>
        <a href="/customerdashboard" class="dashboard">&#127968; Dashboard</a>
    </div>

</div>

<script>
function setAmount(val){
    document.getElementById("amount").value = val;
}
</script>

</body>
</html>