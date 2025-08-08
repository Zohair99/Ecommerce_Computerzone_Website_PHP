<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for ssd table
if (isset($_GET['delete_ssd'])) {
    $solid_disk = mysqli_real_escape_string($conn, $_GET['delete_ssd']); // Sanitize input

    // DELETE query for ssd table
    $delete_query = "DELETE FROM ssd WHERE solid_disk = '$solid_disk' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('SSD deleted successfully.'); window.location.href='view_ssd_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting SSD: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for capacity table
if (isset($_GET['delete_capacity'])) {
    $c_storage = mysqli_real_escape_string($conn, $_GET['delete_capacity']); // Sanitize input

    // DELETE query for capacity table
    $delete_query = "DELETE FROM s_capacity WHERE c_storage = '$c_storage' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Capacity deleted successfully.'); window.location.href='view_ssd_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Capacity: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from ssd table
$ssd_query = "SELECT * FROM ssd ORDER BY created_at DESC;";
$ssd_result = mysqli_query($conn, $ssd_query);

// Fetch data from capacity table
$capacity_query = "SELECT * FROM s_capacity ORDER BY created_at DESC;";
$capacity_result = mysqli_query($conn, $capacity_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View SSD and Capacity Data</title>

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
                if (table === 'ssd') {
                    window.location.href = "view_ssd_brand.php?delete_ssd=" + encodeURIComponent(name);
                } else if (table === 'capacity') {
                    window.location.href = "view_ssd_brand.php?delete_capacity=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- SSD Table -->
    <h2>SSD Table</h2>
    <table>
        <thead>
            <tr>
                <th>Solid Disk</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($ssd_result) > 0) {
                while ($row = mysqli_fetch_assoc($ssd_result)) {
                    $solid_disk = isset($row['solid_disk']) ? htmlspecialchars($row['solid_disk']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $solid_disk; ?></td>
                <td>
                    <a href="edit_ssd_brand.php?type=ssd&name=<?php echo urlencode($solid_disk); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('ssd', '<?php echo $solid_disk; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No SSD data found.</td></tr>";
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
                    <a href="edit_ssd_brand.php?type=capacity&name=<?php echo urlencode($c_storage); ?>" class="action-icons edit-icon">
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