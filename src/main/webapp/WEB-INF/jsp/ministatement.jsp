<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Transaction History</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<style>

/* ===== BODY ===== */
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(135deg,#0a1f44,#163b88,#2d5fd3);
    color: white;
}

/* ===== HEADER ===== */
.header {
    padding: 20px;
}

.header h1 {
    margin: 0;
    font-size: 24px;
}


/* ===== SEARCH ===== */
.search-box {
    margin: 15px;
    padding: 10px;
    border-radius: 20px;
    background: rgba(255,255,255,0.2);
}

.search-box input {
    width: 100%;
    border: none;
    background: transparent;
    color: white;
    outline: none;
}

/* ===== FILTER ===== */
.filters {
    display: flex;
    gap: 10px;
    margin: 0 15px 15px;
}

.filter-btn {
    padding: 8px 12px;
    border-radius: 20px;
    background: rgba(255,255,255,0.2);
    cursor: pointer;
}

.active {
    background: white;
    color: #2d5fd3;
}

/* ===== LIST ===== */
.container {
    padding: 0 15px 30px;
}

/* ===== CARD ===== */
.txn-card {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);
    border-radius: 15px;
    padding: 14px;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: 0.3s;
}

.txn-card:hover {
    transform: scale(1.02);
}

/* LEFT */
.txn-left {
    display: flex;
    gap: 10px;
    align-items: center;
}

.txn-icon {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: linear-gradient(135deg,#00c6ff,#0072ff);
    display: flex;
    align-items: center;
    justify-content: center;
}

/* TEXT */
.txn-title {
    font-weight: 600;
}

.txn-date {
    font-size: 12px;
    opacity: 0.7;
}

/* RIGHT */
.txn-right {
    text-align: right;
}

/* AMOUNT */
.amount {
    font-size: 16px;
    font-weight: bold;
}

.debit {
    color: #ff5252;
}

.credit {
    color: #00e676;
}

/* STATUS */
.status {
    font-size: 12px;
    opacity: 0.7;
}

/* EMPTY */
.empty {
    text-align: center;
    margin-top: 40px;
}

.back-btn {
    padding: 8px 15px;
    background: white;
    color: #2d5fd3;
    border-radius: 20px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.3s;
}

.back-btn:hover {
    background: #e3f2fd;
    transform: scale(1.05);
}

</style>

</head>

<body>

<!-- HEADER -->
<div class="header">

    <div style="display:flex; justify-content:space-between; align-items:center;">
        <h1>&#128179; Transaction History</h1>

        <a href="/customerdashboard" class="back-btn">
            &#11013; Dashboard
        </a>
    </div>

</div>

<!-- SEARCH -->
<div class="search-box">
    <input type="text" id="search" placeholder="Search transactions">
</div>

<!-- FILTER -->
<div class="filters">
    <div class="filter-btn active" onclick="filterData('all', this)">All</div>
    <div class="filter-btn" onclick="filterData('credit', this)">Credit</div>
    <div class="filter-btn" onclick="filterData('debit', this)">Debit</div>
</div>

<!-- LIST -->
<div class="container">

<c:choose>

<c:when test="${not empty ministmt}">

<c:forEach var="t" items="${ministmt}">

<div class="txn-card"
     data-type="<c:choose><c:when test='${t.from_account eq sessionScope.accountno.toString()}'>debit</c:when><c:otherwise>credit</c:otherwise></c:choose>">

    <!-- LEFT -->
    <div class="txn-left">

        <div class="txn-icon">
            <c:choose>
                <c:when test="${t.from_account eq sessionScope.accountno.toString()}">
                    <i class='bx bx-up-arrow-alt'></i>
                </c:when>
                <c:otherwise>
                    <i class='bx bx-down-arrow-alt'></i>
                </c:otherwise>
            </c:choose>
        </div>

        <div>
            <div class="txn-title">
                <c:choose>
                    <c:when test="${t.from_account eq sessionScope.accountno.toString()}">
                        Paid to ${t.to_account}
                    </c:when>
                    <c:otherwise>
                        Received from ${t.from_account}
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="txn-date">${t.transfer_date}</div>
        </div>

    </div>

    <!-- RIGHT -->
    <div class="txn-right">

        <c:choose>
            <c:when test="${t.from_account eq sessionScope.accountno.toString()}">
                <div class="amount debit">- &#8377;${t.amount}</div>
                <div class="status">Debited</div>
            </c:when>
            <c:otherwise>
                <div class="amount credit">+ &#8377;${t.amount}</div>
                <div class="status">Credited</div>
            </c:otherwise>
        </c:choose>

    </div>

</div>

</c:forEach>

</c:when>

<c:otherwise>

<div class="empty">
    <h3>No Transactions</h3>
</div>

</c:otherwise>

</c:choose>

</div>

<!-- SCRIPT -->
<script>

// SEARCH
document.getElementById("search").addEventListener("keyup", function() {
    let val = this.value.toLowerCase();
    document.querySelectorAll(".txn-card").forEach(card => {
        card.style.display = card.innerText.toLowerCase().includes(val) ? "" : "none";
    });
});

// FILTER
function filterData(type, el) {

    document.querySelectorAll(".filter-btn").forEach(btn => btn.classList.remove("active"));
    el.classList.add("active");

    document.querySelectorAll(".txn-card").forEach(card => {

        if(type === "all") {
            card.style.display = "";
        } else {
            card.style.display = (card.getAttribute("data-type") === type) ? "" : "none";
        }

    });
}

</script>

</body>
</html>