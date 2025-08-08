<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_carttrones_store = null;
$stmt_carttrones_brand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        $cattronesstore = $_POST['cattronesstore'] ?? null;
        $carttronesbrand = $_POST['carttronesbrand'] ?? null;

        if (empty($cattronesstore) && empty($carttronesbrand)) {
            throw new Exception("At least one field is required.");
        }

        if (!empty($cattronesstore)) {
            $sql_carttrones_store = "INSERT INTO carttrones_store (cattronesstore) VALUES (?)";
            $stmt_carttrones_store = $conn->prepare($sql_carttrones_store);
            if (!$stmt_carttrones_store) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_carttrones_store->bind_param("s", $cattronesstore);
            $stmt_carttrones_store->execute();
        }

        if (!empty($carttronesbrand)) {
            $sql_carttrones_brand = "INSERT INTO carttrones_brand (carttronesbrand) VALUES (?)";
            $stmt_carttrones_brand = $conn->prepare($sql_carttrones_brand);
            if (!$stmt_carttrones_brand) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_carttrones_brand->bind_param("s", $carttronesbrand);
            $stmt_carttrones_brand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_carttrones_store) $stmt_carttrones_store->close();
        if ($stmt_carttrones_brand) $stmt_carttrones_brand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Carttrones Store and Brand</title>
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
    <h1>Insert Carttrones Store & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="cattronesstore">Carttrones Store:</label>
        <input type="text" id="cattronesstore" name="cattronesstore">

        <label for="carttronesbrand">Carttrones Brand:</label>
        <input type="text" id="carttronesbrand" name="carttronesbrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>