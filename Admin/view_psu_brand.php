<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for power table
if (isset($_GET['delete_power'])) {
    $supply = mysqli_real_escape_string($conn, $_GET['delete_power']); // Sanitize input

    // DELETE query for power table
    $delete_query = "DELETE FROM power WHERE supply = '$supply' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Power supply deleted successfully.'); window.location.href='view_psu_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Power supply: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for wattage table
if (isset($_GET['delete_wattage'])) {
    $watt = mysqli_real_escape_string($conn, $_GET['delete_wattage']); // Sanitize input

    // DELETE query for wattage table
    $delete_query = "DELETE FROM wattage WHERE watt = '$watt' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Wattage deleted successfully.'); window.location.href='view_psu_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Wattage: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data from power table
$power_query = "SELECT * FROM power";
$power_result = mysqli_query($conn, $power_query);

// Fetch data from wattage table
$wattage_query = "SELECT * FROM wattage ORDER BY created_at DESC;";
$wattage_result = mysqli_query($conn, $wattage_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Power and Wattage Data</title>

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
                if (table === 'power') {
                    window.location.href = "view_psu_brand.php?delete_power=" + encodeURIComponent(name);
                } else if (table === 'wattage') {
                    window.location.href = "view_psu_brand.php?delete_wattage=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <!-- Power Table -->
    <h2>Power Table</h2>
    <table>
        <thead>
            <tr>
                <th>Power Supply</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($power_result) > 0) {
                while ($row = mysqli_fetch_assoc($power_result)) {
                    $supply = isset($row['supply']) ? htmlspecialchars($row['supply']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $supply; ?></td>
                <td>
                    <a href="edit_psu_brand.php?type=power&name=<?php echo urlencode($supply); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('power', '<?php echo $supply; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Power data found.</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <!-- Wattage Table -->
    <h2>Wattage Table</h2>
    <table>
        <thead>
            <tr>
                <th>Wattage</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($wattage_result) > 0) {
                while ($row = mysqli_fetch_assoc($wattage_result)) {
                    $watt = isset($row['watt']) ? htmlspecialchars($row['watt']) : 'No Data';
            ?>
            <tr>
                <td><?php echo $watt; ?></td>
                <td>
                    <a href="edit_psu_brand.php?type=wattage&name=<?php echo urlencode($watt); ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('wattage', '<?php echo $watt; ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='3'>No Wattage data found.</td></tr>";
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>
