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
    <title>Salary List</title>
</head>
<body>
    <h2>Employee's Salary List</h2>
    <table border="1">
        <tr>
            <th>Emp ID</th>
            <th>Name</th>
            <th>Salary</th>
            <th>Join Date</th>
            <th>End Date</th>
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
