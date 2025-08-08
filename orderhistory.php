<?php
$title = 'Order history | Computer Zone';
include_once('navbar\productstyle.php');
?>

<style>
    .container {
        margin: 20px auto;
        margin-left: 210px;
        margin-top: 50px;
        margin-bottom: 100px;
    }

    .your-order-list {
        font-size: 15px;
        font-weight: 500;
        margin-top: 30px;
        color: #555;
        text-transform: uppercase;
        width: 84%;
        border-bottom: 2px solid #adadad;
    }

    .order-table-container {
        background-color: #ffffff;
        padding-top: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }

    table {
        width: 84%;
        border-collapse: collapse;
    }

    th,
    td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #e0e0e0;
        font-size: 15px;
    }

    th {
        background-color: #f7f7f7;
        font-weight: 500;
        color: #555;
    }

    tr:last-child td {
        border-bottom: none;
    }

    .status-tag {
        display: inline-block;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 13px;
        font-weight: 500;
        text-transform: uppercase;
    }

    .status-unpaid {
        background-color: #6c757d;
        color: #fff;
    }

    .status-pending {
        background-color: #ffc107;
        color: #333;
    }

    .view-detail-link {
        color: #007bff;
        text-decoration: none;
        font-weight: 500;
    }

    .view-detail-link:hover {
        color:rgb(0, 0, 0);
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
        </ul>
    </nav>

    <div class="container">

        <h2 id="h2"> <i class="fa-solid fa-rectangle-list"> </i> Order History </h2>

        <div class="your-order-list">
            YOUR ORDER LIST
        </div>

        <div class="order-table-container">
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Order ID</th>
                        <th>Items</th>
                        <th>Order Amount</th>
                        <th>Order Date</th>
                        <th>Payment Method</th>
                        <th>Payment Status</th>
                        <th>Order Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>144232</td>
                        <td>2</td>
                        <td>Rs.190,450</td>
                        <td>09 Jun, 2025</td>
                        <td>Bank Deposit</td>
                        <td><span class="status-tag status-unpaid">Unpaid</span></td>
                        <td><span class="status-tag status-pending">Pending</span></td>
                        <td><a href="viewdetails.php" class="view-detail-link">View Detail</a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>144231</td>
                        <td>1</td>
                        <td>Rs.95,400</td>
                        <td>09 Jun, 2025</td>
                        <td>Bank Deposit</td>
                        <td><span class="status-tag status-unpaid">Unpaid</span></td>
                        <td><span class="status-tag status-pending">Pending</span></td>
                        <td><a href="viewdetails.php" class="view-detail-link">View Detail</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <?php
    include_once('footer/footer.php');
    ?>

</body>

</html>

<script src="javascript/products.js"></script>