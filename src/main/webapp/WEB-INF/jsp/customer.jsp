<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
	<title>Registered Customers</title>
	<link rel="stylesheet" href="css/dash.css">
	<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/admindashboard.css">
	

	<style>
		* {
			box-sizing: border-box;
		}

		body {
			background: linear-gradient(135deg, #eef4ff, #f6faff, #edf3ff);
		}

		.home-section {
			background: transparent;
		}

		nav {
			background: rgba(255, 255, 255, 0.75);
			backdrop-filter: blur(12px);
			-webkit-backdrop-filter: blur(12px);
			box-shadow: 0 8px 24px rgba(15, 23, 42, 0.06);
			border-bottom: 1px solid rgba(255, 255, 255, 0.55);
		}

		.home-content {
			padding: 30px;
		}

		.page-header {
			background: linear-gradient(135deg, #0A2558, #123b8f, #2d5fd3);
			border-radius: 28px;
			padding: 30px;
			color: #fff;
			box-shadow: 0 18px 40px rgba(10, 37, 88, 0.18);
			margin-bottom: 28px;
			position: relative;
			overflow: hidden;
		}

		.page-header::before {
			content: "";
			position: absolute;
			width: 220px;
			height: 220px;
			background: rgba(255, 255, 255, 0.08);
			border-radius: 50%;
			top: -70px;
			right: -60px;
		}

		.page-header::after {
			content: "";
			position: absolute;
			width: 160px;
			height: 160px;
			background: rgba(255, 255, 255, 0.06);
			border-radius: 50%;
			bottom: -55px;
			left: -45px;
		}

		.page-header h2 {
			font-size: 30px;
			font-weight: 800;
			margin: 0 0 10px 0;
			position: relative;
			z-index: 1;
			letter-spacing: 0.4px;
		}

		.page-header p {
			margin: 0;
			font-size: 15px;
			color: rgba(255, 255, 255, 0.88);
			position: relative;
			z-index: 1;
			line-height: 1.6;
		}

		.glass-card {
			background: rgba(255, 255, 255, 0.72);
			backdrop-filter: blur(16px);
			-webkit-backdrop-filter: blur(16px);
			border: 1px solid rgba(255, 255, 255, 0.55);
			border-radius: 26px;
			padding: 24px;
			box-shadow: 0 20px 50px rgba(15, 23, 42, 0.08);
		}

		.card-top {
			display: flex;
			justify-content: space-between;
			align-items: center;
			flex-wrap: wrap;
			gap: 12px;
			margin-bottom: 20px;
		}

		.card-top h3 {
			margin: 0;
			font-size: 22px;
			font-weight: 800;
			color: #0A2558;
		}

		.card-top .badge {
			padding: 10px 16px;
			border-radius: 999px;
			font-size: 13px;
			font-weight: 700;
			color: #0A2558;
			background: linear-gradient(135deg, #dbeafe, #eff6ff);
			border: 1px solid #cfe0ff;
			box-shadow: inset 0 1px 0 rgba(255,255,255,0.8);
		}

		.table-container {
			overflow-x: auto;
			border-radius: 20px;
		}

		.table {
			width: 100%;
			border-collapse: collapse;
			overflow: hidden;
			border-radius: 20px;
			background: #ffffff;
		}

		.table thead tr,
		.table tr:first-child {
			background: linear-gradient(135deg, #0A2558, #1d4fa8);
			color: #0f172a;
		}

		.table th {
			padding: 18px 16px;
			text-align: left;
			font-size: 14px;
			font-weight: 800;
			letter-spacing: 0.3px;
			border: none;
			white-space: nowrap;
		}

		.table td {
			padding: 16px;
			font-size: 14px;
			color: #24324a;
			border-bottom: 1px solid #e9eef7;
			background: rgba(255,255,255,0.92);
			vertical-align: middle;
		}

		.table tr:hover td {
			background: #f8fbff;
			transition: 0.25s ease;
		}

		.status-pill {
			display: inline-block;
			padding: 8px 14px;
			border-radius: 999px;
			font-size: 12px;
			font-weight: 800;
			letter-spacing: 0.2px;
		}

		.status-active {
			background: rgba(34, 197, 94, 0.14);
			color: #15803d;
			border: 1px solid rgba(34, 197, 94, 0.25);
		}

		.status-inactive {
			background: rgba(239, 68, 68, 0.12);
			color: #b91c1c;
			border: 1px solid rgba(239, 68, 68, 0.22);
		}

		.role-pill {
			display: inline-block;
			padding: 8px 14px;
			border-radius: 999px;
			font-size: 12px;
			font-weight: 800;
			color: #1d4fa8;
			background: rgba(59, 130, 246, 0.12);
			border: 1px solid rgba(59, 130, 246, 0.20);
			text-transform: capitalize;
		}

		.action-form {
			display: flex;
			flex-wrap: wrap;
			gap: 10px;
		}

		.action-form input[type="submit"] {
			border: none;
			outline: none;
			padding: 10px 18px;
			border-radius: 12px;
			font-size: 13px;
			font-weight: 700;
			cursor: pointer;
			transition: all 0.25s ease;
		}

		.action-form input[value="Delete"] {
			background: linear-gradient(135deg, #ef4444, #dc2626);
			color: #fff;
			box-shadow: 0 10px 20px rgba(239, 68, 68, 0.18);
		}

		.action-form input[value="Delete"]:hover {
			transform: translateY(-2px);
			box-shadow: 0 14px 24px rgba(239, 68, 68, 0.24);
		}

		.action-form input[value="Update"] {
			background: linear-gradient(135deg, #0A2558, #2d5fd3);
			color: #fff;
			box-shadow: 0 10px 20px rgba(45, 95, 211, 0.18);
		}

		.action-form input[value="Update"]:hover {
			transform: translateY(-2px);
			box-shadow: 0 14px 24px rgba(45, 95, 211, 0.24);
		}

		.empty-state {
			padding: 50px 20px;
			text-align: center;
			color: #667085;
		}

		.empty-state i {
			font-size: 46px;
			color: #2d5fd3;
			margin-bottom: 12px;
		}

		.empty-state h4 {
			margin: 10px 0 6px;
			font-size: 22px;
			color: #0A2558;
		}

		.sidebar .logo-details {
			background: rgba(255,255,255,0.04);
			border-radius: 0 0 18px 18px;
		}

		@media (max-width: 900px) {
			.home-content {
				padding: 18px;
			}

			.page-header {
				padding: 22px;
			}

			.page-header h2 {
				font-size: 24px;
			}

			.card-top {
				flex-direction: column;
				align-items: flex-start;
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
				<h2>Registered Customers</h2>
				<p>
					View, manage, update, and maintain customer account access from your admin dashboard.
				</p>
			</div>

			<div class="glass-card">
				<div class="card-top">
					<h3>Customer Management Table</h3>
					<span class="badge">
						<i class='bx bx-user-check'></i> Total Records: ${usermaster.size()}
					</span>
				</div>

				<c:choose>
					<c:when test="${not empty usermaster}">
						<div class="table-container">
							<table class="table">
								<tr>
									<th>Account No.</th>
									<th>Name</th>
									<th>Email</th>
									<th>Role</th>
									<th>Status</th>
									<th>Action</th>
								</tr>

								<c:forEach var="user" items="${usermaster}">
									<tr>
										<td>${user.accountno}</td>
										<td>${user.name}</td>
										<td>${user.email}</td>
										<td>
											<span class="role-pill">${user.role}</span>
										</td>
										<td>
											<c:choose>
												<c:when test="${user.status == 1}">
													<span class="status-pill status-active">Active</span>
												</c:when>
												<c:otherwise>
													<span class="status-pill status-inactive">Inactive</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<form action="manageuser" method="post" class="action-form">
												<input type="hidden" name="email" value="${user.email}">
												<input type="submit" value="Delete" name="btn">
												<input type="submit" value="Update" name="btn">
											</form>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:when>

					<c:otherwise>
						<div class="empty-state">
							<i class='bx bx-user-x'></i>
							<h4>No customers found</h4>
							<p>There are no registered customers to display right now.</p>
						</div>
					</c:otherwise>
				</c:choose>
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