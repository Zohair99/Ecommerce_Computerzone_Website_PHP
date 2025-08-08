<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for printers table
if (isset($_GET['delete_printer_model'])) {
    $model = mysqli_real_escape_string($conn, $_GET['delete_printer_model']); // Sanitize input

    // DELETE query for printers table
    $delete_query = "DELETE FROM printers WHERE model = '$model' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Printer deleted successfully.'); window.location.href='view_printer_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Printer: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for series table
if (isset($_GET['delete_series_name'])) {
    $series = mysqli_real_escape_string($conn, $_GET['delete_series_name']); // Sanitize input

    // DELETE query for series table
    $delete_query = "DELETE FROM series WHERE m_series = '$series' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Series deleted successfully.'); window.location.href='view_printer_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Series: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from printers table
$printers_query = "SELECT * FROM printers";
$printers_result = mysqli_query($conn, $printers_query);

// Fetch data from series table
$series_query = "SELECT * FROM series";
$series_result = mysqli_query($conn, $series_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Printers and Series Data</title>

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
                if (table === 'printers') {
                    window.location.href = "view_printer_brand.php?delete_printer_model=" + encodeURIComponent(name);
                } else if (table === 'series') {
                    window.location.href = "view_printer_brand.php?delete_series_name=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- Printers Table -->
    <h2>Printers Table</h2>
    <table>
        <thead>
            <tr>
                <th>Model</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($printers_result) > 0) {
                while ($row = mysqli_fetch_assoc($printers_result)) {
                    $model = isset($row['model']) ? htmlspecialchars($row['model']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $model; ?></td>
                <td>
                    <a href="edit_printer_brand.php?type=printers&name=<?php echo urlencode($model); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('printers', '<?php echo $model; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Printers data found.</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <!-- Series Table -->
    <h2>Series Table</h2>
    <table>
        <thead>
            <tr>
                <th>Series</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($series_result) > 0) {
                while ($row = mysqli_fetch_assoc($series_result)) {
                    $series = isset($row['m_series']) ? htmlspecialchars($row['m_series']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $series; ?></td>
                <td>
                    <a href="edit_printer_brand.php?type=series&name=<?php echo urlencode($series); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('series', '<?php echo $series; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Series data found.</td></tr>";
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>
