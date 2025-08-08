<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Database Connection Failed: " . mysqli_connect_error());
}

// Fetch brands for the dropdown (from speaker_brand)
$brand_query = "SELECT id, speakerbrand FROM speaker_brand ORDER BY speakerbrand ASC";
$brand_result = mysqli_query($conn, $brand_query);

// Fetch stores for the dropdown (from speaker_store)
$store_query = "SELECT id, speakerstore FROM speaker_store ORDER BY speakerstore ASC";
$store_result = mysqli_query($conn, $store_query);

// Handle form submission for updating product
if (isset($_POST['update_product']) && isset($_POST['update_id'])) {
    $update_id = intval($_POST['update_id']);
    $offer = mysqli_real_escape_string($conn, $_POST['offer']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    // Changed 'processor_dropdown' to reflect 'speakerbrand' table
    $processor = mysqli_real_escape_string($conn, $_POST['processor_dropdown']);
    // Changed 'store_dropdown' to reflect 'speakerstore' table
    $brand = mysqli_real_escape_string($conn, $_POST['store_dropdown']);
    $review = mysqli_real_escape_string($conn, $_POST['rating']);
    $codee = mysqli_real_escape_string($conn, $_POST['codee']);
    $spec1 = mysqli_real_escape_string($conn, $_POST['spec1']);
    $spec2 = mysqli_real_escape_string($conn, $_POST['spec2']);
    $spec3 = mysqli_real_escape_string($conn, $_POST['spec3']);
    $spec4 = mysqli_real_escape_string($conn, $_POST['spec4']);
    $price = floatval($_POST['price']);
    $old_price = floatval($_POST['old_price']);

    // Handle image upload
    if (!empty($_FILES['image']['name'])) {
        $temp = $_FILES['image']['tmp_name'];
        $file_name = $_FILES['image']['name'];
        $final = 'images/' . $file_name;

        if (!is_dir('images')) {
            mkdir('images', 0777, true);
        }
        move_uploaded_file($temp, $final);
    } else {
        $file_name = $_POST['existing_image'];
    }

    // Update query - changed table name from 'software' to 'speaker'
    $update_query = "UPDATE speaker SET
                     offer='$offer',
                     name='$name',
                     review='$review',
                     code='$codee',
                     description='$description',
                     image='$file_name',
                     brand='$brand',
                     processor='$processor',
                     spec1='$spec1',
                     spec2='$spec2',
                     spec3='$spec3',
                     spec4='$spec4',
                     price='$price',
                     old_price='$old_price'
                     WHERE id='$update_id'";

    if (mysqli_query($conn, $update_query)) {
        // Changed alert message and redirect page
        echo "<script>alert('Speaker product updated successfully.'); window.location.href='view_speaker.php';</script>";
    } else {
        die("SQL Error in Update: " . mysqli_error($conn));
    }
}

// Fetch product details for editing - changed table name from 'software' to 'speaker'
$edit_data = null;
if (isset($_GET['edit_id'])) {
    $edit_id = intval($_GET['edit_id']);
    $edit_query = "SELECT * FROM speaker WHERE id='$edit_id'";
    $edit_result = mysqli_query($conn, $edit_query);
    $edit_data = mysqli_fetch_assoc($edit_result);
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Speaker Product</title> <style>
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
        input, textarea, select {
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
    </style>
</head>
<body>
<?php if ($edit_data) { ?>
    <h2>Edit Speaker Product</h2> <form method="POST" enctype="multipart/form-data">
        <input type="hidden" name="update_id" value="<?php echo $edit_data['id']; ?>">

        <label>Offer:</label>
        <input type="text" name="offer" value="<?php echo htmlspecialchars($edit_data['offer']); ?>">

        <label>Product Name:</label>
        <input type="text" name="name" value="<?php echo htmlspecialchars($edit_data['name']); ?>" required>

        <label>Description:</label>
        <textarea name="description" required><?php echo htmlspecialchars($edit_data['description']); ?></textarea>

        <label>Speaker Brand:</label> <select name="processor_dropdown" required>
            <option value="">Select Speaker Brand</option> <?php
            mysqli_data_seek($brand_result, 0);
            while ($Brand = mysqli_fetch_assoc($brand_result)) { ?>
                <option value="<?php echo htmlspecialchars($Brand['speakerbrand']); ?>"
                    <?php if ($edit_data['processor'] == $Brand['speakerbrand']) echo 'selected'; ?>>
                    <?php echo htmlspecialchars($Brand['speakerbrand']); ?>
                </option>
            <?php } ?>
        </select>

        <label>Store Category:</label>
        <select name="store_dropdown" required>
            <option value="">Select Store Category</option>
            <?php
            mysqli_data_seek($store_result, 0);
            while ($Store = mysqli_fetch_assoc($store_result)) { ?>
                <option value="<?php echo htmlspecialchars($Store['speakerstore']); ?>"
                    <?php if ($edit_data['brand'] == $Store['speakerstore']) echo 'selected'; ?>>
                    <?php echo htmlspecialchars($Store['speakerstore']); ?>
                </option>
            <?php } ?>
        </select>

        <label>Review (Rating):</label>
        <input type="number" name="rating" value="<?php echo htmlspecialchars($edit_data['review']); ?>" min="1" max="5" required>

        <label>Product Code:</label>
        <input type="text" name="codee" value="<?php echo htmlspecialchars($edit_data['code']); ?>" required>

        <label>Product Image:</label>
        <input type="file" name="image">
        <input type="hidden" name="existing_image" value="<?php echo htmlspecialchars($edit_data['image']); ?>">
        <img src="images/<?php echo htmlspecialchars($edit_data['image']); ?>" alt="Speaker Image"> <label>Specification 1:</label>
        <input type="text" name="spec1" value="<?php echo htmlspecialchars($edit_data['spec1']); ?>" >

        <label>Specification 2:</label>
        <input type="text" name="spec2" value="<?php echo htmlspecialchars($edit_data['spec2']); ?>" >

        <label>Specification 3:</label>
        <input type="text" name="spec3" value="<?php echo htmlspecialchars($edit_data['spec3']); ?>">

        <label>Specification 4:</label>
        <input type="text" name="spec4" value="<?php echo htmlspecialchars($edit_data['spec4']); ?>">

        <label>Price:</label>
        <input type="number" name="price" value="<?php echo htmlspecialchars($edit_data['price']); ?>" step="0.01" required>

        <label>Old Price:</label>
        <input type="number" name="old_price" value="<?php echo htmlspecialchars($edit_data['old_price']); ?>" step="0.01">

        <button type="submit" name="update_product">Update Product</button>
    </form>
<?php } else { ?>
    <p class="error">Speaker product not found. Please provide a valid `edit_id` in the URL.</p> <?php } ?>
</body>
</html>