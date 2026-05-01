<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Edit FAQ</title>
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

        .faq-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 6px 0 20px;
        }

        .faq-card {
            width: 100%;
            max-width: 760px;
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

        .faq-card::before {
            content: "";
            position: absolute;
            top: -50px;
            right: -50px;
            width: 170px;
            height: 170px;
            background: linear-gradient(135deg, rgba(45,95,211,0.12), rgba(10,37,88,0.04));
            border-radius: 50%;
        }

        .faq-card::after {
            content: "";
            position: absolute;
            bottom: -60px;
            left: -35px;
            width: 190px;
            height: 190px;
            background: linear-gradient(135deg, rgba(45,95,211,0.08), rgba(10,37,88,0.03));
            border-radius: 50%;
        }

        .faq-top {
            position: relative;
            z-index: 1;
            text-align: center;
            margin-bottom: 28px;
        }

        .faq-icon {
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

        .faq-subtitle {
            font-size: 13px;
            color: #667085;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 8px;
        }

        .faq-title {
            font-size: 32px;
            font-weight: 800;
            color: #0A2558;
            margin: 0;
        }

        .faq-desc {
            margin: 10px auto 0;
            max-width: 520px;
            font-size: 14px;
            color: #667085;
            line-height: 1.7;
        }

        .faq-form {
            position: relative;
            z-index: 1;
        }

        .form-group {
            margin-bottom: 22px;
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
            top: 18px;
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
            min-height: 160px;
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

        .faq-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 32px rgba(10, 37, 88, 0.30);
        }

        .faq-note {
            margin-top: 24px;
            padding: 22px;
            border-radius: 22px;
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            color: #fff;
            position: relative;
            overflow: hidden;
            box-shadow: 0 14px 32px rgba(10, 37, 88, 0.18);
        }

        .faq-note::before {
            content: "";
            position: absolute;
            top: -20px;
            right: -20px;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .faq-note-title {
            position: relative;
            z-index: 1;
            margin: 0;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.80);
        }

        .faq-note-text {
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

            .faq-card {
                padding: 24px 20px;
                border-radius: 24px;
            }

            .faq-title {
                font-size: 26px;
            }

            .faq-hero-text h1 {
                font-size: 28px;
            }

            .faq-hero {
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
                <span class="dashboard">Edit FAQ</span>
            </div>
        </nav>

        <div class="home-content">
            <div class="faq-hero">
                <div class="faq-hero-text">
                    <h1>Update FAQ Details</h1>
                    <p>
                        Edit the question and answer below to keep your bank help section clear,
                        polished, and useful for customers.
                    </p>
                </div>
                <div class="faq-hero-badge">
                    Admin FAQ Panel
                </div>
            </div>

            <div class="faq-wrapper">
                <div class="faq-card">
                    <div class="faq-top">
                        <div class="faq-icon">
                            <i class='bx bx-edit-alt'></i>
                        </div>
                        <div class="faq-subtitle">Knowledge Center</div>
                        <h2 class="faq-title">Edit FAQ</h2>
                        <p class="faq-desc">
                            Refine your FAQ content with a clean glossy editor and keep answers professional and easy to understand.
                        </p>
                    </div>

                    <form action="updatefaq" method="post" class="faq-form">
                        <div class="form-group">
                            <label class="form-label">Question</label>
                            <div class="input-wrap">
                                <i class='bx bx-help-circle'></i>
                                <input type="text" name="question" value="${usermaster[0].question}" class="form-input" placeholder="Enter FAQ question" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Answer</label>
                            <div class="input-wrap">
                                <i class='bx bx-message-square-detail'></i>
                                <textarea name="answer" class="form-textarea" placeholder="Enter FAQ answer" required>${usermaster[0].answer}</textarea>
                            </div>
                        </div>

                        <input type="hidden" name="slno" value="${usermaster[0].slno}">
                        <input type="submit" name="btn" value="Update FAQ" class="faq-btn">

                        <div class="faq-note">
                            <p class="faq-note-title">Admin Note</p>
                            <p class="faq-note-text">Keep answers simple, accurate, and customer-friendly for the best experience.</p>
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