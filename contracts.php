<?php
include 'connect.php';

$sql = "SELECT c.contract_id, e.first_name, e.last_name, c.start_date, c.end_date 
        FROM contract c 
        JOIN contract_of_emp ce ON c.contract_id = ce.contract_id
        JOIN employee e ON ce.emp_no = e.emp_no";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Hợp đồng</title>
</head>
<body>
    <h2>Danh sách Hợp đồng</h2>
    <table border="1">
        <tr>
            <th>ID Hợp đồng</th>
            <th>Nhân viên</th>
            <th>Ngày bắt đầu</th>
            <th>Ngày kết thúc</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['contract_id']; ?></td>
            <td><?php echo $row['first_name'] . ' ' . $row['last_name']; ?></td>
            <td><?php echo $row['start_date']; ?></td>
            <td><?php echo $row['end_date']; ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
