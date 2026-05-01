<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Transactions | Customer Dashboard</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #eef4ff 0%, #f7faff 45%, #e8f0ff 100%);
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

        .search-box {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 16px;
            padding: 0 12px;
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.08);
        }

        .search-box input {
            background: transparent;
            border: none;
            outline: none;
        }

        .profile-details {
            background: rgba(255, 255, 255, 0.82);
            border-radius: 18px;
            padding: 8px 14px;
            box-shadow: 0 8px 18px rgba(15, 23, 42, 0.08);
        }

        .profile-details img {
            border-radius: 50%;
            object-fit: cover;
        }

        .profile-details .admin_name {
            color: #0A2558;
            font-weight: 700;
        }

        .sidebar .nav-links li a:hover,
        .sidebar .nav-links li a.active {
            background: linear-gradient(135deg, rgba(255,255,255,0.16), rgba(255,255,255,0.08));
            border-radius: 14px;
            box-shadow: inset 0 1px 1px rgba(255,255,255,0.12);
        }

        .home-content {
            padding: 25px;
        }

        .transactions-hero {
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            border-radius: 30px;
            padding: 35px 30px;
            color: white;
            box-shadow: 0 20px 45px rgba(10, 37, 88, 0.22);
            position: relative;
            overflow: hidden;
            margin-bottom: 30px;
        }

        .transactions-hero::before {
            content: "";
            position: absolute;
            top: -60px;
            right: -30px;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .transactions-hero::after {
            content: "";
            position: absolute;
            bottom: -70px;
            left: 25%;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255,255,255,0.06);
        }

        .transactions-hero-content {
            position: relative;
            z-index: 2;
        }

        .transactions-hero h1 {
            font-size: 34px;
            font-weight: 800;
            margin-bottom: 10px;
            letter-spacing: 0.4px;
        }

        .transactions-hero p {
            font-size: 15px;
            color: rgba(255,255,255,0.86);
            max-width: 700px;
            line-height: 1.6;
        }

        .buttons_transactions {
            margin-top: 10px;
        }

        .overview-boxes {
            display: grid;
            grid-template-columns: repeat(3, minmax(240px, 1fr));
            gap: 22px;
        }

        .overview-boxes .box {
            border: none;
            outline: none;
            cursor: pointer;
            border-radius: 26px;
            background: rgba(255, 255, 255, 0.55);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 0;
            box-shadow: 0 18px 40px rgba(10, 37, 88, 0.10);
            border: 1px solid rgba(255,255,255,0.65);
            transition: all 0.3s ease;
            overflow: hidden;
            min-height: 200px;
        }

        .overview-boxes .box:hover {
            transform: translateY(-8px);
            box-shadow: 0 25px 45px rgba(10, 37, 88, 0.16);
        }

        .overview-boxes .box a {
            text-decoration: none;
            color: inherit;
            display: block;
            width: 100%;
            height: 100%;
        }

        .transaction-card {
            height: 100%;
            padding: 28px 24px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background: linear-gradient(145deg, rgba(255,255,255,0.95), rgba(240,246,255,0.86));
        }

        .transaction-icon {
            width: 70px;
            height: 70px;
            border-radius: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            color: white;
            margin-bottom: 18px;
            box-shadow: 0 12px 25px rgba(0,0,0,0.12);
        }

        .deposit-icon {
            background: linear-gradient(135deg, #00b894, #00d2a8);
        }

        .transfer-icon {
            background: linear-gradient(135deg, #1d4ed8, #3b82f6);
        }

        .statement-icon {
            background: linear-gradient(135deg, #7c3aed, #a855f7);
        }

        .box-topic {
            font-size: 24px;
            font-weight: 800;
            color: #0A2558;
            margin-bottom: 10px;
        }

        .transaction-text {
            color: #5b6474;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 22px;
        }

        .go-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, #0A2558, #1f56b3);
            color: white;
            padding: 12px 18px;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 700;
            width: fit-content;
            box-shadow: 0 10px 22px rgba(10, 37, 88, 0.18);
        }

        .quick-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(180px, 1fr));
            gap: 18px;
            margin-top: 28px;
        }

        .stat-card {
            background: rgba(255,255,255,0.72);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border-radius: 22px;
            padding: 22px;
            box-shadow: 0 14px 32px rgba(10, 37, 88, 0.08);
            border: 1px solid rgba(255,255,255,0.65);
        }

        .stat-card h3 {
            color: #0A2558;
            font-size: 15px;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .stat-card p {
            color: #667085;
            font-size: 13px;
            line-height: 1.6;
        }

        @media (max-width: 1100px) {
            .overview-boxes,
            .quick-stats {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .home-content {
                padding: 15px;
            }

            .transactions-hero {
                padding: 25px 20px;
                border-radius: 22px;
            }

            .transactions-hero h1 {
                font-size: 28px;
            }

            .box-topic {
                font-size: 22px;
            }

            .transaction-card {
                padding: 22px 18px;
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
                <a href="/customerdashboard" class="active">
                    <i class='bx bx-grid-alt'></i>
                    <span class="links_name">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="/profile">
                    <i class='bx bx-user'></i>
                    <span class="links_name">Profile</span>
                </a>
            </li>
            <li>
                <a href="/check_account">
                    <i class='bx bx-box'></i>
                    <span class="links_name">Check Account</span>
                </a>
            </li>
            <li>
                <a href="/transactions">
                    <i class='bx bx-list-ul'></i>
                    <span class="links_name">Transactions</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-pie-chart-alt-2'></i>
                    <span class="links_name">Analytics</span>
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
            <div class="search-box">
                <input type="text" placeholder="Search...">
                <i class='bx bx-search'></i>
            </div>
            <div class="profile-details">
                <img src="si.jpg" alt="" width="40" height="40">
                <span class="admin_name">${name}</span>
            </div>
        </nav>

        <div class="home-content">
            <div class="transactions-hero">
                <div class="transactions-hero-content">
                    <h1>Transactions</h1>
                    <p>
                        Manage your money smoothly with secure banking actions.
                        Deposit funds, transfer money instantly, and track your recent transaction history
                        from one elegant dashboard.
                    </p>
                </div>
            </div>

            <div class="buttons_transactions">
                <div class="overview-boxes">
                    <button class="box">
                        <a href="/deposit">
                            <div class="transaction-card">
                                <div>
                                    <div class="transaction-icon deposit-icon">
                                        <i class='bx bx-wallet'></i>
                                    </div>
                                    <div class="box-topic">Deposit Money</div>
                                    <div class="transaction-text">
                                        Add funds securely to your account and keep your balance growing with ease.
                                    </div>
                                </div>
                                <span class="go-btn">
                                    Open Now <i class='bx bx-right-arrow-alt'></i>
                                </span>
                            </div>
                        </a>
                    </button>

                    <button class="box">
                        <a href="/withdraw">
                            <div class="transaction-card">
                                <div>
                                    <div class="transaction-icon transfer-icon">
                                        <i class='bx bx-transfer-alt'></i>
                                    </div>
                                    <div class="box-topic">Fund Transfer</div>
                                    <div class="transaction-text">
                                        Send money quickly and safely to another account with a clean transfer process.
                                    </div>
                                </div>
                                <span class="go-btn">
                                    Transfer Now <i class='bx bx-right-arrow-alt'></i>
                                </span>
                            </div>
                        </a>
                    </button>

                    <button class="box">
                        <a href="/ministatement">
                            <div class="transaction-card">
                                <div>
                                    <div class="transaction-icon statement-icon">
                                        <i class='bx bx-receipt'></i>
                                    </div>
                                    <div class="box-topic">Mini Statement</div>
                                    <div class="transaction-text">
                                        View your latest transaction records and keep track of your banking activity.
                                    </div>
                                </div>
                                <span class="go-btn">
                                    View Statement <i class='bx bx-right-arrow-alt'></i>
                                </span>
                            </div>
                        </a>
                    </button>
                </div>
            </div>

            <div class="quick-stats">
                <div class="stat-card">
                    <h3>Fast Banking</h3>
                    <p>Perform daily banking actions in a few clicks with a cleaner premium interface.</p>
                </div>
                <div class="stat-card">
                    <h3>Secure Transfers</h3>
                    <p>Move your funds confidently with clear transaction flow and better navigation.</p>
                </div>
                <div class="stat-card">
                    <h3>Easy Tracking</h3>
                    <p>Check your statement anytime and stay updated with your recent account activity.</p>
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