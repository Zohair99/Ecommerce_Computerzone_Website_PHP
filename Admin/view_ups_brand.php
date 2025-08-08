<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for ups_store
if (isset($_GET['delete_ups_store'])) {
    $store_name = mysqli_real_escape_string($conn, $_GET['delete_ups_store']);
    // Check for dependencies in the 'ups' table where 'brand' column references 'upsstore'
    $check_dependency_query = "SELECT COUNT(*) FROM ups WHERE brand = '$store_name'";
    $dependency_result = mysqli_query($conn, $check_dependency_query);
    $row = mysqli_fetch_row($dependency_result);
    $dependency_count = $row[0];

    if ($dependency_count > 0) {
        // Updated alert message and redirection URL
        echo "<script>alert('Cannot delete category/store: There are $dependency_count UPS products associated with it. Please reassign or delete these products first.'); window.location.href='view_ups_brand.php';</script>";
    } else {
        // Updated table and column name
        $delete_query = "DELETE FROM ups_store WHERE upsstore = '$store_name' LIMIT 1";
        if (mysqli_query($conn, $delete_query)) {
            // Updated alert message and redirection URL
            echo "<script>alert('UPS Category/Store deleted successfully.'); window.location.href='view_ups_brand.php';</script>";
        } else {
            // Updated error message
            echo "<script>alert('Error deleting UPS Category/Store: " . mysqli_error($conn) . "');</script>";
        }
    }
}

// Handle deletion for ups_brand
if (isset($_GET['delete_ups_brand'])) {
    $brand_name = mysqli_real_escape_string($conn, $_GET['delete_ups_brand']);
    // Check for dependencies in the 'ups' table where 'processor' column references 'upsbrand'
    $check_dependency_query = "SELECT COUNT(*) FROM ups WHERE processor = '$brand_name'";
    $dependency_result = mysqli_query($conn, $check_dependency_query);
    $row = mysqli_fetch_row($dependency_result);
    $dependency_count = $row[0];

    if ($dependency_count > 0) {
        // Updated alert message and redirection URL
        echo "<script>alert('Cannot delete brand: There are $dependency_count UPS products associated with it. Please reassign or delete these products first.'); window.location.href='view_ups_brand.php';</script>";
    } else {
        // Updated table and column name
        $delete_query = "DELETE FROM ups_brand WHERE upsbrand = '$brand_name' LIMIT 1";
        if (mysqli_query($conn, $delete_query)) {
            // Updated alert message and redirection URL
            echo "<script>alert('UPS Brand deleted successfully.'); window.location.href='view_ups_brand.php';</script>";
        } else {
            // Updated error message
            echo "<script>alert('Error deleting UPS Brand: " . mysqli_error($conn) . "');</script>";
        }
    }
}

// Fetch records for ups_store and ups_brand
// Updated table names and column names for fetching
$store_result = mysqli_query($conn, "SELECT * FROM ups_store ORDER BY created_at DESC");
$brand_result = mysqli_query($conn, "SELECT * FROM ups_brand ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View UPS Categories & Brands</title>
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
                if (table === 'store') {
                    // Updated URL parameter
                    window.location.href = "view_ups_brand.php?delete_ups_store=" + encodeURIComponent(name);
                } else if (table === 'brand') {
                    // Updated URL parameter
                    window.location.href = "view_ups_brand.php?delete_ups_brand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

<h2>UPS Categories</h2>
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
                    <td><?= htmlspecialchars($row['upsstore']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_ups_category.php?type=store&name=<?= urlencode($row['upsstore']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('store', '<?= $row['upsstore'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4">No UPS categories found.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>

<h2>UPS Brands</h2>
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
                    <td><?= htmlspecialchars($row['upsbrand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_ups_brand.php?type=brand&name=<?= urlencode($row['upsbrand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('brand', '<?= $row['upsbrand'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="4">No UPS brands found.</td>
            </tr>
        <?php endif;

        mysqli_close($conn);
        ?>
    </tbody>
</table>

</body>
</html>