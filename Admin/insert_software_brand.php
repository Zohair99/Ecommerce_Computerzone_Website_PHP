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
        $softwarestore = $_POST['softwarestore'] ?? null;
        $softwarebrand = $_POST['softwarebrand'] ?? null;

        if (empty($softwarestore) && empty($softwarebrand)) {
            throw new Exception("At least one field (Category/Store or Brand) is required.");
        }

        if (!empty($softwarestore)) {
            $sql_store = "INSERT INTO software_store (softwarestore) VALUES (?)";
            $stmt_store = $conn->prepare($sql_store);
            if (!$stmt_store) {
                throw new Exception("Prepare failed for software_store: " . $conn->error);
            }
            $stmt_store->bind_param("s", $softwarestore);
            $stmt_store->execute();
        }

        if (!empty($softwarebrand)) {
            $sql_brand = "INSERT INTO software_brand (softwarebrand) VALUES (?)";
            $stmt_brand = $conn->prepare($sql_brand);
            if (!$stmt_brand) {
                throw new Exception("Prepare failed for software_brand: " . $conn->error);
            }
            $stmt_brand->bind_param("s", $softwarebrand);
            $stmt_brand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
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
    <title>Add Software Category & Brand</title>
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
    <h1>Add Software Category & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="softwarestore">Software Category</label>
        <input type="text" id="softwarestore" name="softwarestore">

        <label for="softwarebrand">Software Brand</label>
        <input type="text" id="softwarebrand" name="softwarebrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
