<?php
session_start();

$conn = mysqli_connect("localhost", "root", "", "computerzone");
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['remove_item'])) {
        $itemIndex = $_POST['item_index'];
        if (isset($_SESSION['cart'][$itemIndex])) {
            unset($_SESSION['cart'][$itemIndex]);
            $_SESSION['cart'] = array_values($_SESSION['cart']);
        }
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    } elseif (isset($_POST['update_quantity'])) {
        $itemIndex = $_POST['item_index'];
        $newQuantity = intval($_POST['quantity']);
        if ($newQuantity > 0 && isset($_SESSION['cart'][$itemIndex])) {
            $_SESSION['cart'][$itemIndex]['quantity'] = $newQuantity;
        }
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    }
}

$totalProducts = count($_SESSION['cart'] ?? []);
$totalItems = 0;
$grandTotal = 0;

$cartItems = [];
if (!empty($_SESSION['cart'])) {
    foreach ($_SESSION['cart'] as $index => $cartItem) {
        $table = $cartItem['table'];
        $product_id = $cartItem['id'];

        $query = "SELECT * FROM $table WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $product_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $product = $result->fetch_assoc();

            $itemTotal = $cartItem['price'] * $cartItem['quantity'];
            $totalItems += $cartItem['quantity'];
            $grandTotal += $itemTotal;

            $cartItems[] = [
                'index' => $index,
                'id' => $product_id,
                'name' => $product['name'],
                'price' => $cartItem['price'],
                'quantity' => $cartItem['quantity'],
                'image' => $product['image'],
                'category' => $product['category'] ?? 'Uncategorized',
                'total' => $itemTotal
            ];
        }
        $stmt->close();
    }
}

$title = 'Peripherals / Mics in Pakistan | Computer Zone';
include_once('navbar/productstyle.php');

mysqli_close($conn);
?>
<style>
    /* add details */

    .cart-container {
        max-width: 1300px;
        margin: auto;
        background: #fff;
        padding: 20px;
        margin-left: 200px;
        margin-right: 200px;
    }

    .cart-container h2 {
        margin-bottom: 20px;
        color: #34495e;
        font-size: 26px;
        font-weight: 100;
    }

    .cart-layout {
        display: flex;
        gap: 20px;
    }

    .cart-left {
        flex: 3;
    }

    .cart-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .cart-table th,
    .cart-table td {
        border-bottom: 1px solid #ddd;
        padding: 15px;
        text-align: center;
        color: #34495e;

    }

    .cart-table th {
        background-color: #Ebedef;
        color: #34495e;
        text-transform: uppercase;
        font-size: 14px;
    }

    .cart-table td img {
        width: 80px;
        height: 80px;
        object-fit: contain;
        border: 1px solid #ddd;
        background: #fff;
        margin-right: 10px;
    }

    .cart-table .product-details {
        display: flex;
        align-items: center;
        text-align: left;
        color: #34495e;
    }

    .cart-table .product-info {
        line-height: 1.4;
        font-size: 14px;
        color: #34495e;
    }

    .cart-table .product-info small {
        font-size: 12px;
        color: #afafaf;
    }

    .cart-table input[type="number"] {
        width: 25px;
        height: 20px;
        padding: 5px;
        border-color: #afafaf;
        text-align: center;
    }

    .delete-btn {
        color: #34495e;
        font-size: 18px;
    }

    .delete-btn:hover {
        color: #c82333;
    }

    strong {
        font-size: 14px;
    }

    .total-section {
        text-align: right;
        font-size: 14px;
        margin-bottom: 20px;
        margin-right: 20px;
    }

    .total-section strong {
        padding-right: 450px;

    }

    .total-price {
        color: #e40613;
        font-weight: bold;
    }

    .cart-actions {
        display: flex;
        justify-content: space-between;
        margin-bottom: 30px;
    }

    .continue-btn {
        background: #ccc;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
    }

    .checkout-btn {
        background: #1c355e;
        color: white;
        border: none;
        padding: 10px 25px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    .checkout-btn i {
        margin-left: 10px;
    }

    .checkout-btn:hover {
        background-color: #142644;
    }

    .full-width {
        width: 100%;
        margin-bottom: 20px;
        margin-left: -1px;
    }

    .sidebar-summary {
        flex: 1;
        border-radius: 8px;
        height: fit-content;
    }

    .summary-info p {
        margin: 10px 0;
        margin-left: 15px;
        font-size: 18px;
        color: #34495e;
    }

    .summary-info strong {
        text-align: right;
        align-content: right;
        align-items: right;
        color: #afafaf;
    }

    .total-price-red {
        color: #e40613;
        font-weight: bold;
    }

    .product-name {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 250px;
        display: block;
    }

    .product-info small {
        display: block;
        margin-top: 5px;
    }

    /* add details */
</style>

<body>

    <!-- breadcrumb -->

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="add_details.php" class="active">Cart</a></li>
        </ul>
    </nav>

    <div class="cart-container">
        <h2>Shopping Cart</h2>

        <div class="cart-layout">
            <div class="cart-left">
                <?php if (empty($cartItems)): ?>
                    <p>Your cart is empty. <a href="index.php">Continue shopping</a></p>
                <?php else: ?>
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($cartItems as $index => $item): ?>
                                <tr>
                                    <td><?= $index + 1 ?></td>
                                    <td class="product-details">
                                        <img src="Admin/images/<?= htmlspecialchars($item['image']) ?>" alt="Product Image">
                                        <div class="product-info">
                                            <div class="product-name"><?= htmlspecialchars(str_replace(["\r", "\n"], ' ', $item['name'])) ?></div>
                                            <small><?= htmlspecialchars($item['category']) ?></small>
                                        </div>
                                    </td>
                                    <td><strong>Rs.<?= number_format($item['price'], 2) ?></strong></td>
                                    <td>
                                        <form method="post" style="display:inline;">
                                            <input type="hidden" name="item_index" value="<?= $item['index'] ?>">
                                            <input type="number" name="quantity" value="<?= $item['quantity'] ?>" min="1"
                                                onchange="this.form.submit()">
                                            <input type="hidden" name="update_quantity" value="1">
                                        </form>
                                    </td>
                                    <td><strong>Rs.<?= number_format($item['total'], 2) ?></strong></td>
                                    <td>
                                        <form method="post" style="display:inline;">
                                            <input type="hidden" name="item_index" value="<?= $item['index'] ?>">
                                            <button type="submit" name="remove_item" class="delete-btn" style="background:none; border:none;">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>

                    <div class="total-section">
                        <p><strong>Total:</strong> <span class="total-price">Rs.<?= number_format($grandTotal, 2) ?></span></p>
                    </div>

                    <div class="cart-actions">
                        <button class="continue-btn" onclick="window.location.href='index.php'">Continue Shopping</button>
                        <button class="checkout-btn" onclick="window.location.href='checkout.php'">
                            Proceed to Checkout <i class="fa-solid fa-arrow-right"></i>
                        </button>
                    </div>
                <?php endif; ?>
            </div>

            <div class="sidebar-summary">
                <button class="checkout-btn full-width" onclick="window.location.href='checkout.php'">
                    Proceed to Checkout <i class="fa-solid fa-arrow-right"></i>
                </button>

                <div class="summary-info">
                    <p><strong>Total products:</strong> <?= $totalProducts ?></p>
                    <p><strong>Total items:</strong> <?= $totalItems ?></p>
                    <p><strong>Total:</strong> <span class="total-price-red">Rs.<?= number_format($grandTotal, 2) ?></span></p>
                </div>
            </div>
        </div>
    </div>


    <?php
    include_once('footer/footer.php');
    ?>

</body>

</html>

<script src="javascript/products.js"></script>