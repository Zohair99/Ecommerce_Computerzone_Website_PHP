<?php
$title = 'About Computer Zone';
include_once('navbar/productstyle.php');
?>
<style>
    /* Profile */

    .account-container {
        display: flex;
        margin: 0 auto;
        border-radius: 5px;
        overflow: hidden;
        margin-top: -20px;

    }

    .sidebar {
        width: 250px;
        height: 250px;
        color: #34495e;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    .sidebar h2 {
        padding: 15px 20px;
        margin: 0;
        font-size: 18px;
        border-bottom: 1px solid #34495e;
        background-color: #34495e;
        font-weight: normal;
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .sidebar li {
        border: 1px solid #34495e;
    }

    .sidebar li a {
        display: block;
        padding: 12px 20px;
        color: #34495e;
        text-decoration: none;
        transition: all 0.3s ease;
        font-size: 14px;
    }

    .sidebar li a:hover {
        background-color: #bdbdbd;
        padding-left: 25px;
    }

    .sidebar li a:active {
        background-color: #34495e;
    }

    .main-content {
        flex: 1;
        padding: 30px;
        margin-left: 220px;
        color: #34495e;
    }

    .section-title {
        width: 810px;
        font-size: 24px;
        margin-bottom: 20px;
        color: #34495e;
        border-bottom: 1px solid #34495e;
        border-width: 2px;
        /* padding-bottom: 10px; */
    }

    .profile-info {
        margin-bottom: 30px;
    }

    .info-row {
        display: flex;
        margin-bottom: 15px;
    }

    .info-label {
        width: 150px;
        font-weight: bold;
    }

    .info-value {
        flex: 1;
    }

    .addresses {
        width: 770px;
        background-color:#e7e7e7;
        color: #34495e;
        padding: 20px;
        border-radius: 5px;
    }

    .no-address {
        color: #777;
        font-style: italic;
    }

    .profile {
        font-size: 26px;
        color: #34495e;
        margin-left: 210px;
    }
</style>
</head>

<body>

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="profile.php" class="active"> Account </a>
            </li>
        </ul>
    </nav>

    <!-- Profile -->
    <br>
    <header class="profile">Account</header>
    <div class="account-container">
        <div class="sidebar">
            <button class="filter-toggle"> <i class="fa-solid fa-caret-down"> </i> Account Links</button>
            <ul>
                <li><a href="#">Account</a></li>
                <li><a href="#">Change Password</a></li>
                <li><a href="#">Order History</a></li>
                <li><a href="#">Shopping Cart</a></li>
            </ul>
        </div>

        <div class="main-content">
            <h1 class="section-title">MY PROFILE</h1>

            <div class="profile-info">
                <div class="info-row">
                    <div class="info-label">Full Name:</div>
                    <div class="info-value">Muhammad Zohair</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Email Address:</div>
                    <div class="info-value">mohammadzohair41@gmail.com</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Gender:</div>
                    <div class="info-value"> - </div>
                </div>
                <div class="info-row">
                    <div class="info-label">Phone:</div>
                    <div class="info-value"> - </div>
                </div>
                <div class="info-row">
                    <div class="info-label">Mobile:</div>
                    <div class="info-value">03343574436</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Customer Status:</div>
                    <div class="info-value">Approved Customer</div>
                </div>
            </div>

            <h1 class="section-title">MY ADDRESSES</h1>
            <div class="addresses">
                <p class="no-address">There is no address saved with your account.</p>
            </div>
        </div>
    </div>

    <?php
    include_once('footer/footer.php');
    ?>

</body>

</html>

<script src="javascript/script.js"></script>