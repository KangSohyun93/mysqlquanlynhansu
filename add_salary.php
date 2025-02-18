<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $emp_id = $_POST['emp_id'];
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];
    $basic_salary = $_POST['basic_salary'];

    if (!empty($emp_id) && !empty($start_date) && !empty($basic_salary)) {
        $sql = "INSERT INTO salary (emp_id, start_date, end_date, basic_salary) 
                VALUES ('$emp_id', '$start_date', '$end_date', '$basic_salary')";

        if ($conn->query($sql) === TRUE) {
            echo "Thêm lương thành công!";
            header("Location: index.php");
            exit();
        } else {
            echo "Lỗi: " . $conn->error;
        }
    } else {
        echo "Vui lòng nhập đầy đủ thông tin!";
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Lương Nhân Viên</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <h2>Thêm Lương Nhân Viên</h2>
    <form method="POST" action="">
        <label for="emp_id">ID Nhân Viên:</label>
        <input type="number" name="emp_id" required><br>

        <label for="start_date">Ngày Bắt Đầu:</label>
        <input type="date" name="start_date" required><br>

        <label for="end_date">Ngày Kết Thúc:</label>
        <input type="date" name="end_date"><br>

        <label for="basic_salary">Lương Cơ Bản:</label>
        <input type="number" name="basic_salary" required><br>

        <button type="submit">Thêm Lương</button>
    </form>
</body>
</html>
