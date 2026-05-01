<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>Add Beneficiary</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admindashboard.css">
    

    <style>
        .home-content {
            padding: 24px;
            background: #f5f8fc;
            min-height: calc(100vh - 80px);
        }

        .top-banner {
            background: linear-gradient(135deg, #0A2558 0%, #163b88 55%, #2d5fd3 100%);
            color: #fff;
            border-radius: 28px;
            padding: 30px;
            box-shadow: 0 20px 45px rgba(10, 37, 88, 0.18);
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            position: relative;
            overflow: hidden;
            margin-bottom: 28px;
        }

        .top-banner::before {
            content: "";
            position: absolute;
            right: -35px;
            top: -35px;
            width: 170px;
            height: 170px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .top-banner::after {
            content: "";
            position: absolute;
            left: -55px;
            bottom: -55px;
            width: 210px;
            height: 210px;
            border-radius: 50%;
            background: rgba(255,255,255,0.05);
        }

        .banner-text {
            position: relative;
            z-index: 1;
        }

        .banner-text h2 {
            margin: 0;
            font-size: 30px;
            font-weight: 800;
            letter-spacing: 0.3px;
        }

        .banner-text p {
            margin: 10px 0 0 0;
            font-size: 15px;
            color: rgba(255,255,255,0.88);
            max-width: 650px;
            line-height: 1.6;
        }

        .banner-badge {
            position: relative;
            z-index: 1;
            padding: 14px 22px;
            border-radius: 999px;
            background: rgba(255,255,255,0.16);
            border: 1px solid rgba(255,255,255,0.24);
            font-weight: 700;
            backdrop-filter: blur(8px);
        }

        .beneficiary-wrapper {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin: 0 auto 28px auto;
        }

        .beneficiary-card {
            width: 100%;
            max-width: 800px;
            background: #ffffff;
            border-radius: 28px;
            padding: 34px;
            box-shadow: 0 18px 40px rgba(10, 37, 88, 0.10);
            border: 1px solid #eef2f7;
            position: relative;
            overflow: hidden;
        }

        .beneficiary-card::before {
            content: "";
            position: absolute;
            top: -60px;
            right: -60px;
            width: 180px;
            height: 180px;
            background: linear-gradient(135deg, rgba(45,95,211,0.10), rgba(10,37,88,0.04));
            border-radius: 50%;
        }

        .beneficiary-card::after {
            content: "";
            position: absolute;
            bottom: -70px;
            left: -40px;
            width: 210px;
            height: 210px;
            background: linear-gradient(135deg, rgba(45,95,211,0.08), rgba(10,37,88,0.03));
            border-radius: 50%;
        }

        .card-header {
            position: relative;
            z-index: 1;
            margin-bottom: 26px;
        }

        .card-subtitle {
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: #667085;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .card-heading {
            font-size: 30px;
            font-weight: 800;
            color: #0A2558;
            margin: 0;
        }

        .beneficiary-form {
            position: relative;
            z-index: 1;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 700;
            color: #344054;
        }

        .input-wrap {
            position: relative;
        }

        .input-wrap i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #667085;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px 14px 44px;
            border: 1px solid #d0d5dd;
            border-radius: 16px;
            font-size: 15px;
            color: #101828;
            background: #f8fafc;
            outline: none;
            transition: all 0.25s ease;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #2d5fd3;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(45, 95, 211, 0.10);
        }

        .form-group input[readonly] {
            background: #eef2f7;
            color: #475467;
            font-weight: 700;
        }

        .submit-btn {
            margin-top: 28px;
            width: 100%;
            border: none;
            border-radius: 18px;
            padding: 16px;
            font-size: 16px;
            font-weight: 800;
            color: #ffffff;
            background: linear-gradient(135deg, #0A2558 0%, #163b88 55%, #2d5fd3 100%);
            box-shadow: 0 10px 24px rgba(10, 37, 88, 0.22);
            cursor: pointer;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 14px 28px rgba(10, 37, 88, 0.28);
        }

        .message-box {
            margin-top: 18px;
            text-align: center;
            font-weight: 800;
            color: #16a34a;
            font-size: 15px;
        }

        .premium-note {
            margin-top: 22px;
            padding: 18px 20px;
            border-radius: 20px;
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            color: #fff;
            position: relative;
            overflow: hidden;
            box-shadow: 0 14px 30px rgba(10, 37, 88, 0.16);
        }

        .premium-note::before {
            content: "";
            position: absolute;
            top: -25px;
            right: -25px;
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
        }

        .premium-note-title {
            position: relative;
            z-index: 1;
            margin: 0;
            font-size: 13px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.80);
            font-weight: 700;
        }

        .premium-note-text {
            position: relative;
            z-index: 1;
            margin: 8px 0 0 0;
            font-size: 18px;
            font-weight: 700;
            line-height: 1.5;
        }

        .list-card {
            background: #ffffff;
            border-radius: 26px;
            box-shadow: 0 14px 35px rgba(10, 37, 88, 0.10);
            border: 1px solid #eef2f7;
            overflow: hidden;
        }

        .list-head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
            padding: 24px 26px 18px 26px;
            border-bottom: 1px solid #edf2f7;
            background: linear-gradient(180deg, #ffffff 0%, #f9fbff 100%);
        }

        .list-head h3 {
            margin: 0;
            color: #0A2558;
            font-size: 22px;
            font-weight: 800;
        }

        .list-head p {
            margin: 6px 0 0 0;
            color: #667085;
            font-size: 14px;
        }

        .safe-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #ecfdf3;
            color: #027a48;
            padding: 10px 16px;
            border-radius: 999px;
            font-size: 14px;
            font-weight: 700;
            border: 1px solid #d1fadf;
        }

        .safe-pill i {
            font-size: 18px;
        }

        .table-scroll {
            overflow-x: auto;
            padding: 22px;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 14px;
            min-width: 760px;
            background: transparent;
        }

        .table th {
            background: #eef4ff;
            color: #0A2558;
            padding: 16px;
            font-size: 14px;
            font-weight: 800;
            border: none;
            text-align: left;
        }

        .table th:first-child {
            border-top-left-radius: 14px;
            border-bottom-left-radius: 14px;
        }

        .table th:last-child {
            border-top-right-radius: 14px;
            border-bottom-right-radius: 14px;
        }

        .table td {
            padding: 16px;
            background: #ffffff;
            border-top: 1px solid #edf2f7;
            border-bottom: 1px solid #edf2f7;
            color: #344054;
            font-size: 15px;
        }

        .table td:first-child {
            border-left: 1px solid #edf2f7;
            border-top-left-radius: 14px;
            border-bottom-left-radius: 14px;
            font-weight: 800;
            color: #0A2558;
        }

        .table td:last-child {
            border-right: 1px solid #edf2f7;
            border-top-right-radius: 14px;
            border-bottom-right-radius: 14px;
        }

        .table tr:hover td {
            background: #f8fbff;
        }

        .account-pill {
            display: inline-block;
            background: #f2f4f7;
            color: #344054;
            padding: 8px 14px;
            border-radius: 999px;
            font-weight: 700;
            font-size: 13px;
        }

        .delete-btn {
            border: none;
            padding: 10px 18px;
            border-radius: 12px;
            background: linear-gradient(135deg, #dc2626, #ef4444);
            color: white;
            font-weight: 800;
            cursor: pointer;
            box-shadow: 0 8px 18px rgba(239, 68, 68, 0.18);
            transition: transform 0.25s ease;
        }

        .delete-btn:hover {
            transform: translateY(-2px);
        }

        .empty-box {
            text-align: center;
            padding: 42px 20px 48px;
            color: #667085;
        }

        .empty-box i {
            font-size: 52px;
            color: #98a2b3;
            display: block;
            margin-bottom: 12px;
        }

        .empty-box h4 {
            margin: 0 0 8px 0;
            font-size: 22px;
            color: #0A2558;
        }

        .empty-box p {
            margin: 0;
            font-size: 14px;
        }

        @media (max-width: 900px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .home-content {
                padding: 16px;
            }

            .top-banner,
            .beneficiary-card {
                padding: 22px;
                border-radius: 22px;
            }

            .card-heading,
            .banner-text h2 {
                font-size: 24px;
            }

            .table-scroll {
                padding: 14px;
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
                <span class="dashboard">Dashboard</span>
            </div>
            
            <div class="profile-details">
                <img src="si.jpg" alt="">
                <span class="admin_name">${name}</span>
            </div>
        </nav>

        <div class="home-content">
            <div class="top-banner">
                <div class="banner-text">
                    <h2>Add Beneficiary</h2>
                    <p>
                        Save trusted beneficiary accounts for faster, smoother and more secure fund transfers.
                    </p>
                </div>
                <div class="banner-badge">
                    Secure Transfer Setup
                </div>
            </div>

            <div class="beneficiary-wrapper">
                <div class="beneficiary-card">
                    <div class="card-header">
                        <div class="card-subtitle">Trusted Banking</div>
                        <h2 class="card-heading">Beneficiary Registration</h2>
                    </div>

                    <form name="Form" action="/addbeneficiary" method="post" onsubmit="return validateForm()" class="beneficiary-form">
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="baccount">Beneficiary Account Number</label>
                                <div class="input-wrap">
                                    <i class='bx bx-credit-card'></i>
                                    <input type="text" id="baccount" name="baccount" placeholder="Enter account number">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="ahname">Account Holder Name</label>
                                <div class="input-wrap">
                                    <i class='bx bx-user'></i>
                                    <input type="text" id="ahname" name="ahname" readonly placeholder="Auto fetched name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cnfacno">Confirm Account Number</label>
                                <div class="input-wrap">
                                    <i class='bx bx-check-shield'></i>
                                    <input type="text" id="cnfacno" name="cnfacno" placeholder="Re-enter account number">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="branch">Beneficiary Branch</label>
                                <div class="input-wrap">
                                    <i class='bx bx-buildings'></i>
                                    <input type="text" id="branch" name="branch" placeholder="Enter branch name">
                                </div>
                            </div>
                        </div>

                        <input type="submit" value="Add Beneficiary" class="submit-btn">

                        <div class="message-box">${sms}</div>

                        <div class="premium-note">
                            <p class="premium-note-title">Banking Tip</p>
                            <p class="premium-note-text">
                                Always verify the beneficiary account number carefully before saving.
                            </p>
                        </div>
                    </form>
                </div>
            </div>

            <div class="list-card">
                <div class="list-head">
                    <div>
                        <h3>Saved Beneficiaries</h3>
                        <p>Your added beneficiaries are listed below.</p>
                    </div>
                    <div class="safe-pill">
                        <i class='bx bx-shield-quarter'></i>
                        Verified List
                    </div>
                </div>

                <div class="table-scroll">
                    <c:choose>
                        <c:when test="${not empty usermaster}">
                            <table class="table">
                                <tr>
                                    <th>Beneficiary Account Number</th>
                                    <th>Account Holder Name</th>
                                    <th>Branch</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach var="user" items="${usermaster}">
                                    <tr>
                                        <td>
                                            <span class="account-pill">${user.baccount}</span>
                                        </td>
                                        <td>${user.ahname}</td>
                                        <td>${user.branch}</td>
                                        <td>
                                            <form action="/dltbeneficiary" method="post">
                                                <input type="hidden" name="baccount" value="${user.baccount}">
                                                <input type="submit" value="Delete" class="delete-btn" name="btn">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </c:when>

                        <c:otherwise>
                            <div class="empty-box">
                                <i class='bx bx-user-plus'></i>
                                <h4>No Beneficiaries Added Yet</h4>
                                <p>Add a beneficiary above to make future fund transfers faster.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>

    <script>
        $(document).ready(function () {
            $('#baccount').blur(function () {
                $.ajax({
                    url: "/getAccountHolderName",
                    method: "GET",
                    dataType: "JSON",
                    data: { baccount: $(this).val() },
                    success: function (res) {
                        if (res.length > 0) {
                            $("#ahname").val(res[0].name);
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
            let baccount = document.forms["Form"]["baccount"].value;
            let cnfacno = document.forms["Form"]["cnfacno"].value;
            let branch = document.forms["Form"]["branch"].value;

            if (baccount == "") {
                alert("Account No. must be filled out");
                return false;
            }
            if (cnfacno == "") {
                alert("Confirm Account No. must be filled out");
                return false;
            }
            if (branch == "") {
                alert("Branch must be filled out");
                return false;
            }
            if (baccount !== cnfacno) {
                alert("Account Number and Confirm Account Number Does Not Match");
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