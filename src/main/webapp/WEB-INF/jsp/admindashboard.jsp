<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="css/dash.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/admindashboard.css">
  <%@ page contentType="text/html; charset=UTF-8" %>
 

  <style>
    .home-content {
      padding: 24px;
      background: #f5f8fc;
      min-height: calc(100vh - 80px);
    }

    .hero-banner {
      position: relative;
      overflow: hidden;
      background: linear-gradient(135deg, #0A2558 0%, #163b88 55%, #2d5fd3 100%);
      border-radius: 28px;
      padding: 34px 32px;
      color: #fff;
      box-shadow: 0 18px 45px rgba(10, 37, 88, 0.20);
      margin-bottom: 28px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 20px;
      flex-wrap: wrap;
    }

    .hero-banner::before {
      content: "";
      position: absolute;
      top: -45px;
      right: -45px;
      width: 180px;
      height: 180px;
      border-radius: 50%;
      background: rgba(255,255,255,0.08);
    }

    .hero-banner::after {
      content: "";
      position: absolute;
      bottom: -60px;
      left: -60px;
      width: 220px;
      height: 220px;
      border-radius: 50%;
      background: rgba(255,255,255,0.05);
    }

    .hero-text {
      position: relative;
      z-index: 1;
    }

    .hero-text .mini-title {
      font-size: 13px;
      text-transform: uppercase;
      letter-spacing: 2px;
      color: rgba(255,255,255,0.80);
      margin-bottom: 8px;
      font-weight: 700;
    }

    .hero-text h1 {
      margin: 0;
      font-size: 34px;
      font-weight: 800;
      line-height: 1.2;
    }

    .hero-text p {
      margin: 12px 0 0 0;
      max-width: 650px;
      font-size: 15px;
      line-height: 1.7;
      color: rgba(255,255,255,0.90);
    }

    .hero-badge {
      position: relative;
      z-index: 1;
      padding: 14px 22px;
      border-radius: 999px;
      background: rgba(255,255,255,0.16);
      border: 1px solid rgba(255,255,255,0.22);
      font-weight: 700;
      backdrop-filter: blur(6px);
    }

    .overview-boxes {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 22px;
      margin-bottom: 30px;
    }

    .overview-boxes .box {
      background: #ffffff;
      border-radius: 24px;
      padding: 24px;
      box-shadow: 0 12px 30px rgba(10, 37, 88, 0.08);
      border: 1px solid #eef2f7;
      transition: all 0.25s ease;
      position: relative;
      overflow: hidden;
    }

    .overview-boxes .box::before {
      content: "";
      position: absolute;
      top: -30px;
      right: -30px;
      width: 110px;
      height: 110px;
      border-radius: 50%;
      background: linear-gradient(135deg, rgba(45,95,211,0.10), rgba(10,37,88,0.03));
    }

    .overview-boxes .box:hover {
      transform: translateY(-5px);
      box-shadow: 0 16px 38px rgba(10, 37, 88, 0.13);
    }

    .stat-top {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      margin-bottom: 16px;
      position: relative;
      z-index: 1;
    }

    .stat-icon {
      width: 54px;
      height: 54px;
      border-radius: 16px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 26px;
      color: #fff;
      box-shadow: 0 10px 24px rgba(10, 37, 88, 0.18);
    }

    .icon-blue {
      background: linear-gradient(135deg, #0A2558, #2d5fd3);
    }

    .icon-green {
      background: linear-gradient(135deg, #0f766e, #10b981);
    }

    .icon-purple {
      background: linear-gradient(135deg, #5b21b6, #7c3aed);
    }

    .icon-red {
      background: linear-gradient(135deg, #b91c1c, #ef4444);
    }

    .box-topic {
      font-size: 14px;
      color: #667085;
      font-weight: 700;
      margin-bottom: 8px;
      position: relative;
      z-index: 1;
    }

    .number {
      font-size: 34px;
      font-weight: 800;
      color: #0A2558;
      line-height: 1.1;
      margin-bottom: 10px;
      position: relative;
      z-index: 1;
    }

    .indicator {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      padding: 8px 12px;
      border-radius: 999px;
      font-size: 13px;
      font-weight: 700;
      position: relative;
      z-index: 1;
    }

    .indicator.up {
      background: #ecfdf3;
      color: #027a48;
    }

    .indicator.down-box {
      background: #fef3f2;
      color: #b42318;
    }

    .dashboard-grid {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 24px;
    }

    .panel-card {
      background: #ffffff;
      border-radius: 26px;
      box-shadow: 0 14px 35px rgba(10, 37, 88, 0.08);
      border: 1px solid #eef2f7;
      overflow: hidden;
    }

    .panel-header {
      padding: 22px 24px 16px;
      border-bottom: 1px solid #edf2f7;
      background: linear-gradient(180deg, #ffffff 0%, #f9fbff 100%);
    }

    .panel-header h3 {
      margin: 0;
      color: #0A2558;
      font-size: 22px;
      font-weight: 800;
    }

    .panel-header p {
      margin: 8px 0 0 0;
      color: #667085;
      font-size: 14px;
      line-height: 1.6;
    }

    .quick-actions {
      padding: 24px;
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 16px;
    }

    .action-card {
      text-decoration: none;
      background: #f8fbff;
      border: 1px solid #e6eefc;
      border-radius: 20px;
      padding: 20px;
      transition: all 0.25s ease;
      color: inherit;
    }

    .action-card:hover {
      transform: translateY(-4px);
      background: #ffffff;
      box-shadow: 0 12px 28px rgba(10, 37, 88, 0.10);
    }

    .action-card i {
      font-size: 28px;
      color: #2d5fd3;
      margin-bottom: 12px;
      display: inline-block;
    }

    .action-card h4 {
      margin: 0 0 6px 0;
      color: #0A2558;
      font-size: 17px;
      font-weight: 800;
    }

    .action-card p {
      margin: 0;
      color: #667085;
      font-size: 14px;
      line-height: 1.5;
    }

    .admin-card-body {
      padding: 24px;
    }

    .admin-profile-box {
      background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
      border-radius: 24px;
      color: #fff;
      padding: 26px;
      position: relative;
      overflow: hidden;
      box-shadow: 0 16px 34px rgba(10, 37, 88, 0.18);
    }

    .admin-profile-box::before {
      content: "";
      position: absolute;
      top: -30px;
      right: -30px;
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: rgba(255,255,255,0.08);
    }

    .admin-avatar {
      width: 72px;
      height: 72px;
      border-radius: 20px;
      background: rgba(255,255,255,0.14);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 34px;
      margin-bottom: 18px;
      border: 1px solid rgba(255,255,255,0.18);
      position: relative;
      z-index: 1;
    }

    .admin-profile-box h4 {
      margin: 0;
      font-size: 24px;
      font-weight: 800;
      position: relative;
      z-index: 1;
    }

    .admin-profile-box p {
      margin: 10px 0 0 0;
      font-size: 14px;
      line-height: 1.7;
      color: rgba(255,255,255,0.88);
      position: relative;
      z-index: 1;
    }

    .status-list {
      margin-top: 20px;
      display: grid;
      gap: 14px;
    }

    .status-item {
      background: #f8fbff;
      border: 1px solid #e8eef8;
      border-radius: 18px;
      padding: 16px 18px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 12px;
    }

    .status-item span {
      color: #344054;
      font-size: 14px;
      font-weight: 700;
    }

    .status-pill {
      padding: 8px 14px;
      border-radius: 999px;
      font-size: 13px;
      font-weight: 800;
    }

    .pill-live {
      background: #ecfdf3;
      color: #027a48;
    }

    .pill-safe {
      background: #eff8ff;
      color: #175cd3;
    }

    .pill-fast {
      background: #f4f3ff;
      color: #6938ef;
    }

    @media (max-width: 1100px) {
      .overview-boxes {
        grid-template-columns: repeat(2, 1fr);
      }

      .dashboard-grid {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 768px) {
      .home-content {
        padding: 16px;
      }

      .hero-banner {
        padding: 24px;
        border-radius: 22px;
      }

      .hero-text h1 {
        font-size: 26px;
      }

      .overview-boxes {
        grid-template-columns: 1fr;
      }

      .quick-actions {
        grid-template-columns: 1fr;
      }
    }
  </style>


<!-- 🔥 ADD THIS CSS AT END OF YOUR EXISTING <style> (DO NOT REMOVE ANYTHING) -->

<style>
.analytics-floating {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 260px;
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(10px);
    border-radius: 18px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.15);
    padding: 18px;
    z-index: 999;
    animation: slideUp 0.6s ease;
}

@keyframes slideUp {
    from {
        transform: translateY(40px);
        opacity: 0;
    }
    to {
        transform: translateY(0);
        opacity: 1;
    }
}

.analytics-floating h4 {
    margin: 0 0 12px;
    font-size: 16px;
    color: #0A2558;
    font-weight: 700;
}

.analytics-item {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    font-size: 13px;
}

.analytics-item strong {
    color: #0A2558;
}

.analytics-badge {
    background: #eef4ff;
    padding: 4px 10px;
    border-radius: 10px;
    font-weight: 600;
}

.analytics-toggle {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: linear-gradient(135deg, #0A2558, #2d5fd3);
    color: white;
    padding: 12px 16px;
    border-radius: 50px;
    cursor: pointer;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    font-size: 14px;
}

.analytics-toggle {
    bottom: 20px;
    right: 20px;
    transition: 0.3s;
}

.analytics-floating {
    bottom: 70px; /* 🔥 move panel above button */
}

.fraud-popup {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.6);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
}

.fraud-box {
    background: #fff;
    padding: 30px;
    border-radius: 20px;
    text-align: center;
    width: 320px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.3);
    animation: popup 0.4s ease;
}

.fraud-box h2 {
    color: red;
    margin-bottom: 10px;
}

.fraud-box button {
    margin-top: 15px;
    padding: 10px 20px;
    border: none;
    background: #0A2558;
    color: white;
    border-radius: 10px;
    cursor: pointer;
}


.action-btn {
  border: none;
  padding: 6px 14px;
  border-radius: 8px;
  font-size: 13px;
  font-weight: 600;
  cursor: pointer;
  transition: 0.2s ease;
}

/* Allow */
.btn-allow {
  background: #10b981;
  color: white;
}
.btn-allow:hover {
  background: #059669;
}

/* Block */
.btn-block {
  background: #ef4444;
  color: white;
}
.btn-block:hover {
  background: #dc2626;
}

/* Delete */
.btn-delete {
  background: #6b7280;
  color: white;
}
.btn-delete:hover {
  background: #374151;
}

@keyframes popup {
    from { transform: scale(0.7); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
}




</style>
</head>

<body>
  <%@ page import="java.util.*" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   

  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxs-user'></i>
      <span class="logo_name">${name}</span>
    </div>
    <ul class="nav-links">
      <li>
        <a href="/admindashboard" class="active">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Dashboard</span>
        </a>
      </li>
      <li>
        <a href="/customeraccounts">
          <i class='bx bx-box'></i>
          <span class="links_name">Customer Accounts</span>
        </a>
      </li>
      <li>
        <a href="/activeusers">
          <i class='bx bx-list-ul'></i>
          <span class="links_name">Active Users</span>
        </a>
      </li>
      <li>
        <a href="/customer">
          <i class='bx bx-user'></i>
          <span class="links_name">Customers</span>
        </a>
      </li>
      <li>
        <a href="/message">
          <i class='bx bx-message'></i>
          <span class="links_name">Messages</span>
        </a>
      </li>
      <li>
        <a href="/faq_admin">
          <i class='bx bx-list-ul'></i>
          <span class="links_name">FAQ</span>
        </a>
      </li>
      <li class="log_out">
        <a href="/">
          <i class='bx bx-log-out'></i>
          <span class="links_name">Log out</span>
        </a>
      </li>
    </ul>
  </div>

  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
    </nav>

    <div class="home-content">
      <div class="hero-banner">
        <div class="hero-text">
          <div class="mini-title">Admin Control Center</div>
          <h1>Welcome back, ${name}</h1>
          <p>
            Manage customer accounts, monitor user activity, review messages, and keep your digital banking platform running smoothly from one secure dashboard.
          </p>
        </div>
        <div class="hero-badge">
          Secure Admin Access
        </div>
      </div>

      <div class="overview-boxes">
        
        <div class="box">
          <div class="stat-top">
            <div>
              <div class="box-topic">Total Customer</div>
              <div class="number">${totalCustomer}</div>
            </div>
            <div class="stat-icon icon-blue">
              <i class='bx bx-user'></i>
            </div>
          </div>
          <div class="indicator up">
            <i class='bx bx-group'></i>
            <span class="text">Registered users</span>
          </div>
        </div>

        <div class="box">
          <div class="stat-top">
            <div>
              <div class="box-topic">Total Transaction</div>
              <div class="number">${totalTransaction}</div>
            </div>
            <div class="stat-icon icon-green">
              <i class='bx bx-transfer-alt'></i>
            </div>
          </div>
          <div class="indicator up">
            <i class='bx bx-line-chart'></i>
            <span class="text">All bank transfers</span>
          </div>
        </div>

        <div class="box">
          <div class="stat-top">
            <div>
              <div class="box-topic">Active Customer</div>
              <div class="number">${activeCustomer}</div>
            </div>
            <div class="stat-icon icon-purple">
              <i class='bx bx-user-check'></i>
            </div>
          </div>
          <div class="indicator up">
            <i class='bx bx-check-circle'></i>
            <span class="text">Approved users</span>
          </div>
        </div>

        <div class="box">
          <div class="stat-top">
            <div>
              <div class="box-topic">Inactive Customer</div>
              <div class="number">${inactiveCustomer}</div>
            </div>
            <div class="stat-icon icon-red">
              <i class='bx bx-user-x'></i>
            </div>
          </div>
          <div class="indicator down-box">
            <i class='bx bx-time'></i>
            <span class="text">Pending / inactive</span>
          </div>
        </div>
      </div>

      <div class="dashboard-grid">
        <div class="panel-card">
          <div class="panel-header">
            <h3>Quick Actions</h3>
            <p>Jump directly to the most important admin sections and manage the system faster.</p>
          </div>

          <div class="quick-actions">
            <a href="/customeraccounts" class="action-card">
              <i class='bx bx-folder-open'></i>
              <h4>Customer Accounts</h4>
              <p>Review account opening requests and manage approval flow.</p>
            </a>

            <a href="/activeusers" class="action-card">
              <i class='bx bx-pulse'></i>
              <h4>Active Users</h4>
              <p>Check which users are currently active and approved in the system.</p>
            </a>

            <a href="/customer" class="action-card">
              <i class='bx bx-group'></i>
              <h4>Customers</h4>
              <p>Manage registered customers, update roles, and control status.</p>
            </a>

            <a href="/message" class="action-card">
              <i class='bx bx-envelope'></i>
              <h4>Messages</h4>
              <p>Total messages: ${totalMessages}</p>
            </a>

            <a href="/faq_admin" class="action-card">
              <i class='bx bx-help-circle'></i>
              <h4>FAQ Manager</h4>
              <p>Add and manage frequently asked questions for a better user experience.</p>
            </a>

            <a href="/customeraccounts" class="action-card">
              <i class='bx bx-task'></i>
              <h4>Pending Requests</h4>
              <p>Total pending account requests: ${pendingRequests}</p>
            </a>
          </div>
        </div>

        <div class="panel-card">
          <div class="panel-header">
            <h3>Admin Overview</h3>
            <p>System status and admin profile summary.</p>
          </div>

          <div class="admin-card-body">
            <div class="admin-profile-box">
              <div class="admin-avatar">
                <i class='bx bxs-user'></i>
              </div>
              <h4>${name}</h4>
              <p>
                You are logged in as administrator. Use this panel to monitor account activity, review requests, and maintain banking operations securely.
              </p>
            </div>

            <div class="status-list">
              <div class="status-item">
                <span>System Status</span>
                <div class="status-pill pill-live">Live</div>
              </div>

              <div class="status-item">
                <span>Total Messages</span>
                <div class="status-pill pill-safe">${totalMessages}</div>
              </div>

              <div class="status-item">
                <span>Pending Requests</span>
                <div class="status-pill pill-fast">${pendingRequests}</div>
              </div>
            </div>
          </div>
        </div>

        <div class="panel-card">
  <div class="panel-header">
    <h3>Fraud Alerts &#128680;</h3>
  </div>

  <div class="admin-card-body">
    <c:forEach var="f" items="${frauds}">
  <div class="status-item">

   <span>
  ${f["accountno"]} - ₹${f["amount"]}
  <br>
 <small style="font-weight:600;">
  Status: 
  <c:choose>
    <c:when test="${f['action'] == 'BLOCKED'}">
      <span style="color:red;">BLOCKED</span>
    </c:when>
    <c:when test="${f['action'] == 'ALLOWED'}">
      <span style="color:green;">ALLOWED</span>
    </c:when>
    <c:otherwise>
      <span style="color:orange;">Pending</span>
    </c:otherwise>
  </c:choose>
</small>
</span>

    <div style="display:flex; gap:10px;">
      
      <!-- ✅ ALLOW BUTTON -->
      <form action="/allowTransaction" method="post">
        <input type="hidden" name="id" value="${f['id']}">
        <button style="background:#10b981;color:white;border:none;padding:6px 12px;border-radius:8px;">
          Allow
        </button>
      </form>

      <!-- ❌ BLOCK BUTTON -->
      <form action="/blockTransaction" method="post">
        <input type="hidden" name="id" value="${f['id']}">
        <input type="hidden" name="accountno" value="${f['accountno']}">
        <button style="background:#ef4444;color:white;border:none;padding:6px 12px;border-radius:8px;">
          Block
        </button>
      </form>

      <!-- Delete -->
   <form action="/deleteFraud" method="post">
    <input type="hidden" name="id" value="${f['id']}">
    <button class="action-btn btn-delete"
            onclick="return confirm('Are you sure to delete this fraud alert?')">
      Delete
    </button>
  </form>

    </div>

  </div>
</c:forEach>
  </div>
</div>
      </div>

    </div>
  </section>

  <script>
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".sidebarBtn");
    sidebarBtn.onclick = function () {
      sidebar.classList.toggle("active");
      if (sidebar.classList.contains("active")) {
        sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
      } else
        sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      }
    
  </script>

  <!-- 🔥 ADD THIS BEFORE </body> (DO NOT TOUCH ANYTHING ABOVE) -->

<div class="analytics-toggle" onclick="toggleAnalytics()">
  &#x1F4CA; Analytics
</div>

<div class="analytics-floating" id="analyticsBox" style="display:none;">
  <h4>Quick Insights</h4>

  <div class="analytics-item">
    <span>Customers</span>
    <strong class="analytics-badge">${totalCustomer}</strong>
  </div>

  <div class="analytics-item">
    <span>Transactions</span>
    <strong class="analytics-badge">${totalTransaction}</strong>
  </div>

  <div class="analytics-item">
    <span>Active</span>
    <strong class="analytics-badge">${activeCustomer}</strong>
  </div>

  <div class="analytics-item">
    <span>Pending</span>
    <strong class="analytics-badge">${pendingRequests}</strong>
  </div>

  <div class="analytics-item">
    <span>Messages</span>
    <strong class="analytics-badge">${totalMessages}</strong>
  </div>
</div>

<script>
function toggleAnalytics() {
    let box = document.getElementById("analyticsBox");
    box.style.display = (box.style.display === "none") ? "block" : "none";
}
</script>

<c:if test="${showFraudAlert}">
  <div id="fraudPopup" class="fraud-popup">
    <div class="fraud-box">
      <h2>&#128680; Fraud Alert Detected!</h2>
      <p>Suspicious transactions found in the system.</p>
      <button onclick="closeFraud()">OK</button>
    </div>
  </div>
</c:if>

<script>
function closeFraud() {
    document.getElementById("fraudPopup").style.display = "none";
}
</script>

</body>
</html>