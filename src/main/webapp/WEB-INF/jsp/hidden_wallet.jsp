<!DOCTYPE html>
<html>
<head>
<title>Secure PIN</title>

<style>

body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    background: radial-gradient(circle at top, #1e3a8a, #020617);
    color: white;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.wrapper {
    width: 340px;
    padding: 35px 25px;
    border-radius: 22px;
    background: rgba(255,255,255,0.04);
    backdrop-filter: blur(15px);
    text-align: center;
    box-shadow: 0 0 50px rgba(0,0,0,0.6);
}

.title {
    font-size: 24px;
    font-weight: 600;
}

.subtitle {
    font-size: 13px;
    opacity: 0.7;
    margin-top: 6px;
    margin-bottom: 30px;
}

.dots {
    display: flex;
    justify-content: center;
    gap: 14px;
    margin-bottom: 25px;
}

.dot {
    width: 14px;
    height: 14px;
    border-radius: 50%;
    background: rgba(255,255,255,0.15);
    transition: 0.25s;
}

.dot.active {
    background: linear-gradient(135deg, #3a86ff, #00c6ff);
    box-shadow: 0 0 12px rgba(58,134,255,0.8);
    transform: scale(1.3);
}

.hidden-input {
    position: absolute;
    opacity: 0;
}

.error {
    font-size: 13px;
    height: 20px;
    margin-top: 5px;
    color: #ff4d4d;
}

.success {
    color: #00ffae;
}

.switch {
    margin-top: 15px;
    font-size: 13px;
    color: #9ca3af;
    cursor: pointer;
}

/* fingerprint buttons */
.fp-btn {
    margin-top: 12px;
    font-size: 13px;
    color: #3a86ff;
    cursor: pointer;
}

.fp-btn:hover {
    text-decoration: underline;
}

</style>
</head>

<body>

<div class="wrapper">

    <div id="title" class="title">Enter PIN</div>
    <div id="subtitle" class="subtitle">Access hidden wallet</div>

    <div class="dots">
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
    </div>

    <input type="password" maxlength="4" id="pinInput" class="hidden-input" autofocus>

    <div id="error" class="error"></div>

    <div id="switchText" class="switch" onclick="switchMode()">
        Create new PIN
    </div>

    <!-- 🔐 Fingerprint -->
    <div class="fp-btn" onclick="registerFingerprint()">Enable Fingerprint</div>
    <div class="fp-btn" onclick="loginFingerprint()">Use Fingerprint</div>

</div>

<script>

let mode = "LOGIN";
let step = 1;
let firstPin = "";

const input = document.getElementById("pinInput");
const error = document.getElementById("error");

// focus always
document.body.addEventListener("click", () => input.focus());

// typing
input.addEventListener("input", () => {

    let value = input.value;
    updateDots(value.length);

    if (value.length === 4) {
        handlePin(value);
    }
});

// backspace fix
input.addEventListener("keydown", () => {
    setTimeout(() => updateDots(input.value.length), 0);
});

// dots
function updateDots(count) {
    let dots = document.querySelectorAll(".dot");
    dots.forEach((d, i) => {
        d.classList.toggle("active", i < count);
    });
}

// switch
function switchMode() {

    mode = (mode === "LOGIN") ? "CREATE" : "LOGIN";
    step = 1;
    firstPin = "";

    reset();
    error.innerText = "";

    if (mode === "LOGIN") {
        title.innerText = "Enter PIN";
        subtitle.innerText = "Access hidden wallet";
        switchText.innerText = "Create new PIN";
    } else {
        title.innerText = "Create PIN";
        subtitle.innerText = "Enter new PIN";
        switchText.innerText = "Back to Login";
    }
}

// handle pin
function handlePin(pin) {

    error.innerText = "";

    if (mode === "CREATE") {

        if (step === 1) {
            firstPin = pin;
            step = 2;
            reset();

            title.innerText = "Confirm PIN";
            subtitle.innerText = "Re-enter your PIN";

        } else {

            if (pin === firstPin) {
                savePin(pin);
            } else {
                error.innerText = "PIN not matched ❌";
                reset();
            }
        }

    } else {
        verifyPin(pin);
    }
}

// save
function savePin(pin) {

    fetch("/setHiddenPin", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "pin=" + pin
    })
    .then(() => {
        error.classList.add("success");
        error.innerText = "PIN created successfully ✅";
        reset();
    });
}

// verify
function verifyPin(pin) {

    fetch("/verifyHiddenPin", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "pin=" + pin
    })
    .then(res => res.text())
    .then(data => {

        if (data === "SUCCESS") {
            window.location.href = "/hidden_home";
        } else {
            error.innerText = "Wrong PIN ❌";
            reset();
        }

    });
}

// reset
function reset() {
    input.value = "";
    updateDots(0);
}

/* =========================
   🔐 FINGERPRINT (FIXED)
========================= */

// REGISTER
async function registerFingerprint() {

    let res = await fetch("/fingerprint/register/options");
    let options = await res.json();

    options.challenge = Uint8Array.from(atob(options.challenge), c => c.charCodeAt(0));
    options.user.id = new TextEncoder().encode(options.user.id);

    let cred = await navigator.credentials.create({ publicKey: options });

    await fetch("/fingerprint/register/verify", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({
            id: btoa(String.fromCharCode(...new Uint8Array(cred.rawId))),
            publicKey: "demo"
        })
    });

    alert("Fingerprint Registered ✅");
}

// LOGIN
async function loginFingerprint() {
    try {

        let res = await fetch("/fingerprint/login/options");
        let options = await res.json();

        options.challenge = Uint8Array.from(atob(options.challenge), c => c.charCodeAt(0));

        let credential = await navigator.credentials.get({ publicKey: options });

        // ✅ Send response to backend
        let verify = await fetch("/fingerprint/login/verify", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                id: btoa(String.fromCharCode(...new Uint8Array(credential.rawId)))
            })
        });

        let result = await verify.text();

        if (result === "SUCCESS") {
            window.location.href = "/hidden_home";
        } else {
            alert("Fingerprint failed ❌");
        }

    } catch (err) {
        alert("Fingerprint cancelled or failed ❌");
    }
}

</script>

</body>
</html>