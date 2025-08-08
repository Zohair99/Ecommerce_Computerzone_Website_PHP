<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Delete from deskcomp_store
if (isset($_GET['delete_deskcompstore'])) {
    $deskcompstore = mysqli_real_escape_string($conn, $_GET['delete_deskcompstore']);
    $delete_query = "DELETE FROM deskcomp_store WHERE deskcompstore = '$deskcompstore' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Deskcomp Store deleted successfully.'); window.location.href='view_deskcomp_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting deskcomp store: " . mysqli_error($conn) . "');</script>";
    }
}

// Delete from deskcomp_brand
if (isset($_GET['delete_deskcompbrand'])) {
    $deskcompbrand = mysqli_real_escape_string($conn, $_GET['delete_deskcompbrand']);
    $delete_query = "DELETE FROM deskcomp_brand WHERE deskcompbrand = '$deskcompbrand' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Deskcomp Brand deleted successfully.'); window.location.href='view_deskcomp_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting deskcomp brand: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data
$store_result = mysqli_query($conn, "SELECT * FROM deskcomp_store ORDER BY created_at DESC");
$brand_result = mysqli_query($conn, "SELECT * FROM deskcomp_brand ORDER BY created_at DESC");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Deskcomp Stores & Brands</title>
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
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
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
                if (table === 'deskcompstore') {
                    window.location.href = "view_deskcomp_brand.php?delete_deskcompstore=" + encodeURIComponent(name);
                } else if (table === 'deskcompbrand') {
                    window.location.href = "view_deskcomp_brand.php?delete_deskcompbrand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <h2>Deskcomp Stores</h2>
    <table>
        <thead>
            <tr>
                <th>Store Name</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($store_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($store_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['deskcompstore']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_deskcomp_brand.php?type=deskcompstore&name=<?= urlencode($row['deskcompstore']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('deskcompstore', '<?= $row['deskcompstore'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No deskcomp stores found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

    <h2>Deskcomp Brands</h2>
    <table>
        <thead>
            <tr>
                <th>Brand Name</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($brand_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($brand_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['deskcompbrand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_deskcomp_brand.php?type=deskcompbrand&name=<?= urlencode($row['deskcompbrand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('deskcompbrand', '<?= $row['deskcompbrand'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No deskcomp brands found.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>

</body>
</html>

<?php
mysqli_close($conn);
?>
