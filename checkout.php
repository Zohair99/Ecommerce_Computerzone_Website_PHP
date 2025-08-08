<?php
session_start();

// Database connection
$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Registration logic
if (isset($_POST['btn'])) {
    // Sanitize inputs
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $contact = mysqli_real_escape_string($conn, $_POST['contact']);
    $password = $_POST['hash_password'];
    $confirm_password = $_POST['confirm_password'];

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email format!");
    }

    // Validate password match
    if ($password !== $confirm_password) {
        die("Passwords do not match!");
    }

    // Hash password
    $hash_password = password_hash($password, PASSWORD_DEFAULT);

    // Prepare the SQL query using prepared statements
    $insert_query = "INSERT INTO register (name, email, hash_password, contact) VALUES (?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $insert_query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "ssss", $name, $email, $hash_password, $contact);
        $result = mysqli_stmt_execute($stmt);

        if ($result) {
            echo "Registered successfully!";

            // Create a session for the user
            $_SESSION['user_id'] = mysqli_insert_id($conn);
            $_SESSION['user_name'] = $name;
            $_SESSION['user_email'] = $email;

            // Redirect to the welcome section
            header("Location: #welcome");
            exit();
        } else {
            echo "Error: " . mysqli_stmt_error($stmt);
        }

        mysqli_stmt_close($stmt);
    } else {
        echo "Error preparing statement: " . mysqli_error($conn);
    }
}

// Login logic
if (isset($_POST['login'])) {
    // Sanitize inputs
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = $_POST['password'];

    // Prepare the SQL query using prepared statements
    $login_query = "SELECT id, name, email, hash_password FROM register WHERE email = ?";
    $stmt = mysqli_prepare($conn, $login_query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "s", $email);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) == 1) {
            mysqli_stmt_bind_result($stmt, $user_id, $user_name, $user_email, $hashed_password);
            mysqli_stmt_fetch($stmt);

            if (password_verify($password, $hashed_password)) {
                // Create a session for the user
                $_SESSION['user_id'] = $user_id;
                $_SESSION['user_name'] = $user_name;
                $_SESSION['user_email'] = $user_email;

                // Redirect to the welcome section
                header("Location: #welcome");
                exit();
            } else {
                echo "Invalid password!";
            }
        } else {
            echo "No user found with this email!";
        }

        mysqli_stmt_close($stmt);
    } else {
        echo "Error preparing statement: " . mysqli_error($conn);
    }
}

// Logout logic
if (isset($_POST['logout'])) {
    session_destroy();
    header("Location: #login");
    exit();
}

$title = 'Checkout';
include_once('navbar/productstyle.php');

mysqli_close($conn);
?>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    .container {
        max-width: 1100px;
        width: 100%;
        margin-left: 173px;
        border-radius: 0.5rem;
        padding: 2rem;
    }

    /* @media (min-width: 768px) {
        .container {
            padding: 2.5rem;
        }
    }

    @media (min-width: 1024px) {
        .container {
            padding: 3rem;
        }
    } */

    .header-section {
        margin-bottom: 2rem;
    }

    .main-title {
        font-size: 1.875rem;
        font-weight: 600;
        color: #1f2937;
    }

    .main-grid {
        display: grid;
        grid-template-columns: 1fr;
        gap: 2rem;
    }

    @media (min-width: 1024px) {
        .main-grid {
            grid-template-columns: repeat(3, minmax(0, 1fr));
        }

        .left-column {
            grid-column: auto;
        }
    }

    .space-y-8>*:not(:first-child) {
        margin-top: 2rem;
    }

    .section-box1 {
        padding: 20px;
        border: 1px solid #b9babd;
        width: 290px;
    }

    .section-box2 {
        padding: 20px;
        border: 1px solid #b9babd;
        width: 220px;
        margin-left: -15px;
    }

    .section-box3 {
        padding: 20px;
        border: 1px solid #b9babd;
        width: 400px;
        margin-left: -95px;
    }

    .section-title {
        font-size: 13px;
        font-weight: bold;
        color: #34495e;
        margin: 0px 0px 15px;
        padding: 10px 0px 0px;
        margin-bottom: 10px;
    }

    .mandatory-text {
        font-size: 0.875rem;
        color: #ff0000;
        margin-bottom: 1rem;
    }

    .form-field-group>*:not(:first-child) {
        margin-top: 1rem;
    }

    .form-label {
        display: block;
        font-size: 0.875rem;
        font-weight: 500;
        color: #374151;
        margin-bottom: 0.25rem;
    }


    .form-select,
    .form-textarea {
        width: 100%;
        padding: 0.5rem;
        border: 1px solid #d1d5db;
        border-radius: 0.375rem;
    }

    .form-input {
        width: 95%;
        padding: 0.5rem;
        border: 1px solid #d1d5db;
        border-radius: 0.375rem;
    }

    .form-input:focus,
    .form-select:focus,
    .form-textarea:focus {
        outline: 2px solid transparent;
        outline-offset: 2px;
        box-shadow: 0 0 0 2px #bfdbfe, 0 0 0 4px #60a5fa;
        border-color: #3b82f6;
    }

    .grid-cols-2-form {
        display: grid;
        grid-template-columns: 1fr;
        gap: 1rem;
    }

    @media (min-width: 768px) {
        .grid-cols-2-form {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    .checkbox-container {
        display: flex;
        align-items: center;
        margin-top: 1rem;
    }

    .checkbox-input {
        height: 1rem;
        width: 1rem;
        color: #3b82f6;
        border-color: #d1d5db;
        border-radius: 0.25rem;
        box-shadow: none;
    }

    .checkbox-input:focus {
        outline: 2px solid transparent;
        outline-offset: 2px;
        box-shadow: 0 0 0 2px #bfdbfe, 0 0 0 4px #60a5fa;
    }

    .checkbox-label {
        margin-left: 0.5rem;
        display: block;
        font-size: 0.875rem;
        color: #1f2937;
    }

    .shipping-info {
        font-size: 13.8px;
        color: #34495e;
    }

    .radio-container1 {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .radio-container2 {
        display: flex;
        align-items: center;
    }

    .radio-input {
        height: 1rem;
        width: 1rem;
        color: #3b82f6;
        border-color: #d1d5db;
        box-shadow: none;
    }

    .radio-input:focus {
        outline: 2px solid transparent;
        outline-offset: 2px;
        box-shadow: 0 0 0 2px #bfdbfe, 0 0 0 4px #60a5fa;
    }

    .radio-label {
        margin-left: 0.5rem;
        display: block;
        font-size: 0.875rem;
        font-weight: 500;
        color: #1f2937;
    }

    .bank-details {
        font-size: 14px;
        color: #374151;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-right: 15px;
        padding-left: 15px;
        margin-bottom: 10px;
        background-color: #f9f9f9;
        border: 1px solid #dbdcde;

    }

    .bank-details p {
        margin-bottom: 0.5rem;
    }

    .bank-details .font-semibold {
        font-weight: 600;
    }

    .order-summary-header {
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #b9babd;
        align-items: center;
        margin-bottom: 1rem;
    }

    .edit-quantity-link {
        color: #34495e;
        text-decoration: none;
        font-size: 0.875rem;
    }

    .edit-quantity-link:hover {
        text-decoration: underline;
    }

    .order-table-container {
        overflow-x: auto;
    }

    .order-table {
        min-width: 100%;
        font-size: 0.875rem;
        color: #4b5563;
        border-collapse: collapse;
    }

    .order-table th,
    .order-table td {
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
        text-align: left;
    }

    .order-table th {
        font-weight: 500;
        color: #374151;
        border-bottom: 1px solid #e5e7eb;
    }

    .order-table td {
        border-bottom: 1px solid #e5e7eb;
    }

    .order-table td.pr-2 {
        padding-right: 0.5rem;
    }

    .order-table td.text-right {
        text-align: right;
    }

    .order-table td.text-center {
        text-align: center;
    }

    .order-table td.whitespace-nowrap {
        white-space: nowrap;
    }

    .order-table .product-name {
        font-size: 12px;
        color: #34495e;
        padding-top: 0.75rem;
        padding-bottom: 0.75rem;
    }

    .order-table .price-total {
        font-weight: 600;
        color: #ff0000;
    }

    .order-table tfoot tr:first-child {
        border-top: 1px solid #e5e7eb;
    }

    .order-table tfoot tr:last-child {
        border-top: 2px solid #9ca3af;
    }

    .order-table tfoot th,
    .order-table tfoot td {
        padding-top: 0.75rem;
        padding-bottom: 0.75rem;
        text-align: right;
        font-weight: 500;
        color: #374151;
    }

    .order-table tfoot .shipping-free {
        font-weight: 600;
        color: #ff0000;
    }

    .order-table tfoot .total-row {
        font-size: 16px;
        text-align: left;
        /* font-weight: 700; */
        color: #34495e;
    }

    .order-table tfoot .total-amount {
        font-size: 1.125rem;
        font-weight: 700;
        color: #ff0000;
    }

    .discount-input-group {
        display: flex;
    }

    .discount-input {
        flex-grow: 1;
        padding: 0.5rem;
        border: 1px solid #d1d5db;
        border-top-left-radius: 0.375rem;
        border-bottom-left-radius: 0.375rem;
        border-right: none;
    }

    .discount-input:focus {
        outline: 2px solid transparent;
        outline-offset: 2px;
        box-shadow: 0 0 0 2px #bfdbfe, 0 0 0 4px #60a5fa;
        border-color: #3b82f6;
    }

    .apply-button {
        background-color: #bdc3c7;
        color: #ffffff;
        padding-left: 1rem;
        padding-right: 1rem;
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
        border-top-right-radius: 0.375rem;
        border-bottom-right-radius: 0.375rem;
        border: none;
        cursor: pointer;
    }

    .apply-button:hover {
        background-color: #2563eb;
    }

    .apply-button:focus {
        outline: none;
        box-shadow: 0 0 0 2px #bfdbfe, 0 0 0 4px #60a5fa;
    }

    .comments-textarea {
        width: 95%;
        padding: 0.5rem;
        border: 1px solid #d1d5db;
        border-radius: 0.375rem;
        resize: vertical;
    }

    .comments-textarea:focus {
        outline: 2px solid transparent;
        outline-offset: 2px;
        box-shadow: 0 0 0 2px #bfdbfe, 0 0 0 4px #60a5fa;
        border-color: #3b82f6;
    }

    .confirm-button-container {
        margin-top: 2rem;
        display: flex;
        justify-content: flex-end;
    }

    .confirm-button {
        background-color: #2b3e5e;
        color: #ffffff;
        font-weight: 600;
        padding-top: 0.75rem;
        padding-bottom: 0.75rem;
        padding-left: 2rem;
        padding-right: 2rem;
        border-radius: 0.375rem;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        cursor: pointer;
        transition: background-color 0.2s ease-in-out;
    }

    .confirm-button:hover {
        background-color: rgb(24, 51, 137);
    }

    .check {
        font-size: 26px;
        color: #34495e;
    }
</style>

<body>

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="add_details.php" class="active">Cart</a></li>
            <li>/</li>
            <li><a href="checkout.php" class="active">Checkout</a></li>
        </ul>
    </nav>

    <div class="container">
        <header class="check">Checkout</header><br><br>
        <div class="header-section">
            <div class="main-grid">
                <div class="column-1 space-y-8">
                    <div class="section-box1">
                        <div class="order-summary-header">
                            <h2 class="section-title">1. YOUR INFORMATION</h2>
                        </div>
                        <p class="mandatory-text">Fields with (*) are mandatory</p>

                        <div class="form-field-group">
                            <div>
                                <label for="fullName" class="form-label">Full Name *</label>
                                <input type="text" id="fullName" placeholder="Full Name" class="form-input">
                            </div>
                            <div>
                                <label for="phoneMobile" class="form-label">Phone/Mobile *</label>
                                <input type="text" id="phoneMobile" placeholder="03xxxxxxxxx" class="form-input">
                            </div>
                            <div>
                                <label for="addressLine1" class="form-label">Address *</label>
                                <input type="text" id="addressLine1" placeholder="Address Line 1" class="form-input">
                            </div>
                            <div>
                                <input type="text" id="addressLine2" placeholder="Address Line 2" class="form-input">
                            </div>

                            <div class="grid-cols-1-form">
                                <div>
                                    <label for="country" class="form-label">Country *</label>
                                    <select id="country" class="form-select">
                                        <option value="">Select</option>
                                        <option value="PK">Pakistan</option>
                                    </select>
                                </div>

                            </div>
                            <div class="grid-cols-2-form">

                                <div>
                                    <label for="state" class="form-label">State *</label>
                                    <select id="state" class="form-select">
                                        <option value="">Select</option>
                                        <option value="Sindh">Sindh</option>
                                        <option value="Punjab">Punjab</option>
                                        <option value="Balochistan">Balochistan</option>
                                        <option value="Khyber-Pakhtunkhwa">Khyber-Pakhtunkhwa</option>
                                        <option value="Gilgit-Baltistan">Gilgit-Baltistan</option>
                                        <option value="Azad-Kashmir">Azad Kashmir</option>
                                    </select>
                                </div>
                                <div>
                                    <label for="city" class="form-label">City *</label>
                                    <input type="text" id="city" placeholder="City" class="form-input">
                                </div>
                            </div>
                            <div class="grid-cols-1-form">

                                <div>
                                    <label for="zipCode" class="form-label">Zip/Postal Code *</label>
                                    <input type="text" id="zipCode" placeholder="Zip/Postal Code" class="form-input">
                                </div>
                            </div>

                            <div class="checkbox-container">
                                <input type="checkbox" id="sameAddress" class="checkbox-input">
                                <label for="sameAddress" class="checkbox-label">Delivery to the same address</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="column-2 space-y-8">
                    <div class="section-box2">
                        <div class="order-summary-header">
                            <h2 class="section-title">2. SHIPPING (DELIVERY)</h2>
                        </div>
                        <div class="mb-4">
                            <select class="form-select">
                                <option>Free Shipping</option>
                            </select>
                        </div>
                        <p class="shipping-info">Please select a delivery method. Respective shipping charges will be added to your order amount</p>
                    </div>

                    <div class="section-box2">
                        <div class="order-summary-header">
                            <h2 class="section-title">3. PAYMENT METHODS</h2>
                        </div>
                        <div class="radio-container1">
                            <input type="radio" id="bankDeposit" name="paymentMethod" value="bankDeposit" class="radio-input" checked>
                            <label for="bankDeposit" class="radio-label">Bank Deposit</label>
                        </div>
                        <div class="bank-details">
                            <p>Deposit your order amount in the following Bank Account.</p>
                            <p class="font-semibold">Faysal Bank Limited</p>
                            <p>Title: CZONE</p>
                            <p>Account #: PK97FAYS3512787000003264</p>
                        </div>
                        <div class="radio-container2">
                            <input type="radio" id="bankDeposit" name="paymentMethod" value="bankDeposit" class="radio-input" checked>
                            <label for="bankDeposit" class="radio-label">Cash on Delivery (Khi)</label>
                        </div>
                    </div>
                </div>

                <div class="column-3 space-y-8">
                    <div class="section-box3">
                        <div class="order-summary-header">
                            <h2 class="section-title">4. ORDER SUMMARY</h2>
                            <a href="#" class="edit-quantity-link">Edit Quantity</a>
                        </div>

                        <div class="order-table-container">
                            <table class="order-table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th class="text-right">Price</th>
                                        <th class="text-center">Quantity</th>
                                        <th class="text-right">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="product-name pr-2">SteelSeries Apex 3 Water Resistant RGB Gaming Keyboard - 64795 - Whisper Quiet Gaming Switch - English US</td>
                                        <td class="text-right whitespace-nowrap">Rs.18,500</td>
                                        <td class="text-center">1</td>
                                        <td class="price-total text-right whitespace-nowrap">Rs.18,500</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="3" class="total-row">Sub Total</td>
                                        <td class="price-total text-right whitespace-nowrap">Rs.18,500</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="total-row">Shipping Charges</td>
                                        <td class="shipping-free text-right">Free</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="total-row">Total: </td>
                                        <td class="total-amount text-right whitespace-nowrap">Rs.18,500</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>

                    <div class="section-box3">
                        <div class="order-summary-header">
                            <h2 class="section-title">5. DISCOUNT COUPON</h2>
                        </div>
                        <div class="discount-input-group">
                            <input type="text" placeholder="Discount Coupon" class="discount-input">
                            <button class="apply-button">Apply</button>
                        </div>
                    </div>

                    <div class="section-box3">
                        <div class="order-summary-header">
                            <h2 class="section-title">6. OTHER INFORMATION</h2>
                        </div>
                        <div>
                            <label for="comments" class="form-label">Comments</label>
                            <textarea id="comments" rows="3" placeholder="Any special instructions (Optional)" class="comments-textarea"></textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="confirm-button-container">
                <a href="confirm.php"><button class="confirm-button">
                    Confirm Now
                </button></a>
            </div>
        </div>
    </div>

    <?php
    include_once('footer/footer.php');
    ?>

</body>

</html>

<script src="javascript/products.js"></script>