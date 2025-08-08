<?php
$title = 'Thank You | Computer Zone';
include_once('navbar\productstyle.php');
?>

<style>
    .container {
        border-radius: 8px;
        margin-left: 210px;
        margin-top: 50px;
        margin-right: 173px;
        margin-bottom: 50px;
    }

    h1 {
        color: #2b3e5e;
        font-size: 28px;
        margin-bottom: 25px;
        font-weight: 500;
    }

    p {
        margin-bottom: 15px;
        font-size: 14px;
        color: #2b3e5e;
    }

    .order-info {
        margin-top: 25px;
        margin-bottom: 30px;
        color: #2b3e5e;
    }

    .order-info strong {
        font-size: 16px;
        color: #2b3e5e;
    }

    .order-id {
        color: #2b3e5e;
        text-decoration: none;
        font-weight: bold;
    }

    .order-id:hover {
        text-decoration: underline;
    }

    h2 {
        color: #2b3e5e;
        font-size: 22px;
        margin-top: 35px;
        margin-bottom: 20px;
    }

    .bank-details-text {
        font-size: 14px;
        color: #2b3e5e;
        margin-bottom: 25px;
    }

    table {
        width: 80%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fcfcfc;
        border: 1px solid #e0e0e0;
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
</style>
</head>

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
        <h1>Thank you!</h1>

        <p>Thank you for placing order with Computer Zone. Following is your Order ID for future reference.</p>

        <div class="order-info">
            <strong> Order ID: </strong> <a href="orderhistory.php" class="order-id"> 144232 </a>  Click here to view order detail
        </div>

        <h2>Bank Account Details</h2>

        <p class="bank-details-text">You can deposit your order amount in any of the following Bank Accounts. After deposit, kindly provide us with the deposit receipt number for verification. For this option, go to My Account » Order History » Order Detail.</p>

        <table>
            <thead>
                <tr>
                    <th>Bank Name</th>
                    <th>Account Title</th>
                    <th>Account Number</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Faysal Bank Limited</td>
                    <td>CZONE</td>
                    <td>PK97FAYS3512787000003264</td>
                </tr>
                <tr>
                    <td>Al-Habib Bank Limited</td>
                    <td>MUHAMMAD ZOHAIR</td>
                    <td>PK85HBLS5879654123654789</td>
                </tr>
            </tbody>
        </table>
    </div>

    <?php
    include_once('footer/footer.php');
    ?>

</body>

</html>

<script src="javascript/products.js"></script>