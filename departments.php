<?php
include 'connect.php';

$sql = "SELECT dept_no, dept_name FROM department";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Phòng ban</title>
</head>
<body>
    <h2>Danh sách Phòng ban</h2>
    <table border="1">
        <tr>
            <th>Mã phòng</th>
            <th>Tên phòng</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <td><?php echo $row['dept_no']; ?></td>
            <td><?php echo $row['dept_name']; ?></td>
        </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>
