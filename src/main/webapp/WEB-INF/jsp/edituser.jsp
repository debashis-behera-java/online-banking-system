<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admindashboard.css">
    

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #eef4ff 0%, #f8fbff 45%, #edf3ff 100%);
        }

        .home-section {
            background: transparent;
        }

        nav {
            background: rgba(255, 255, 255, 0.78);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
            border-bottom: 1px solid rgba(255, 255, 255, 0.55);
        }

        .home-content {
            padding: 28px;
        }

        .user-hero {
            background: linear-gradient(135deg, #081f4d 0%, #11367d 55%, #2f67e0 100%);
            border-radius: 30px;
            padding: 34px 32px;
            color: #ffffff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            position: relative;
            overflow: hidden;
            box-shadow: 0 24px 55px rgba(10, 37, 88, 0.22);
            margin-bottom: 28px;
        }

        .user-hero::before {
            content: "";
            position: absolute;
            right: -50px;
            top: -45px;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.08);
        }

        .user-hero::after {
            content: "";
            position: absolute;
            left: -60px;
            bottom: -60px;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
        }

        .user-hero-text,
        .user-hero-badge {
            position: relative;
            z-index: 1;
        }

        .user-hero-text h1 {
            margin: 0;
            font-size: 34px;
            font-weight: 800;
            line-height: 1.2;
        }

        .user-hero-text p {
            margin: 12px 0 0 0;
            max-width: 650px;
            font-size: 15px;
            line-height: 1.7;
            color: rgba(255, 255, 255, 0.90);
        }

        .user-hero-badge {
            background: rgba(255, 255, 255, 0.14);
            border: 1px solid rgba(255, 255, 255, 0.22);
            border-radius: 999px;
            padding: 14px 24px;
            font-weight: 800;
            font-size: 14px;
            backdrop-filter: blur(10px);
        }

        .user-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 6px 0 20px;
        }

        .user-card {
            width: 100%;
            max-width: 700px;
            background: rgba(255, 255, 255, 0.82);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 30px;
            padding: 36px 34px;
            box-shadow: 0 18px 45px rgba(10, 37, 88, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.88);
            position: relative;
            overflow: hidden;
        }

        .user-card::before {
            content: "";
            position: absolute;
            top: -50px;
            right: -50px;
            width: 170px;
            height: 170px;
            background: linear-gradient(135deg, rgba(45,95,211,0.12), rgba(10,37,88,0.04));
            border-radius: 50%;
        }

        .user-card::after {
            content: "";
            position: absolute;
            bottom: -60px;
            left: -35px;
            width: 190px;
            height: 190px;
            background: linear-gradient(135deg, rgba(45,95,211,0.08), rgba(10,37,88,0.03));
            border-radius: 50%;
        }

        .user-top {
            position: relative;
            z-index: 1;
            text-align: center;
            margin-bottom: 28px;
        }

        .user-icon {
            width: 74px;
            height: 74px;
            margin: 0 auto 16px;
            border-radius: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 34px;
            color: #2d5fd3;
            background: linear-gradient(135deg, #eef4ff, #ffffff);
            box-shadow: 0 10px 25px rgba(45, 95, 211, 0.14);
        }

        .user-subtitle {
            font-size: 13px;
            color: #667085;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 8px;
        }

        .user-title {
            font-size: 32px;
            font-weight: 800;
            color: #0A2558;
            margin: 0;
        }

        .user-desc {
            margin: 10px auto 0;
            max-width: 520px;
            font-size: 14px;
            color: #667085;
            line-height: 1.7;
        }

        .user-form {
            position: relative;
            z-index: 1;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 9px;
            font-size: 14px;
            font-weight: 700;
            color: #344054;
        }

        .input-wrap {
            position: relative;
        }

        .input-wrap i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            color: #2d5fd3;
        }

        .form-input,
        .form-select {
            width: 100%;
            padding: 15px 16px 15px 48px;
            border: 1px solid #d0d5dd;
            border-radius: 18px;
            font-size: 16px;
            color: #101828;
            background: #f8fafc;
            outline: none;
            transition: all 0.25s ease;
        }

        .form-input:focus,
        .form-select:focus {
            border-color: #2d5fd3;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(45, 95, 211, 0.10);
        }

        .readonly-box {
            width: 100%;
            padding: 15px 18px;
            border-radius: 18px;
            background: linear-gradient(135deg, #f8fbff, #eef4ff);
            border: 1px solid #d8e3ff;
            color: #0A2558;
            font-size: 15px;
            font-weight: 700;
        }

        .user-btn {
            width: 100%;
            border: none;
            border-radius: 18px;
            padding: 16px;
            font-size: 16px;
            font-weight: 800;
            color: #ffffff;
            background: linear-gradient(135deg, #0A2558 0%, #163b88 55%, #2d5fd3 100%);
            box-shadow: 0 12px 28px rgba(10, 37, 88, 0.24);
            cursor: pointer;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            letter-spacing: 0.4px;
        }

        .user-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 32px rgba(10, 37, 88, 0.30);
        }

        .user-note {
            margin-top: 24px;
            padding: 22px;
            border-radius: 22px;
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            color: #fff;
            position: relative;
            overflow: hidden;
            box-shadow: 0 14px 32px rgba(10, 37, 88, 0.18);
        }

        .user-note::before {
            content: "";
            position: absolute;
            top: -20px;
            right: -20px;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .user-note-title {
            position: relative;
            z-index: 1;
            margin: 0;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.80);
        }

        .user-note-text {
            position: relative;
            z-index: 1;
            margin: 8px 0 0 0;
            font-size: 18px;
            font-weight: 700;
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .home-content {
                padding: 16px;
            }

            .user-card {
                padding: 24px 20px;
                border-radius: 24px;
            }

            .user-title {
                font-size: 26px;
            }

            .user-hero-text h1 {
                font-size: 28px;
            }

            .user-hero {
                padding: 26px 20px;
                border-radius: 24px;
            }
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
                <span class="dashboard">Edit User</span>
            </div>
        </nav>

        <div class="home-content">
            <div class="user-hero">
                <div class="user-hero-text">
                    <h1>Update User Details</h1>
                    <p>
                        Manage customer profile access, role, and account status from this premium admin control panel.
                    </p>
                </div>
                <div class="user-hero-badge">
                    Admin Control
                </div>
            </div>

            <div class="user-wrapper">
                <div class="user-card">
                    <div class="user-top">
                        <div class="user-icon">
                            <i class='bx bx-user-pin'></i>
                        </div>
                        <div class="user-subtitle">Customer Management</div>
                        <h2 class="user-title">Edit User</h2>
                        <p class="user-desc">
                            Update customer information cleanly and securely with a glossy modern admin interface.
                        </p>
                    </div>

                    <form action="/updateuser" method="post" class="user-form">
                        <div class="form-group">
                            <label class="form-label">Customer Name</label>
                            <div class="input-wrap">
                                <i class='bx bx-user'></i>
                                <input type="text" name="name" value="${usermaster[0].name}" class="form-input" placeholder="Enter customer name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Role</label>
                            <div class="input-wrap">
                                <i class='bx bx-shield-quarter'></i>
                                <select name="role" class="form-select" required>
                                    <option value="customer" ${usermaster[0].role=='customer' ? 'selected' : ''}>Customer</option>
                                    <option value="admin" ${usermaster[0].role=='admin' ? 'selected' : ''}>Admin</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Status</label>
                            <div class="input-wrap">
                                <i class='bx bx-check-shield'></i>
                                <select name="status" class="form-select" required>
                                    <option value="1" ${usermaster[0].status==1 ? 'selected' : ''}>Active</option>
                                    <option value="0" ${usermaster[0].status==0 ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Email ID</label>
                            <div class="readonly-box">
                                ${usermaster[0].email}
                            </div>
                        </div>

                        <input type="hidden" name="email" value="${usermaster[0].email}">
                        <input type="submit" name="btn" value="Update User" class="user-btn">

                        <div class="user-note">
                            <p class="user-note-title">Admin Note</p>
                            <p class="user-note-text">Always review user role and status carefully before saving changes.</p>
                        </div>
                    </form>
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