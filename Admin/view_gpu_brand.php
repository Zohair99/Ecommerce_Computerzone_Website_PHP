<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for chipset table
if (isset($_GET['delete_chipset_name'])) {
    $chip_set = mysqli_real_escape_string($conn, $_GET['delete_chipset_name']); // Sanitize input

    // DELETE query for chipset table
    $delete_query = "DELETE FROM chipset WHERE chip_set = '$chip_set' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Chipset deleted successfully.'); window.location.href='view_gpu_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting chipset: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for graphic_card table
if (isset($_GET['delete_gpu_name'])) {
    $gpu_name = mysqli_real_escape_string($conn, $_GET['delete_gpu_name']); // Sanitize input

    // DELETE query for graphic_card table
    $delete_query = "DELETE FROM graphic_card WHERE gpu_name = '$gpu_name' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('GPU deleted successfully.'); window.location.href='view_gpu_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting GPU: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from chipset table
$chipset_query = "SELECT * FROM chipset";
$chipset_result = mysqli_query($conn, $chipset_query);

// Fetch data from graphic_card table
$gpu_query = "SELECT * FROM graphic_card";
$gpu_result = mysqli_query($conn, $gpu_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Chipset and GPU Data</title>

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
                if (table === 'chipset') {
                    window.location.href = "view_gpu_brand.php?delete_chipset_name=" + encodeURIComponent(name);
                } else if (table === 'gpu') {
                    window.location.href = "view_gpu_brand.php?delete_gpu_name=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- Chipset Table -->
    <h2>Chipset Table</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Chip Set</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($chipset_result) > 0) {
                while ($row = mysqli_fetch_assoc($chipset_result)) {
                    $id = isset($row['id']) ? $row['id'] : 'N/A';
                    $chip_set = isset($row['chip_set']) ?htmlspecialchars($row['chip_set']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $id; ?></td>
                <td><?php echo $chip_set; ?></td>
                <td>
                    <a href="edit_gpu_brand.php?type=chipset&name=<?php echo urlencode($chip_set); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('chipset', '<?php echo $chip_set; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='4'>No chipset data found.</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <!-- GPU Table -->
    <h2>GPU Table</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>GPU Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($gpu_result) > 0) {
                while ($row = mysqli_fetch_assoc($gpu_result)) {
                    $id = isset($row['id']) ? $row['id'] : 'N/A';
                    $gpu_name = isset($row['gpu_name']) ?htmlspecialchars($row['gpu_name']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $id; ?></td>
                <td><?php echo $gpu_name; ?></td>
                <td>
                    <a href="edit_gpu_brand.php?type=gpu&name=<?php echo urlencode($gpu_name); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('gpu', '<?php echo $gpu_name; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='4'>No GPU data found.</td></tr>";
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>