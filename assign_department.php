<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $emp_id = $_POST['emp_id'];
    $dept_id = $_POST['dept_id'];
    $start_date = $_POST['start_date'];

    $sql = "INSERT INTO dept_emp (emp_id, dept_id, start_date) VALUES ('$emp_id', '$dept_id', '$start_date')";

    if ($conn->query($sql) === TRUE) {
        echo "Gán nhân viên vào phòng ban thành công!";
    } else {
        echo "Lỗi: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Gán Nhân viên vào Phòng ban</title>
</head>
<body>
    <h2>Gán Nhân viên vào Phòng ban</h2>
    <form method="POST">
        <label>ID Nhân viên:</label> <input type="text" name="emp_id" required><br>
        <label>ID Phòng ban:</label> <input type="text" name="dept_id" required><br>
        <label>Ngày bắt đầu:</label> <input type="date" name="start_date" required><br>
        <button type="submit">Gán vào Phòng ban</button>
    </form>
</body>
</html>
