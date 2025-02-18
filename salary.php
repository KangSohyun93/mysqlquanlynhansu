<?php
include 'connect.php';

$sql = "SELECT s.emp_no, e.first_name, e.last_name, s.salary, s.from_date, s.to_date 
        FROM salary s 
        JOIN employee e ON s.emp_no = e.emp_no";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Lương</title>
</head>
<body>
    <h2>Danh sách Lương Nhân viên</h2>
    <table border="1">
        <tr>
            <th>Mã NV</th>
            <th>Họ tên</th>
            <th>Lương</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['emp_no']; ?></td>
            <td><?php echo $row['first_name'] . ' ' . $row['last_name']; ?></td>
            <td><?php echo number_format($row['salary']); ?></td>
            <td><?php echo $row['from_date']; ?></td>
            <td><?php echo $row['to_date']; ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
