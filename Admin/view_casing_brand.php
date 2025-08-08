<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for casing_store table
if (isset($_GET['delete_casingstore'])) {
    $casingstore = mysqli_real_escape_string($conn, $_GET['delete_casingstore']);
    $delete_query = "DELETE FROM casing_store WHERE casingstore = '$casingstore' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Casing store deleted successfully.'); window.location.href='view_casing_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Casing store: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for casing_brand table
if (isset($_GET['delete_casingbrand'])) {
    $casingbrand = mysqli_real_escape_string($conn, $_GET['delete_casingbrand']);
    $delete_query = "DELETE FROM casing_brand WHERE casingbrand = '$casingbrand' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Casing brand deleted successfully.'); window.location.href='view_casing_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Casing brand: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch records for display
$casing_store_result = mysqli_query($conn, "SELECT * FROM casing_store ORDER BY created_at DESC");
$casing_brand_result = mysqli_query($conn, "SELECT * FROM casing_brand ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Casing Stores & Brands</title>
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
                if (table === 'casingstore') {
                    window.location.href = "view_casing_brand.php?delete_casingstore=" + encodeURIComponent(name);
                } else if (table === 'casingbrand') {
                    window.location.href = "view_casing_brand.php?delete_casingbrand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <h2>Casing Stores</h2>
    <table>
        <thead>
            <tr>
                <th>Casing Store</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($casing_store_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($casing_store_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['casingstore']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_casing_brand.php?type=casingstore&name=<?= urlencode($row['casingstore']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('casingstore', '<?= $row['casingstore'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No casing stores found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

    <h2>Casing Brands</h2>
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
            <?php if (mysqli_num_rows($casing_brand_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($casing_brand_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['casingbrand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_casing_brand.php?type=casingbrand&name=<?= urlencode($row['casingbrand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('casingbrand', '<?= $row['casingbrand'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No casing brands found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

</body>
</html>

<?php
mysqli_close($conn);
?>
