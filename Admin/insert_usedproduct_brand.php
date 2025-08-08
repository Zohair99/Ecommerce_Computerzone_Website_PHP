<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_store = null;
$stmt_brand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        // Changed variable names from usb to usedproduct
        $usedproductstore = $_POST['usedproductstore'] ?? null;
        $usedproductbrand = $_POST['usedproductbrand'] ?? null;

        if (empty($usedproductstore) && empty($usedproductbrand)) {
            throw new Exception("At least one field (Category/Store or Brand) is required.");
        }

        if (!empty($usedproductstore)) {
            // Changed table and column name to usedproduct_store and usedproductstore
            $sql_store = "INSERT INTO usedproduct_store (usedproductstore) VALUES (?)";
            $stmt_store = $conn->prepare($sql_store);
            if (!$stmt_store) {
                throw new Exception("Prepare failed for usedproduct_store: " . $conn->error);
            }
            // Changed bind_param variable to usedproductstore
            $stmt_store->bind_param("s", $usedproductstore);
            $stmt_store->execute();
        }

        if (!empty($usedproductbrand)) {
            // Changed table and column name to usedproduct_brand and usedproductbrand
            $sql_brand = "INSERT INTO usedproduct_brand (usedproductbrand) VALUES (?)";
            $stmt_brand = $conn->prepare($sql_brand);
            if (!$stmt_brand) {
                throw new Exception("Prepare failed for usedproduct_brand: " . $conn->error);
            }
            // Changed bind_param variable to usedproductbrand
            $stmt_brand->bind_param("s", $usedproductbrand);
            $stmt_brand->execute();
        }

        mysqli_commit($conn);
        $message = "Used Product data inserted successfully!"; // Updated success message
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_store) $stmt_store->close();
        if ($stmt_brand) $stmt_brand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Used Product Category & Brand</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 0 10px #ccc;
        }
        h1 {
            text-align: center;
        }
        label {
            margin-top: 10px;
            display: block;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            margin-top: 5px;
            padding: 10px;
        }
        input[type="submit"] {
            background: #28a745;
            color: white;
            border: none;
            margin-top: 20px;
            cursor: pointer;
        }
        .message {
            margin-top: 15px;
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Add Used Product Category & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="usedproductstore">Used Product Category</label>
        <input type="text" id="usedproductstore" name="usedproductstore">

        <label for="usedproductbrand">Used Product Brand</label>
        <input type="text" id="usedproductbrand" name="usedproductbrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>