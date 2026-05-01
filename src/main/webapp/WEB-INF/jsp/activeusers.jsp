<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title>Active Users</title>
  <link rel="stylesheet" href="css/dash.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/admindashboard.css">
 

  <style>
    .active-users-page {
      padding: 24px;
      background: #f5f8fc;
      min-height: calc(100vh - 80px);
    }

    .page-header {
      background: linear-gradient(135deg, #0A2558 0%, #163b88 55%, #2d5fd3 100%);
      color: white;
      border-radius: 28px;
      padding: 30px;
      box-shadow: 0 20px 45px rgba(10, 37, 88, 0.18);
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 20px;
      flex-wrap: wrap;
      position: relative;
      overflow: hidden;
      margin-bottom: 24px;
    }

    .page-header::before {
      content: "";
      position: absolute;
      top: -40px;
      right: -30px;
      width: 160px;
      height: 160px;
      background: rgba(255,255,255,0.08);
      border-radius: 50%;
    }

    .page-header::after {
      content: "";
      position: absolute;
      bottom: -55px;
      left: -45px;
      width: 200px;
      height: 200px;
      background: rgba(255,255,255,0.05);
      border-radius: 50%;
    }

    .page-header-text {
      position: relative;
      z-index: 1;
    }

    .page-header-text h2 {
      margin: 0;
      font-size: 30px;
      font-weight: 800;
      letter-spacing: 0.4px;
    }

    .page-header-text p {
      margin: 10px 0 0 0;
      color: rgba(255,255,255,0.88);
      font-size: 15px;
      max-width: 650px;
    }

    .header-badge {
      position: relative;
      z-index: 1;
      background: rgba(255,255,255,0.15);
      border: 1px solid rgba(255,255,255,0.24);
      padding: 14px 22px;
      border-radius: 999px;
      font-size: 14px;
      font-weight: 700;
      backdrop-filter: blur(8px);
    }

    .users-card {
      background: #ffffff;
      border-radius: 26px;
      box-shadow: 0 14px 38px rgba(16, 24, 40, 0.08);
      border: 1px solid #eaf0f6;
      overflow: hidden;
    }

    .users-card-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 15px;
      flex-wrap: wrap;
      padding: 24px 26px 18px 26px;
      border-bottom: 1px solid #edf2f7;
      background: linear-gradient(180deg, #ffffff 0%, #f9fbff 100%);
    }

    .users-card-top h3 {
      margin: 0;
      color: #0A2558;
      font-size: 22px;
      font-weight: 800;
    }

    .users-card-top p {
      margin: 6px 0 0 0;
      color: #667085;
      font-size: 14px;
    }

    .live-status {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      background: #ecfdf3;
      color: #027a48;
      padding: 10px 16px;
      border-radius: 999px;
      font-size: 14px;
      font-weight: 700;
      border: 1px solid #d1fadf;
    }

    .live-dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      background: #12b76a;
      box-shadow: 0 0 0 5px rgba(18, 183, 106, 0.12);
    }

    .table-wrap {
      padding: 22px;
      overflow-x: auto;
    }

    .styled-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 14px;
      min-width: 700px;
    }

    .styled-table thead th {
      background: #eef4ff;
      color: #0A2558;
      font-size: 14px;
      font-weight: 800;
      padding: 16px 18px;
      text-align: left;
      border: none;
      letter-spacing: 0.4px;
    }

    .styled-table thead th:first-child {
      border-top-left-radius: 14px;
      border-bottom-left-radius: 14px;
    }

    .styled-table thead th:last-child {
      border-top-right-radius: 14px;
      border-bottom-right-radius: 14px;
    }

    .styled-table tbody tr {
      background: #ffffff;
      box-shadow: 0 8px 24px rgba(16, 24, 40, 0.06);
      transition: transform 0.25s ease, box-shadow 0.25s ease;
    }

    .styled-table tbody tr:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 28px rgba(16, 24, 40, 0.10);
    }

    .styled-table tbody td {
      padding: 18px;
      font-size: 15px;
      color: #344054;
      border-top: 1px solid #eef2f7;
      border-bottom: 1px solid #eef2f7;
    }

    .styled-table tbody td:first-child {
      border-left: 1px solid #eef2f7;
      border-top-left-radius: 14px;
      border-bottom-left-radius: 14px;
      font-weight: 800;
      color: #0A2558;
    }

    .styled-table tbody td:last-child {
      border-right: 1px solid #eef2f7;
      border-top-right-radius: 14px;
      border-bottom-right-radius: 14px;
    }

    .user-name {
      display: flex;
      align-items: center;
      gap: 12px;
      font-weight: 700;
      color: #101828;
    }

    .avatar {
      width: 42px;
      height: 42px;
      border-radius: 50%;
      background: linear-gradient(135deg, #dbeafe, #bfdbfe);
      display: flex;
      align-items: center;
      justify-content: center;
      color: #0A2558;
      font-size: 20px;
      box-shadow: inset 0 0 0 1px rgba(10, 37, 88, 0.06);
    }

    .email-pill {
      display: inline-block;
      padding: 8px 14px;
      border-radius: 999px;
      background: #f2f4f7;
      color: #344054;
      font-size: 13px;
      font-weight: 700;
    }

    .active-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 8px 14px;
      border-radius: 999px;
      background: #ecfdf3;
      color: #027a48;
      border: 1px solid #d1fadf;
      font-size: 13px;
      font-weight: 800;
    }

    .empty-box {
      text-align: center;
      padding: 45px 20px;
      color: #667085;
    }

    .empty-box i {
      font-size: 52px;
      color: #98a2b3;
      margin-bottom: 12px;
      display: block;
    }

    .empty-box h4 {
      margin: 0 0 8px 0;
      font-size: 22px;
      color: #0A2558;
    }

    .empty-box p {
      margin: 0;
      font-size: 14px;
    }

    @media (max-width: 768px) {
      .active-users-page {
        padding: 15px;
      }

      .page-header {
        padding: 22px 18px;
        border-radius: 22px;
      }

      .page-header-text h2 {
        font-size: 24px;
      }

      .users-card-top {
        padding: 18px;
      }

      .table-wrap {
        padding: 14px;
      }
    }
  </style>
</head>

<body>
   
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

    <div class="home-content active-users-page">
      <div class="page-header">
        <div class="page-header-text">
          <h2>Active Users</h2>
          <p>View all currently active registered users in a clean and organized dashboard.</p>
        </div>
        <div class="header-badge">
          Admin Monitoring Panel
        </div>
      </div>

      <div class="users-card">
        <div class="users-card-top">
          <div>
            <h3>Users List</h3>
            <p>All active users are displayed below.</p>
          </div>
          <div class="live-status">
            <span class="live-dot"></span>
            Active Records
          </div>
        </div>

        <div class="table-wrap">
          <c:choose>
            <c:when test="${not empty li}">
              <table class="styled-table">
                <thead>
                  <tr>
                    <th>Account Number</th>
                    <th>Customer Name</th>
                    <th>Email Address</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="user" items="${li}">
                    <tr>
                      <td>${user.accountno}</td>
                      <td>
                        <div class="user-name">
                          <div class="avatar">
                            <i class='bx bx-user'></i>
                          </div>
                          <span>${user.name}</span>
                        </div>
                      </td>
                      <td>
                        <span class="email-pill">${user.email}</span>
                      </td>
                      <td>
                        <span class="active-pill">
                          <i class='bx bx-check-circle'></i>
                          Active
                        </span>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </c:when>

            <c:otherwise>
              <div class="empty-box">
                <i class='bx bx-user-x'></i>
                <h4>No Active Users Found</h4>
                <p>There are currently no active users to display.</p>
              </div>
            </c:otherwise>
          </c:choose>
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
      } else {
        sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      }
    }
  </script>

</body>

</html>