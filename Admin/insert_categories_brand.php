<?php
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$stmt_cattrones = null;
$stmt_catbrand = null;
$message = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    mysqli_begin_transaction($conn);

    try {
        $cattrones = $_POST['cattrones'] ?? null;
        $catbrand = $_POST['catbrand'] ?? null;

        if (empty($cattrones) && empty($catbrand)) {
            throw new Exception("At least one field is required.");
        }

        if (!empty($cattrones)) {
            $sql_cattrones = "INSERT INTO categories_store (cattrones) VALUES (?)";
            $stmt_cattrones = $conn->prepare($sql_cattrones);
            if (!$stmt_cattrones) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_cattrones->bind_param("s", $cattrones);
            $stmt_cattrones->execute();
        }

        if (!empty($catbrand)) {
            $sql_catbrand = "INSERT INTO categories_brand (catbrand) VALUES (?)";
            $stmt_catbrand = $conn->prepare($sql_catbrand);
            if (!$stmt_catbrand) {
                throw new Exception("Prepare failed: " . $conn->error);
            }
            $stmt_catbrand->bind_param("s", $catbrand);
            $stmt_catbrand->execute();
        }

        mysqli_commit($conn);
        $message = "Data inserted successfully!";
    } catch (Exception $e) {
        mysqli_rollback($conn);
        $message = "Transaction failed: " . $e->getMessage();
    } finally {
        if ($stmt_cattrones) $stmt_cattrones->close();
        if ($stmt_catbrand) $stmt_catbrand->close();
    }
}

mysqli_close($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Categories & Brands</title>
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
    <h1>Insert Cattrones & Brands</h1>
    <?php if ($message): ?>
        <div class="message"><?= htmlspecialchars($message) ?></div>
    <?php endif; ?>
    <form method="post">
        <label for="cattrones">Cattrone:</label>
        <input type="text" id="cattrones" name="cattrones">

        <label for="catbrand">Brand:</label>
        <input type="text" id="catbrand" name="catbrand">

        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>
