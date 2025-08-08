<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for lcdmonitor table
if (isset($_GET['delete_lcdmonitor_name'])) {
    $monitor = mysqli_real_escape_string($conn, $_GET['delete_lcdmonitor_name']); // Sanitize input

    // DELETE query for lcdmonitor table
    $delete_query = "DELETE FROM lcdmonitor WHERE monitor = '$monitor' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('LCD Monitor deleted successfully.'); window.location.href='view_monitor_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting LCD Monitor: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for inches table
if (isset($_GET['delete_inches_name'])) {
    $size = mysqli_real_escape_string($conn, $_GET['delete_inches_name']); // Sanitize input

    // DELETE query for inches table
    $delete_query = "DELETE FROM inches WHERE size = '$size' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Size deleted successfully.'); window.location.href='view_monitor_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Size: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from lcdmonitor table
$lcdmonitor_query = "SELECT * FROM lcdmonitor";
$lcdmonitor_result = mysqli_query($conn, $lcdmonitor_query);

// Fetch data from inches table
$inches_query = "SELECT * FROM inches";
$inches_result = mysqli_query($conn, $inches_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View LCD Monitor and Size Data</title>

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
                if (table === 'lcdmonitor') {
                    window.location.href = "view_monitor_brand.php?delete_lcdmonitor_name=" + encodeURIComponent(name);
                } else if (table === 'inches') {
                    window.location.href = "view_monitor_brand.php?delete_inches_name=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- LCD Monitor Table -->
    <h2>LCD Monitor Table</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Monitor</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($lcdmonitor_result) > 0) {
                while ($row = mysqli_fetch_assoc($lcdmonitor_result)) {
                    $id = isset($row['id']) ? $row['id'] : 'N/A';
                    $monitor = isset($row['monitor']) ? htmlspecialchars($row['monitor']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $id; ?></td>
                <td><?php echo $monitor; ?></td>
                <td>
                    <a href="edit_lcd_brand.php?type=lcdmonitor&name=<?php echo urlencode($monitor); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('lcdmonitor', '<?php echo $monitor; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='4'>No LCD Monitor data found.</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <!-- Inches Table -->
    <h2>Inches Table</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Size</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($inches_result) > 0) {
                while ($row = mysqli_fetch_assoc($inches_result)) {
                    $id = isset($row['id']) ? $row['id'] : 'N/A';
                    $size = isset($row['size']) ? htmlspecialchars($row['size']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $id; ?></td>
                <td><?php echo $size; ?></td>
                <td>
                    <a href="edit_lcd_brand.php?type=inches&name=<?php echo urlencode($size); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('inches', '<?php echo $size; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='4'>No Size data found.</td></tr>";
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>