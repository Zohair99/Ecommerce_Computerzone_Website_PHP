<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_cooling_store = null;
$stmt_cooling_brand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        $coolingstore = $_POST['coolingstore'] ?? null;
        $coolingbrand = $_POST['coolingbrand'] ?? null;

        if (empty($coolingstore) && empty($coolingbrand)) {
            throw new Exception("At least one field is required.");
        }

        if (!empty($coolingstore)) {
            $sql_cooling_store = "INSERT INTO cooling_store (coolingstore) VALUES (?)";
            $stmt_cooling_store = $conn->prepare($sql_cooling_store);
            if (!$stmt_cooling_store) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_cooling_store->bind_param("s", $coolingstore);
            $stmt_cooling_store->execute();
        }

        if (!empty($coolingbrand)) {
            $sql_cooling_brand = "INSERT INTO cooling_brand (coolingbrand) VALUES (?)";
            $stmt_cooling_brand = $conn->prepare($sql_cooling_brand);
            if (!$stmt_cooling_brand) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_cooling_brand->bind_param("s", $coolingbrand);
            $stmt_cooling_brand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_cooling_store) $stmt_cooling_store->close();
        if ($stmt_cooling_brand) $stmt_cooling_brand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Cooling Store and Brand</title>
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
    <h1>Insert Cooling Store & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="coolingstore">Cooling Store:</label>
        <input type="text" id="coolingstore" name="coolingstore">

        <label for="coolingbrand">Cooling Brand:</label>
        <input type="text" id="coolingbrand" name="coolingbrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
