<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion by ID
if (isset($_GET['delete_id'])) {
    $id = intval($_GET['delete_id']);
    $delete_query = "DELETE FROM keyboard WHERE id = $id LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Keyboard product deleted successfully.'); window.location.href='view_keyboard.php';</script>";
    } else {
        echo "<script>alert('Error deleting product: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch keyboard products
$fetch_query = "SELECT * FROM keyboard ORDER BY id DESC";
$result = mysqli_query($conn, $fetch_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Keyboard Product List</title>
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
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
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
        img {
            display: block;
            margin: auto;
            border-radius: 4px;
            width: 50px;
            height: 50px;
            object-fit: contain;
            background: #fff;
            border: 1px solid #ddd;
            padding: 4px;
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
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this product?")) {
                window.location.href = "view_keyboard.php?delete_id=" + id;
            }
        }
    </script>
</head>
<body>

<h2>Keyboard Products</h2>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
            <th>Store</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Old Price</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <?php if (mysqli_num_rows($result) > 0): ?>
            <?php while ($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                    <td><?= $row['id'] ?></td>
                    <td><?= htmlspecialchars($row['name']) ?></td>
                    <td>
                        <img src="images/<?= htmlspecialchars($row['image']) ?>" onerror="this.src='placeholder.jpg'" alt="Product Image">
                    </td>
                    <td><?= htmlspecialchars($row['brand']) ?></td>
                    <td><?= htmlspecialchars($row['processor']) ?></td>
                    <td><?= htmlspecialchars($row['price']) ?></td>
                    <td><?= htmlspecialchars($row['old_price']) ?></td>
                    <td>
                        <a href="edit_keyboard.php?edit_id=<?= $row['id'] ?>" class="action-icons edit-icon">
                            <i class="fa fa-pencil-alt"></i>
                        </a>
                    </td>
                    <td>
                        <a href="#" onclick="confirmDelete(<?= $row['id'] ?>);" class="action-icons delete-icon">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr><td colspan="9">No keyboard products found.</td></tr>
        <?php endif;
        mysqli_close($conn);
        ?>
    </tbody>
</table>

</body>
</html>
