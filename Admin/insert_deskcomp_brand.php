<?php
// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Initialize variables
$stmt_deskcomp_store = null;
$stmt_deskcomp_brand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        $deskcompstore = $_POST['deskcompstore'] ?? null;
        $deskcompbrand = $_POST['deskcompbrand'] ?? null;

        if (empty($deskcompstore) && empty($deskcompbrand)) {
            throw new Exception("At least one field is required.");
        }

        if (!empty($deskcompstore)) {
            $sql_deskcomp_store = "INSERT INTO deskcomp_store (deskcompstore) VALUES (?)";
            $stmt_deskcomp_store = $conn->prepare($sql_deskcomp_store);
            if (!$stmt_deskcomp_store) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_deskcomp_store->bind_param("s", $deskcompstore);
            $stmt_deskcomp_store->execute();
        }

        if (!empty($deskcompbrand)) {
            $sql_deskcomp_brand = "INSERT INTO deskcomp_brand (deskcompbrand) VALUES (?)";
            $stmt_deskcomp_brand = $conn->prepare($sql_deskcomp_brand);
            if (!$stmt_deskcomp_brand) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_deskcomp_brand->bind_param("s", $deskcompbrand);
            $stmt_deskcomp_brand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_deskcomp_store) $stmt_deskcomp_store->close();
        if ($stmt_deskcomp_brand) $stmt_deskcomp_brand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Deskcomp Store and Brand</title>
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
    <h1>Insert Deskcomp Store & Brand</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="deskcompstore">Deskcomp Store:</label>
        <input type="text" id="deskcompstore" name="deskcompstore">

        <label for="deskcompbrand">Deskcomp Brand:</label>
        <input type="text" id="deskcompbrand" name="deskcompbrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
