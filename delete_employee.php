<?php
include 'connect.php';

if (isset($_GET['emp_id'])) {
    $emp_id = $_GET['emp_id'];

    // Kiểm tra nhân viên có tồn tại không
    $check_query = "SELECT * FROM employee WHERE emp_id = ?";
    $stmt = $conn->prepare($check_query);
    $stmt->bind_param("i", $emp_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Nếu tồn tại thì xóa
        $delete_query = "DELETE FROM employee WHERE emp_id = ?";
        $stmt = $conn->prepare($delete_query);
        $stmt->bind_param("i", $emp_id);
        if ($stmt->execute()) {
            echo "<script>alert('Xóa thành công!'); window.location.href=document.referrer;</script>"; 
            exit();
        } else {
            echo "<script>alert('Lỗi khi xóa! Kiểm tra ràng buộc dữ liệu.'); window.history.back();</script>";
        }
    } else {
        echo "<script>alert('Nhân viên không tồn tại!'); window.history.back();</script>";
    }
} else {
    echo "<script>alert('Thiếu thông tin nhân viên!'); window.history.back();</script>";
}

$conn->close();
?>
