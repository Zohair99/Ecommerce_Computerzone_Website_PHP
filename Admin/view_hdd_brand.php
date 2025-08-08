<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for hdd table
if (isset($_GET['delete_hdd'])) {
    $hard_disk = mysqli_real_escape_string($conn, $_GET['delete_hdd']); // Sanitize input

    // DELETE query for hdd table
    $delete_query = "DELETE FROM hdd WHERE hard_disk = '$hard_disk' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('HDD deleted successfully.'); window.location.href='view_hdd_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting HDD: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for capacity table
if (isset($_GET['delete_capacity'])) {
    $c_storage = mysqli_real_escape_string($conn, $_GET['delete_capacity']); // Sanitize input

    // DELETE query for capacity table
    $delete_query = "DELETE FROM capacity WHERE c_storage = '$c_storage' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Capacity deleted successfully.'); window.location.href='view_hdd_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Capacity: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from hdd table
$hdd_query = "SELECT * FROM hdd ORDER BY created_at DESC;";
$hdd_result = mysqli_query($conn, $hdd_query);

// Fetch data from capacity table
$capacity_query = "SELECT * FROM capacity ORDER BY created_at DESC";
$capacity_result = mysqli_query($conn, $capacity_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View HDD and Capacity Data</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #212529;
            color: #fff;
            text-transform: uppercase;
            font-size: 14px;
        }
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        td {
            font-size: 14px;
            color: #333;
            border-bottom: 1px solid #ddd;
        }
        .action-icons {
            font-size: 16px;
            cursor: pointer;
            padding: 5px;
            text-decoration: none;
        }
        .edit-icon {
            color: #007bff;
        }
        .edit-icon:hover {
            color: #0056b3;
        }
        .delete-icon {
            color: #dc3545;
        }
        .delete-icon:hover {
            color: #c82333;
        }
    </style>

    <script>
        function confirmDelete(table, name) {
            if (confirm("Are you sure you want to delete this record?")) {
                if (table === 'hdd') {
                    window.location.href = "view_hdd_brand.php?delete_hdd=" + encodeURIComponent(name);
                } else if (table === 'capacity') {
                    window.location.href = "view_hdd_brand.php?delete_capacity=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- HDD Table -->
    <h2>HDD Table</h2>
    <table>
        <thead>
            <tr>
                <th>Hard Disk</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($hdd_result) > 0) {
                while ($row = mysqli_fetch_assoc($hdd_result)) {
                    $hard_disk = isset($row['hard_disk']) ? htmlspecialchars($row['hard_disk']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $hard_disk; ?></td>
                <td>
                    <a href="edit_hdd_brand.php?type=hdd&name=<?php echo urlencode($hard_disk); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('hdd', '<?php echo $hard_disk; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No HDD data found.</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <!-- Capacity Table -->
    <h2>Capacity Table</h2>
    <table>
        <thead>
            <tr>
                <th>Capacity</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($capacity_result) > 0) {
                while ($row = mysqli_fetch_assoc($capacity_result)) {
                    $c_storage = isset($row['c_storage']) ? htmlspecialchars($row['c_storage']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $c_storage; ?></td>
                <td>
                    <a href="edit_hdd_brand.php?type=capacity&name=<?php echo urlencode($c_storage); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('capacity', '<?php echo $c_storage; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Capacity data found.</td></tr>";
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>