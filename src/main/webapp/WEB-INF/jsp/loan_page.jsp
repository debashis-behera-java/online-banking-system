<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>Loan</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI';
    background: linear-gradient(135deg,#0f172a,#1e293b);
}

/* MAIN WRAPPER */
.wrapper {
    max-width: 420px;
    margin: 40px auto;
    padding: 15px;
}

/* FLOAT CARD */
.card {
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(12px);
    border-radius: 22px;
    padding: 18px;
    margin-bottom: 15px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.35);
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-3px);
}

/* HEADER */
.header {
    text-align: center;
    color: white;
    margin-bottom: 15px;
}

.header h2 {
    margin: 0;
}

.header p {
    opacity: 0.7;
    font-size: 13px;
}

/* AMOUNT */
.amount {
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    color: #a78bfa;
}

/* LABEL */
.label {
    font-size: 13px;
    color: #cbd5f5;
}

/* SLIDER */
input[type=range] {
    width: 100%;
    margin-top: 10px;
    accent-color: #a78bfa;
}

/* EMI */
.emi {
    text-align: center;
}
.emi h2 {
    color: #22c55e;
    font-size: 28px;
    font-weight: 800;
    text-shadow: 0 0 8px rgba(34,197,94,0.5);
}

/* ROW */
.row {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    color: #cbd5f5;
}

/* TERMS */
ul {
    padding-left: 18px;
    font-size: 13px;
    color: #cbd5f5;
}

/* BUTTON */
.apply-btn {
    width: 100%;
    padding: 14px;
    border-radius: 30px;
    border: none;
    background: linear-gradient(135deg,#7c3aed,#a78bfa);
    color: white;
    font-weight: bold;
    font-size: 15px;
    cursor: pointer;
    box-shadow: 0 10px 25px rgba(124,58,237,0.4);
    transition: all 0.3s ease;
}

.apply-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 15px 30px rgba(124,58,237,0.6);
}

/* CHECKBOX */
.checkbox {
    color: #cbd5f5;
    font-size: 13px;
}

/* EMI LABEL */
.emi-label {
    font-size: 14px;
    color: #cbd5f5;
    text-align: center;
}

/* EMI VALUE */
.emi h2 {
    color: #22c55e;
    font-size: 30px;
    font-weight: 900;
    text-shadow: 0 0 10px rgba(34,197,94,0.6);
    margin: 5px 0;
}

/* DIVIDER */
.divider {
    height: 1px;
    background: rgba(255,255,255,0.1);
    margin: 10px 0;
}

/* ROW */
.row {
    display: flex;
    justify-content: space-between;
    margin-top: 8px;
}

/* LABEL TEXT */
.sub-label {
    color: #94a3b8;
    font-size: 13px;
}

/* TOTAL VALUE */
.total-value {
    color: #38bdf8;
    font-weight: bold;
}

/* INTEREST VALUE */
.interest-value {
    color: #facc15;
    font-weight: bold;
}

/* MESSAGE */
.error {color:#f87171;text-align:center;}
.success {color:#4ade80;text-align:center;}

</style>

<script>

function updateLoan(){

 let P = document.getElementById("amount").value;
 let n = document.getElementById("tenure").value;

 let interest = 10;

 document.getElementById("hiddenAmount").value = P;

 document.getElementById("amountText").innerText =
     "₹ " + Number(P).toLocaleString();

 document.getElementById("tenureText").innerText =
     n + " months";

 let r = interest/12/100;

 let emi = (P*r*Math.pow(1+r,n))/(Math.pow(1+r,n)-1);

 document.getElementById("emi").innerText =
     "₹ " + Math.round(emi);

 document.getElementById("total").innerText =
     "₹ " + Math.round(emi*n);
}

function validateLoan(){
 if(!document.getElementById("agree").checked){
   alert("Please accept terms");
   return false;
 }
 return true;
}

window.onload = updateLoan;

</script>

</head>

<body>

<div class="wrapper">

<form action="/applyLoan" method="post" onsubmit="return validateLoan()">

<input type="hidden" name="amount" id="hiddenAmount">

<!-- HEADER -->
<div class="header">
    <h2>💰 Personal Loan</h2>
    <p>Instant • Smart • Paperless</p>
</div>

<!-- AMOUNT -->
<div class="card">
    <div class="label">Loan Amount</div>
    <div class="amount" id="amountText"></div>

<input type="range"
       id="amount"
       min="1000"
       max="10000"
       value="1000"
       step="500"
       oninput="updateLoan()">
</div>

<!-- TENURE -->
<div class="card">
    <div class="label">Loan Tenure</div>

    <input type="range" id="tenure" min="3" max="24"
           value="6" oninput="updateLoan()">

    <div id="tenureText" style="color:#a78bfa;"></div>
</div>

<div class="card emi">

    <p class="emi-label">Monthly EMI</p>
    <h2 id="emi">₹ 0</h2>

    <div class="divider"></div>

    <div class="row">
        <span class="sub-label">Total Payable</span>
        <b id="total" class="total-value"></b>
    </div>

    <div class="row">
        <span class="sub-label">Interest Rate</span>
        <b class="interest-value">10% fixed</b>
    </div>

</div>

<!-- TERMS -->
<div class="card">
    <b style="color:#a78bfa;">Eligibility</b>
    <ul>
        <li>Account older than 3 months</li>
        <li>No active loans</li>
        <li>Balance below ₹100</li>
    </ul>
</div>

<!-- CHECKBOX -->
<div class="checkbox">
    <input type="checkbox" id="agree"> Accept Terms & Conditions
</div>

<p class="error">${error}</p>
<p class="success">${msg}</p>
<c:if test="${not empty msg}">
  
  <p class="success">
    ${msg} <br>
    ⏳ Redirecting to dashboard in <span id="count">5</span> seconds...
  </p>

  <script>
    let time = 3;

    let timer = setInterval(function() {
        time--;
        document.getElementById("count").innerText = time;

        if(time <= 0){
            clearInterval(timer);
            window.location.href = "/customerdashboard";
        }
    }, 1000);
  </script>

</c:if>

<!-- BUTTON -->
<button class="apply-btn">Apply Loan</button>

</form>

</div>

</body>
</html>