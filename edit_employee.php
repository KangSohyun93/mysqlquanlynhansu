<?php
include 'connect.php';

if (!isset($_GET['emp_id']) || empty($_GET['emp_id'])) {
    echo "<script>alert('Employee information is lacking!'); window.location.href='view_tables.php?table=employee';</script>";
    exit();
}

$emp_id = $_GET['emp_id'];

$query = "SELECT * FROM employee WHERE emp_id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $emp_id);
$stmt->execute();
$result = $stmt->get_result();
$employee = $result->fetch_assoc();

if (!$employee) {
    echo "<script>alert('Employee does not exist!'); window.location.href='view_tables.php?table=employee';</script>";
    exit();
}

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
            echo "<script>alert('Please enter full information!'); window.history.back();</script>";
            exit();
        }

        $update_query = "UPDATE employee SET emp_name=?, gender=?, dob=?, emp_address=?, emp_phone=?, email=?, join_date=? WHERE emp_id=?";
        $stmt = $conn->prepare($update_query);
        
        if (!$stmt) {
            die("Lỗi chuẩn bị câu lệnh: " . $conn->error);
        }

        $stmt->bind_param("sssssssi", $emp_name, $gender, $dob, $emp_address, $emp_phone, $email, $join_date, $emp_id);
        
        if ($stmt->execute()) {
            echo "<script>
                    alert('Success updated!');
                    window.location.href = 'view_tables.php?table=employee';
                  </script>";
            exit();
        } else {
            echo "<script>alert('Error when updating: " . $stmt->error . "'); window.history.back();</script>";
        }
    } elseif (isset($_POST['cancel'])) {
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
        button.cancel-btn {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Employee Information</h2>
        <form method="post">
            <label>Name:</label>
            <input type="text" name="emp_name" value="<?php echo htmlspecialchars($employee['emp_name']); ?>" required>

            <label>Gender:</label>
            <select name="gender">
                <option value="nam" <?php if ($employee['gender'] == 'nam') echo "selected"; ?>>Nam</option>
                <option value="nữ" <?php if ($employee['gender'] == 'nữ') echo "selected"; ?>>Nữ</option>
            </select>

            <label>Date of Birth:</label>
            <input type="date" name="dob" value="<?php echo date('Y-m-d', strtotime($employee['dob'])); ?>" required>

            <label>Address:</label>
            <input type="text" name="emp_address" value="<?php echo htmlspecialchars($employee['emp_address']); ?>" required>

            <label>Phone Number:</label>
            <input type="text" name="emp_phone" value="<?php echo htmlspecialchars($employee['emp_phone']); ?>" required>

            <label>Email:</label>
            <input type="email" name="email" value="<?php echo htmlspecialchars($employee['email']); ?>" required>

            <label>Join Date:</label>
            <input type="date" name="join_date" value="<?php echo $employee['join_date']; ?>" required>

            <div class="button-group">
                <button type="submit" name="save">Lưu</button>
                <button type="submit" name="cancel" class="cancel-btn">Hủy</button>
            </div>
        </form>
    </div>
</body>
</html>
