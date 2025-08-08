<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for carttrones_store table
if (isset($_GET['delete_cattronesstore'])) {
    $cattronesstore = mysqli_real_escape_string($conn, $_GET['delete_cattronesstore']);
    
    // Debugging: Check if $cattronesstore is coming through correctly
    echo "Deleting carttrones store: " . $cattronesstore;

    $delete_query = "DELETE FROM carttrones_store WHERE cattronesstore = '$cattronesstore' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Carttrones store deleted successfully.'); window.location.href='view_carttrones_brand.php';</script>";
    } else {
        // More detailed error message for debugging
        echo "<script>alert('Error deleting Carttrones store: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for carttrones_brand table
if (isset($_GET['delete_carttronesbrand'])) {
    $carttronesbrand = mysqli_real_escape_string($conn, $_GET['delete_carttronesbrand']);
    
    // Debugging: Check if $carttronesbrand is coming through correctly
    echo "Deleting brand: " . $carttronesbrand;

    $delete_query = "DELETE FROM carttrones_brand WHERE carttronesbrand = '$carttronesbrand' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Carttrones brand deleted successfully.'); window.location.href='view_carttrones_brand.php';</script>";
    } else {
        // More detailed error message for debugging
        echo "<script>alert('Error deleting Carttrones brand: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch records for display
$carttrones_store_result = mysqli_query($conn, "SELECT * FROM carttrones_store ORDER BY created_at DESC");
$carttrones_brand_result = mysqli_query($conn, "SELECT * FROM carttrones_brand ORDER BY created_at DESC");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Carttrones Stores & Brands</title>
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
                if (table === 'cattronesstore') {
                    window.location.href = "view_carttrones_brand.php?delete_cattronesstore=" + encodeURIComponent(name);
                } else if (table === 'carttronesbrand') {
                    window.location.href = "view_carttrones_brand.php?delete_carttronesbrand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <h2>Carttrones Stores</h2>
    <table>
        <thead>
            <tr>
                <th>Carttrones Store</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($carttrones_store_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($carttrones_store_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['cattronesstore']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_carttrones_brand.php?type=cattronesstore&name=<?= urlencode($row['cattronesstore']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('cattronesstore', '<?= $row['cattronesstore'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No carttrones stores found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

    <h2>Carttrones Brands</h2>
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
            <?php if (mysqli_num_rows($carttrones_brand_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($carttrones_brand_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['carttronesbrand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_carttrones_brand.php?type=carttronesbrand&name=<?= urlencode($row['carttronesbrand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('carttronesbrand', '<?= $row['carttronesbrand'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No carttrones brands found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

</body>
</html>

<?php
// Close the connection
mysqli_close($conn);
?>