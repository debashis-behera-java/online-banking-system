<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard | Messages</title>
  <link rel="stylesheet" href="css/dash.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/admindashboard.css">
  

  <style>
    body {
      background: linear-gradient(135deg, #eef4ff, #dfe9ff, #f6f9ff);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .home-section {
      background: linear-gradient(135deg, rgba(240, 246, 255, 0.95), rgba(228, 238, 255, 0.95));
      min-height: 100vh;
    }

    nav {
      background: rgba(255, 255, 255, 0.72);
      backdrop-filter: blur(14px);
      -webkit-backdrop-filter: blur(14px);
      border-bottom: 1px solid rgba(255, 255, 255, 0.35);
      box-shadow: 0 8px 24px rgba(15, 23, 42, 0.08);
    }

    .dashboard {
      font-weight: 700;
      color: #0a2558;
      letter-spacing: 0.4px;
    }

    .search-box {
      background: rgba(255, 255, 255, 0.75);
      border-radius: 30px;
      padding: 6px 14px;
      box-shadow: inset 0 2px 8px rgba(255, 255, 255, 0.8), 0 4px 12px rgba(0, 0, 0, 0.06);
    }

    .search-box input {
      background: transparent;
      border: none;
      outline: none;
      color: #0a2558;
      font-weight: 500;
    }

    .search-box i {
      color: #0a2558;
      font-weight: bold;
    }

    .profile-details {
      background: rgba(255, 255, 255, 0.72);
      padding: 8px 16px;
      border-radius: 16px;
      box-shadow: 0 8px 18px rgba(15, 23, 42, 0.08);
    }

    .profile-details .admin_name {
      color: #0a2558;
      font-weight: 700;
    }

    .page-header {
      width: 100%;
      margin-bottom: 24px;
      padding: 28px 30px;
      border-radius: 28px;
      background: linear-gradient(135deg, #0a2558, #1d4ed8, #60a5fa);
      color: #fff;
      box-shadow: 0 18px 40px rgba(29, 78, 216, 0.22);
      position: relative;
      overflow: hidden;
    }

    .page-header::before {
      content: "";
      position: absolute;
      width: 220px;
      height: 220px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.12);
      top: -70px;
      right: -60px;
    }

    .page-header::after {
      content: "";
      position: absolute;
      width: 160px;
      height: 160px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.08);
      bottom: -40px;
      left: 35%;
    }

    .page-header h2 {
      position: relative;
      z-index: 2;
      margin: 0;
      font-size: 30px;
      font-weight: 800;
      letter-spacing: 1px;
    }

    .page-header p {
      position: relative;
      z-index: 2;
      margin-top: 8px;
      font-size: 15px;
      color: rgba(255, 255, 255, 0.92);
    }

    .table-card {
      background: rgba(255, 255, 255, 0.55);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      border: 1px solid rgba(255, 255, 255, 0.5);
      border-radius: 26px;
      padding: 22px;
      box-shadow: 0 20px 45px rgba(15, 23, 42, 0.10);
    }

    .table-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      margin-bottom: 18px;
      flex-wrap: wrap;
    }

    .table-top h3 {
      color: #0a2558;
      font-size: 22px;
      font-weight: 800;
      margin: 0;
    }

    .message-count {
      padding: 10px 18px;
      border-radius: 999px;
      background: linear-gradient(135deg, #eff6ff, #dbeafe);
      color: #1d4ed8;
      font-weight: 700;
      box-shadow: inset 0 2px 6px rgba(255,255,255,0.9);
    }

    .table-container {
      width: 100%;
      overflow-x: auto;
      border-radius: 20px;
    }

    .table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      overflow: hidden;
      border-radius: 20px;
      background: rgba(255, 255, 255, 0.92);
      box-shadow: 0 14px 35px rgba(15, 23, 42, 0.08);
    }

    .table thead th,
    .table tr:first-child th {
      background: linear-gradient(135deg, #0a2558, #1d4ed8);
      color: #ffffff;
      font-size: 15px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.4px;
      padding: 16px 14px;
      border: none;
      position: sticky;
      top: 0;
      z-index: 1;
    }

    .table td {
      padding: 16px 14px;
      color: #1e293b;
      font-size: 14px;
      border-bottom: 1px solid #e5ecf6;
      vertical-align: top;
      transition: all 0.25s ease;
      line-height: 1.6;
    }

    .table tr:nth-child(even) td {
      background: #f8fbff;
    }

    .table tr:hover td {
      background: #eef5ff;
      transform: scale(1.003);
    }

    .name-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 8px 14px;
      border-radius: 999px;
      background: linear-gradient(135deg, #eff6ff, #dbeafe);
      color: #0a2558;
      font-weight: 700;
      white-space: nowrap;
    }

    .email-link {
      color: #2563eb;
      font-weight: 600;
      text-decoration: none;
    }

    .email-link:hover {
      text-decoration: underline;
    }

    .subject-badge {
      display: inline-block;
      padding: 8px 14px;
      border-radius: 999px;
      background: linear-gradient(135deg, #e0f2fe, #dbeafe);
      color: #0a2558;
      font-weight: 700;
      max-width: 240px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .message-box {
      max-width: 420px;
      min-width: 250px;
      background: linear-gradient(135deg, #ffffff, #f8fbff);
      border: 1px solid #e5edf8;
      border-radius: 16px;
      padding: 12px 14px;
      color: #334155;
      box-shadow: inset 0 1px 0 rgba(255,255,255,0.8);
      word-break: break-word;
    }

    .sidebar .nav-links li a:hover,
    .sidebar .nav-links li a.active {
      background: linear-gradient(135deg, rgba(255,255,255,0.16), rgba(255,255,255,0.08));
      border-radius: 14px;
      box-shadow: inset 0 1px 1px rgba(255,255,255,0.12);
    }

    @media (max-width: 991px) {
      .page-header {
        padding: 24px 20px;
      }

      .page-header h2 {
        font-size: 24px;
      }

      .table td,
      .table th {
        font-size: 13px;
      }

      .message-box {
        max-width: 300px;
        min-width: 180px;
      }
    }

    @media (max-width: 600px) {
      .table-card {
        padding: 14px;
        border-radius: 18px;
      }

      .page-header {
        border-radius: 20px;
      }

      .page-header h2 {
        font-size: 22px;
      }

      .message-count {
        width: 100%;
        text-align: center;
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

      <!-- <li>
        <a href="#">
          <i class='bx bx-pie-chart-alt-2'></i>
          <span class="links_name">Analytics</span>
        </a>
      </li> -->

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

    

      <div class="profile-details">
        <img src="" alt="">
        <span class="admin_name">${name}</span>
      </div>
    </nav>

    <div class="home-content">
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <div class="page-header">
        <h2>MESSAGES</h2>
        <p>Read customer queries, suggestions, and support messages in one premium dashboard.</p>
      </div>

      <div class="table-card">
        <div class="table-top">
          <h3>Inbox Overview</h3>
          <div class="message-count">Customer Messages</div>
        </div>

        <div class="table-container">
          <table class="table" width="100%">
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Subject</th>
              <th>Message</th>
            </tr>

            <c:forEach var="user" items="${messages}">
              <tr>
                <td>
                  <span class="name-pill">
                    <i class='bx bx-user-circle'></i>
                    ${user.name}
                  </span>
                </td>
                <td>
                  <a href="mailto:${user.email}" class="email-link">${user.email}</a>
                </td>
                <td>
                  <span class="subject-badge">${user.subject}</span>
                </td>
            <td>
  <div style="display:flex; justify-content:space-between; align-items:center; gap:10px;">
    
    <div class="message-box">${user.message}</div>

    <form action="deletemessage" method="post">
      <input type="hidden" name="id" value="${user.slno}">
      <input type="submit" value="Delete" class="delete-btn">
    </form>

  </div>
</td>
              </tr>
            </c:forEach>
          </table>
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