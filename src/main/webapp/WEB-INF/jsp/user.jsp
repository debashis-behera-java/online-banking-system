<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Users | Admin Dashboard</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admindashboard.css">
   

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #eef4ff 0%, #f7fbff 40%, #e8f0ff 100%);
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        .home-section {
            background: transparent;
            min-height: 100vh;
        }

        nav {
            background: rgba(255, 255, 255, 0.72);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.45);
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
        }

        .dashboard {
            font-weight: 800;
            color: #0A2558;
            letter-spacing: 0.4px;
        }

        .sidebar .nav-links li a:hover,
        .sidebar .nav-links li a.active {
            background: linear-gradient(135deg, rgba(255,255,255,0.16), rgba(255,255,255,0.08));
            border-radius: 14px;
            box-shadow: inset 0 1px 1px rgba(255,255,255,0.12);
        }

        .home-content {
            padding: 24px;
        }

        .page-header {
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            border-radius: 28px;
            padding: 30px 28px;
            color: white;
            box-shadow: 0 20px 45px rgba(10, 37, 88, 0.20);
            position: relative;
            overflow: hidden;
            margin-bottom: 24px;
        }

        .page-header::before {
            content: "";
            position: absolute;
            top: -60px;
            right: -30px;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .page-header::after {
            content: "";
            position: absolute;
            bottom: -70px;
            left: 20%;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255,255,255,0.06);
        }

        .page-header-content {
            position: relative;
            z-index: 2;
        }

        .page-header h1 {
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 8px;
            letter-spacing: 0.4px;
        }

        .page-header p {
            color: rgba(255,255,255,0.85);
            font-size: 14px;
            line-height: 1.6;
            max-width: 700px;
        }

        .welcome-chip {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-top: 14px;
            background: rgba(255,255,255,0.14);
            border: 1px solid rgba(255,255,255,0.16);
            padding: 10px 16px;
            border-radius: 999px;
            font-size: 14px;
            font-weight: 600;
            color: #fff;
        }

        .table-wrap {
            background: rgba(255, 255, 255, 0.62);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255,255,255,0.65);
            border-radius: 26px;
            padding: 20px;
            box-shadow: 0 16px 40px rgba(10, 37, 88, 0.10);
            overflow-x: auto;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 24px;
            font-weight: 800;
            color: #0A2558;
            margin-bottom: 18px;
        }

        .section-title i {
            font-size: 28px;
            color: #1f56b3;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 18px;
            min-width: 800px;
        }

        .table thead th,
        .table tr:first-child th {
            background: linear-gradient(135deg, #0A2558, #1f56b3);
            color: #fff;
            padding: 16px 14px;
            text-align: left;
            font-size: 14px;
            font-weight: 700;
            border: none;
        }

        .table td {
            padding: 16px 14px;
            font-size: 14px;
            color: #334155;
            background: rgba(255,255,255,0.70);
            border-bottom: 1px solid rgba(203, 213, 225, 0.55);
        }

        .table tr:nth-child(even) td {
            background: rgba(241, 247, 255, 0.90);
        }

        .table tr:hover td {
            background: rgba(219, 234, 254, 0.75);
            transition: 0.3s ease;
        }

        .role-badge {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            background: rgba(37, 99, 235, 0.12);
            color: #1d4ed8;
        }

        .status-active {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            background: rgba(16, 185, 129, 0.14);
            color: #059669;
        }

        .status-inactive {
            display: inline-block;
            padding: 7px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            background: rgba(239, 68, 68, 0.14);
            color: #dc2626;
        }

        .action-form {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn-action {
            border: none;
            outline: none;
            cursor: pointer;
            padding: 10px 16px;
            border-radius: 12px;
            color: white;
            font-size: 13px;
            font-weight: 700;
            transition: all 0.3s ease;
            box-shadow: 0 8px 18px rgba(0,0,0,0.08);
        }

        .btn-delete {
            background: linear-gradient(135deg, #ef4444, #dc2626);
        }

        .btn-update {
            background: linear-gradient(135deg, #0A2558, #2563eb);
        }

        .btn-action:hover {
            transform: translateY(-2px);
            opacity: 0.95;
        }

        @media (max-width: 900px) {
            .home-content {
                padding: 15px;
            }

            .page-header {
                padding: 24px 18px;
                border-radius: 22px;
            }

            .page-header h1 {
                font-size: 26px;
            }

            .table-wrap {
                padding: 14px;
                border-radius: 20px;
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

        <div class="home-content">
            <div class="page-header">
                <div class="page-header-content">
                    <h1>Users Management</h1>
                    <p>
                        View all registered users, monitor their roles and account status,
                        and manage them with a cleaner premium admin experience.
                    </p>
                    <div class="welcome-chip">
                        <i class='bx bxs-user-circle'></i>
                        Welcome <%= session.getAttribute("name") %>
                    </div>
                </div>
            </div>

            <div class="table-wrap">
                <div class="section-title">
                    <i class='bx bx-group'></i>
                    <span>Registered Users</span>
                </div>

                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>

                    <c:forEach var="user" items="${usermaster}">
                        <tr>
                            <td>${user.name}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${not empty user.email}">
                                        ${user.email}
                                    </c:when>
                                    <c:otherwise>
                                        ${user.user_id}
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <span class="role-badge">${user.role}</span>
                            </td>

                            <td>
                                <c:choose>
                                    <c:when test="${user.status == 1 || user.status == '1' || user.status == 'active' || user.status == 'Active'}">
                                        <span class="status-active">Active</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-inactive">Inactive</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <form action="manageuser" method="post" class="action-form">
                                    <c:choose>
                                        <c:when test="${not empty user.email}">
                                            <input type="hidden" name="email" value="${user.email}">
                                        </c:when>
                                        <c:otherwise>
                                            <input type="hidden" name="user_id" value="${user.user_id}">
                                        </c:otherwise>
                                    </c:choose>

                                    <input type="submit" value="Delete" name="btn" class="btn-action btn-delete">
                                    <input type="submit" value="Update" name="btn" class="btn-action btn-update">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
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