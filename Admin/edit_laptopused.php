<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Database Connection Failed: " . mysqli_connect_error());
}

// Fetch brand and processor for dropdowns
$brand_query = "SELECT * FROM laptopused_store";
$brand_result = mysqli_query($conn, $brand_query);

$processor_query = "SELECT * FROM processor_store";
$processor_result = mysqli_query($conn, $processor_query);

// Handle update
if (isset($_POST['update_product']) && isset($_POST['update_id'])) {
    $update_id = intval($_POST['update_id']);
    $offer = mysqli_real_escape_string($conn, $_POST['offer']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $brand = mysqli_real_escape_string($conn, $_POST['brand_dropdown']);
    $processor = mysqli_real_escape_string($conn, $_POST['processor_dropdown']);
    $review = intval($_POST['rating']);
    $code = mysqli_real_escape_string($conn, $_POST['code']);
    $spec1 = mysqli_real_escape_string($conn, $_POST['spec1']);
    $spec2 = mysqli_real_escape_string($conn, $_POST['spec2']);
    $spec3 = mysqli_real_escape_string($conn, $_POST['spec3']);
    $spec4 = mysqli_real_escape_string($conn, $_POST['spec4']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    $old_price = mysqli_real_escape_string($conn, $_POST['old_price']);

    // Image handling
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

    $update_query = "UPDATE laptopused SET
                    offer='$offer',
                    name='$name',
                    review='$review',
                    code='$code',
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
        echo "<script>alert('Laptop record updated successfully.'); window.location.href='view_laptop.php';</script>";
    } else {
        die("SQL Error in Update: " . mysqli_error($conn));
    }
}

// Fetch record to edit
$edit_data = null;
if (isset($_GET['edit_id'])) {
    $edit_id = intval($_GET['edit_id']);
    $edit_query = "SELECT * FROM laptopused WHERE id='$edit_id'";
    $edit_result = mysqli_query($conn, $edit_query);
    $edit_data = mysqli_fetch_assoc($edit_result);
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Laptop</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f5f5f5; }
        form { max-width: 600px; margin: auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        label { display: block; font-weight: bold; margin-top: 10px; }
        input, select, textarea { width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; width: 100%; }
        button:hover { background-color: #0056b3; }
        img { display: block; margin-top: 10px; max-width: 100px; height: auto; }
    </style>
</head>
<body>

<?php if ($edit_data) { ?>
    <h2>Edit Laptop</h2>
    <form method="POST" enctype="multipart/form-data">
        <input type="hidden" name="update_id" value="<?php echo $edit_data['id']; ?>">

        <label>Offer:</label>
        <input type="text" name="offer" value="<?php echo htmlspecialchars($edit_data['offer']); ?>">

        <label>Product Name:</label>
        <input type="text" name="name" value="<?php echo htmlspecialchars($edit_data['name']); ?>" required>

        <label>Description:</label>
        <textarea name="description" required><?php echo htmlspecialchars($edit_data['description']); ?></textarea>

        <label>Brand:</label>
        <select name="brand_dropdown" required>
            <option value="">Select Brand</option>
            <?php
            mysqli_data_seek($brand_result, 0);
            while ($brand_row = mysqli_fetch_assoc($brand_result)) {
                $brand_value = $brand_row['laptopused'];
                $selected = ($edit_data['brand'] == $brand_value) ? 'selected' : '';
                echo "<option value=\"$brand_value\" $selected>$brand_value</option>";
            }
            ?>
        </select>

        <label>Processor:</label>
        <select name="processor_dropdown" required>
            <option value="">Select Processor</option>
            <?php
            mysqli_data_seek($processor_result, 0);
            while ($proc_row = mysqli_fetch_assoc($processor_result)) {
                $proc_value = $proc_row['processor'];
                $selected = ($edit_data['processor'] == $proc_value) ? 'selected' : '';
                echo "<option value=\"$proc_value\" $selected>$proc_value</option>";
            }
            ?>
        </select>

        <label>Review (Rating):</label>
        <input type="number" name="rating" min="1" max="5" value="<?php echo htmlspecialchars($edit_data['review']); ?>" required>

        <label>Code:</label>
        <input type="text" name="code" value="<?php echo htmlspecialchars($edit_data['code']); ?>" required>

        <label>Product Image:</label>
        <input type="file" name="image">
        <input type="hidden" name="existing_image" value="<?php echo htmlspecialchars($edit_data['image']); ?>">
        <img src="images/<?php echo htmlspecialchars($edit_data['image']); ?>" alt="Product Image">

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
    <p style="color:red; text-align:center;">Laptop record not found.</p>
<?php } ?>
</body>
</html>
