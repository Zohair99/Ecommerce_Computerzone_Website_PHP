<?php
session_start();

$registration_message = '';
$login_message = '';

$conn = mysqli_connect("localhost", "root", "", "computerzone");

if (!$conn) {

    error_log("Database connection failed: " . mysqli_connect_error());
    die("Error connecting to the database. Please try again later.");
}

if (isset($_GET['logout'])) {
    session_destroy();
    header("Location: index.php");
    exit();
}

if (isset($_POST['btn'])) {
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $contact = mysqli_real_escape_string($conn, $_POST['contact']);
    $password = $_POST['hash_password'];
    $confirm_password = $_POST['confirm_password'];

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $registration_message = "<p style='color: red;'>Invalid email format!</p>";
    } elseif ($password !== $confirm_password) {
        $registration_message = "<p style='color: red;'>Passwords do not match!</p>";
    } else {
        $check_email_query = "SELECT id FROM register WHERE email = ?";
        $stmt_check = mysqli_prepare($conn, $check_email_query);
        mysqli_stmt_bind_param($stmt_check, "s", $email);
        mysqli_stmt_execute($stmt_check);
        mysqli_stmt_store_result($stmt_check);

        if (mysqli_stmt_num_rows($stmt_check) > 0) {
            $registration_message = "<p style='color: red;'>An account with this email already exists. Please log in or use a different email.</p>";
        } else {
            $hash_password = password_hash($password, PASSWORD_DEFAULT);

            $insert_query = "INSERT INTO register (name, email, hash_password, contact) VALUES (?, ?, ?, ?)";
            $stmt_insert = mysqli_prepare($conn, $insert_query);

            if ($stmt_insert) {
                mysqli_stmt_bind_param($stmt_insert, "ssss", $name, $email, $hash_password, $contact);
                $result = mysqli_stmt_execute($stmt_insert);

                if ($result) {
                    $_SESSION['user_id'] = mysqli_insert_id($conn);
                    $_SESSION['user_name'] = $name;
                    $_SESSION['user_email'] = $email;
                    $registration_message = "<p style='color: green;'>Registered Successfully! You are now logged in.</p>";

                } else {
                    $registration_message = "<p style='color: red;'>Error registering: " . mysqli_stmt_error($stmt_insert) . "</p>";
                }
                mysqli_stmt_close($stmt_insert);
            } else {
                $registration_message = "<p style='color: red;'>Error preparing registration statement: " . mysqli_error($conn) . "</p>";
            }
        }
        mysqli_stmt_close($stmt_check);
    }
}

if (isset($_POST['login'])) {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = $_POST['password'];

    $login_query = "SELECT id, name, email, hash_password FROM register WHERE email = ?";
    $stmt_login = mysqli_prepare($conn, $login_query);

    if ($stmt_login) {
        mysqli_stmt_bind_param($stmt_login, "s", $email);
        mysqli_stmt_execute($stmt_login);
        mysqli_stmt_store_result($stmt_login);

        if (mysqli_stmt_num_rows($stmt_login) == 1) {
            mysqli_stmt_bind_result($stmt_login, $user_id, $user_name, $user_email, $hashed_password);
            mysqli_stmt_fetch($stmt_login);

            if (password_verify($password, $hashed_password)) {
                $_SESSION['user_id'] = $user_id;
                $_SESSION['user_name'] = $user_name;
                $_SESSION['user_email'] = $user_email;
                header("Location: index.php");
                exit();
            } else {
                $login_message = "<p style='color: red;'>Invalid password!</p>";
            }
        } else {
            $login_message = "<p style='color: red;'>No user found with this email!</p>";
        }
        mysqli_stmt_close($stmt_login);
    } else {
        $login_message = "<p style='color: red;'>Error preparing login statement: " . mysqli_error($conn) . "</p>";
    }
}

mysqli_close($conn);

$title = 'PC Casing Price in Pakistan - PC Case';
include_once('navbar\productstyle.php');
?>

<body>

    <!-- breadcrumb -->

    <nav class="breadcrumb">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li>/</li>
            <li><a href="create-account.php" class="active">Sign In</a></li>
            <li>/</li>
            <li><a href="create-account.php" class="active">Sign Up</a></li>
        </ul>
    </nav>

    <main>
        <div class="accountcontainer">
            <div class="form-box" id="register">
                <h3 class="accounth3">CREATE AN ACCOUNT</h3>
                <?php echo $registration_message; 
                ?>
                <form method="POST" action="">
                    <label class="label">Full Name *</label>
                    <input type="text" name="name" placeholder="Full Name" id="name" required>

                    <label class="label">Email *</label>
                    <input type="email" name="email" placeholder="Email Address" id="email" required>

                    <label class="label">Password *</label>
                    <input type="password" name="hash_password" placeholder="Password" id="hash_password" required>

                    <label class="label">Confirm Password *</label>
                    <input type="password" name="confirm_password" placeholder="Confirm Password" id="confirm_password" required>

                    <label class="label">Phone/Mobile *</label>
                    <input type="text" name="contact" placeholder="03xxxxxxxxx" id="contact" required>

                    <div class="checkbox">
                        <input type="checkbox" name="newsletter" id="newsletter">
                        <label for="newsletter" class="label">Yes, I want to subscribe for newsletter.</label>
                    </div>

                    <button type="submit" class="account" name="btn">Sign Up</button>
                </form>
            </div>

            <div class="form-box1" id="login">
                <h3>ALREADY REGISTERED?</h3>
                <button class="facebook-btn">
                    <a href="https://web.facebook.com/login.php/?_rdc=1&_rdr#"><img src="images/facebook.png" alt="Facebook logo">Sign in with Facebook</a>
                </button>
                <p class="or">OR</p>
                <?php echo $login_message; 
                ?>
                <form method="POST" action="">
                    <label>Email *</label>
                    <input type="email" name="email" placeholder="Email Address" required>

                    <label>Password *</label>
                    <input type="password" name="password" placeholder="Password" required>

                    <div class="options">
                        <div>
                            <input type="checkbox" id="remember">
                            <label for="remember">Remember me</label>
                        </div>
                        <a href="#">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn" name="login">Sign In</button>
                </form>
            </div>
        </div>
    </main>

    <?php
    include_once('footer/footer.php');
    ?>

    <script src="javascript/script.js"></script>
</body>

</html>