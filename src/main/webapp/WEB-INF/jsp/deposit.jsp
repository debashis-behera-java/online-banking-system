<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Deposit Money</title>
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

        .deposit-hero {
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

        .deposit-hero::before {
            content: "";
            position: absolute;
            right: -50px;
            top: -45px;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.08);
        }

        .deposit-hero::after {
            content: "";
            position: absolute;
            left: -60px;
            bottom: -60px;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
        }

        .deposit-hero-text,
        .deposit-hero-badge {
            position: relative;
            z-index: 1;
        }

        .deposit-hero-text h1 {
            margin: 0;
            font-size: 34px;
            font-weight: 800;
            line-height: 1.2;
        }

        .deposit-hero-text p {
            margin: 12px 0 0 0;
            max-width: 650px;
            font-size: 15px;
            line-height: 1.7;
            color: rgba(255, 255, 255, 0.90);
        }

        .deposit-hero-badge {
            background: rgba(255, 255, 255, 0.14);
            border: 1px solid rgba(255, 255, 255, 0.22);
            border-radius: 999px;
            padding: 14px 24px;
            font-weight: 800;
            font-size: 14px;
            backdrop-filter: blur(10px);
        }

        .deposit-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 6px 0 20px;
        }

        .deposit-card {
            width: 100%;
            max-width: 620px;
            background: rgba(255, 255, 255, 0.80);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-radius: 30px;
            padding: 36px 34px;
            box-shadow: 0 18px 45px rgba(10, 37, 88, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.85);
            position: relative;
            overflow: hidden;
        }

        .deposit-card::before {
            content: "";
            position: absolute;
            top: -50px;
            right: -50px;
            width: 170px;
            height: 170px;
            background: linear-gradient(135deg, rgba(45,95,211,0.12), rgba(10,37,88,0.04));
            border-radius: 50%;
        }

        .deposit-card::after {
            content: "";
            position: absolute;
            bottom: -60px;
            left: -35px;
            width: 190px;
            height: 190px;
            background: linear-gradient(135deg, rgba(45,95,211,0.08), rgba(10,37,88,0.03));
            border-radius: 50%;
        }

        .deposit-top {
            position: relative;
            z-index: 1;
            text-align: center;
            margin-bottom: 28px;
        }

        .deposit-icon {
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

        .deposit-subtitle {
            font-size: 13px;
            color: #667085;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 8px;
        }

        .deposit-title {
            font-size: 32px;
            font-weight: 800;
            color: #0A2558;
            margin: 0;
        }

        .deposit-desc {
            margin: 10px auto 0;
            max-width: 460px;
            font-size: 14px;
            color: #667085;
            line-height: 1.7;
        }

        .deposit-form {
            position: relative;
            z-index: 1;
        }

        .form-group {
            margin-bottom: 18px;
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

        .form-input {
            width: 100%;
            padding: 15px 16px 15px 48px;
            border: 1px solid #d0d5dd;
            border-radius: 16px;
            font-size: 16px;
            color: #101828;
            background: #f8fafc;
            outline: none;
            transition: all 0.25s ease;
        }

        .form-input:focus {
            border-color: #2d5fd3;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(45, 95, 211, 0.10);
        }

        .readonly-input {
            background: #eef2f7;
            color: #475467;
            font-weight: 700;
        }

        .deposit-btn {
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

        .deposit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 16px 32px rgba(10, 37, 88, 0.30);
        }

        .sms-box {
            margin-top: 18px;
            text-align: center;
            font-size: 15px;
            font-weight: 700;
            color: #16a34a;
            min-height: 22px;
        }

        .deposit-note {
            margin-top: 24px;
            padding: 22px;
            border-radius: 22px;
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            color: #fff;
            position: relative;
            overflow: hidden;
            box-shadow: 0 14px 32px rgba(10, 37, 88, 0.18);
        }

        .deposit-note::before {
            content: "";
            position: absolute;
            top: -20px;
            right: -20px;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .deposit-note-title {
            position: relative;
            z-index: 1;
            margin: 0;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.80);
        }

        .deposit-note-text {
            position: relative;
            z-index: 1;
            margin: 8px 0 0 0;
            font-size: 18px;
            font-weight: 700;
            line-height: 1.6;
        }

        .payment-options {
    display: flex;
    gap: 15px;
    margin-bottom: 15px;
}

.payment-card {
    flex: 1;
    padding: 15px;
    border: 2px solid #ddd;
    border-radius: 15px;
    text-align: center;
    cursor: pointer;
    transition: 0.3s;
    font-weight: 600;
    background: #f8fafc;
}

.payment-card:hover {
    border-color: #2d5fd3;
    background: #eef4ff;
    transform: translateY(-3px);
}

.payment-card.active {
    border-color: #2d5fd3;
    background: #dbe7ff;
    box-shadow: 0 5px 15px rgba(45,95,211,0.2);
}

        @media (max-width: 768px) {
    .home-content {
        padding: 16px;
    }

    .deposit-card {
        padding: 24px 20px;
        border-radius: 24px;
    }

    .deposit-title {
        font-size: 26px;
    }

    .deposit-hero-text h1 {
        font-size: 28px;
    }

    .deposit-hero {
        padding: 26px 20px;
        border-radius: 24px;
    }

    /* ✅ FIXED PAYMENT UI */
    .payment-options {
        display: flex;
        gap: 10px;
        margin-bottom: 15px;
    }

    .payment-card {
        flex: 1;
        padding: 12px;
        border: 2px solid #ddd;
        border-radius: 12px;
        text-align: center;
        cursor: pointer;
        transition: 0.3s;
        font-weight: 600;
        background: #f8fafc;
    }

    .payment-card:hover {
        border-color: #2d5fd3;
        background: #eef4ff;
    }

    .payment-card.active {
        border-color: #2d5fd3;
        background: #dbe7ff;
        box-shadow: 0 5px 12px rgba(45,95,211,0.2);
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
            <li class="dropdown">
                <a class="dropbtn">
                    <i class='bx bx-list-ul'></i>
                    <span class="links_name">Transations</span>
                    <i class='bx bxs-chevron-down'></i>
                </a>
                <div class="dropdown-content">
                    <a href="/deposit">Deposite Money</a>
                    <a href="/withdraw">Fund Transfer</a>
                    <a href="/addbeneficiary">Add Beneficiary</a>
                    <a href="/ministatement">Mini Statement</a>
                </div>
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
                <span class="dashboard">Deposit Money</span>
            </div>
        </nav>

        <div class="home-content">
            <div class="deposit-hero">
                <div class="deposit-hero-text">
                    <h1>Secure Deposit Portal</h1>
                    <p>
                        Add funds to your account quickly and safely with a premium banking experience.
                        Your money is processed securely and reflected in your account balance.
                    </p>
                </div>
                <div class="deposit-hero-badge">
                    Instant Deposit Access
                </div>
            </div>

            <div class="deposit-wrapper">
                <div class="deposit-card">
                    <div class="deposit-top">
                        <div class="deposit-icon">
                            <i class='bx bx-wallet'></i>
                        </div>
                        <div class="deposit-subtitle">Digital Banking</div>
                        <h2 class="deposit-title">Deposit Money</h2>
                        <p class="deposit-desc">
                            Enter your deposit details below and credit your account with a smooth and secure transaction.
                        </p>
                    </div>

                    <form action="/deposit_money" method="post" class="deposit-form">
                        <div class="form-group">
                            <label class="form-label">Account Number</label>
                            <div class="input-wrap">
                                <i class='bx bx-credit-card'></i>
                                <input type="text" name="accountno" value="${accountno}" class="form-input readonly-input" readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Deposit Amount</label>
                            <div class="input-wrap">
                                <i class='bx bx-rupee'></i>
                                <input type="number" name="dep_money" placeholder="Enter Deposit Amount" class="form-input" required>
                            </div>
                        </div>

                      <div class="payment-options">

    <div class="payment-card" onclick="selectMethod('UPI', this)">
        &#128241; UPI
    </div>

    <div class="payment-card" onclick="selectMethod('CARD', this)">
        &#128179; Card
    </div>

    <div class="payment-card" onclick="selectMethod('NETBANKING', this)">
        &#127974; Net Banking
    </div>

</div>

<input type="hidden" name="payment_method" id="paymentMethod">

                        <input type="submit" value="Deposit Now" class="deposit-btn">

                        <div class="sms-box">${sms}</div>

                        <div class="deposit-note">
                            <p class="deposit-note-title">Secure Credit</p>
                            <p class="deposit-note-text">Your deposit will be processed safely and added to your account balance.</p>
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



        function selectMethod(method, el) {
    document.getElementById("paymentMethod").value = method;

    document.querySelectorAll(".payment-card").forEach(card => {
        card.classList.remove("active");
    });

    el.classList.add("active");
}
    </script>

</body>
</html>