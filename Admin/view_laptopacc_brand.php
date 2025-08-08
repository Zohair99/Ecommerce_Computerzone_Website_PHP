<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for laptopacc_store table
if (isset($_GET['delete_laptopacc'])) {
    $laptopacc = mysqli_real_escape_string($conn, $_GET['delete_laptopacc']);
    $delete_query = "DELETE FROM laptopacc_store WHERE laptopacc = '$laptopacc' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Laptop accessory deleted successfully.'); window.location.href='view_laptopacc_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Laptop accessory: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for brand_store table
if (isset($_GET['delete_brand'])) {
    $brand = mysqli_real_escape_string($conn, $_GET['delete_brand']);
    $delete_query = "DELETE FROM brand_store WHERE brand = '$brand' LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Brand deleted successfully.'); window.location.href='view_laptopacc_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Brand: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch records
$laptopacc_result = mysqli_query($conn, "SELECT * FROM laptopacc_store ORDER BY created_at DESC");
$brand_result = mysqli_query($conn, "SELECT * FROM brand_store ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Accessories & Brands</title>
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
                if (table === 'laptopacc') {
                    window.location.href = "view_laptopacc_brand.php?delete_laptopacc=" + encodeURIComponent(name);
                } else if (table === 'brand') {
                    window.location.href = "view_laptopacc_brand.php?delete_brand=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <h2>Laptop Accessories</h2>
    <table>
        <thead>
            <tr>
                <th>Accessory</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if (mysqli_num_rows($laptopacc_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($laptopacc_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['laptopacc']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_laptop_brand.php?type=laptopacc&name=<?= urlencode($row['laptopacc']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('laptopacc', '<?= $row['laptopacc'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No accessories found.</td></tr>
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
            <?php if (mysqli_num_rows($brand_result) > 0): ?>
                <?php while ($row = mysqli_fetch_assoc($brand_result)): ?>
                <tr>
                    <td><?= htmlspecialchars($row['brand']) ?></td>
                    <td><?= htmlspecialchars($row['created_at']) ?></td>
                    <td>
                        <a href="edit_laptop_brand.php?type=brand&name=<?= urlencode($row['brand']) ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete('brand', '<?= $row['brand'] ?>');" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="4">No brands found.</td></tr>
            <?php endif;

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>
