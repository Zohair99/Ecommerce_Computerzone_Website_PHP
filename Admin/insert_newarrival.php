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
    $spec1 = mysqli_real_escape_string($conn, $_POST['spec1']);
    $spec2 = mysqli_real_escape_string($conn, $_POST['spec2']);
    $spec3 = mysqli_real_escape_string($conn, $_POST['spec3']);
    $spec4 = mysqli_real_escape_string($conn, $_POST['spec4']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);
    $old_price = mysqli_real_escape_string($conn, $_POST['old_price']);

    // Handle image upload
    if (isset($_FILES['image']) && $_FILES['image']['error'] == 0) {
        $temp = $_FILES['image']['tmp_name'];
        $file_name = basename($_FILES['image']['name']);
        $final_path = "images/" . $file_name;

        // Check and create images directory if not exists
        if (!is_dir("images")) {
            mkdir("images", 0777, true);
        }

        // Move uploaded file
        if (move_uploaded_file($temp, $final_path)) {
            // Insert query
            $insert_query = "INSERT INTO new_home (offer, name, description, image, spec1, spec2, spec3, spec4, price, old_price) 
                             VALUES ('$offer','$name', '$description', '$file_name', '$spec1', '$spec2', '$spec3', '$spec4', '$price', '$old_price')";

            if (mysqli_query($conn, $insert_query)) {
                echo "<script>alert('Record inserted successfully.'); window.location.href='view_newarrival.php';</script>";
            } else {
                echo "<p class='error'>Error: " . mysqli_error($conn) . "</p>";
            }
        } else {
            echo "<p class='error'>Failed to upload image.</p>";
        }
    } else {
        echo "<p class='error'>Invalid image file.</p>";
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Data</title>
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
    <label for="offer">Offer</label>
    <input type="text" id="offer" name="offer" >

    <label for="name">Product Name</label>
    <input type="text" id="name" name="name" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="3" required></textarea>

        <label for="image">Product Image</label>
        <input type="file" id="image" name="image" required>

        <label for="spec1">Specification 1</label>
        <input type="text" id="spec1" name="spec1" required>

        <label for="spec2">Specification 2</label>
        <input type="text" id="spec2" name="spec2" required>

        <label for="spec3">Specification 3</label>
        <input type="text" id="spec3" name="spec3" >

        <label for="spec4">Specification 4</label>
        <input type="text" id="spec4" name="spec4" >

        <label for="price">Price</label>
        <input type="number" id="price" name="price" required>

        <label for="old_price">Old Price</label>
        <input type="number" id="old_price" name="old_price" >

        <button type="submit" name="btn">Insert</button>
    </form>
</body>
</html>
