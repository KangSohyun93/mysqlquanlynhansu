<?php
include 'connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $contract_id = $_POST['contract_id'];
    $contract_name = $_POST['contract_name'];

    $sql = "INSERT INTO contract (contract_id, contract_name) VALUES ('$contract_id', '$contract_name')";

    if ($conn->query($sql) === TRUE) {
        echo "Thêm hợp đồng thành công!";
    } else {
        echo "Lỗi: " . $conn->error;
    }
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Hợp đồng</title>
</head>
<body>
    <h2>Thêm Hợp đồng</h2>
    <form method="POST">
        <label>ID Hợp đồng:</label> <input type="text" name="contract_id" required><br>
        <label>Tên hợp đồng:</label> <input type="text" name="contract_name" required><br>
        <button type="submit">Thêm Hợp đồng</button>
    </form>
</body>
</html>
