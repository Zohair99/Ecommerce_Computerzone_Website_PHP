<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_casing_store = null;
$stmt_casing_brand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        $casingstore = $_POST['casingstore'] ?? null;
        $casingbrand = $_POST['casingbrand'] ?? null;

        if (empty($casingstore) && empty($casingbrand)) {
            throw new Exception("At least one field is required.");
        }

        if (!empty($casingstore)) {
            $sql_casing_store = "INSERT INTO casing_store (casingstore) VALUES (?)";
            $stmt_casing_store = $conn->prepare($sql_casing_store);
            if (!$stmt_casing_store) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_casing_store->bind_param("s", $casingstore);
            $stmt_casing_store->execute();
        }

        if (!empty($casingbrand)) {
            $sql_casing_brand = "INSERT INTO casing_brand (casingbrand) VALUES (?)";
            $stmt_casing_brand = $conn->prepare($sql_casing_brand);
            if (!$stmt_casing_brand) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_casing_brand->bind_param("s", $casingbrand);
            $stmt_casing_brand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_casing_store) $stmt_casing_store->close();
        if ($stmt_casing_brand) $stmt_casing_brand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Casing Store and Brand</title>
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
    <h1>Insert Casing Store & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="casingstore">Casing Store:</label>
        <input type="text" id="casingstore" name="casingstore">

        <label for="casingbrand">Casing Brand:</label>
        <input type="text" id="casingbrand" name="casingbrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
