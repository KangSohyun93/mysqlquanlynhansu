<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $emp_id = $_POST['emp_id'];

    $check_query = "SELECT * FROM employee WHERE emp_id = ?";
    $stmt = $conn->prepare($check_query);
    $stmt->bind_param("i", $emp_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $delete_query = "DELETE FROM employee WHERE emp_id = ?";
        $stmt = $conn->prepare($delete_query);
        $stmt->bind_param("i", $emp_id);
        if ($stmt->execute()) {
            echo json_encode(["status" => "success", "message" => "Xóa thành công!"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Lỗi khi xóa! Kiểm tra ràng buộc dữ liệu."]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Nhân viên không tồn tại!"]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Yêu cầu không hợp lệ!"]);
}

$conn->close();
?>
