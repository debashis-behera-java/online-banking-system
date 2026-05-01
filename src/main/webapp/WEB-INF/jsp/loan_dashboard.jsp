<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
<title>Loan Dashboard</title>

<style>

/* BACKGROUND */
body{
    margin:0;
    font-family:'Segoe UI',sans-serif;
    background:linear-gradient(135deg,#0f172a,#1e293b,#334155);
}

/* CONTAINER */
.container{
    max-width:420px;
    margin:40px auto;
    padding:15px;
}

/* HEADER */
.header{
    text-align:center;
    color:white;
    margin-bottom:20px;
}

/* SUMMARY */
.summary{
    background:linear-gradient(135deg,#1e3a8a,#2563eb);
    color:white;
    padding:20px;
    border-radius:20px;
    margin-bottom:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.3);
}

/* CARD */
.loan-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:20px;
    padding:18px;
    margin-bottom:15px;
    box-shadow:0 15px 30px rgba(0,0,0,0.35);
    transition:all 0.3s ease;
}

.loan-card:hover{
    transform:translateY(-6px) scale(1.01);
    box-shadow:0 20px 40px rgba(0,0,0,0.5);
}

/* TEXT */
.amount{
    font-size:22px;
    color:#a78bfa;
    font-weight:bold;
}

.emi{
    color:#22c55e;
    font-weight:600;
    margin-top:5px;
}

.status{
    margin-top:8px;
    font-size:13px;
    color:#cbd5f5;
}

/* PROGRESS */
.progress-bg{
    height:8px;
    background:#1e293b;
    border-radius:10px;
    margin-top:8px;
    overflow:hidden;
}

.progress-bar{
    height:8px;
    border-radius:10px;
    background:linear-gradient(90deg,#22c55e,#4ade80);
    box-shadow:0 0 12px #22c55eaa;
    transition:width 0.8s ease;
}

/* SHINE EFFECT */
.progress-bar::after{
    content:'';
    display:block;
    height:100%;
    width:100%;
    background:linear-gradient(
        120deg,
        transparent,
        rgba(255,255,255,0.4),
        transparent
    );
    animation:shine 2s infinite;
}

@keyframes shine{
    0%{ transform:translateX(-100%); }
    100%{ transform:translateX(100%); }
}

/* BUTTON */
.pay-btn{
    margin-top:12px;
    padding:10px;
    border:none;
    border-radius:12px;
    background:linear-gradient(135deg,#22c55e,#16a34a);
    color:white;
    width:100%;
    cursor:pointer;
    font-weight:600;
    transition:all 0.25s ease;
}

.pay-btn:hover{
    transform:scale(1.03);
    box-shadow:0 10px 25px rgba(34,197,94,0.5);
}

/* COMPLETED */
.completed{
    background:#64748b;
    box-shadow:none;
}

/* MESSAGE */
.msg{
    padding:10px;
    border-radius:10px;
    margin-bottom:10px;
}

.success{
    background:#dcfce7;
    color:#166534;
}

.error{
    background:#fee2e2;
    color:#991b1b;
}

.back-btn{
    padding:12px 20px;
    border:none;
    border-radius:25px;
    background:linear-gradient(135deg,#6366f1,#8b5cf6);
    color:white;
    font-weight:600;
    cursor:pointer;
    transition:all 0.3s ease;
}

.back-btn:hover{
    transform:scale(1.05);
    box-shadow:0 10px 20px rgba(139,92,246,0.5);
}

.credit-wrapper{
    text-align:center;
    color:white;
    margin-bottom:40px;
}

.credit-card{
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(12px);
    border-radius:20px;
    padding:20px;
    text-align:center;
    color:white;
    margin:20px auto;
    max-width:420px;
    box-shadow:0 10px 30px rgba(0,0,0,0.4);
}

.score{
    font-size:40px;
    font-weight:bold;
    margin-top:10px;
}

.score-label{
    margin-top:8px;
    font-size:14px;
    font-weight:600;
}

</style>

</head>

<body>
<div class="credit-card">

    <h3>💳 Credit Score</h3>

    <div class="score">${creditScore}</div>

    <div class="score-label" id="scoreLabel"></div>

</div>

<div class="container">

    <!-- HEADER -->
    <div class="header">
        <h2>💰 Loan Dashboard</h2>
        <p style="color:#94a3b8;">Your EMI & Loan Details</p>
    </div>

    <!-- MESSAGE -->
    <c:if test="${not empty msg}">
        <div class="msg success">${msg}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="msg error">${error}</div>
    </c:if>

    <!-- SUMMARY -->
    <div class="summary">
        <h3>Total Loan</h3>
        <h1>₹ ${totalLoan}</h1>
        <p>Active Loans: ${loanCount}</p>
    </div>

    <!-- LOANS -->
  <c:if test="${not empty activeLoans}">
    <h3 style="color:white;margin-top:20px;">Active Loans</h3>
</c:if>

<c:if test="${empty activeLoans}">
    <p style="color:#94a3b8;text-align:center;margin-top:15px;">
    🎉 You have no active loans
</p>
</c:if>

<c:forEach var="l" items="${activeLoans}">

        <c:set var="progress" value="${l.progress}" />

        <div class="loan-card">
            

            <div class="amount">₹ ${l.amount}</div>

            <div class="emi">EMI ₹ ${l.emi}</div>

          <div style="font-size:12px;color:#facc15;margin-top:5px;">
    ⏳ Next EMI: ${l.next_due_date}
</div>

            <div class="status">
                Status: ${l.status}
            </div>

            <c:if test="${l.penalty > 0}">
    <div style="color:#f87171;font-size:12px;margin-top:5px;">
        ⚠️ Penalty: ₹ ${l.penalty}
    </div>
</c:if>

            <!-- PROGRESS -->
            <div style="margin-top:10px;">
                EMI Paid: ${l.safePaid} / ${l.tenure}

                <div class="progress-bg">
                    <div class="progress-bar" id="bar-${l.loan_id}"></div>
                </div>
            </div>

            <!-- BUTTON -->
            <c:choose>

                <c:when test="${l.paid_emi >= l.tenure}">
                    <button class="pay-btn completed" disabled>
                        Loan Completed ✅
                    </button>
                </c:when>

                <c:otherwise>
                    <form action="/payEmi" method="post">
                        <input type="hidden" name="loanId" value="${l.loan_id}">
                        <button class="pay-btn">Pay EMI</button>
                    </form>
                </c:otherwise>

            </c:choose>

        </div>

        <!-- SCRIPT -->
        <script>
            var el = document.getElementById("bar-${l.loan_id}");
            if(el){
                el.style.width = "${progress}%";
            }



           
        </script>

    </c:forEach>

    <hr style="border:1px solid rgba(255,255,255,0.1); margin:20px 0;">

    <c:if test="${not empty closedLoans}">
    <h3 style="color:white;margin-top:25px;">Closed Loans</h3>
</c:if>

<c:forEach var="l" items="${closedLoans}">

    <c:set var="progress" value="${l.progress}" />

    <div class="loan-card">

        <div class="amount">₹ ${l.amount}</div>

        <div class="emi">EMI ₹ ${l.emi}</div>

        <div class="status">Status: Closed ✅</div>

        <div style="font-size:12px;color:#22c55e;margin-top:5px;">
    ✔ Fully Repaid
</div>

        <!-- PROGRESS -->
        <div style="margin-top:10px;">
            EMI Paid: ${l.paid_emi} / ${l.tenure}

            <div class="progress-bg">
                <div class="progress-bar" id="bar-${l.loan_id}"></div>

<script>
    document.getElementById("bar-${l.loan_id}").style.width = "${progress}%";
</script>
            </div>
        </div>

        <!-- ✅ CERTIFICATE ONLY HERE -->
        <a href="/downloadCertificate?loanId=${l.loan_id}">
            <button class="pay-btn" style="background:#2563eb;">
                📄 Download Certificate
            </button>
        </a>

    </div>

</c:forEach>

</div>

<div style="margin-top:20px; text-align:center;">
    <a href="/customerdashboard">
        <button class="back-btn">← Back to Customer Dashboard</button>
    </a>
</div>
<script>
    let score = parseInt("${creditScore}") || 300;

    let label = "Poor";
    let color = "#ef4444";

    if(score >= 800){
        label = "Excellent";
        color = "#16a34a";
    } else if(score >= 740){
        label = "Very Good";
        color = "#84cc16";
    } else if(score >= 670){
        label = "Good";
        color = "#facc15";
    } else if(score >= 580){
        label = "Fair";
        color = "#f97316";
    }

    document.getElementById("scoreLabel").innerText = label;
    document.querySelector(".score").style.color = color;
</script>

</body>
</html>