<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Check Account Balance</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admindashboard.css">
    

    <style>
        .home-content {
            padding: 30px;
            background: linear-gradient(135deg, #eef4ff, #f8fbff);
            min-height: calc(100vh - 80px);
        }

        .balance-wrapper {
            max-width: 1100px;
            margin: 0 auto;
        }

        .balance-header {
            background: linear-gradient(135deg, #0A2558, #123b8f);
            color: #fff;
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 18px 40px rgba(10, 37, 88, 0.18);
            position: relative;
            overflow: hidden;
            margin-bottom: 30px;
        }

        .balance-header::before {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
            top: -60px;
            right: -60px;
        }

        .balance-header::after {
            content: "";
            position: absolute;
            width: 160px;
            height: 160px;
            border-radius: 50%;
            background: rgba(255,255,255,0.06);
            bottom: -50px;
            left: -40px;
        }

        .balance-header h2 {
            margin: 0;
            font-size: 30px;
            font-weight: 800;
            position: relative;
            z-index: 1;
        }

        .balance-header p {
            margin-top: 10px;
            font-size: 15px;
            color: rgba(255,255,255,0.88);
            position: relative;
            z-index: 1;
        }

        .balance-card {
            background: #ffffff;
            border-radius: 26px;
            box-shadow: 0 18px 45px rgba(15, 23, 42, 0.08);
            padding: 35px;
            border: 1px solid #e8eefb;
        }

        .balance-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            align-items: stretch;
        }

        .left-panel,
        .right-panel {
            background: #f9fbff;
            border-radius: 22px;
            padding: 28px;
            border: 1px solid #e2ebfb;
        }

        .section-title {
            font-size: 20px;
            font-weight: 800;
            color: #0A2558;
            margin-bottom: 10px;
        }

        .section-subtitle {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 22px;
            line-height: 1.6;
        }

        .input-group {
            margin-bottom: 18px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            font-weight: 700;
            color: #0A2558;
            margin-bottom: 8px;
        }

        .input-box {
            position: relative;
        }

        .input-box i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #0A2558;
            font-size: 18px;
        }

        .input-box input {
            width: 100%;
            height: 52px;
            border: 1px solid #cfdcf5;
            border-radius: 14px;
            padding: 0 16px 0 45px;
            font-size: 16px;
            background: #fff;
            outline: none;
            transition: 0.3s ease;
            box-sizing: border-box;
        }

        .input-box input:focus {
            border-color: #2d5fd3;
            box-shadow: 0 0 0 4px rgba(45, 95, 211, 0.12);
        }

        .check-btn {
            width: 100%;
            height: 54px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg, #0A2558, #2d5fd3);
            color: #fff;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 14px 28px rgba(10, 37, 88, 0.18);
        }

        .check-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 18px 34px rgba(10, 37, 88, 0.24);
        }

        .balance-display {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: linear-gradient(135deg, #0b1f4d, #123b8f, #2d5fd3);
            border-radius: 24px;
            padding: 30px;
            color: white;
            position: relative;
            overflow: hidden;
            min-height: 280px;
            box-shadow: 0 18px 35px rgba(10, 37, 88, 0.20);
        }

        .balance-display::before {
            content: "";
            position: absolute;
            top: -35px;
            right: -35px;
            width: 130px;
            height: 130px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .balance-display::after {
            content: "";
            position: absolute;
            bottom: -45px;
            left: -45px;
            width: 170px;
            height: 170px;
            border-radius: 50%;
            background: rgba(255,255,255,0.06);
        }

        .balance-display .mini-text {
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: rgba(255,255,255,0.78);
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
        }

        .balance-display .amount {
            font-size: 42px;
            font-weight: 800;
            margin: 8px 0 12px 0;
            position: relative;
            z-index: 1;
        }

        .balance-display .note {
            font-size: 14px;
            line-height: 1.7;
            color: rgba(255,255,255,0.88);
            position: relative;
            z-index: 1;
        }

        .balance-chip {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-top: 16px;
            padding: 10px 16px;
            border-radius: 999px;
            background: rgba(255,255,255,0.14);
            border: 1px solid rgba(255,255,255,0.16);
            font-size: 13px;
            font-weight: 700;
            width: fit-content;
            position: relative;
            z-index: 1;
        }

        .empty-balance {
            text-align: center;
            padding: 40px 20px;
            color: #667085;
        }

        .empty-balance i {
            font-size: 42px;
            color: #2d5fd3;
            margin-bottom: 14px;
        }

        @media (max-width: 900px) {
            .balance-form-grid {
                grid-template-columns: 1fr;
            }

            .balance-header h2 {
                font-size: 24px;
            }

            .balance-card {
                padding: 20px;
            }
        }

        .balance-hidden {
    filter: blur(6px);
    transition: all 0.4s ease;
}

.balance-visible {
    filter: blur(0);
    transform: translateY(-3px);
    transition: all 0.4s ease;
}

.balance-display .amount {
    letter-spacing: 2px;
}

#toggleEye {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    height: 42px;       /* match balance text */
    line-height: 1;
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
            <span class="dashboard">Dashboard</span>
        </div>
    </nav>

    <div class="home-content">
        <div class="balance-wrapper">
            <div class="balance-header">
                <h2>Check Your Account Balance</h2>
                <p>
                    View your available balance in a clean and secure banking dashboard.
                </p>
            </div>

            <div class="balance-card">

                <form action="/check_account" method="get">
                    <input type="hidden" name="action" value="check">

                    <div class="balance-form-grid">

                        <!-- LEFT PANEL -->
                        <div class="left-panel">
                            <div class="section-title">Account Information</div>

                            <div class="input-group">
                                <label>Account Number</label>
                                <div class="input-box">
                                    <i class='bx bx-credit-card'></i>
                                    <input type="text"
                                           name="accountno"
                                           value="${param.accountno != null ? param.accountno : sessionScope.accountno}"
                                           readonly required>
                                </div>
                            </div>

                            <button type="submit" class="check-btn">
                                Check Balance
                            </button>
                        </div>

                        <!-- RIGHT PANEL -->
                        <div class="right-panel" style="padding:0; background:none; border:none;">

                            <!-- ✅ SHOW BALANCE -->
                            <c:if test="${blnc != null and blnc.size() > 0}">

                                <c:forEach var="user" items="${blnc}">

                                    <div class="balance-display">

    <div class="mini-text">Available Balance</div>

  <div style="display:flex; align-items:center; gap:10px; line-height:1;">

        <div id="balanceText" class="amount balance-hidden"
             data-balance="${user.balance}">
            ****** 
        </div>

        <i class='bx bx-show' id="toggleEye"
           style="font-size:28px; cursor:pointer;"></i>
    </div>

    <!-- 🔥 STATUS TEXT -->
    <div id="balanceStatus" style="margin-top:10px; font-size:13px; opacity:0.8;">
        🔒 Balance Hidden
    </div>

</div>

                                </c:forEach>

                            </c:if>

                            <!-- ❌ NO DATA -->
                            <c:if test="${blnc == null or blnc.size() == 0}">
                                <div class="empty-balance">
                                    <i class='bx bx-wallet'></i>
                                    <h3>No balance information found</h3>
                                    <p>Please check your account details or contact support.</p>
                                </div>
                            </c:if>

                        </div>

                    </div>

                </form>

            </div>
        </div>
    </div>
</section>

 <script>

let visible = false;

document.addEventListener("DOMContentLoaded", function () {

    const balanceText = document.getElementById("balanceText");
    const eye = document.getElementById("toggleEye");
    const status = document.getElementById("balanceStatus");

    if (!balanceText || !eye) return;

    const balance = balanceText.getAttribute("data-balance");

    // detect button click
    const urlParams = new URLSearchParams(window.location.search);
    const action = urlParams.get("action");

    if (action === "check" && balance) {
        showBalance();
    } else {
        hideBalance();
    }

    function showBalance() {
        balanceText.innerText = "₹ " + balance;
        balanceText.classList.remove("balance-hidden");
        balanceText.classList.add("balance-visible");

        eye.classList.replace("bx-show", "bx-hide");

        status.innerText = "✅ Balance Visible";
        visible = true;

        // 🔥 AUTO HIDE AFTER 5 SECONDS
        setTimeout(() => {
            hideBalance();
        }, 5000);
    }

    function hideBalance() {
        balanceText.innerText = "******";
        balanceText.classList.remove("balance-visible");
        balanceText.classList.add("balance-hidden");

        eye.classList.replace("bx-hide", "bx-show");

        status.innerText = "🔒 Balance Hidden";
        visible = false;
    }

    eye.onclick = function () {
        if (visible) {
            hideBalance();
        } else {
            showBalance();
        }
    };

});

</script>
</body>
</html>