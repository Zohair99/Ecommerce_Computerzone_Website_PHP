<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle product deletion using ID
if (isset($_GET['delete_id'])) {
    $id = intval($_GET['delete_id']); // Convert to integer for security

    // DELETE query from 'peripheralsmics' table
    $delete_query = "DELETE FROM peripheralsmics WHERE id = $id LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Product deleted successfully.'); window.location.href='view_peripherals-mics.php';</script>"; 
    } else {
        echo "<script>alert('Error deleting product: " . mysqli_error($conn) . "');</script>";
    }
}

$fetch_query = "SELECT * FROM peripheralsmics";
$result = mysqli_query($conn, $fetch_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Peripherals / Misc Product Table</title>

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
            if (confirm("Are you sure you want to delete this product?")) {
                window.location.href = "view_peripherals-mics.php?delete_id=" + id;
            }
        }
    </script>
</head>
<body>

    <table>
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Product Price</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $id = isset($row['id']) ? $row['id'] : 'N/A';
                    $name = isset($row['name']) ? htmlspecialchars($row['name']) : 'No Name';
                    $image = isset($row['image']) ? htmlspecialchars($row['image']) : 'placeholder.jpg';
                    $price = isset($row['price']) ? number_format((float)$row['price'], 2) : '0.00'; // Cast to float for number_format
                    
            ?>
            <tr>
                <td><?php echo $id; ?></td>
                <td><?php echo $name; ?></td>
                <td>
                    <img src="Admin/images/<?php echo $image; ?>" alt="Product Image" onerror="this.src='placeholder.jpg'">
                </td>
                <td><?php echo $price; ?> $</td>
                
                <td>
                    <a href="edit_peripherals-mics.php?edit_id=<?php echo $id; ?>" class="action-icons edit-icon"> <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete(<?php echo $id; ?>);" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='6'>No peripherals or miscellaneous products found.</td></tr>"; // Adjusted colspan and message
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>