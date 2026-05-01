<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" href="css/dash.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admindashboard.css">
    

    <style>
        body {
            background: linear-gradient(135deg, #eef4ff 0%, #f7faff 45%, #e8f0ff 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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

        .profile-details {
            background: rgba(255, 255, 255, 0.82);
            border-radius: 18px;
            padding: 8px 14px;
            box-shadow: 0 8px 18px rgba(15, 23, 42, 0.08);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .profile-details .admin_name {
            color: #0A2558;
            font-weight: 700;
        }

        .profile-page {
            padding: 25px;
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 25px;
            padding: 30px;
            border-radius: 28px;
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            color: #fff;
            box-shadow: 0 20px 45px rgba(10, 37, 88, 0.22);
            position: relative;
            overflow: hidden;
        }

        .profile-header::before {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            top: -80px;
            right: -40px;
            background: rgba(255,255,255,0.10);
        }

        .profile-header::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            bottom: -70px;
            left: 30%;
            background: rgba(255,255,255,0.08);
        }

        .profile-title,
        .profile-badge {
            position: relative;
            z-index: 2;
        }

        .profile-title h2 {
            margin: 0;
            font-size: 34px;
            font-weight: 800;
            letter-spacing: 0.5px;
        }

        .profile-title p {
            margin-top: 10px;
            color: rgba(255,255,255,0.88);
            font-size: 15px;
            font-weight: 500;
        }

        .profile-badge {
            background: rgba(255,255,255,0.16);
            color: #ffffff;
            padding: 12px 22px;
            border-radius: 999px;
            font-weight: 700;
            border: 1px solid rgba(255,255,255,0.22);
            box-shadow: inset 0 1px 0 rgba(255,255,255,0.18);
        }

        .profile-card {
            background: rgba(255, 255, 255, 0.56);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-radius: 28px;
            box-shadow: 0 20px 45px rgba(10, 37, 88, 0.12);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.65);
        }

        .profile-top {
            background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
            padding: 38px 30px;
            color: #ffffff;
            position: relative;
            overflow: hidden;
        }

        .profile-top::before {
            content: "";
            position: absolute;
            top: -45px;
            right: -25px;
            width: 160px;
            height: 160px;
            background: rgba(255,255,255,0.08);
            border-radius: 50%;
        }

        .profile-top::after {
            content: "";
            position: absolute;
            bottom: -60px;
            left: 18%;
            width: 140px;
            height: 140px;
            background: rgba(255,255,255,0.06);
            border-radius: 50%;
        }

        .profile-top-content {
            position: relative;
            z-index: 1;
            display: flex;
            align-items: center;
            gap: 24px;
            flex-wrap: wrap;
        }

        .profile-image-box {
            width: 135px;
            height: 135px;
            border-radius: 50%;
            overflow: hidden;
            border: 4px solid rgba(255,255,255,0.88);
            box-shadow: 0 14px 28px rgba(0,0,0,0.20);
            background: #fff;
            flex-shrink: 0;
        }

        .profile-image-box img,
        .nav-profile-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .nav-profile-img {
            width: 42px;
            height: 42px;
            border-radius: 50%;
        }

        .profile-main-info h3 {
            margin: 0;
            font-size: 30px;
            font-weight: 800;
        }

        .profile-main-info p {
            margin: 8px 0 0 0;
            font-size: 15px;
            color: rgba(255,255,255,0.88);
            font-weight: 500;
        }

        .profile-body {
            padding: 28px;
            background: transparent;
        }

        .section-title {
            font-size: 22px;
            font-weight: 800;
            color: #0A2558;
            margin-bottom: 20px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(260px, 1fr));
            gap: 18px;
        }

        .info-card {
            background: rgba(255,255,255,0.88);
            border-radius: 20px;
            padding: 18px 20px;
            box-shadow: 0 10px 24px rgba(10, 37, 88, 0.08);
            border: 1px solid #edf2f7;
            transition: all 0.25s ease;
        }

        .info-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 16px 30px rgba(10, 37, 88, 0.12);
        }

        .info-label {
            font-size: 12px;
            font-weight: 800;
            color: #667085;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .info-value {
            font-size: 17px;
            font-weight: 700;
            color: #101828;
            word-break: break-word;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .sidebar .nav-links li a:hover,
        .sidebar .nav-links li a.active {
            background: linear-gradient(135deg, rgba(255,255,255,0.16), rgba(255,255,255,0.08));
            border-radius: 14px;
            box-shadow: inset 0 1px 1px rgba(255,255,255,0.12);
        }

        @media (max-width: 768px) {
            .profile-page {
                padding: 15px;
            }

            .profile-header {
                padding: 22px 20px;
                border-radius: 22px;
            }

            .profile-grid {
                grid-template-columns: 1fr;
            }

            .profile-top {
                padding: 26px 20px;
            }

            .profile-main-info h3 {
                font-size: 24px;
            }

            .profile-title h2 {
                font-size: 26px;
            }

            .profile-image-box {
                width: 110px;
                height: 110px;
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

            <c:forEach var="user" items="${usermaster}">
                <div class="profile-details">
                    <img src="data:image/jpeg;base64,${user.photoBase64}" alt="User Photo" class="nav-profile-img">
                    <span class="admin_name">${name}</span>
                </div>
            </c:forEach>
        </nav>

        <div class="home-content profile-page">
            <div class="profile-header">
                <div class="profile-title">
                    <h2>My Profile</h2>
                    <p>Your banking profile, personal details and identity information in one premium view.</p>
                </div>
                <div class="profile-badge">
                    <i class='bx bx-badge-check'></i> Verified Customer
                </div>
            </div>

            <c:forEach var="user" items="${usermaster}">
                <div class="profile-card">
                    <div class="profile-top">
                        <div class="profile-top-content">
                            <div class="profile-image-box">
                                <img src="data:image/jpeg;base64,${user.photoBase64}" alt="User Photo">
                            </div>
                            <div class="profile-main-info">
                                <h3>${user.name}</h3>
                                <p><i class='bx bx-envelope'></i> ${user.email}</p>
                                <p><i class='bx bx-credit-card'></i> Account No: ${user.accountno}</p>
                            </div>
                        </div>
                    </div>

                    <div class="profile-body">
                        <div class="section-title">Personal Details</div>

                        <div class="profile-grid">
                            <div class="info-card">
                                <div class="info-label">Account Type</div>
                                <div class="info-value">${user.account_type}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Date of Birth</div>
                                <div class="info-value">${user.dob}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Gender</div>
                                <div class="info-value">${user.gender}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Occupation</div>
                                <div class="info-value">${user.occupation}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Father's Name</div>
                                <div class="info-value">${user.fathers_name}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Mother's Name</div>
                                <div class="info-value">${user.mothers_name}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Aadhaar No</div>
                                <div class="info-value">${user.aadhar_no}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Mobile No</div>
                                <div class="info-value">${user.mobile_no}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Marital Status</div>
                                <div class="info-value">${user.marital_status}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">PAN No</div>
                                <div class="info-value">${user.pan_no}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Nationality</div>
                                <div class="info-value">${user.nationality}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Religion</div>
                                <div class="info-value">${user.religion}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Qualification</div>
                                <div class="info-value">${user.qualification}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">Category</div>
                                <div class="info-value">${user.category}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">City</div>
                                <div class="info-value">${user.city}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">State</div>
                                <div class="info-value">${user.state}</div>
                            </div>

                            <div class="info-card">
                                <div class="info-label">PIN</div>
                                <div class="info-value">${user.pin}</div>
                            </div>

                            <div class="info-card full-width">
                                <div class="info-label">Address</div>
                                <div class="info-value">${user.address}</div>
                            </div>
                        </div>


                        <div style="margin-top:25px; text-align:center;">
    <a href="/updateprofile">
        <button style="
            background: linear-gradient(135deg, #0A2558, #2d5fd3);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 8px 20px rgba(10, 37, 88, 0.2);
            transition: all 0.3s ease;
        "
        onmouseover="this.style.transform='scale(1.05)'"
        onmouseout="this.style.transform='scale(1)'">
            &#9999; Update Profile
        </button>
    </a>
</div>
                    </div>
                </div>
            </c:forEach>
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