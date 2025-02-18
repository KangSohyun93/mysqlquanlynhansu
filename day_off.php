<?php
include 'connect.php';

$sql = "SELECT d.day_off_id, e.first_name, e.last_name, d.start_date, d.end_date, d.reason 
        FROM day_off d 
        JOIN employee e ON d.emp_no = e.emp_no";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách nghỉ phép</title>
</head>
<body>
    <h2>Danh sách nghỉ phép</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nhân viên</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
            <th>Lý do</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['day_off_id']; ?></td>
            <td><?php echo $row['first_name'] . ' ' . $row['last_name']; ?></td>
            <td><?php echo $row['start_date']; ?></td>
            <td><?php echo $row['end_date']; ?></td>
            <td><?php echo $row['reason']; ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
