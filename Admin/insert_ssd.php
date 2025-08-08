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
    $sd = $_POST['sd_dropdown']; // Don't escape yet - we need the raw value for comparison
    $store = $_POST['store_dropdown']; // Don't escape yet
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
            $spec3 = mysqli_real_escape_string($conn, $_POST['spec3']);
            $spec4 = mysqli_real_escape_string($conn, $_POST['spec4']);
            $price = mysqli_real_escape_string($conn, $_POST['price']);
            $old_price = mysqli_real_escape_string($conn, $_POST['old_price']);

            // First verify the foreign key values exist - use prepared statement
            $check_sd = $conn->prepare("SELECT 1 FROM ssd WHERE solid_disk = ? LIMIT 1");
            $check_sd->bind_param("s", $sd);
            $check_sd->execute();
            $sd_exists = $check_sd->get_result()->num_rows > 0;
            $check_sd->close();
            
            $check_store = $conn->prepare("SELECT 1 FROM s_capacity WHERE c_storage = ? LIMIT 1");
            $check_store->bind_param("s", $store);
            $check_store->execute();
            $store_exists = $check_store->get_result()->num_rows > 0;
            $check_store->close();
            
            if (!$sd_exists) {
                // Try to find a similar SD type (case-insensitive and ignoring apostrophes)
                $similar_sd = $conn->query("SELECT solid_disk FROM ssd WHERE 
                                          REPLACE(LOWER(solid_disk), '''', '') = REPLACE(LOWER('$sd'), '''', '')");
                
                if ($similar_sd->num_rows > 0) {
                    $correct_sd = $similar_sd->fetch_assoc()['solid_disk'];
                    $sd = $correct_sd; // Use the correct version from database
                    $sd_exists = true;
                    echo "<p style='color: orange;'>Note: Adjusted solid disk type to match database entry: " . 
                         htmlspecialchars($correct_sd) . "</p>";
                } else {
                    echo "<p style='color: red;'>Error: The selected solid disk type doesn't exist in the database.</p>";
                    echo "<p>Attempted to insert SD value: " . htmlspecialchars($sd) . "</p>";
                    
                    // Show available SD options
                    $sd_options = $conn->query("SELECT solid_disk FROM ssd");
                    echo "<p>Available SD options:</p><ul>";
                    while ($row = $sd_options->fetch_assoc()) {
                        echo "<li>" . htmlspecialchars($row['solid_disk']) . "</li>";
                    }
                    echo "</ul>";
                    exit(); // Stop execution if SD type is invalid
                }
            }

            if (!$store_exists) {
                echo "<p style='color: red;'>Error: The selected storage capacity doesn't exist in the database.</p>";
                exit();
            }

            // Use prepared statement for the insert
            $insert_query = "INSERT INTO ssd_data (offer, name, review, code, description, image, sd, store, spec1, spec2, spec3, spec4, price, old_price) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            $stmt = $conn->prepare($insert_query);
            if ($stmt === false) {
                die("Prepare failed: " . $conn->error);
            }
            
            $stmt->bind_param("ssssssssssssss", 
                $offer, $name, $review, $code, $description, $file_name, 
                $sd, $store, $spec1, $spec2, $spec3, $spec4, $price, $old_price);
            
            if ($stmt->execute()) {
                echo "<p style='color: green;'>Record inserted successfully.</p>";
            } else {
                echo "<p style='color: red;'>Error: " . $stmt->error . "</p>";
            }
            $stmt->close();
        } else {
            echo "<p style='color: red;'>Failed to upload image.</p>";
        }
    } else {
        echo "<p style='color: red;'>Please select an image to upload.</p>";
    }
}

// Fetch data for the dropdowns
$sd_query = "SELECT * FROM ssd";
$sd_result = mysqli_query($conn, $sd_query);

$store_query = "SELECT * FROM s_capacity";
$store_result = mysqli_query($conn, $store_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert SSD Data</title>
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
    <h2>Insert New SSD Record</h2>
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

        <label for="sd_dropdown">Select a Solid State Disk</label>
        <select class="form-select" name="sd_dropdown" id="sd_dropdown" required>
            <option selected disabled>Select a solid state disk</option>
            <?php
            // Reset the pointer if needed
            mysqli_data_seek($sd_result, 0);
            while ($row = mysqli_fetch_assoc($sd_result)) {
                $solid_disk = htmlspecialchars($row['solid_disk']);
                echo "<option value='$solid_disk'>$solid_disk</option>";
            }
            ?>
        </select>

        <label for="store_dropdown">Select Storage Capacity</label>
        <select class="form-select" name="store_dropdown" id="store_dropdown" required>
            <option selected disabled>Select storage capacity</option>
            <?php
            while ($row = mysqli_fetch_assoc($store_result)) {
                $c_storage = htmlspecialchars($row['c_storage']);
                echo "<option value='$c_storage'>$c_storage</option>";
            }
            ?>
        </select>

        <label for="spec1">Specification 1</label>
        <input type="text" id="spec1" name="spec1" required>

        <label for="spec2">Specification 2</label>
        <input type="text" id="spec2" name="spec2" required>

        <label for="spec3">Specification 3</label>
        <input type="text" id="spec3" name="spec3">

        <label for="spec4">Specification 4</label>
        <input type="text" id="spec4" name="spec4">

        <label for="price">Price</label>
        <input type="number" id="price" name="price" required>

        <label for="old_price">Old Price</label>
        <input type="number" id="old_price" name="old_price">

        <button type="submit" name="btn">Insert</button>
    </form>
</body>
</html>