<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle deletion for laptopused_store table
if (isset($_GET['delete_laptopused'])) {
    $laptopused = mysqli_real_escape_string($conn, $_GET['delete_laptopused']);

    $delete_query = "DELETE FROM laptopused_store WHERE laptopused = '$laptopused' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Laptop brand deleted successfully.'); window.location.href='view_laptopused_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Laptop brand: " . mysqli_error($conn) . "');</script>";
    }
}

// Handle deletion for processor_store table
if (isset($_GET['delete_processor'])) {
    $processor = mysqli_real_escape_string($conn, $_GET['delete_processor']);

    $delete_query = "DELETE FROM processor_store WHERE processor = '$processor' LIMIT 1";

    if (mysqli_query($conn, $delete_query)) {
        echo "<script>alert('Processor deleted successfully.'); window.location.href='view_laptopused_brand.php';</script>";
    } else {
        echo "<script>alert('Error deleting Processor: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch data
$laptopused_result = mysqli_query($conn, "SELECT * FROM laptopused_store ORDER BY created_at DESC");
$processor_result = mysqli_query($conn, "SELECT * FROM processor_store ORDER BY created_at DESC");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Laptop Brands and Processors</title>
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
                if (table === 'laptopused') {
                    window.location.href = "view_laptopused_brand.php?delete_laptopused=" + encodeURIComponent(name);
                } else if (table === 'processor') {
                    window.location.href = "view_laptopused_brand.php?delete_processor=" + encodeURIComponent(name);
                }
            }
        }
    </script>
</head>
<body>

    <h2>Laptop Brands</h2>
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
            <?php
            if (mysqli_num_rows($laptopused_result) > 0) {
                while ($row = mysqli_fetch_assoc($laptopused_result)) {
                    $brand = htmlspecialchars($row['laptopused']);
                    $created = htmlspecialchars($row['created_at']);
            ?>
            <tr>
                <td><?= $brand ?></td>
                <td><?= $created ?></td>
                <td>
                    <a href="edit_laptop_brand.php?type=laptopused&name=<?= urlencode($brand) ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('laptopused', '<?= $brand ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='4'>No Laptop brands found.</td></tr>";
            }
            ?>
        </tbody>
    </table>

    <h2>Processors</h2>
    <table>
        <thead>
            <tr>
                <th>Processor</th>
                <th>Created At</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php
            if (mysqli_num_rows($processor_result) > 0) {
                while ($row = mysqli_fetch_assoc($processor_result)) {
                    $processor = htmlspecialchars($row['processor']);
                    $created = htmlspecialchars($row['created_at']);
            ?>
            <tr>
                <td><?= $processor ?></td>
                <td><?= $created ?></td>
                <td>
                    <a href="edit_laptop_brand.php?type=processor&name=<?= urlencode($processor) ?>" class="action-icons edit-icon">
                        <i class="fa fa-pencil-alt"></i>
                    </a>
                </td>
                <td>
                    <a href="#" onclick="confirmDelete('processor', '<?= $processor ?>');" class="action-icons delete-icon">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php
                }
            } else {
                echo "<tr><td colspan='4'>No Processors found.</td></tr>";
            }

            mysqli_close($conn);
            ?>
        </tbody>
    </table>

</body>
</html>
