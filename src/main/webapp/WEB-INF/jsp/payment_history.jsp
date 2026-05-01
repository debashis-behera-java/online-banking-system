<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction History</title>
    <meta charset="UTF-8">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0A2558, #1d4fa8);
            color: white;
        }

        .container {
            padding: 30px;
        }

        .title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .card {
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .top-bar {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        input, select {
            padding: 10px;
            border-radius: 10px;
            border: none;
            outline: none;
        }

        input {
            flex: 1;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px;
            text-align: center;
        }

        th {
            background: rgba(255,255,255,0.2);
        }

        tr {
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        tr:hover {
            background: rgba(255,255,255,0.1);
        }

        .success {
            color: #00ff99;
            font-weight: bold;
        }

        .failed {
            color: #ff4d4d;
            font-weight: bold;
        }

        .btn {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background: linear-gradient(135deg, #00c853, #2ecc71);
            border-radius: 10px;
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="title">&#128179; Transaction History</div>

    <div class="card">

        <!-- 🔍 SEARCH + FILTER -->
        <div class="top-bar">
            <input type="text" id="search" placeholder="&#128269; Search Payment ID...">

            <select id="filter">
                <option value="all">All</option>
                <option value="today">Today</option>
                <option value="7days">Last 7 Days</option>
            </select>
        </div>

        <!-- 📊 TABLE -->
        <table id="table">
            <tr>
                <th>ID</th>
                <th>Payment ID</th>
                <th>Order ID</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Date</th>
            </tr>

            <c:forEach var="t" items="${list}">
                <tr>
                    <td>${t.id}</td>
                    <td>${t.payment_id}</td>
                    <td>${t.order_id}</td>
                    <td>&#8377;${t.amount}</td>

                    <td>
                        <span class="${t.status == 'SUCCESS' ? 'success' : 'failed'}">
                            ${t.status}
                        </span>
                    </td>

                    <td>${t.created_at}</td>
                </tr>
            </c:forEach>
        </table>

        <!-- 🔙 BACK BUTTON -->
        <a href="/customerdashboard" class="btn">&#11013; Back to Dashboard</a>

    </div>

</div>

<!-- 🔍 SEARCH SCRIPT -->
<script>
document.getElementById("search").addEventListener("keyup", function() {
    let value = this.value.toLowerCase();
    let rows = document.querySelectorAll("#table tr");

    rows.forEach((row, index) => {
        if (index === 0) return;

        let text = row.innerText.toLowerCase();
        row.style.display = text.includes(value) ? "" : "none";
    });
});
</script>

</body>
</html>