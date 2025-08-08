<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for camdrone_store table
if (isset($_GET['delete_camdrone'])) {
    $camdrone = mysqli_real_escape_string($conn, $_GET['delete_camdrone']);
    
    // Debugging: Check if $camdrone is coming through correctly
    echo "Deleting camera drone: " . $camdrone;

    $delete_query = "DELETE FROM camdrone_store WHERE camdrone = '$camdrone' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Camera drone deleted successfully.'); window.location.href='view_cameradrone_brand.php';</script>";
    } else {
        // More detailed error message for debugging
        echo "<script>alert('Error deleting Camera drone: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for cambrand_store table
if (isset($_GET['delete_cambrand'])) {
    $cambrand = mysqli_real_escape_string($conn, $_GET['delete_cambrand']);
    
    // Debugging: Check if $cambrand is coming through correctly
    echo "Deleting brand: " . $cambrand;

    $delete_query = "DELETE FROM cambrand_store WHERE cambrand = '$cambrand' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Brand deleted successfully.'); window.location.href='view_cameradrone_brand.php';</script>";
    } else {
        // More detailed error message for debugging
        echo "<script>alert('Error deleting Brand: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch records for display
$camdrone_result = mysqli_query($conn, "SELECT * FROM camdrone_store ORDER BY created_at DESC");
$cambrand_result = mysqli_query($conn, "SELECT * FROM cambrand_store ORDER BY created_at DESC");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Camera Drones & Brands</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }
        h2 {
            margin-top: 30px;
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
                if (table === 'camdrone') {
                    window.location.href = "view_cameradrone_brand.php?delete_camdrone=" + encodeURIComponent(name);
                } else if (table === 'cambrand') {
                    window.location.href = "view_cameradrone_brand.php?delete_cambrand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <h2>Camera Drones</h2>
    <table>
        <thead>
            <tr>
                <th>Camera Drone</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($camdrone_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($camdrone_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['camdrone']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_camdrone_brand.php?type=camdrone&name=<?= urlencode($row['camdrone']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('camdrone', '<?= $row['camdrone'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No camera drones found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

    <h2>Brands</h2>
    <table>
        <thead>
            <tr>
                <th>Brand</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($cambrand_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($cambrand_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['cambrand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_camdrone_brand.php?type=cambrand&name=<?= urlencode($row['cambrand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('cambrand', '<?= $row['cambrand'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No brands found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

</body>
</html>

<?php
// Close the connection
mysqli_close($conn);
?>
