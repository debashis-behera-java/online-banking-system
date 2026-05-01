<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Secure Payment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #0f2027, #2c5364);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 400px;
            padding: 35px;
            border-radius: 25px;
            background: rgba(255,255,255,0.08);
            backdrop-filter: blur(20px);
            box-shadow: 0 20px 60px rgba(0,0,0,0.4);
            text-align: center;
            color: white;
        }

        .bank-logo {
            font-size: 18px;
            opacity: 0.8;
            margin-bottom: 10px;
        }

        .title {
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .amount {
            font-size: 42px;
            font-weight: bold;
            margin: 15px 0;
        }

        .divider {
            height: 1px;
            background: rgba(255,255,255,0.2);
            margin: 20px 0;
        }

        .secure-text {
            font-size: 13px;
            opacity: 0.7;
        }

        .btn {
            width: 100%;
            padding: 15px;
            margin-top: 25px;
            border: none;
            border-radius: 50px;
            font-size: 18px;
            font-weight: bold;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: white;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 10px 25px rgba(0,114,255,0.5);
        }

        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 35px rgba(0,114,255,0.7);
        }

        .razorpay {
            margin-top: 15px;
            font-size: 12px;
            opacity: 0.6;
        }
    </style>
</head>

<body>

<div class="card">

    <div class="bank-logo">&#x1F3E6; My Bank</div>

    <div class="title">Secure Payment</div>

    <!-- FIXED ₹ ISSUE -->
    <div class="amount">&#8377;${amount}</div>

    <div class="divider"></div>

    <div class="secure-text">&#128274; 100% Secure Payment via Razorpay</div>

    <input type="hidden" id="amountValue" value="${amount}">

    <button onclick="payNow()" class="btn">
        &#128179; Pay Now
    </button>

    <div class="razorpay">Powered by Razorpay</div>

</div>

<script>
function payNow() {

    var amount = document.getElementById("amountValue").value;

    fetch("/create_order?amount=" + amount, {
        method: "POST"
    })
    .then(res => res.json())
    .then(order => {

        var options = {
            "key": "rzp_test_SYtIERyTrzDaL2",

            "amount": order.amount,
            "currency": "INR",

            "order_id": order.id, // 🔥 VERY IMPORTANT

            "name": "My Bank",
            "description": "Deposit Money",

            "handler": function (response) {

                var form = document.createElement("form");
                form.method = "POST";
                form.action = "/payment_success";

             var p1 = document.createElement("input");
p1.type = "hidden";   // ✅ FIX
p1.name = "razorpay_payment_id";
p1.value = response.razorpay_payment_id;

var p2 = document.createElement("input");
p2.type = "hidden";   // ✅ FIX
p2.name = "razorpay_order_id";
p2.value = response.razorpay_order_id;

var p3 = document.createElement("input");
p3.type = "hidden";   // ✅ FIX
p3.name = "razorpay_signature";
p3.value = response.razorpay_signature;

                form.appendChild(p1);
                form.appendChild(p2);
                form.appendChild(p3);

                document.body.appendChild(form);
                form.submit();
            }
        };

        var rzp = new Razorpay(options);
        rzp.open();
    });
}

</script>

</body>
</html>