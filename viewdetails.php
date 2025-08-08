<?php
$title = 'Order history | Computer Zone';
include_once('navbar\productstyle.php');
?>

<style>
    .container {
        margin-left: 210px;
        margin-right: 210px;
        margin-top: 50px;
        margin-bottom: 100px;
    }

    .order-detail-header {
        display: flex;
        align-items: center;
        padding: 20px;
        border-radius: 5px;
        margin-bottom: 20px;
        margin-top: 20px;
    }

    .order-detail-header i {
        font-size: 28px;
        color: #007bff;
        margin-right: 15px;
    }

    .order-detail-header h1 {
        font-size: 24px;
        color: #333;
        margin: 0;
        font-weight: 500;
    }

    .order-id-section {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: 500;
        margin-top: 25px;
        margin-bottom: 10px;
        color: #555;
        font-size: 15px;
    }

    .order-id-section i {
        font-size: 20px;
        color: #666;
        cursor: pointer;
    }

    .order-info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 30px;
        padding: 20px;
        border-top: 1px solid #e0e0e0;
    }

    .order-info-grid div p {
        margin: 0;
        padding: 3px 0;
        font-size: 15px;
        color: #444;
    }

    .order-info-grid div p strong {
        color: #222;
    }

    .order-info-grid .left-col {
        padding-right: 0;
    }

    .order-info-grid .right-col {
        padding-left: 20px;
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
        background: #fff;
        margin-right: 35px;
        margin-left: 15px;
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

    .product-names {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        max-width: 350px;
        display: block;
    }

    .product-info small {
        display: block;
        margin-top: 5px;
    }
</style>
</head>

<body>

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="create-account.php" class="active">Account</a></li>
            <li>/</li>
            <li><a href="orderhistory.php" class="active">Order History</a></li>
            <li>/</li>
            <li><a href="viewdetails.php" class="active">Order Details</a></li>
        </ul>
    </nav>

    <div class="container">

        <h2 id="h2"> <i class="fa-solid fa-rectangle-list"> </i> Order Details </h2>

        <div class="order-id-section">
            <div class="label">ORDER ID:</div>
            <i class="fas fa-print"></i>
        </div>

        <div class="order-info-grid">
            <div class="left-col">
                <p><strong>Order ID:</strong> 144232</p>
                <p><strong>Order Date:</strong> 09 Jun, 2025</p>
                <p><strong>Status:</strong> Pending</p>
            </div>
            <div class="right-col">
                <p><strong>Payment Method:</strong> Bank Deposit</p>
                <p><strong>Payment Status:</strong> Unpaid</p>
                <p class="payment-status-text">Enter bank deposit receipt number for verification</p>
            </div>
        </div>

        <div class="cart-layout">
            <div class="cart-left">
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
                        <tr>
                            <td> 1</td>
                            <td class="product-details">
                                <img src="Admin\images\1-czone.com.pk-1-1540-17407-271124083404.jpg" alt="Product Image">
                                <div class="product-info">
                                    <div class="product-names">SteelSeries Arena 7 Illuminated 2.1 Gaming Speakers - 61542 | UK Plug - USB, Bluetooth</div>
                                    <small>Speakers > Bluetooth Speakers</small>
                                </div>
                            </td>
                            <td><strong>Rs.111,111</strong></td>
                            <td>
                                <form method="post" style="display:inline;">
                                    <input type="hidden" name="item_index" value="">
                                    <p>1</p>
                                    <input type="hidden" name="update_quantity" value="1">
                                </form>
                            </td>
                            <td><strong>Rs.111,111</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="sidebar-summary">

                <div class="summary-info">
                    <p><strong>Sub-Total:</strong></p>
                    <p><strong>Shipping Charges:</strong></p>
                    <p><strong>Total:</strong> <span class="total-price-red">Rs.456,555</span></p>
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