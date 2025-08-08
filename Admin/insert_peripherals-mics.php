<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if the form is submitted
if (isset($_POST['btn'])) {
    // Collect data from the form
    $offer = mysqli_real_escape_string($conn, $_POST['offer']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);

    // For 'brand' in peripheralsmics table, we need the actual string value from peripheralsmics_store
    $store_category = mysqli_real_escape_string($conn, $_POST['store_dropdown']);

    // For 'processor' in peripheralsmics table, we need the actual string value from peripheralsmics_brand
    $peripheral_brand = mysqli_real_escape_string($conn, $_POST['brand_dropdown']);

    $review = mysqli_real_escape_string($conn, $_POST['rating']);
    $code = mysqli_real_escape_string($conn, $_POST['codee']); // Corrected variable name to match column 'code'

    // Handle image upload
    if (!empty($_FILES['image']['name'])) {
        $temp = $_FILES['image']['tmp_name'];
        $file_name = $_FILES['image']['name'];
        $final = 'images/' . $file_name;

        // Check if the directory exists
        if (!is_dir('images')) {
            mkdir('images', 0777, true); // Create directory if it doesn't exist
        }

        if (move_uploaded_file($temp, $final)) {
            // Image uploaded successfully
            $spec1 = mysqli_real_escape_string($conn, $_POST['spec1']);
            $spec2 = mysqli_real_escape_string($conn, $_POST['spec2']);
            $spec3 = mysqli_real_escape_string($conn, $_POST['spec3']);
            $spec4 = mysqli_real_escape_string($conn, $_POST['spec4']);
            $price = mysqli_real_escape_string($conn, $_POST['price']);
            $old_price = mysqli_real_escape_string($conn, $_POST['old_price']);

            // Insert query into the 'peripheralsmics' table
            $insert_query = "INSERT INTO peripheralsmics (offer, name, review, code, description, image, brand, processor, spec1, spec2, spec3, spec4, price, old_price) 
                             VALUES ('$offer', '$name', '$review', '$code', '$description', '$file_name', '$store_category', '$peripheral_brand', '$spec1', '$spec2', '$spec3', '$spec4', '$price', '$old_price')";

            if (mysqli_query($conn, $insert_query)) {
                echo "<p style='color: green;'>Record inserted successfully into Peripherals/Misc.</p>";
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

// Fetch brands for the dropdown (from peripheralsmics_brand)
$brand_query = "SELECT id, peripheralsmicsbrand FROM peripheralsmics_brand ORDER BY peripheralsmicsbrand ASC";
$brand_result = mysqli_query($conn, $brand_query);

// Fetch categories/stores for the dropdown (from peripheralsmics_store)
$store_query = "SELECT id, peripheralsmicsstore FROM peripheralsmics_store ORDER BY peripheralsmicsstore ASC";
$store_result = mysqli_query($conn, $store_query);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Peripheral/Misc Data</title>

    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />
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

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input,
        textarea,
        select {
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
            /* Make button full width */
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>
    <h2>Insert New Peripheral / Miscellaneous Product</h2>
    <form action="" method="POST" enctype="multipart/form-data">

        <label for="name">Product Name</label>
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
        <input type="text" id="codee" name="codee" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="3" required></textarea>

        <label for="image">Product Image</label>
        <input type="file" id="image" name="image" required>

        <label for="store_dropdown">Select Product Category / Store </label>
        <div class="form-outline mb-4">
            <select class="form-select" name="store_dropdown" id="store_dropdown" required>
                <option selected disabled>Select a Category / Store</option>
                <?php
                // Display categories/stores from peripheralsmics_store
                while ($row = mysqli_fetch_assoc($store_result)) {
                    $store_category_name = $row['peripheralsmicsstore'];
                    echo "<option value='$store_category_name'>$store_category_name</option>";
                }
                ?>
            </select>
        </div>

        <label for="brand_dropdown">Select Product Brand </label>
        <div class="form-outline mb-4">
            <select class="form-select" name="brand_dropdown" id="brand_dropdown" required>
                <option selected disabled>Select a Brand</option>
                <?php
                // Display brands from peripheralsmics_brand
                while ($row = mysqli_fetch_assoc($brand_result)) {
                    $peripheral_brand_name = $row['peripheralsmicsbrand'];
                    echo "<option value='$peripheral_brand_name'>$peripheral_brand_name</option>";
                }
                ?>
            </select>
        </div>

        <label for="spec1">Specification 1</label>
        <input type="text" id="spec1" name="spec1" required>

        <label for="spec2">Specification 2</label>
        <input type="text" id="spec2" name="spec2" required>

        <label for="spec3">Specification 3</label>
        <input type="text" id="spec3" name="spec3">

        <label for="spec4">Specification 4</label>
        <input type="text" id="spec4" name="spec4">

        <label for="price">Price</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="old_price">Old Price</label>
        <input type="number" id="old_price" name="old_price" step="0.01">

        <button type="submit" name="btn">Insert Product</button>
    </form>
</body>

</html>

<?php
// Close the connection at the end of the file
mysqli_close($conn);
?>