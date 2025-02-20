<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $emp_name = trim($_POST['emp_name']);
    $gender = $_POST['gender'];
    $dob = $_POST['dob'];
    $emp_address = trim($_POST['emp_address']);
    $emp_phone = trim($_POST['emp_phone']);
    $email = trim($_POST['email']);
    $join_date = $_POST['join_date'];

    // Kiểm tra dữ liệu đầu vào không được để trống
    if (empty($emp_name) || empty($gender) || empty($dob) || empty($emp_address) || empty($emp_phone) || empty($email) || empty($join_date)) {
        echo "<script>alert('Vui lòng nhập đầy đủ thông tin!'); window.history.back();</script>";
        exit();
    }

    // Sử dụng prepared statements để tránh lỗi SQL Injection
    $sql = "INSERT INTO employee (emp_name, gender, dob, emp_address, emp_phone, email, join_date) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    
    if ($stmt) {
        $stmt->bind_param("sssssss", $emp_name, $gender, $dob, $emp_address, $emp_phone, $email, $join_date);
        if ($stmt->execute()) {
            echo "<script>
                    alert('Thêm nhân viên thành công!');
                    window.location.href = 'view_tables.php?table=employee';
                  </script>";
            exit();
        } else {
            echo "<script>alert('Lỗi khi thêm nhân viên: " . $stmt->error . "');</script>";
        }
        $stmt->close();
    } else {
        echo "<script>alert('Lỗi khi chuẩn bị truy vấn: " . $conn->error . "');</script>";
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Nhân Viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        h2 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button[name="save"] {
            background-color: #28a745;
            color: white;
        }
        .cancel-btn {
            background-color: #dc3545;
            color: white;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            padding: 10px 15px;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }
        .cancel-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Thêm Nhân Viên</h2>
        <form method="POST">
            <label>Họ và Tên:</label>
            <input type="text" name="emp_name" required>

            <label>Giới Tính:</label>
            <select name="gender">
                <option value="nam">Nam</option>
                <option value="nữ">Nữ</option>
            </select>

            <label>Ngày Sinh:</label>
            <input type="date" name="dob" required>

            <label>Địa Chỉ:</label>
            <input type="text" name="emp_address" required>

            <label>Số Điện Thoại:</label>
            <input type="text" name="emp_phone" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Ngày Vào Làm:</label>
            <input type="date" name="join_date" required>

            <div class="button-group">
                <button type="submit" name="save">Thêm Nhân Viên</button>
            </div>
        </form>
        <br>
        <a href="view_tables.php?table=employee" class="cancel-btn">Quay lại danh sách</a>
    </div>
</body>
</html>
