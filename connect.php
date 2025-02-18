<?php
$servername = "localhost";
$username = "root";
$password = "Sohyun280697.";
$dbname = "quanlynhansu";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

