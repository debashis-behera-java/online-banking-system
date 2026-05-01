<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>FAQ Admin Panel</title>
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

        .faq-hero {
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

        .faq-hero::before {
            content: "";
            position: absolute;
            right: -50px;
            top: -45px;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.08);
        }

        .faq-hero::after {
            content: "";
            position: absolute;
            left: -60px;
            bottom: -60px;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
        }

        .faq-hero-text,
        .faq-hero-badge {
            position: relative;
            z-index: 1;
        }

        .faq-hero-text h1 {
            margin: 0;
            font-size: 34px;
            font-weight: 800;
            line-height: 1.2;
        }

        .faq-hero-text p {
            margin: 12px 0 0 0;
            max-width: 650px;
            font-size: 15px;
            line-height: 1.7;
            color: rgba(255, 255, 255, 0.90);
        }

        .faq-hero-badge {
            background: rgba(255, 255, 255, 0.14);
            border: 1px solid rgba(255, 255, 255, 0.22);
            border-radius: 999px;
            padding: 14px 24px;
            font-weight: 800;
            font-size: 14px;
            backdrop-filter: blur(10px);
        }

        .faq-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 28px;
        }

        .faq-card,
        .table-card {
            background: rgba(255, 255, 255, 0.82);
            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);
            border-radius: 30px;
            padding: 32px;
            box-shadow: 0 18px 45px rgba(10, 37, 88, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.88);
            position: relative;
            overflow: hidden;
        }

        .faq-card::before,
        .table-card::before {
            content: "";
            position: absolute;
            top: -50px;
            right: -50px;
            width: 170px;
            height: 170px;
            background: linear-gradient(135deg, rgba(45,95,211,0.12), rgba(10,37,88,0.04));
            border-radius: 50%;
        }

        .card-top {
            position: relative;
            z-index: 1;
            margin-bottom: 24px;
        }

        .card-subtitle {
            font-size: 13px;
            color: #667085;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 8px;
        }

        .card-title {
            font-size: 30px;
            font-weight: 800;
            color: #0A2558;
            margin: 0 0 10px;
        }

        .card-desc {
            font-size: 14px;
            color: #667085;
            line-height: 1.7;
            margin: 0;
        }

        .faq-form {
            position: relative;
            z-index: 1;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group.full {
            grid-column: 1 / -1;
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
            top: 17px;
            font-size: 20px;
            color: #2d5fd3;
        }

        .form-input,
        .form-textarea {
            width: 100%;
            border: 1px solid #d0d5dd;
            border-radius: 18px;
            font-size: 16px;
            color: #101828;
            background: #f8fafc;
            outline: none;
            transition: all 0.25s ease;
            font-family: Arial, sans-serif;
        }

        .form-input {
            padding: 15px 16px 15px 48px;
        }

        .form-textarea {
            min-height: 140px;
            resize: vertical;
            padding: 16px 18px 16px 48px;
            line-height: 1.7;
        }

        .form-input:focus,
        .form-textarea:focus {
            border-color: #2d5fd3;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(45, 95, 211, 0.10);
        }

        .faq-btn {
            border: none;
            border-radius: 18px;
            padding: 15px 26px;
            font-size: 16px;
            font-weight: 800;
            color: #ffffff;
            background: linear-gradient(135deg, #0A2558 0%, #163b88 55%, #2d5fd3 100%);
            box-shadow: 0 12px 28px rgba(10, 37, 88, 0.24);
            cursor: pointer;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            letter-spacing: 0.4px;
        }

        .faq-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 32px rgba(10, 37, 88, 0.30);
        }

        .table-wrap {
            overflow-x: auto;
            position: relative;
            z-index: 1;
        }

        .faq-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            min-width: 850px;
        }

        .faq-table thead th {
            background: linear-gradient(135deg, #0A2558, #163b88);
            color: #fff;
            padding: 16px 14px;
            font-size: 14px;
            font-weight: 700;
            text-align: left;
            border: none;
        }

        .faq-table thead th:first-child {
            border-top-left-radius: 16px;
        }

        .faq-table thead th:last-child {
            border-top-right-radius: 16px;
        }

        .faq-table tbody tr {
            background: rgba(255, 255, 255, 0.85);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .faq-table tbody tr:hover {
            transform: scale(1.003);
            box-shadow: 0 8px 20px rgba(10, 37, 88, 0.06);
        }

        .faq-table tbody td {
            padding: 16px 14px;
            font-size: 14px;
            color: #344054;
            border-bottom: 1px solid #e9eef7;
            vertical-align: top;
        }

        .faq-table tbody tr:last-child td:first-child {
            border-bottom-left-radius: 16px;
        }

        .faq-table tbody tr:last-child td:last-child {
            border-bottom-right-radius: 16px;
        }

        .sl-badge {
            display: inline-flex;
            min-width: 38px;
            height: 38px;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            font-weight: 800;
            color: #0A2558;
            background: linear-gradient(135deg, #eef4ff, #dfeaff);
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.7);
        }

        .question-box {
            font-weight: 700;
            color: #0f172a;
            line-height: 1.6;
        }

        .answer-box {
            color: #667085;
            line-height: 1.7;
        }

        .action-form {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .btn-delete,
        .btn-update {
            border: none;
            border-radius: 12px;
            padding: 10px 16px;
            color: white;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .btn-update {
            background: linear-gradient(135deg, #0A2558, #2d5fd3);
            box-shadow: 0 8px 20px rgba(45, 95, 211, 0.20);
        }

        .btn-delete {
            background: linear-gradient(135deg, #d92d20, #ff5c5c);
            box-shadow: 0 8px 20px rgba(217, 45, 32, 0.18);
        }

        .btn-update:hover,
        .btn-delete:hover {
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .home-content {
                padding: 16px;
            }

            .faq-hero,
            .faq-card,
            .table-card {
                border-radius: 24px;
                padding: 24px 20px;
            }

            .faq-hero-text h1,
            .card-title {
                font-size: 26px;
            }

            .form-row {
                grid-template-columns: 1fr;
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
                <span class="dashboard">FAQ Management</span>
            </div>
        </nav>

        <div class="home-content">
            <div class="faq-hero">
                <div class="faq-hero-text">
                    <h1>Manage Bank FAQs</h1>
                    <p>
                        Add, review, update, and organize frequently asked questions from one premium glossy admin panel.
                    </p>
                </div>
                <div class="faq-hero-badge">
                    FAQ Admin Center
                </div>
            </div>

            <div class="faq-grid">
                <div class="faq-card">
                    <div class="card-top">
                        <div class="card-subtitle">Knowledge Base</div>
                        <h2 class="card-title">Add New FAQ</h2>
                        <p class="card-desc">
                            Create clear and helpful answers for customers with a clean and modern interface.
                        </p>
                    </div>

                    <form action="addfaq" method="post" class="faq-form">
                        <div class="form-row">
                            <div class="form-group full">
                                <label class="form-label">Question</label>
                                <div class="input-wrap">
                                    <i class='bx bx-help-circle'></i>
                                    <input type="text" name="question" class="form-input" placeholder="Enter FAQ question" required>
                                </div>
                            </div>

                            <div class="form-group full">
                                <label class="form-label">Answer</label>
                                <div class="input-wrap">
                                    <i class='bx bx-message-square-detail'></i>
                                    <textarea name="answer" class="form-textarea" placeholder="Enter FAQ answer" required></textarea>
                                </div>
                            </div>
                        </div>

                        <input type="submit" name="btn" value="Add FAQ" class="faq-btn">
                    </form>
                </div>

                <div class="table-card">
                    <div class="card-top">
                        <div class="card-subtitle">FAQ Records</div>
                        <h2 class="card-title">All FAQs</h2>
                        <p class="card-desc">
                            Manage all existing questions and answers with quick update and delete actions.
                        </p>
                    </div>

                    <div class="table-wrap">
                        <table class="faq-table">
                            <thead>
                                <tr>
                                    <th>Serial No.</th>
                                    <th>Question</th>
                                    <th>Answer</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${usermaster}">
                                    <tr>
                                        <td><span class="sl-badge">${user.slno}</span></td>
                                        <td><div class="question-box">${user.question}</div></td>
                                        <td><div class="answer-box">${user.answer}</div></td>
                                        <td>
                                            <form class="action-form" action="managefaq" method="post">
                                                <input type="hidden" name="slno" value="${user.slno}">
                                                <input type="submit" value="Delete" name="btn" class="btn-delete">
                                                <input type="submit" value="Update" name="btn" class="btn-update">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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