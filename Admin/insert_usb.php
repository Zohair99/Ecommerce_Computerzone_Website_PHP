<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection Failed: " . mysqli_connect_error());
}

// Handle form submission
if (isset($_POST['btn'])) {
    $offer = mysqli_real_escape_string($conn, $_POST['offer']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $store_category = mysqli_real_escape_string($conn, $_POST['store_dropdown']); // This will be the usbstore
    $usb_brand = mysqli_real_escape_string($conn, $_POST['brand_dropdown']); // This will be the usbbrand
    $review = mysqli_real_escape_string($conn, $_POST['rating']);
    $code = mysqli_real_escape_string($conn, $_POST['codee']);

    if (!empty($_FILES['image']['name'])) {
        $temp = $_FILES['image']['tmp_name'];
        $file_name = basename($_FILES['image']['name']);
        $upload_dir = 'images/';
        $final = $upload_dir . $file_name;

        if (!is_dir($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        if (move_uploaded_file($temp, $final)) {
            $spec1 = mysqli_real_escape_string($conn, $_POST['spec1']);
            $spec2 = mysqli_real_escape_string($conn, $_POST['spec2']);
            $spec3 = mysqli_real_escape_string($conn, $_POST['spec3']);
            $spec4 = mysqli_real_escape_string($conn, $_POST['spec4']);
            $price = mysqli_real_escape_string($conn, $_POST['price']); // Changed to string based on new schema
            $old_price = mysqli_real_escape_string($conn, $_POST['old_price']); // Changed to string based on new schema

            // Changed table name to 'usb' and column names for brand and processor
            $insert_query = "INSERT INTO usb (offer, name, review, code, description, image, brand, processor, spec1, spec2, spec3, spec4, price, old_price)
                             VALUES ('$offer', '$name', '$review', '$code', '$description', '$file_name', '$store_category', '$usb_brand', '$spec1', '$spec2', '$spec3', '$spec4', '$price', '$old_price')";

            if (mysqli_query($conn, $insert_query)) {
                echo "<p style='color: green;'>USB record inserted successfully.</p>"; // Updated success message
            } else {
                echo "<p style='color: red;'>Error: " . mysqli_error($conn) . "</p>";
            }
        } else {
            echo "<p style='color: red;'>Failed to upload image.</p>";
        }
    } else {
        echo "<p style='color: red;'>Please select an image to upload.</p>";
    }
}

// Fetch dropdown values for usb_brand and usb_store
$brand_query = "SELECT id, usbbrand FROM usb_brand ORDER BY usbbrand ASC"; // Changed table and column
$brand_result = mysqli_query($conn, $brand_query);

$store_query = "SELECT id, usbstore FROM usb_store ORDER BY usbstore ASC"; // Changed table and column
$store_result = mysqli_query($conn, $store_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert USB Data</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; padding: 20px; background-color: #f5f5f5; }
        form { max-width: 600px; margin: auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); }
        label { font-weight: bold; margin-top: 10px; display: block; }
        input, textarea, select { width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 4px; }
        button { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; width: 100%; }
        button:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <h2>Insert New USB Device</h2>
    <form action="" method="POST" enctype="multipart/form-data">
        <label for="name">USB Device Name</label>
        <input type="text" id="name" name="name" required>

        <label for="offer">Offer</label>
        <input type="text" id="offer" name="offer">

        <label for="rating">Select Rating:</label>
        <select name="rating" required>
            <option value="" disabled selected>Choose rating</option>
            <option value="1">⭐</option>
            <option value="2">⭐⭐</option>
            <option value="3">⭐⭐⭐</option>
            <option value="4">⭐⭐⭐⭐</option>
            <option value="5">⭐⭐⭐⭐⭐</option>
        </select>

        <label for="codee">Product Code</label>
        <input type="number" id="codee" name="codee" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="3" required></textarea>

        <label for="image">Product Image</label>
        <input type="file" id="image" name="image" required>

        <label for="store_dropdown">Select Category / Store</label>
        <select name="store_dropdown" id="store_dropdown" required>
            <option selected disabled>Select a Store</option>
            <?php while ($row = mysqli_fetch_assoc($store_result)) {
                // Changed column name to 'usbstore'
                echo "<option value='" . htmlspecialchars($row['usbstore']) . "'>" . htmlspecialchars($row['usbstore']) . "</option>";
            } ?>
        </select>

        <label for="brand_dropdown">Select USB Brand</label>
        <select name="brand_dropdown" id="brand_dropdown" required>
            <option selected disabled>Select a Brand</option>
            <?php while ($row = mysqli_fetch_assoc($brand_result)) {
                // Changed column name to 'usbbrand'
                echo "<option value='" . htmlspecialchars($row['usbbrand']) . "'>" . htmlspecialchars($row['usbbrand']) . "</option>";
            } ?>
        </select>

        <label for="spec1">Specification 1</label>
        <input type="text" id="spec1" name="spec1">

        <label for="spec2">Specification 2</label>
        <input type="text" id="spec2" name="spec2">

        <label for="spec3">Specification 3</label>
        <input type="text" id="spec3" name="spec3">

        <label for="spec4">Specification 4</label>
        <input type="text" id="spec4" name="spec4">

        <label for="price">Price</label>
        <input type="text" id="price" name="price" required>

        <label for="old_price">Old Price</label>
        <input type="text" id="old_price" name="old_price">

        <button type="submit" name="btn">Insert USB Device</button>
    </form>
</body>
</html>

<?php mysqli_close($conn); ?>