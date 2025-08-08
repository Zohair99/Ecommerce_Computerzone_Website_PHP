<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for categories_store table
if (isset($_GET['delete_cattrones'])) {
    $cattrones = mysqli_real_escape_string($conn, $_GET['delete_cattrones']);
    echo "Deleting cattrone: " . $cattrones;

    $delete_query = "DELETE FROM categories_store WHERE cattrones = '$cattrones' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Category (cattrone) deleted successfully.'); window.location.href='view_categories_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting cattrone: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for categories_brand table
if (isset($_GET['delete_catbrand'])) {
    $catbrand = mysqli_real_escape_string($conn, $_GET['delete_catbrand']);
    echo "Deleting brand: " . $catbrand;

    $delete_query = "DELETE FROM categories_brand WHERE catbrand = '$catbrand' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Brand deleted successfully.'); window.location.href='view_categories_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting brand: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch records
$cattrones_result = mysqli_query($conn, "SELECT * FROM categories_store ORDER BY created_at DESC");
$catbrand_result = mysqli_query($conn, "SELECT * FROM categories_brand ORDER BY created_at DESC");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Categories & Brands</title>
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
        }    </style>
    <script>
        function confirmDelete(table, name) {
            if (confirm("Are you sure you want to delete this record?")) {
                if (table === 'cattrones') {
                    window.location.href = "view_categories_brand.php?delete_cattrones=" + encodeURIComponent(name);
                } else if (table === 'catbrand') {
                    window.location.href = "view_categories_brand.php?delete_catbrand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <h2>Category (Cattrones)</h2>
    <table>
        <thead>
            <tr>
                <th>Cattrone</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($cattrones_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($cattrones_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['cattrones']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_category.php?type=cattrones&name=<?= urlencode($row['cattrones']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('cattrones', '<?= $row['cattrones'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No categories found.</td></tr>
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
            <?php if (mysqli_num_rows($catbrand_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($catbrand_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['catbrand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_category.php?type=catbrand&name=<?= urlencode($row['catbrand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('catbrand', '<?= $row['catbrand'] ?>');" class="action-icons delete-icon">
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
mysqli_close($conn);
?>
