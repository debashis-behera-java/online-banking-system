<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    

    <style>
        body {
            background: linear-gradient(135deg, #eef4ff, #e8f0ff);
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: white;
            padding: 30px 40px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(10, 37, 88, 0.2);
            width: 400px;
        }

        h2 {
            text-align: center;
            color: #0A2558;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: 600;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ccc;
            outline: none;
            transition: 0.3s;
        }

        input:focus, textarea:focus {
            border-color: #2d5fd3;
            box-shadow: 0 0 8px rgba(45, 95, 211, 0.2);
        }

        textarea {
            resize: none;
            height: 70px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #0A2558, #2d5fd3);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 25px rgba(10, 37, 88, 0.3);
        }
    </style>
</head>

<body>

<div class="form-container">
    <h2>&#9999; Update Profile</h2>

    <form action="/updateprofiledata" method="post">

        <div class="input-group">
            <label>Name</label>
            <input type="text" name="name" value="${user.name}">
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" name="email" value="${user.email}">
        </div>

        <div class="input-group">
            <label>Mobile</label>
            <input type="text" name="mobile_no" value="${user.mobile_no}">
        </div>

        <div class="input-group">
            <label>City</label>
            <input type="text" name="city" value="${user.city}">
        </div>

        <div class="input-group">
            <label>State</label>
            <input type="text" name="state" value="${user.state}">
        </div>

        <div class="input-group">
            <label>PIN</label>
            <input type="text" name="pin" value="${user.pin}">
        </div>

        <div class="input-group">
            <label>Address</label>
            <textarea name="address">${user.address}</textarea>
        </div>

        <button type="submit">Update Profile</button>

    </form>
</div>

</body>
</html>