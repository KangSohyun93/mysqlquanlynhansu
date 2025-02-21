<?php
include 'connect.php';

if (isset($_GET['table'])) {
    $table = $_GET['table'];
    echo "<h2>📋 Table: " . ucfirst($table) . "</h2>";


    if ($table == 'employee') {
        echo "<a href='add_employee.php' class='btn btn-success' style='margin-bottom: 10px;'>+ Add Employee</a><br><br>";
    }

    // Nút quay lại danh sách bảng
    echo "<a href='index.php' class='btn btn-back'>⬅ Back to Table List</a><br><br>";

    $query = "SELECT * FROM $table";
    
    if ($table == 'employee' && isset($_GET['search']) && !empty($_GET['search'])) {
        $search = $conn->real_escape_string($_GET['search']);
        $query = "SELECT * FROM employee WHERE emp_id LIKE '%$search%' OR first_name LIKE '%$search%' OR last_name LIKE '%$search%'";
    }

    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        echo "<table border='1'>";
        echo "<tr>";

        $column_names = [
            "emp_id" => "Emp ID",
            "first_name" => "First Name",
            "last_name" => "Last Name",
            "dob" => "Date of Birth",
            "joindate" => "Join Date",
            "gender" => "Gender",
            "position" => "Position",
            "department" => "Department",
            "salary" => "Salary"
        ];

        // Hiển thị tiêu đề cột
        while ($field = $result->fetch_field()) {
            $col_name = $field->name;
            echo "<th>" . ($column_names[$col_name] ?? ucfirst(str_replace('_', ' ', $col_name))) . "</th>";
        }

        if ($table == 'employee') {
            echo "<th>Actions</th>";
        }
        echo "</tr>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            foreach ($row as $key => $value) {
                if (preg_match('/date|dob|joindate/i', $key)) {
                    $value = date("Y-m-d", strtotime($value));
                }
                echo "<td>{$value}</td>";
            }
            if ($table == 'employee') {
                echo "<td>
                        <a href='edit_employee.php?emp_id={$row['emp_id']}' class='btn btn-warning'>Edit</a>
                        <a href='javascript:void(0);' class='btn btn-danger' onclick='deleteEmployee({$row['emp_id']})'>Delete</a>
                      </td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "<p>No data available.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Table: <?php echo ucfirst($table); ?></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        .btn {
            display: inline-block;
            padding: 10px 12px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
            font-weight: bold;
        }
        .btn-success { background-color: #28a745; color: white; }
        .btn-warning { background-color: #ffc107; color: black; }
        .btn-danger { background-color: #dc3545; color: white; }
        .btn-back { background-color: #007bff; color: white; }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px 15px;
            text-align: center;
            white-space: nowrap;
        }
        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
    <!-- Thêm thư viện SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
function deleteEmployee(empId) {
    Swal.fire({
        title: "Are you sure to delete?",
        text: "Employee data will be completely deleted!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Delete",
        cancelButtonText: "Cancel"
    }).then((result) => {
        if (result.isConfirmed) {
            fetch("delete_employee.php", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: `emp_id=${empId}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    Swal.fire("Deleted!", data.message, "success").then(() => {
                        location.reload(); // Tải lại trang sau khi xóa
                    });
                } else {
                    Swal.fire("Error!", data.message, "error");
                }
            })
            .catch(error => Swal.fire("Error!", "Error occurs!", "error"));
        }
    });
}
</script>

</head>
<body>
</body>
</html>
