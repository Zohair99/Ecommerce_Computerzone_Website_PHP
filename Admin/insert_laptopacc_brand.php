<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_acc = null;
$stmt_brand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        $laptopacc = $_POST['laptopacc'] ?? null;
        $brand = $_POST['brand'] ?? null;

        if (empty($laptopacc) && empty($brand)) {
            throw new Exception("At least one field is required.");
        }

        if (!empty($laptopacc)) {
            $sql_acc = "INSERT INTO laptopacc_store (laptopacc) VALUES (?)";
            $stmt_acc = $conn->prepare($sql_acc);
            if (!$stmt_acc) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_acc->bind_param("s", $laptopacc);
            $stmt_acc->execute();
        }

        if (!empty($brand)) {
            $sql_brand = "INSERT INTO brand_store (brand) VALUES (?)";
            $stmt_brand = $conn->prepare($sql_brand);
            if (!$stmt_brand) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_brand->bind_param("s", $brand);
            $stmt_brand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_acc) $stmt_acc->close();
        if ($stmt_brand) $stmt_brand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Laptop Accessory and Brand</title>
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
    <h1>Insert Laptop Accessory & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="laptopacc">Laptop Accessory:</label>
        <input type="text" id="laptopacc" name="laptopacc">

        <label for="brand">Brand:</label>
        <input type="text" id="brand" name="brand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
