<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle product update
if (isset($_POST['update_product'])) {
    $update_id = intval($_POST['update_id']);
    $offer = mysqli_real_escape_string($conn, $_POST['offer']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $price = floatval($_POST['price']);
    $old_price = floatval($_POST['old_price']);

    // Handle image upload
    if (!empty($_FILES['image']['name'])) {
        $temp = $_FILES['image']['tmp_name'];
        $file_name = $_FILES['image']['name'];
        $final = 'images/' . $file_name;
        move_uploaded_file($temp, $final);
    } else {
        $file_name = $_POST['existing_image'];
    }

    $update_query = "UPDATE Home SET offer='$offer', name='$name', description='$description', image='$file_name', 
                    price='$price', old_price='$old_price' 
                    WHERE id='$update_id'";

    if (mysqli_query($conn, $update_query)) {
        echo "<script>alert('Product updated successfully.'); window.location.href='view_features.php';</script>";
    } else {
        echo "<script>alert('Error updating product: " . mysqli_error($conn) . "');</script>";
    }
}

// Fetch product details
if (isset($_GET['edit_id'])) {
    $edit_id = intval($_GET['edit_id']);
    $edit_query = "SELECT * FROM Home WHERE id='$edit_id'";
    $edit_result = mysqli_query($conn, $edit_query);
    $edit_data = mysqli_fetch_assoc($edit_result);
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    margin: 20px;
    padding: 20px;
    background-color: #f5f5f5;
}

form {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
}

label {
    font-weight: bold;
    margin-top: 10px;
    display: block;
}

input, textarea {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

button {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #0056b3;
}

img {
    display: block;
    margin-top: 10px;
    max-width: 100px;
    height: auto;
    border-radius: 4px;
}

.error {
    color: red;
    text-align: center;
}

.success {
    color: green;
    text-align: center;
}

    </style>
</head>
<body>
<?php if ($edit_data) { ?>
    <h2>Edit Product</h2>
    <form method="POST" enctype="multipart/form-data">
        <input type="hidden" name="update_id" value="<?php echo $edit_data['id']; ?>">
        <label>Offer:</label>
        <input type="text" name="offer" value="<?php echo htmlspecialchars($edit_data['offer']); ?>">
        <label>Product Name:</label>
        <input type="text" name="name" value="<?php echo htmlspecialchars($edit_data['name']); ?>" required>
        <label>Description:</label>
        <textarea name="description" required><?php echo htmlspecialchars($edit_data['description']); ?></textarea>
        <label>Product Image:</label>
        <input type="file" name="image">
        <input type="hidden" name="existing_image" value="<?php echo htmlspecialchars($edit_data['image']); ?>">
        <img src="images/<?php echo htmlspecialchars($edit_data['image']); ?>" width="100" height="100">
        <label>Specification 1:</label>
        <input type="text" name="spec1" value="<?php echo htmlspecialchars($edit_data['spec1']); ?>" required>
        <label>Specification 2:</label>
        <input type="text" name="spec2" value="<?php echo htmlspecialchars($edit_data['spec2']); ?>" required>
        <label>Specification 3:</label>
        <input type="text" name="spec3" value="<?php echo htmlspecialchars($edit_data['spec3']); ?>">
        <label>Specification 4:</label>
        <input type="text" name="spec4" value="<?php echo htmlspecialchars($edit_data['spec4']); ?>">
        <label>Price:</label>
        <input type="number" name="price" value="<?php echo htmlspecialchars($edit_data['price']); ?>" required>
        <label>Old Price:</label>
        <input type="number" name="old_price" value="<?php echo htmlspecialchars($edit_data['old_price']); ?>">
        <button type="submit" name="update_product">Update</button>
    </form>
<?php } else { ?>
    <p>Product not found.</p>
<?php } ?>
</body>
</html>
