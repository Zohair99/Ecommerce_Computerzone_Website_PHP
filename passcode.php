<?php
$title = 'Change Password';
include_once('navbar\productstyle.php')
?>

<style>
    .form-container {
        max-width: 500px;
        padding: 30px;
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        gap: 15px;
        margin-left: 200px;
    }

    .form-header {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
        padding-bottom: 15px;
    }

    .form-header i {
        color: #607d8b;
        font-size: 24px;
        margin-right: 10px;
    }

    .form-header h2 {
        font-size: 22px;
        color: #424242;
        font-weight: 500;
        margin: 0;
    }

    .form-grou {
        margin-bottom: 15px;
    }

    .form-grou:last-of-type {
        margin-bottom: 25px;
    }

    .form-grou label {
        display: block;
        margin-bottom: 6px;
        font-size: 14px;
        color: #555555;
        font-weight: normal;
    }

    .form-grou input[type="text"],
    .form-grou input[type="email"],
    .form-grou textarea {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #dcdcdc;
        border-radius: 4px;
        font-size: 15px;
        color: #333333;
        outline: none;
        transition: border-color 0.2s ease, box-shadow 0.2s ease;
        box-sizing: border-box;
    }

    .form-grou input[type="text"]:focus,
    .form-grou input[type="email"]:focus,
    .form-grou textarea:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }

    .form-grou input::placeholder,
    .form-grou textarea::placeholder {
        color: #999999;
        opacity: 1;
    }

    .submit-button {
        width: 100%;
        padding: 10px 20px;
        background-color: #34495e;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.2s ease, transform 0.1s ease;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .submit-button:hover {
        background-color: #2c3e50;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
    }

    .submit-button:active {
        transform: translateY(1px);
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }
</style>
</head>

<body>

    <!-- breadcrumb -->

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="#" class="active">Accounts</a></li>
            <li>/</li>
            <li><a href="passcode.php" class="active">Change Password</a></li>
        </ul>
    </nav>

    <div class="form-container">
        <div class="form-header">
            <i class="fa-solid fa-rectangle-list"></i>
            <h2>Change Password</h2>
        </div>

        <form action="#" method="POST">
            <div class="form-grou">
                <label for="email">Email Address</label>
                <input type="email" id="email" placeholder="Enter Your Email">
            </div>

            <div class="form-grou">
                <label for="old-password">Old Password</label>
                <input type="password" id="old-password" placeholder="Old Password">
            </div>

            <div class="form-grou">
                <label for="new-password">New Password</label>
                <input type="password" id="new-password" placeholder="New Password">
            </div>

            <div class="form-grou">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" placeholder="Confirm Password">
            </div>

            <button type="submit" class="submit-button">Submit</button>
        </form>
    </div>


    <?php
    include_once('footer/footer.php');
    ?>


</body>

</html>

<script src="javascript/script.js"></script>