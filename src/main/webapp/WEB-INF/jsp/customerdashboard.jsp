<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="UTF-8">
  <title>Customer Dashboard</title>
  <link rel="stylesheet" href="css/dash.css">
  <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  

  <style>
    .home-content {
      padding: 24px;
      background: #f5f8fc;
      min-height: calc(100vh - 80px);
    }

    .welcome-banner {
      background: linear-gradient(135deg, #0A2558 0%, #163b88 55%, #2d5fd3 100%);
      color: white;
      border-radius: 28px;
      padding: 32px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 20px;
      flex-wrap: wrap;
      box-shadow: 0 20px 45px rgba(10, 37, 88, 0.18);
      position: relative;
      overflow: hidden;
    }

    .welcome-banner::before {
      content: "";
      position: absolute;
      right: -40px;
      top: -40px;
      width: 180px;
      height: 180px;
      background: rgba(255,255,255,0.08);
      border-radius: 50%;
    }

    .welcome-banner::after {
      content: "";
      position: absolute;
      left: -50px;
      bottom: -50px;
      width: 220px;
      height: 220px;
      background: rgba(255,255,255,0.05);
      border-radius: 50%;
    }

    .welcome-text {
      position: relative;
      z-index: 1;
    }

    .welcome-text h1 {
      margin: 0;
      font-size: 32px;
      font-weight: 800;
      letter-spacing: 0.3px;
    }

    .welcome-text p {
      margin: 10px 0 0 0;
      font-size: 15px;
      color: rgba(255,255,255,0.88);
      max-width: 600px;
    }

    .welcome-badge {
      position: relative;
      z-index: 1;
      background: rgba(255,255,255,0.16);
      border: 1px solid rgba(255,255,255,0.25);
      padding: 14px 22px;
      border-radius: 999px;
      font-weight: 700;
      backdrop-filter: blur(8px);
    }

    .dashboard-grid {
      display: grid;
      grid-template-columns: repeat(4, minmax(180px, 1fr));
      gap: 20px;
      margin-top: 26px;
    }

    .stat-card {
      background: #ffffff;
      border-radius: 22px;
      padding: 24px 20px;
      box-shadow: 0 10px 28px rgba(16, 24, 40, 0.08);
      border: 1px solid #eef2f7;
      transition: transform 0.25s ease, box-shadow 0.25s ease;
    }

    .stat-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 16px 34px rgba(16, 24, 40, 0.12);
    }

    .stat-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 18px;
    }

    .stat-icon {
      width: 52px;
      height: 52px;
      border-radius: 16px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      color: #0A2558;
      background: linear-gradient(135deg, #e8f0ff, #f4f8ff);
    }

    .stat-label {
      font-size: 14px;
      color: #667085;
      font-weight: 600;
      margin-bottom: 6px;
    }

    .stat-value {
      font-size: 24px;
      font-weight: 800;
      color: #101828;
    }

    .action-section {
      margin-top: 30px;
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 22px;
    }

    .quick-actions,
    .security-card {
      background: #ffffff;
      border-radius: 24px;
      padding: 24px;
      box-shadow: 0 10px 28px rgba(16, 24, 40, 0.08);
      border: 1px solid #eef2f7;
    }

    .section-title {
      font-size: 22px;
      font-weight: 800;
      color: #0A2558;
      margin-bottom: 18px;
    }

    .action-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 16px;
    }

    .action-card {
      text-decoration: none;
      background: linear-gradient(180deg, #ffffff 0%, #f8fbff 100%);
      border: 1px solid #e8eef6;
      border-radius: 20px;
      padding: 20px;
      transition: all 0.25s ease;
      display: block;
    }

    .action-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 14px 30px rgba(10, 37, 88, 0.12);
      border-color: #d6e3ff;
    }

    .action-card i {
      font-size: 28px;
      color: #2d5fd3;
      margin-bottom: 14px;
      display: inline-block;
    }

    .action-card h3 {
      margin: 0 0 8px 0;
      font-size: 18px;
      color: #101828;
      font-weight: 800;
    }

    .action-card p {
      margin: 0;
      color: #667085;
      font-size: 14px;
      line-height: 1.5;
    }

    .security-box {
      background: linear-gradient(135deg, #0b1f4d 0%, #163b88 55%, #2d5fd3 100%);
      border-radius: 22px;
      padding: 22px;
      color: #ffffff;
      box-shadow: 0 16px 34px rgba(10, 37, 88, 0.18);
    }

    .security-box i {
      font-size: 34px;
      margin-bottom: 12px;
      display: inline-block;
    }

    .security-box h3 {
      margin: 0 0 10px 0;
      font-size: 22px;
      font-weight: 800;
    }

    .security-box p {
      margin: 0;
      font-size: 14px;
      color: rgba(255,255,255,0.88);
      line-height: 1.6;
    }

    .tips-list {
      margin-top: 18px;
      display: grid;
      gap: 12px;
    }

    .tip-item {
      display: flex;
      align-items: flex-start;
      gap: 10px;
      font-size: 14px;
      color: #344054;
      line-height: 1.5;
    }

    .tip-item i {
      color: #16a34a;
      font-size: 18px;
      margin-top: 2px;
    }

    
      .chat-bubble {
    display: inline-block;
    max-width: 75%;
    padding: 10px 14px;
    border-radius: 18px;
    font-size: 14px;
    line-height: 1.4;
    word-wrap: break-word;
}

.user-bubble {
    background: linear-gradient(135deg, #0A2558, #2d5fd3);
    color: white;
}

.bot-bubble {
    background: #e5e5ea;
    color: black;
}

#chatContent div {
    margin-bottom: 10px;
}


.typing {
    display: inline-block;
    padding: 8px 12px;
    border-radius: 12px;
    background: #e5e5ea;
}
.dot {
    height: 8px;
    width: 8px;
    margin: 0 3px;
    background-color: #2d5fd3;
    border-radius: 50%;
    display: inline-block;
    animation: blink 1.4s infinite both;
}

.dot:nth-child(2) {
    animation-delay: 0.2s;
}
.dot:nth-child(3) {
    animation-delay: 0.4s;
}

@keyframes blink {
    0%, 80%, 100% { opacity: 0; }
    40% { opacity: 1; }
}

    @media (max-width: 1100px) {
      .dashboard-grid {
        grid-template-columns: repeat(2, 1fr);
      }

      .action-section {
        grid-template-columns: 1fr;
      }
    }

    @media (max-width: 700px) {
      .dashboard-grid,
      .action-grid {
        grid-template-columns: 1fr;
      }

      .welcome-text h1 {
        font-size: 26px;
      }

      .home-content {
        padding: 16px;
      }

      .welcome-banner,
      .quick-actions,
      .security-card {
        padding: 20px;
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
   <a href="/loan">
    <i class='bx bx-money'></i>
    <span class="links_name">Loan</span>
</a>
</li>

  <li>
    <a href="/loanDashboard">
    <i class='bx bx-bar-chart-alt-2'></i>
    <span class="links_name">Loan Dashboard</span>
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
          <a href="/payment-history">Deposit History</a>
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
      <div class="search-box">
        <input type="text" id="globalSearch" placeholder="Search...">
        <i class='bx bx-search'></i>
      </div>
      <div class="profile-details">
        <img src="si.jpg" alt="">
        <span class="admin_name">${name}</span>
      </div>
    </nav>

    <div class="home-content">

      <div class="welcome-banner">
        <div class="welcome-text">
          <h1>Welcome back, ${name}</h1>
          <p>
            Manage your account, deposit funds, transfer money, check your balance,
            and view your mini statement from one secure place.
          </p>
        </div>
        <div class="welcome-badge">
          Secure Banking Portal
        </div>
      </div>

      <div class="dashboard-grid">
        <div class="stat-card">
          <div class="stat-top">
            <div>
              <div class="stat-label">Profile</div>
              <div class="stat-value">View</div>
            </div>
            <div class="stat-icon">
              <i class='bx bx-user'></i>
            </div>
          </div>
        </div>

        <div class="stat-card">
          <div class="stat-top">
            <div>
              <div class="stat-label">Account</div>
              <div class="stat-value">Check</div>
            </div>
            <div class="stat-icon">
              <i class='bx bx-wallet'></i>
            </div>
          </div>
        </div>

        <div class="stat-card">
          <div class="stat-top">
            <div>
              <div class="stat-label">Transfer</div>
              <div class="stat-value">Fast</div>
            </div>
            <div class="stat-icon">
              <i class='bx bx-transfer'></i>
            </div>
          </div>
        </div>

        <div class="stat-card">
          <div class="stat-top">
            <div>
              <div class="stat-label">Statement</div>
              <div class="stat-value">Recent</div>
            </div>
            <div class="stat-icon">
              <i class='bx bx-receipt'></i>
            </div>
          </div>
        </div>
      </div>

      <div class="action-section">
        <div class="quick-actions">
          <div class="section-title">Quick Actions</div>

          <div class="action-grid">
            <a href="/profile" class="action-card">
              <i class='bx bx-user-circle'></i>
              <h3>My Profile</h3>
              <p>View your full banking profile and personal account details.</p>
            </a>

            <a href="/check_account" class="action-card">
              <i class='bx bx-credit-card-front'></i>
              <h3>Check Balance</h3>
              <p>See your available account balance quickly and securely.</p>
            </a>

            <a href="/deposit" class="action-card">
              <i class='bx bx-plus-circle'></i>
              <h3>Deposit Money</h3>
              <p>Add money to your account with a clean and simple process.</p>
            </a>

            <a href="/withdraw" class="action-card">
              <i class='bx bx-send'></i>
              <h3>Fund Transfer</h3>
              <p>Transfer funds to another account in just a few steps.</p>
            </a>

            <a href="/addbeneficiary" class="action-card">
              <i class='bx bx-user-plus'></i>
              <h3>Add Beneficiary</h3>
              <p>Add trusted beneficiaries before making quick transfers.</p>
            </a>

            <a href="/ministatement" class="action-card">
              <i class='bx bx-detail'></i>
              <h3>Mini Statement</h3>
              <p>Check your recent transactions and account activity.</p>
            </a>

            <a href="/hidden_wallet" class="action-card">
  <i class='bx bx-lock'></i>
  <h3>Emergency Balance</h3>
  <p>Access your hidden emergency funds & deposit securely.</p>
</a>
          </div>

        
        </div>

        <div class="security-card">
          <div class="section-title">Security Center</div>

          <div class="security-box">
            <i class='bx bxs-shield-plus'></i>
            <h3>Your account is protected</h3>
            <p>
              Banking actions are available from your secure customer panel.
              Always verify account numbers before transferring money.
            </p>
          </div>

          <div class="tips-list">
            <div class="tip-item">
              <i class='bx bx-check-circle'></i>
              <span>Never share your password with anyone.</span>
            </div>
            <div class="tip-item">
              <i class='bx bx-check-circle'></i>
              <span>Verify beneficiary and account details before transfer.</span>
            </div>
            <div class="tip-item">
              <i class='bx bx-check-circle'></i>
              <span>Review your mini statement regularly.</span>
            </div>
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
  <!-- 💬 CHAT BUTTON -->
<div id="chatbotBtn" onclick="toggleChat()" style="
    position:fixed;
    bottom:20px;
    right:20px;
    background:#0A2558;
    color:white;
    padding:15px;
    border-radius:50%;
    cursor:pointer;
    font-size:18px;
    z-index:9999;">
  &#128172;
</div>

<!-- 🤖 CHATBOX -->
<div id="chatbox" style="
    display:none;
    flex-direction:column;
    position:fixed;
    bottom:80px;
    right:20px;
    width:320px;
    height:420px;
    background:white;
    border-radius:12px;
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
    overflow:hidden;
    z-index:9999;
">

  <!-- HEADER -->
  <div style="
      background:#0A2558;
      color:white;
      padding:12px;
      font-weight:bold;
      display:flex;
      justify-content:space-between;">
    &#129302; Banking AI
    <span onclick="toggleChat()" style="cursor:pointer;">&#10006;</span>
  </div>

  <!-- CHAT CONTENT -->
  <div id="chatContent" style="
      flex:1;
      padding:10px;
      overflow-y:auto;
      font-size:14px;
      background:#f9f9f9;">
  </div>

  <!-- INPUT AREA -->
  <div style="
      display:flex;
      border-top:1px solid #ccc;">
      
    <input id="userInput" placeholder="Type your message..." style="
        flex:1;
        padding:10px;
        border:none;
        outline:none;
        font-size:14px;
    ">

    <button onclick="sendMessage()" style="
        background:#0A2558;
        color:white;
        border:none;
        padding:10px 15px;
        cursor:pointer;
    ">
      Send
    </button>
  </div>

</div>

<!-- JS -->
<script>
function toggleChat() {
    let box = document.getElementById("chatbox");

    if (box.style.display === "none" || box.style.display === "") {
        box.style.display = "flex";   // 🔥 IMPORTANT
    } else {
        box.style.display = "none";
    }
}

async function sendMessage() {
   let input = document.getElementById("userInput");
let msg = input.value.trim();
if (msg === "") return;

input.value = "";   // 🔥 clear instantly

    let chat = document.getElementById("chatContent");
// ✅ CREATE USER MESSAGE FIRST
let userDiv = document.createElement("div");
userDiv.style.textAlign = "right";
userDiv.style.marginBottom = "8px";

let userSpan = document.createElement("span");
userSpan.className = "chat-bubble user-bubble";

userSpan.innerText = msg;

userDiv.appendChild(userSpan);
chat.appendChild(userDiv);

chat.scrollTop = chat.scrollHeight;




// 🔥 ADD TYPING HERE
let typingDiv = document.createElement("div");
typingDiv.id = "typing";
typingDiv.style.textAlign = "left";
typingDiv.style.marginBottom = "8px";

typingDiv.innerHTML = `
    <span class="typing">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </span>
`;

chat.appendChild(typingDiv);
chat.scrollTop = chat.scrollHeight;
    try {
        let res = await fetch("http://localhost:8082/chat", {
            method: "POST",
            headers: { "Content-Type": "text/plain" },
            body: msg
        });

        let raw = await res.text();
        let reply;

        try {
            let data = JSON.parse(raw);
            reply = data.choices?.[0]?.message?.content || raw;
        } catch {
            reply = raw;
        }

        if (!reply || reply.trim() === "") {
            reply = "🤖 No response received.";
        }

        document.getElementById("typing")?.remove();

        // ✅ BOT MESSAGE
        let botDiv = document.createElement("div");
        botDiv.style.textAlign = "left";
        botDiv.style.marginBottom = "8px";

        let botSpan = document.createElement("span");
        botSpan.className = "chat-bubble bot-bubble";

        botSpan.innerText = reply;

        botDiv.appendChild(botSpan);
        chat.appendChild(botDiv);

        chat.scrollTop = chat.scrollHeight;

    } catch (e) {
        console.error(e);

        let errDiv = document.createElement("div");
        errDiv.style.color = "red";
        errDiv.innerText = "⚠️ Server not responding";

        chat.appendChild(errDiv);
    }

    input.value = "";
}

// 🔥 ENTER KEY SUPPORT
document.addEventListener("keydown", function(e) {
    if (e.key === "Enter") {
        sendMessage();
    }
});
</script>



<script>

const searchBox = document.getElementById("globalSearch");

if (searchBox) {
    searchBox.addEventListener("keydown", function(e) {

        if (e.key === "Enter") {

            let value = this.value.toLowerCase().trim();

            if (value.includes("deposit")) {
                window.location.href = "/deposit";
            }
            else if (value.includes("transfer") || value.includes("send")) {
                window.location.href = "/withdraw";
            }
            else if (value.includes("statement")) {
                window.location.href = "/ministatement";
            }
            else if (value.includes("profile")) {
                window.location.href = "/profile";
            }
            else if (value.includes("beneficiary")) {
                window.location.href = "/addbeneficiary";
            }
            else if (value.includes("history")) {
                window.location.href = "/payment-history";
            }

             else if (value.includes("loan")) {
                window.location.href = "/loan";
            }

             else if (value.includes("loan dashboard")) {
                window.location.href = "/loanDashboard";
            }
            else {
                alert("No result found");
            }

        }

    });
}

</script>



</body>

</html>