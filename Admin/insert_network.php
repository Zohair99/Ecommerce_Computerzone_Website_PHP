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
    $np = mysqli_real_escape_string($conn, $_POST['np_dropdown']);
    $type = mysqli_real_escape_string($conn, $_POST['type_dropdown']);
    $review = mysqli_real_escape_string($conn, $_POST['rating']);
    $code = mysqli_real_escape_string($conn, $_POST['code']);

    // Handle image upload
    if (!empty($_FILES['image']['name'])) {
        $temp = $_FILES['image']['tmp_name'];
        $file_name = $_FILES['image']['name'];
        $final = 'images/' . $file_name;

        // Check if the directory exists
        if (!is_dir('images')) {
            mkdir('images', 0777, true);
        }

        if (move_uploaded_file($temp, $final)) {
            // Image uploaded successfully
            $spec1 = mysqli_real_escape_string($conn, $_POST['spec1']);
            $spec2 = mysqli_real_escape_string($conn, $_POST['spec2']);
            $spec3 = !empty($_POST['spec3']) ? mysqli_real_escape_string($conn, $_POST['spec3']) : null;
            $spec4 = !empty($_POST['spec4']) ? mysqli_real_escape_string($conn, $_POST['spec4']) : null;
            $price = mysqli_real_escape_string($conn, $_POST['price']);
            $old_price = mysqli_real_escape_string($conn, $_POST['old_price']);

            // Insert query
            $insert_query = "INSERT INTO network (offer, name, review, code, description, image, np, type, spec1, spec2, spec3, spec4, price, old_price) 
                             VALUES ('$offer', '$name', '$review', '$code', '$description', '$file_name', '$np', '$type', '$spec1', '$spec2', " .
                             ($spec3 ? "'$spec3'" : "NULL") . ", " .
                             ($spec4 ? "'$spec4'" : "NULL") . ", 
                             '$price', '$old_price')";

            if (mysqli_query($conn, $insert_query)) {
                echo "<p style='color: green;'>Record inserted successfully.</p>";
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

// Fetch data for the dropdowns
$np_query = "SELECT * FROM np";
$np_result = mysqli_query($conn, $np_query);

$type_query = "SELECT * FROM type";
$type_result = mysqli_query($conn, $type_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Data</title>
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
    <h2>Insert New Record</h2>
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

        <label for="code">Code</label>
        <input type="text" id="code" name="code" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="3" required></textarea>

        <label for="image">Product Image</label>
        <input type="file" id="image" name="image" required>

        <label for="np_dropdown">Select a Network</label>
        <select class="form-select" name="np_dropdown" id="np_dropdown" required>
            <option selected disabled>Select a network</option>
            <?php
            while ($row = mysqli_fetch_assoc($np_result)) {
                $network = $row['network'];
                echo "<option value='$network'>$network</option>";
            }
            ?>
        </select>

        <label for="type_dropdown">Select a Type</label>
        <select class="form-select" name="type_dropdown" id="type_dropdown" required>
            <option selected disabled>Select a type</option>
            <?php
            while ($row = mysqli_fetch_assoc($type_result)) {
                $n_type = $row['n_type'];
                echo "<option value='$n_type'>$n_type</option>";
            }
            ?>
        </select>

        <label for="spec1">Specification 1</label>
        <input type="text" id="spec1" name="spec1">

        <label for="spec2">Specification 2</label>
        <input type="text" id="spec2" name="spec2">

        <label for="spec3">Specification 3 (optional)</label>
        <input type="text" id="spec3" name="spec3">

        <label for="spec4">Specification 4 (optional)</label>
        <input type="text" id="spec4" name="spec4">

        <label for="price">Price</label>
        <input type="number" id="price" name="price" required>

        <label for="old_price">Old Price</label>
        <input type="number" id="old_price" name="old_price">

        <button type="submit" name="btn">Insert</button>
    </form>
</body>
</html>
