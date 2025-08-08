<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if (isset($_POST['update_brand'])) {
    $id = intval($_POST['id']);
    $brand = mysqli_real_escape_string($conn, $_POST['brand']); 

    $update_query = "UPDATE brand SET brand = '$brand' WHERE id = $id";

    if (mysqli_query($conn, $update_query)) {
        echo "<script>alert('Brand updated successfully.'); window.location.href='view_brand.php';</script>";
    } else {
        echo "<script>alert('Error updating brand: " . mysqli_error($conn) . "');</script>";
    }
}

$brand_data = [];
if (isset($_GET['id'])) {
    $id = intval($_GET['id']); 
    $fetch_query = "SELECT * FROM brand WHERE id = $id";
    $result = mysqli_query($conn, $fetch_query);

    if ($result && mysqli_num_rows($result) > 0) {
        $brand_data = mysqli_fetch_assoc($result);
    } else {
        echo "<script>alert('Brand not found.'); window.location.href='view_brand.php';</script>";
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Brand</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 20px;
        }
        form {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #212529;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Edit Brand</h2>
    <?php if (!empty($brand_data)): ?>
        <form method="POST" action="">
            <input type="hidden" name="id" value="<?php echo $brand_data['id']; ?>">
            <label for="brand">Brand Name:</label>
            <input type="text" id="brand" name="brand" value="<?php echo htmlspecialchars($brand_data['Brand']); ?>" required>
            <button type="submit" name="update_brand">Update Brand</button>
        </form>
    <?php else: ?>
        <p>No brand data found.</p>
    <?php endif; ?>
    <a href="view_brand.php" class="back-link">Back to Brand List</a>
</body>
</html>