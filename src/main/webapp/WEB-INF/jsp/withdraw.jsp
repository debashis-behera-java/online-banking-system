<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admindashboard.css">
    
    <style>
        .transfer-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
        }

        .transfer-card {
            width: 520px;
            background: #ffffff;
            padding: 32px;
            border-radius: 24px;
            box-shadow: 0 14px 35px rgba(0, 0, 0, 0.10);
            border: 1px solid #eef2f7;
        }

        .transfer-title {
            text-align: center;
            margin-bottom: 24px;
            color: #0A2558;
            font-size: 28px;
            font-weight: 700;
        }

        .input-label {
            display: block;
            margin: 14px 0 8px 0;
            font-size: 14px;
            color: #667085;
            font-weight: 600;
        }

        .transfer-input {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #d0d5dd;
            border-radius: 14px;
            font-size: 16px;
            background: #f8fafc;
            color: #344054;
            outline: none;
            box-sizing: border-box;
            transition: 0.3s ease;
        }

        .transfer-input:focus {
            border-color: #163b88;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(22, 59, 136, 0.08);
        }

        .readonly-input {
            background: #eef2f7;
        }

        .transfer-btn {
            width: 100%;
            margin-top: 22px;
            padding: 14px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg, #0A2558, #163b88);
            color: #fff;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 8px 18px rgba(10, 37, 88, 0.18);
            transition: 0.3s ease;
        }

        .transfer-btn:hover {
            transform: translateY(-2px);
        }

        .premium-info-box {
            margin-top: 24px;
            padding: 24px;
            border-radius: 20px;
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            box-shadow: 0 18px 40px rgba(10, 37, 88, 0.22);
            position: relative;
            overflow: hidden;
            color: white;
        }

        .premium-info-box::before {
            content: "";
            position: absolute;
            top: -30px;
            right: -30px;
            width: 120px;
            height: 120px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
        }

        .premium-info-box::after {
            content: "";
            position: absolute;
            bottom: -40px;
            left: -20px;
            width: 140px;
            height: 140px;
            background: rgba(255, 255, 255, 0.06);
            border-radius: 50%;
        }

        .premium-info-title,
        .premium-info-text {
            position: relative;
            z-index: 1;
        }

        .premium-info-title {
            margin: 0 0 10px 0;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: rgba(255, 255, 255, 0.75);
        }

        .premium-info-text {
            font-size: 18px;
            font-weight: 700;
            margin: 0;
        }

        .message-text {
            text-align: center;
            margin-top: 16px;
            font-weight: 600;
            color: green;
        }

        .error-text {
            text-align: center;
            margin-top: 16px;
            font-weight: 600;
            color: red;
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
            <div class="transfer-wrapper">
                <form action="/transferMoney" method="post" name="Form" onsubmit="return validateForm()" class="transfer-card">

                    <div class="transfer-title">TRANSFER MONEY</div>

                    <label for="fromAccount" class="input-label">From Account Number</label>
                    <input type="number" name="fromAccount" id="fromAccount" value="${accountno}" readonly class="transfer-input readonly-input">

                    <label for="toAccount" class="input-label">To Account Number</label>
                    <input type="number" id="toAccount" name="toAccount" placeholder="Enter Account Number" class="transfer-input">

                    <label for="ahname" class="input-label">Account Holder Name</label>
                    <input type="text" id="ahname" name="ahname" readonly placeholder="Account holder name will appear here" class="transfer-input readonly-input">

                    <label for="ctoAccount" class="input-label">Confirm Account Number</label>
                    <input type="number" id="ctoAccount" name="ctoAccount" placeholder="Confirm Account Number" class="transfer-input">

                    <label for="amount" class="input-label">Amount</label>
                    <input type="number" id="amount" name="amount" step="0.01" placeholder="0.00" class="transfer-input">

                    <input type="submit" value="Transfer Money" class="transfer-btn">
                    <c:if test="${waitApproval}">
  <div style="margin-top:20px; padding:15px; background:#fff3cd; border-radius:12px; text-align:center;">

    ⏳ Waiting for admin approval...

    <div id="timer" style="font-size:18px; margin-top:10px;">
      Checking approval...
    </div>

  </div>

  <script>
    let seconds = 0;

    let interval = setInterval(function() {

      seconds++;
      document.getElementById("timer").innerText = 
        "Waiting " + seconds + "s... Checking approval...";

      fetch("/checkApproval?from=${fromAccount}&to=${toAccount}&amount=${amount}")
        .then(res => res.text())
        .then(data => {

          if (data === "APPROVED") {
            clearInterval(interval);

            document.getElementById("timer").innerText = "✅ Approved! Redirecting...";

            setTimeout(() => {
              window.location.href =
                "/autoTransfer?from=${fromAccount}&to=${toAccount}&amount=${amount}";
            }, 1500);
          }

        });

    }, 3000);
  </script>
</c:if>

  

                    <c:if test="${not empty sms}">
                        <div class="message-text">${sms}</div>
                    </c:if>

                    <c:if test="${not empty error}">
                        <div class="error-text">${error}</div>
                    </c:if>

                    <div class="premium-info-box">
                        <p class="premium-info-title">Secure Transfer</p>
                        <p class="premium-info-text">Fast, secure and verified bank transfer</p>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $('#toAccount').blur(function () {
                $.ajax({
                    url: "/getaccountholdername",
                    method: "GET",
                    dataType: "JSON",
                    data: { baccount: $(this).val() },
                    success: function (res) {
                        console.log(res);
                        if (res.length > 0) {
                            $("#ahname").val(res[0].ahname);
                        } else {
                            $("#ahname").val("");
                        }
                    },
                    error: function () {
                        $("#ahname").val("");
                    }
                });
            });
        });

        function validateForm() {
            let toAccount = document.forms["Form"]["toAccount"].value;
            let ctoAccount = document.forms["Form"]["ctoAccount"].value;
            let amount = document.forms["Form"]["amount"].value;

            if (toAccount == "") {
                alert("Account No. must be filled out");
                return false;
            }
            if (ctoAccount == "") {
                alert("Confirm Account No. must be filled out");
                return false;
            }
            if (amount == "") {
                alert("Enter minimum Rs: 1.00");
                return false;
            }
            if (toAccount !== ctoAccount) {
                alert("Account Number and Confirm Account Number do not match");
                return false;
            }
            return true;
        }

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