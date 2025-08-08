<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for np table
if (isset($_GET['delete_np'])) {
    $network = mysqli_real_escape_string($conn, $_GET['delete_np']); // Sanitize input

    // DELETE query for np table
    $delete_query = "DELETE FROM np WHERE network = '$network' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Network deleted successfully.'); window.location.href='view_network_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Network: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for type table
if (isset($_GET['delete_type'])) {
    $n_type = mysqli_real_escape_string($conn, $_GET['delete_type']); // Sanitize input

    // DELETE query for type table
    $delete_query = "DELETE FROM type WHERE n_type = '$n_type' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Type deleted successfully.'); window.location.href='view_network_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Type: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from np table
$np_query = "SELECT * FROM np";
$np_result = mysqli_query($conn, $np_query);

// Fetch data from type table
$type_query = "SELECT * FROM type";
$type_result = mysqli_query($conn, $type_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View NP and Type Data</title>

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
                if (table === 'np') {
                    window.location.href = "view_network_brand.php?delete_np=" + encodeURIComponent(name);
                } else if (table === 'type') {
                    window.location.href = "view_network_brand.php?delete_type=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- NP Table -->
    <h2>NP Table</h2>
    <table>
        <thead>
            <tr>
                <th>Network</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($np_result) > 0) {
                while ($row = mysqli_fetch_assoc($np_result)) {
                    $network = isset($row['network']) ? htmlspecialchars($row['network']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $network; ?></td>
                <td>
                    <a href="edit_network_brand.php?type=np&name=<?php echo urlencode($network); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('np', '<?php echo $network; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Network data found.</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <!-- Type Table -->
    <h2>Type Table</h2>
    <table>
        <thead>
            <tr>
                <th>Type</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($type_result) > 0) {
                while ($row = mysqli_fetch_assoc($type_result)) {
                    $n_type = isset($row['n_type']) ? htmlspecialchars($row['n_type']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $n_type; ?></td>
                <td>
                    <a href="edit_network_brand.php?type=type&name=<?php echo urlencode($n_type); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('type', '<?php echo $n_type; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Type data found.</td></tr>";
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>