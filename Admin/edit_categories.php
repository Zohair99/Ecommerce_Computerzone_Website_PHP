<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Database Connection Failed: " . mysqli_connect_error());
} 

// Fetch dropdown data
$category_query = "SELECT * FROM categories_store";
$category_result = mysqli_query($conn, $category_query);

$brand_query = "SELECT * FROM categories_brand";
$brand_result = mysqli_query($conn, $brand_query);

// Handle update
if (isset($_POST['update_product']) && isset($_POST['update_id'])) {
    $update_id = intval($_POST['update_id']);
    $offer = mysqli_real_escape_string($conn, $_POST['offer']);
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $brand = mysqli_real_escape_string($conn, $_POST['brand_dropdown']); // cattrones
    $processor = mysqli_real_escape_string($conn, $_POST['processor_dropdown']); // catbrand
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

    $update_query = "UPDATE categories SET
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
        echo "<script>alert('Product updated successfully.'); window.location.href='view_categories.php';</script>";
    } else {
        die("SQL Error in Update: " . mysqli_error($conn));
    }
}

// Fetch record to edit
$edit_data = null;
if (isset($_GET['edit_id'])) {
    $edit_id = intval($_GET['edit_id']);
    $edit_query = "SELECT * FROM categories WHERE id='$edit_id'";
    $edit_result = mysqli_query($conn, $edit_query);
    $edit_data = mysqli_fetch_assoc($edit_result);
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product (Category)</title>
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
    <h2>Edit Product (Category)</h2>
    <form method="POST" enctype="multipart/form-data">
        <input type="hidden" name="update_id" value="<?= $edit_data['id']; ?>">

        <label>Offer:</label>
        <input type="text" name="offer" value="<?= htmlspecialchars($edit_data['offer']); ?>">

        <label>Product Name:</label>
        <input type="text" name="name" value="<?= htmlspecialchars($edit_data['name']); ?>" required>

        <label>Description:</label>
        <textarea name="description" required><?= htmlspecialchars($edit_data['description']); ?></textarea>

        <label>Category (Cattrones):</label>
        <select name="brand_dropdown" required>
            <option value="">Select Category</option>
            <?php
            mysqli_data_seek($category_result, 0);
            while ($row = mysqli_fetch_assoc($category_result)) {
                $val = $row['cattrones'];
                $selected = ($edit_data['brand'] == $val) ? 'selected' : '';
                echo "<option value=\"$val\" $selected>$val</option>";
            }
            ?>
        </select>

        <label>Brand (Catbrand):</label>
        <select name="processor_dropdown" required>
            <option value="">Select Brand</option>
            <?php
            mysqli_data_seek($brand_result, 0);
            while ($row = mysqli_fetch_assoc($brand_result)) {
                $val = $row['catbrand'];
                $selected = ($edit_data['processor'] == $val) ? 'selected' : '';
                echo "<option value=\"$val\" $selected>$val</option>";
            }
            ?>
        </select>

        <label>Review (Rating):</label>
        <input type="number" name="rating" min="1" max="5" value="<?= htmlspecialchars($edit_data['review']); ?>" required>

        <label>Code:</label>
        <input type="text" name="code" value="<?= htmlspecialchars($edit_data['code']); ?>" required>

        <label>Product Image:</label>
        <input type="file" name="image">
        <input type="hidden" name="existing_image" value="<?= htmlspecialchars($edit_data['image']); ?>">
        <img src="images/<?= htmlspecialchars($edit_data['image']); ?>" alt="Product Image">

        <label>Specification 1:</label>
        <input type="text" name="spec1" value="<?= htmlspecialchars($edit_data['spec1']); ?>" required>

        <label>Specification 2:</label>
        <input type="text" name="spec2" value="<?= htmlspecialchars($edit_data['spec2']); ?>" required>

        <label>Specification 3:</label>
        <input type="text" name="spec3" value="<?= htmlspecialchars($edit_data['spec3']); ?>">

        <label>Specification 4:</label>
        <input type="text" name="spec4" value="<?= htmlspecialchars($edit_data['spec4']); ?>">

        <label>Price:</label>
        <input type="number" name="price" value="<?= htmlspecialchars($edit_data['price']); ?>" required>

        <label>Old Price:</label>
        <input type="number" name="old_price" value="<?= htmlspecialchars($edit_data['old_price']); ?>">

        <button type="submit" name="update_product">Update</button>
    </form>
<?php } else { ?>
    <p style="color:red; text-align:center;">Product not found.</p>
<?php } ?>
</body>
</html>
