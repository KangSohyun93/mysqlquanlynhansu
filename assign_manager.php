<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $dept_id = $_POST['dept_id'];
    $emp_id = $_POST['emp_id'];
    $start_date = $_POST['start_date'];

    $sql = "INSERT INTO dept_maneger (dept_id, emp_id, start_date) VALUES ('$dept_id', '$emp_id', '$start_date')";

    if ($conn->query($sql) === TRUE) {
        echo "Bổ nhiệm trưởng phòng thành công!";
    } else {
        echo "Lỗi: " . $conn->error;
    }
}
?>
