<?php
include 'connect.php';

if (!isset($_GET['emp_id']) || empty($_GET['emp_id'])) {
    echo "<script>alert('Thiếu thông tin nhân viên!'); window.location.href='view_tables.php?table=employee';</script>";
    exit();
}

$emp_id = $_GET['emp_id'];

// Lấy thông tin nhân viên
$query = "SELECT * FROM employee WHERE emp_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $emp_id);
$stmt->execute();
$result = $stmt->get_result();
$employee = $result->fetch_assoc();

if (!$employee) {
    echo "<script>alert('Nhân viên không tồn tại!'); window.location.href='view_tables.php?table=employee';</script>";
    exit();
}

// Xử lý cập nhật dữ liệu
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['save'])) {
        $emp_name = trim($_POST['emp_name']);
        $gender = $_POST['gender'];
        $dob = $_POST['dob'];
        $emp_address = trim($_POST['emp_address']);
        $emp_phone = trim($_POST['emp_phone']);
        $email = trim($_POST['email']);
        $join_date = $_POST['join_date'];

        if (empty($emp_name) || empty($gender) || empty($dob) || empty($emp_address) || empty($emp_phone) || empty($email) || empty($join_date)) {
            echo "<script>alert('Vui lòng nhập đầy đủ thông tin!'); window.history.back();</script>";
            exit();
        }

        $update_query = "UPDATE employee SET emp_name=?, gender=?, dob=?, emp_address=?, emp_phone=?, email=?, join_date=? WHERE emp_id=?";
        $stmt = $conn->prepare($update_query);
        $stmt->bind_param("sssssssi", $emp_name, $gender, $dob, $emp_address, $emp_phone, $email, $join_date, $emp_id);

        if ($stmt->execute()) {
            echo "<script>
                    alert('Cập nhật thành công!');
                    window.location.href = 'view_tables.php?table=employee';
                  </script>";
            exit();
        } else {
            echo "<script>alert('Lỗi khi cập nhật!'); window.history.back();</script>";
        }
    } elseif (isset($_POST['cancel'])) {
        // Nếu nhấn "Hủy", quay lại trang danh sách
        echo "<script>window.location.href = 'view_tables.php?table=employee';</script>";
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sửa Nhân Viên</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Sửa Thông Tin Nhân Viên</h2>
        <form method="post">
            <label>Họ và Tên:</label>
            <input type="text" name="emp_name" value="<?php echo htmlspecialchars($employee['emp_name']); ?>" required>

            <label>Giới tính:</label>
            <select name="gender">
                <option value="nam" <?php if ($employee['gender'] == 'nam') echo "selected"; ?>>Nam</option>
                <option value="nữ" <?php if ($employee['gender'] == 'nữ') echo "selected"; ?>>Nữ</option>
            </select>

            <label>Ngày sinh:</label>
            <input type="date" name="dob" value="<?php echo date('Y-m-d', strtotime($employee['dob'])); ?>" required>

            <label>Địa chỉ:</label>
            <input type="text" name="emp_address" value="<?php echo htmlspecialchars($employee['emp_address']); ?>" required>

            <label>Số điện thoại:</label>
            <input type="text" name="emp_phone" value="<?php echo htmlspecialchars($employee['emp_phone']); ?>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<?php echo htmlspecialchars($employee['email']); ?>" required>

            <label>Ngày vào làm:</label>
            <input type="date" name="join_date" value="<?php echo $employee['join_date']; ?>" required>

            <div class="button-group">
                <button type="submit" name="save">Lưu</button>
                <button type="submit" name="cancel" class="cancel-btn">Hủy</button>
            </div>
        </form>
    </div>
</body>
</html>
