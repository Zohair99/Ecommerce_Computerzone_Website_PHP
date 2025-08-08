<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Handle form submission
if (isset($_POST['btn'])) {
    $offer = mysqli_real_escape_string($conn, $_POST['offer']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $brand = mysqli_real_escape_string($conn, $_POST['brand_dropdown']); // from keyboard_store
    $processor = mysqli_real_escape_string($conn, $_POST['processor_dropdown']); // from keyboard_brand
    $review = mysqli_real_escape_string($conn, $_POST['rating']);
    $code = mysqli_real_escape_string($conn, $_POST['code']);

    if (!empty($_FILES['image']['name'])) {
        $temp = $_FILES['image']['tmp_name'];
        $file_name = $_FILES['image']['name'];
        $final = 'images/' . $file_name;

        if (!is_dir('images')) {
            mkdir('images', 0777, true);
        }

        if (move_uploaded_file($temp, $final)) {
            $spec1 = mysqli_real_escape_string($conn, $_POST['spec1']);
            $spec2 = mysqli_real_escape_string($conn, $_POST['spec2']);
            $spec3 = mysqli_real_escape_string($conn, $_POST['spec3']);
            $spec4 = mysqli_real_escape_string($conn, $_POST['spec4']);
            $price = mysqli_real_escape_string($conn, $_POST['price']);
            $old_price = mysqli_real_escape_string($conn, $_POST['old_price']);

            $insert_query = "INSERT INTO keyboard 
                (offer, name, review, code, description, image, brand, processor, spec1, spec2, spec3, spec4, price, old_price)
                VALUES 
                ('$offer', '$name', '$review', '$code', '$description', '$file_name', '$brand', '$processor', '$spec1', '$spec2', '$spec3', '$spec4', '$price', '$old_price')";

            if (mysqli_query($conn, $insert_query)) {
                echo "<p style='color: green;'>Keyboard product inserted successfully.</p>";
            } else {
                echo "<p style='color: red;'>Error: " . mysqli_error($conn) . "</p>";
            }
        } else {
            echo "<p style='color: red;'>Image upload failed.</p>";
        }
    } else {
        echo "<p style='color: red;'>Please upload an image.</p>";
    }
}

// Fetch dropdown data
$brand_result = mysqli_query($conn, "SELECT * FROM keyboard_store");
$processor_result = mysqli_query($conn, "SELECT * FROM keyboard_brand");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Keyboard Product</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f5f5f5; }
        form { max-width: 600px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        input, textarea, select { width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; }
        button:hover { background: #0056b3; }
    </style>
</head>
<body>
    <h2>Insert Keyboard Product</h2>
    <form action="" method="POST" enctype="multipart/form-data">
        <label for="name">Product Name</label>
        <input type="text" name="name" required>

        <label for="offer">Offer</label>
        <input type="text" name="offer">

        <label for="rating">Rating</label>
        <select name="rating" required>
            <option value="" disabled selected>Select rating</option>
            <option value="1">⭐</option>
            <option value="2">⭐⭐</option>
            <option value="3">⭐⭐⭐</option>
            <option value="4">⭐⭐⭐⭐</option>
            <option value="5">⭐⭐⭐⭐⭐</option>
        </select>

        <label for="code">Code</label>
        <input type="number" name="code" required>

        <label for="description">Description</label>
        <textarea name="description" rows="3" required></textarea>

        <label for="image">Product Image</label>
        <input type="file" name="image" required>

        <label for="brand_dropdown">Select Keyboard Store</label>
        <select name="brand_dropdown" required>
            <option value="" disabled selected>Select a store</option>
            <?php while ($row = mysqli_fetch_assoc($brand_result)) {
                $val = htmlspecialchars($row['keyboardstore']);
                echo "<option value='$val'>$val</option>";
            } ?>
        </select>

        <label for="processor_dropdown">Select Keyboard Brand</label>
        <select name="processor_dropdown" required>
            <option value="" disabled selected>Select a brand</option>
            <?php while ($row = mysqli_fetch_assoc($processor_result)) {
                $val = htmlspecialchars($row['keyboardbrand']);
                echo "<option value='$val'>$val</option>";
            } ?>
        </select>

        <label for="spec1">Specification 1</label>
        <input type="text" name="spec1" required>

        <label for="spec2">Specification 2</label>
        <input type="text" name="spec2" required>

        <label for="spec3">Specification 3</label>
        <input type="text" name="spec3">

        <label for="spec4">Specification 4</label>
        <input type="text" name="spec4">

        <label for="price">Price</label>
        <input type="number" name="price" required>

        <label for="old_price">Old Price</label>
        <input type="number" name="old_price">

        <button type="submit" name="btn">Insert</button>
    </form>
</body>
</html>

<?php mysqli_close($conn); ?>
