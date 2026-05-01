<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="dash.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  

  <style>
    * {
      box-sizing: border-box;
    }

    body {
      background: linear-gradient(135deg, #eef4ff, #f8fbff, #edf3ff);
    }

    .home-section {
      background: transparent;
    }

    nav {
      background: rgba(255, 255, 255, 0.78);
      backdrop-filter: blur(14px);
      -webkit-backdrop-filter: blur(14px);
      box-shadow: 0 10px 30px rgba(15, 23, 42, 0.07);
      border-bottom: 1px solid rgba(255, 255, 255, 0.55);
    }

    .search-box {
      background: rgba(245, 248, 255, 0.95);
      border-radius: 14px;
      padding: 0 10px;
      box-shadow: inset 0 1px 3px rgba(15, 23, 42, 0.05);
    }

    .search-box input {
      background: transparent;
      border: none;
      outline: none;
    }

    .profile-details {
      background: rgba(255, 255, 255, 0.82);
      border: 1px solid #e8eef8;
      border-radius: 16px;
      padding: 8px 14px;
      box-shadow: 0 8px 18px rgba(15, 23, 42, 0.05);
    }

    .profile-details img {
      width: 42px;
      height: 42px;
      object-fit: cover;
      border-radius: 50%;
      border: 2px solid #dbe7ff;
    }

    .home-content {
      padding: 26px;
      min-height: calc(100vh - 80px);
    }

    .hero-banner {
      background: linear-gradient(135deg, #081f4d 0%, #11367d 55%, #2f67e0 100%);
      color: #fff;
      border-radius: 30px;
      padding: 34px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 20px;
      flex-wrap: wrap;
      position: relative;
      overflow: hidden;
      box-shadow: 0 24px 55px rgba(10, 37, 88, 0.20);
    }

    .hero-banner::before {
      content: "";
      position: absolute;
      right: -40px;
      top: -40px;
      width: 190px;
      height: 190px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.08);
    }

    .hero-banner::after {
      content: "";
      position: absolute;
      left: -55px;
      bottom: -55px;
      width: 220px;
      height: 220px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.05);
    }

    .hero-text,
    .hero-badge {
      position: relative;
      z-index: 1;
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
      color: rgba(255, 255, 255, 0.90);
      line-height: 1.7;
      font-size: 15px;
    }

    .hero-badge {
      background: rgba(255, 255, 255, 0.15);
      border: 1px solid rgba(255, 255, 255, 0.22);
      padding: 14px 24px;
      border-radius: 999px;
      font-weight: 800;
      backdrop-filter: blur(10px);
    }

    .overview-boxes {
      display: grid;
      grid-template-columns: repeat(4, minmax(180px, 1fr));
      gap: 20px;
      margin-top: 28px;
    }

    .overview-boxes .box {
      background: rgba(255, 255, 255, 0.84);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 24px;
      padding: 24px 20px;
      box-shadow: 0 12px 30px rgba(16, 24, 40, 0.08);
      border: 1px solid rgba(255, 255, 255, 0.85);
      transition: all 0.25s ease;
      position: relative;
      overflow: hidden;
    }

    .overview-boxes .box:hover {
      transform: translateY(-5px);
      box-shadow: 0 18px 36px rgba(16, 24, 40, 0.12);
    }

    .overview-boxes .box::before {
      content: "";
      position: absolute;
      top: -20px;
      right: -20px;
      width: 90px;
      height: 90px;
      border-radius: 50%;
      background: rgba(47, 103, 224, 0.06);
    }

    .box .right-side {
      position: relative;
      z-index: 1;
    }

    .box-topic {
      font-size: 14px;
      color: #667085;
      font-weight: 700;
      margin-bottom: 8px;
    }

    .number {
      font-size: 30px;
      font-weight: 800;
      color: #101828;
      margin-bottom: 10px;
    }

    .indicator {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 13px;
      color: #475467;
      font-weight: 600;
    }

    .indicator i {
      font-size: 18px;
      color: #16a34a;
      background: #ecfdf3;
      padding: 4px;
      border-radius: 50%;
    }

    .indicator i.down {
      color: #dc2626;
      background: #fef2f2;
    }

    .dashboard-panels {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 22px;
      margin-top: 30px;
    }

    .panel,
    .quick-panel {
      background: rgba(255, 255, 255, 0.84);
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      border-radius: 26px;
      padding: 24px;
      box-shadow: 0 12px 30px rgba(16, 24, 40, 0.08);
      border: 1px solid rgba(255, 255, 255, 0.85);
    }

    .panel-title {
      font-size: 22px;
      font-weight: 800;
      color: #0A2558;
      margin-bottom: 20px;
    }

    .activity-table {
      width: 100%;
      border-collapse: collapse;
      overflow: hidden;
      border-radius: 18px;
    }

    .activity-table thead th {
      background: linear-gradient(135deg, #0A2558, #163b88);
      color: #fff;
      padding: 14px 12px;
      text-align: left;
      font-size: 14px;
      font-weight: 700;
    }

    .activity-table tbody tr {
      background: #fff;
      transition: 0.25s ease;
    }

    .activity-table tbody tr:nth-child(even) {
      background: #f8fbff;
    }

    .activity-table tbody tr:hover {
      background: #eef4ff;
    }

    .activity-table td {
      padding: 14px 12px;
      color: #344054;
      font-size: 14px;
      border-bottom: 1px solid #edf2f7;
    }

    .status {
      display: inline-block;
      padding: 6px 12px;
      border-radius: 999px;
      font-size: 12px;
      font-weight: 700;
    }

    .status.success {
      background: #ecfdf3;
      color: #15803d;
    }

    .status.pending {
      background: #fff7ed;
      color: #c2410c;
    }

    .status.review {
      background: #eff6ff;
      color: #1d4ed8;
    }

    .quick-links {
      display: grid;
      gap: 14px;
    }

    .quick-link {
      display: flex;
      align-items: center;
      gap: 14px;
      text-decoration: none;
      padding: 16px 18px;
      border-radius: 18px;
      background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
      border: 1px solid #e8eef6;
      color: #101828;
      transition: all 0.25s ease;
      box-shadow: 0 8px 18px rgba(15, 23, 42, 0.04);
    }

    .quick-link:hover {
      transform: translateY(-4px);
      box-shadow: 0 14px 28px rgba(10, 37, 88, 0.10);
      border-color: #d6e3ff;
    }

    .quick-link i {
      width: 46px;
      height: 46px;
      border-radius: 14px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 22px;
      color: #2d5fd3;
      background: linear-gradient(135deg, #e8f0ff, #f8fbff);
    }

    .quick-link .text h4 {
      margin: 0 0 4px 0;
      font-size: 16px;
      font-weight: 800;
      color: #101828;
    }

    .quick-link .text p {
      margin: 0;
      font-size: 13px;
      color: #667085;
      line-height: 1.5;
    }

    .security-card {
      margin-top: 18px;
      background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
      border-radius: 22px;
      padding: 22px;
      color: #fff;
      position: relative;
      overflow: hidden;
      box-shadow: 0 16px 34px rgba(10, 37, 88, 0.18);
    }

    .security-card::before {
      content: "";
      position: absolute;
      top: -25px;
      right: -25px;
      width: 120px;
      height: 120px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.08);
    }

    .security-card * {
      position: relative;
      z-index: 1;
    }

    .security-card h3 {
      margin: 0 0 8px 0;
      font-size: 22px;
      font-weight: 800;
    }

    .security-card p {
      margin: 0;
      color: rgba(255, 255, 255, 0.88);
      font-size: 14px;
      line-height: 1.7;
    }

    @media (max-width: 1200px) {
      .overview-boxes {
        grid-template-columns: repeat(2, minmax(180px, 1fr));
      }

      .dashboard-panels {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 768px) {
      .overview-boxes {
        grid-template-columns: 1fr;
      }

      .home-content {
        padding: 16px;
      }

      .hero-text h1 {
        font-size: 27px;
      }

      .search-box,
      .profile-details {
        display: none;
      }

      .activity-table {
        display: block;
        overflow-x: auto;
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
        <a href="#" class="active">
          <i class='bx bx-grid-alt'></i>
          <span class="links_name">Dashboard</span>
        </a>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-box'></i>
          <span class="links_name">Accounts</span>
        </a>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-list-ul'></i>
          <span class="links_name">Active Users</span>
        </a>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-pie-chart-alt-2'></i>
          <span class="links_name">Analytics</span>
        </a>
      </li>
      <li>
        <a href="/user">
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
        <a href="#">
          <i class='bx bx-cog'></i>
          <span class="links_name">Setting</span>
        </a>
      </li>
      <li class="log_out">
        <a href="index.jsp">
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
      <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search'></i>
      </div>
      <div class="profile-details">
        <img src="si.jpg" alt="">
        <span class="admin_name">${name}</span>
        <i class='bx bx-chevron-down'></i>
      </div>
    </nav>

    <div class="home-content">
      <div class="hero-banner">
        <div class="hero-text">
          <h1>Welcome back, ${name}</h1>
          <p>
            Monitor customers, review activity, manage accounts, and keep your digital banking
            platform running smoothly from one premium admin panel.
          </p>
        </div>
        <div class="hero-badge">
          Admin Control Center
        </div>
      </div>

      <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Customer</div>
            <div class="number">40</div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from yesterday</span>
            </div>
          </div>
        </div>

        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Transaction</div>
            <div class="number">38,876</div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from yesterday</span>
            </div>
          </div>
        </div>

        <div class="box">
          <div class="right-side">
            <div class="box-topic">Active Customer</div>
            <div class="number">23</div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from yesterday</span>
            </div>
          </div>
        </div>

        <div class="box">
          <div class="right-side">
            <div class="box-topic">Inactive Customer</div>
            <div class="number">11</div>
            <div class="indicator">
              <i class='bx bx-down-arrow-alt down'></i>
              <span class="text">Down from today</span>
            </div>
          </div>
        </div>
      </div>

      <div class="dashboard-panels">
        <div class="panel">
          <div class="panel-title">Recent Banking Activity</div>

          <table class="activity-table">
            <thead>
              <tr>
                <th>Date</th>
                <th>Customer</th>
                <th>Activity</th>
                <th>Status</th>
                <th>Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>23 Mar 2026</td>
                <td>Debashis Behera</td>
                <td>Account Approval</td>
                <td><span class="status success">Completed</span></td>
                <td>₹0</td>
              </tr>
              <tr>
                <td>23 Mar 2026</td>
                <td>Rohan Kumar</td>
                <td>Fund Transfer</td>
                <td><span class="status pending">Pending</span></td>
                <td>₹5,000</td>
              </tr>
              <tr>
                <td>22 Mar 2026</td>
                <td>Ananya Das</td>
                <td>Deposit Request</td>
                <td><span class="status success">Completed</span></td>
                <td>₹12,000</td>
              </tr>
              <tr>
                <td>22 Mar 2026</td>
                <td>Rahul Sahu</td>
                <td>KYC Review</td>
                <td><span class="status review">In Review</span></td>
                <td>₹0</td>
              </tr>
              <tr>
                <td>21 Mar 2026</td>
                <td>Priya Sharma</td>
                <td>Beneficiary Added</td>
                <td><span class="status success">Completed</span></td>
                <td>₹0</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="quick-panel">
          <div class="panel-title">Quick Access</div>

          <div class="quick-links">
            <a href="/user" class="quick-link">
              <i class='bx bx-user'></i>
              <div class="text">
                <h4>Customers</h4>
                <p>Manage registered customers and account details.</p>
              </div>
            </a>

            <a href="/message" class="quick-link">
              <i class='bx bx-message-rounded-detail'></i>
              <div class="text">
                <h4>Messages</h4>
                <p>View contact requests and customer messages.</p>
              </div>
            </a>

            <a href="#" class="quick-link">
              <i class='bx bx-list-check'></i>
              <div class="text">
                <h4>Active Users</h4>
                <p>Track customers currently approved and active.</p>
              </div>
            </a>

            <a href="#" class="quick-link">
              <i class='bx bx-line-chart'></i>
              <div class="text">
                <h4>Analytics</h4>
                <p>Review growth, transactions, and platform performance.</p>
              </div>
            </a>
          </div>

          <div class="security-card">
            <h3>System Status: Secure</h3>
            <p>
              Admin monitoring is active. Keep reviewing approvals, transactions,
              and support messages regularly for smooth banking operations.
            </p>
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
      } else {
        sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      }
    }
  </script>

</body>

</html>