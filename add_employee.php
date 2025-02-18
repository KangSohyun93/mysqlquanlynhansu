<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $emp_name = $_POST['emp_name'];
    $gender = $_POST['gender'];
    $dob = $_POST['dob'];
    $emp_address = $_POST['emp_address'];
    $emp_phone = $_POST['emp_phone'];
    $email = $_POST['email'];
    $join_date = $_POST['join_date'];

    $sql = "INSERT INTO employee (emp_name, gender, dob, emp_address, emp_phone, email, join_date) 
            VALUES ('$emp_name', '$gender', '$dob', '$emp_address', '$emp_phone', '$email', '$join_date')";

if ($conn->query($sql) === TRUE) {
    echo "<script>
            alert('Thêm nhân viên thành công!');
                    window.location.href = 'view_tables.php?table=employee';
          </script>";
    exit();
} else {
    echo "<script>alert('Lỗi: " . $conn->error . "');</script>";
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
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <h2>Thêm Nhân Viên</h2>
    <form method="POST">
        <label>Họ và Tên:</label>
        <input type="text" name="emp_name" required><br>

        <label>Giới Tính:</label>
        <select name="gender">
            <option value="nam">Nam</option>
            <option value="nữ">Nữ</option>
        </select><br>

        <label>Ngày Sinh:</label>
        <input type="date" name="dob" required><br>

        <label>Địa Chỉ:</label>
        <input type="text" name="emp_address"><br>

        <label>Số Điện Thoại:</label>
        <input type="text" name="emp_phone"><br>

        <label>Email:</label>
        <input type="email" name="email"><br>

        <label>Ngày Vào Làm:</label>
        <input type="date" name="join_date"><br>

        <input type="submit" value="Thêm Nhân Viên">
    </form>
    <br>
    <a href="view_tables.php">Quay lại danh sách</a>
</body>
</html>
