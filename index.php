<?php
include 'connect.php';

$sql = "SHOW TABLES";
$result = $conn->query($sql);

$tables = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_array()) {
        $tables[] = ucfirst(str_replace('_', ' ', $row[0])); // Format table names
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HR Management</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        .table-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 8px;
            transition: 0.3s;
            width: 100%;
        }
        .table-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>📋 Database Tables</h2>
    
    <div class="grid-container">
        <?php foreach ($tables as $table): ?>
            <button class="table-button" onclick="location.href='./view_tables.php?table=<?php echo strtolower(str_replace(' ', '_', $table)); ?>'">
                📂 <?php echo $table; ?>
            </button>
        <?php endforeach; ?>
    </div>
</body>
</html>

<?php
$conn->close();
?>
