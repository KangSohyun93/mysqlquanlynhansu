<?php
$servername = "localhost";
$username = "root";
$password = "Sohyun280697.";
$dbname = "quanlynhansu";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

