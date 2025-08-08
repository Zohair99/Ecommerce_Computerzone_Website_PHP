<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for tabletacc_store (category/store)
if (isset($_GET['delete_tabletacc_store'])) {
    $store_name = mysqli_real_escape_string($conn, $_GET['delete_tabletacc_store']);
    
    // Check dependency: tabletacc.brand references tabletacc_store.tabletaccstore
    $check_dependency_query = "SELECT COUNT(*) FROM tabletacc WHERE brand = '$store_name'";
    $dependency_result = mysqli_query($conn, $check_dependency_query);
    $row = mysqli_fetch_row($dependency_result);
    $dependency_count = $row[0];

    if ($dependency_count > 0) {
        echo "<script>alert('Cannot delete category/store: There are $dependency_count products associated with it. Please reassign or delete these products first.'); window.location.href='view_tabletacc_brand.php';</script>";
    } else {
        $delete_query = "DELETE FROM tabletacc_store WHERE tabletaccstore = '$store_name' LIMIT 1";
        if (mysqli_query($conn, $delete_query)) {
            echo "<script>alert('Tablet Accessories Category/Store deleted successfully.'); window.location.href='view_tabletacc_brand.php';</script>";
        } else {
            echo "<script>alert('Error deleting Tablet Accessories Category/Store: " . mysqli_error($conn) . "');</script>";
        }
    }
}

// Handle deletion for tabletacc_brand
if (isset($_GET['delete_tabletacc_brand'])) {
    $brand_name = mysqli_real_escape_string($conn, $_GET['delete_tabletacc_brand']);

    // Check dependency: tabletacc.processor references tabletacc_brand.tabletaccbrand
    $check_dependency_query = "SELECT COUNT(*) FROM tabletacc WHERE processor = '$brand_name'";
    $dependency_result = mysqli_query($conn, $check_dependency_query);
    $row = mysqli_fetch_row($dependency_result);
    $dependency_count = $row[0];

    if ($dependency_count > 0) {
        echo "<script>alert('Cannot delete brand: There are $dependency_count products associated with it. Please reassign or delete these products first.'); window.location.href='view_tabletacc_brand.php';</script>";
    } else {
        $delete_query = "DELETE FROM tabletacc_brand WHERE tabletaccbrand = '$brand_name' LIMIT 1";
        if (mysqli_query($conn, $delete_query)) {
            echo "<script>alert('Tablet Accessories Brand deleted successfully.'); window.location.href='view_tabletacc_brand.php';</script>";
        } else {
            echo "<script>alert('Error deleting Tablet Accessories Brand: " . mysqli_error($conn) . "');</script>";
        }
    }
}

// Fetch records
$store_result = mysqli_query($conn, "SELECT * FROM tabletacc_store ORDER BY created_at DESC");
$brand_result = mysqli_query($conn, "SELECT * FROM tabletacc_brand ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Tablet Accessories Categories & Brands</title>
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
        function confirmDelete(type, name) {
            if (confirm("Are you sure you want to delete this record?")) {
                if (type === 'store') {
                    window.location.href = "view_tabletacc_brand.php?delete_tabletacc_store=" + encodeURIComponent(name);
                } else if (type === 'brand') {
                    window.location.href = "view_tabletacc_brand.php?delete_tabletacc_brand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

<h2>Tablet Accessories Categories</h2>
<table>
    <thead>
        <tr>
            <th>Category/Store Name</th>
            <th>Created At</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <?php if (mysqli_num_rows($store_result) > 0): ?>
            <?php while ($row = mysqli_fetch_assoc($store_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['tabletaccstore']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_tabletacc.php?type=store&name=<?= urlencode($row['tabletaccstore']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('store', '<?= htmlspecialchars($row['tabletaccstore']) ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4">No tablet accessories categories found.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<h2>Tablet Accessories Brands</h2>
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
                    <td><?= htmlspecialchars($row['tabletaccbrand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_tabletacc.php?type=brand&name=<?= urlencode($row['tabletaccbrand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('brand', '<?= htmlspecialchars($row['tabletaccbrand']) ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4">No tablet accessories brands found.</td>
            </tr>
        <?php
        endif;
        mysqli_close($conn);
        ?>
    </tbody>
</table>

</body>
</html>
