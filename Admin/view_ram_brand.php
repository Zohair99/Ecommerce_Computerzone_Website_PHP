<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for memory table
if (isset($_GET['delete_memory'])) {
    $module = mysqli_real_escape_string($conn, $_GET['delete_memory']); // Sanitize input

    // DELETE query for memory table
    $delete_query = "DELETE FROM memory WHERE module = '$module' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Memory module deleted successfully.'); window.location.href='view_ram_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Memory module: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for r_capacity table
if (isset($_GET['delete_capacity'])) {
    $capacity = mysqli_real_escape_string($conn, $_GET['delete_capacity']); // Sanitize input

    // DELETE query for r_capacity table
    $delete_query = "DELETE FROM r_capacity WHERE capacity = '$capacity' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Capacity deleted successfully.'); window.location.href='view_ram_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Capacity: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from memory table
$memory_query = "SELECT * FROM memory ORDER BY created_at DESC";
$memory_result = mysqli_query($conn, $memory_query);

// Fetch data from r_capacity table
$capacity_query = "SELECT * FROM r_capacity ORDER BY created_at DESC";
$capacity_result = mysqli_query($conn, $capacity_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Memory and Capacity Data</title>

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
                if (table === 'memory') {
                    window.location.href = "view_ram_brand.php?delete_memory=" + encodeURIComponent(name);
                } else if (table === 'capacity') {
                    window.location.href = "view_ram_brand.php?delete_capacity=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- Memory Table -->
    <h2>Memory Table</h2>
    <table>
        <thead>
            <tr>
                <th>Memory Module / RAM</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($memory_result) > 0) {
                while ($row = mysqli_fetch_assoc($memory_result)) {
                    $module = isset($row['module']) ? htmlspecialchars($row['module']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $module; ?></td>
                <td>
                    <a href="edit_ram_brand.php?type=memory&name=<?php echo urlencode($module); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('memory', '<?php echo $module; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Memory data found.</td></tr>";
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
                    $capacity = isset($row['capacity']) ? htmlspecialchars($row['capacity']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $capacity; ?></td>
                <td>
                    <a href="edit_ram_brand.php?type=capacity&name=<?php echo urlencode($capacity); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('capacity', '<?php echo $capacity; ?>');" class="action-icons delete-icon">
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