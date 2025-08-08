<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle product deletion
if (isset($_GET['delete_id'])) {
    $id = intval($_GET['delete_id']);
    $delete_query = "DELETE FROM tabletacc WHERE id = $id LIMIT 1";
    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Tablet accessory deleted successfully.'); window.location.href='view_tabletacc.php';</script>";
    } else {
        echo "<script>alert('Error deleting tablet accessory: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch all tablet accessories
$fetch_query = "SELECT * FROM tabletacc";
$result = mysqli_query($conn, $fetch_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tablet Accessories Table</title>
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
            if (confirm("Are you sure you want to delete this tablet accessory?")) {
                window.location.href = "view_tabletacc.php?delete_id=" + id;
            }
        }
    </script>
</head>
<body>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Offer</th>
            <th>Name</th>
            <th>Image</th>
            <th>Price</th>
            <th>Old Price</th>
            <th>Store (Brand)</th>
            <th>Brand (Processor)</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <?php
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $id = $row['id'];
                $offer = htmlspecialchars($row['offer']);
                $name = htmlspecialchars($row['name']);
                $image = htmlspecialchars($row['image']);
                $price = htmlspecialchars($row['price']);
                $old_price = htmlspecialchars($row['old_price']);
                $brand = htmlspecialchars($row['brand']);         // tabletacc_store.tabletaccstore
                $processor = htmlspecialchars($row['processor']); // tabletacc_brand.tabletaccbrand

                echo "<tr>
                    <td>{$id}</td>
                    <td>{$offer}</td>
                    <td>{$name}</td>
                    <td><img src='Admin/images/{$image}' alt='Tablet Accessory Image' onerror=\"this.src='placeholder.jpg'\"></td>
                    <td>{$price} $</td>
                    <td>{$old_price} $</td>
                    <td>{$brand}</td>
                    <td>{$processor}</td>
                    <td><a href='edit_tabletacc.php?edit_id={$id}' class='action-icons edit-icon'><i class='fa fa-pencil-alt'></i></a></td>
                    <td><a href='#' onclick='confirmDelete({$id});' class='action-icons delete-icon'><i class='fa fa-trash'></i></a></td>
                </tr>";
            }
        } else {
            echo "<tr><td colspan='10'>No tablet accessories found.</td></tr>";
        }
        mysqli_close($conn);
        ?>
    </tbody>
</table>

</body>
</html>
