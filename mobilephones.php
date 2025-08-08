<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ComputerZone | Pakistan</title>
    <link rel="shortcut icon" type="image" href="images/tab.jpg">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="product.css">
    
    <style>
    /* footer */
    
    .section{
        flex: 0.5;
        margin: 0;
    }
    .section a{
        padding-left: 20px;
    }
    #one{
        padding-left: 20px;
    }
    .footer{
        padding-left: 180px;
        padding-right: 170px;
    }
    
    /* footer */
    </style>
</head>

<body>
    <!-- full navbar starts from here -->

    <!-- top bar -->
    <header>
        <div class="topbar">
            <div class="cont1">
                <ul>
                    <li><a href="about.php">About Computer Zone</a></li>
                    <li><a href="feedback.php">Feedbacks & Suggestions</a></li>
                    <li><a href="contact.php">Contact Us</a></li>
                    <li><a href="faqs.php">FAQs</a></li>
                    <li><a href="policies.php">Policies</a></li>
                </ul>
            </div>
            <div class="cont2">
                <ul>
                    <li><a href="#">My Accounts <i class="fa-solid fa-caret-down"> </i></a></li>
                    <li><a href="create-account.php">Log In</a></li>
                    <li><a href="create-account.php">Create Account</a></li>
                </ul>
            </div>
        </div>
        <!-- top bar end -->

        <!-- second bar -->
        <div class="navbar">
            <div class="cont3">
                <a href="index.php"><img src="images/logo.webp" alt="not available" class="logo1"></a>
            </div>
            <div class="cont4">
                <input placeholder="Search entire store here" id="searchbar">
                <select id="cate1">
                    <option value="">Categories</option>
                        <option value="support">Laptops</option>
                        <option value="support">Laptop | Used</option>
                        <option value="support">Laptop Accessories</option>
                        <option value="support">Cameras | Drones</option>
                        <option value="support">Cartridges & Toners</option>
                        <option value="support">Casing</option>
                        <option value="support">Cooling Solutions</option>
                        <option value="support">Desktop Computers</option>
                        <option value="support">Gaming Consoles</option>
                        <option value="support">Gaming Products</option>
                        <option value="support">Graphic Cards</option>
                        <option value="support">Graphic Tablets</option>
                        <option value="support">Hard Drives</option>
                        <option value="support">Headsets | Headphones | Mic</option>
                        <option value="support">Keyboards</option>
                        <option value="support">LCD/LED Monitors</option>
                        <option value="support">Memory Cards</option>
                        <option value="support">Memory Module / RAM</option>
                        <option value="support">Motherboards</option>
                        <option value="support">Mouse</option>
                        <option value="support">Network Products</option>
                        <option value="support">Peripherals / Misc</option>
                        <option value="support">Power Supply</option>
                        <option value="support">Presenters</option>
                        <option value="support">Printers</option>
                        <option value="support">Processors</option>
                        <option value="support">Projectors</option>
                        <option value="support">Scanners</option>
                        <option value="support">Smart Watches</option>
                        <option value="support">Softwares</option>
                        <option value="support">Solid-State Drives (SSD)</option>
                        <option value="support">Speakers</option>
                        <option value="support">Stabilizers</option>
                        <option value="support">Tablet PC</option>
                        <option value="support">Tablet Accessories</option>
                        <option value="support">TV Devices | Streaming Media Players</option>
                        <option value="support">UPS</option>
                        <option value="support">USB Flash Drives</option>
                        <option value="support">Used Products</option>
                        <option value="support">Other</option>
                </select>
                <i class="fa-solid fa-magnifying-glass" id="search-icon"></i>
                <i class="fa-solid fa-cart-shopping" id="cart1"></i>
            </div>
        </div>
               <!-- menu bar -->
               <nav class="menubar">
            <ul class="menu">
                <li><a href="index.php">HOME</a></li>
                <li class="dropdown">
                    <a href="#">PRODUCTS <i class="fa-solid fa-caret-down"></i></a>
                    <div class="mega-menu">
                        <div class="mega-column">
                            <a href="laptop.php" class="a">Laptops</a>
                            <a href="laptopused.php" class="a">Laptops | Used</a>
                            <a href="laptopaccessories.php" class="a">Laptop Accessories</a>
                            <a href="cameradrones.php" class="a">Cameras | Drones</a>
                            <a href="catridges&toners.php" class="a">Cartridges & Toners</a>
                            <a href="Casing.php" class="a">Casing</a>
                            <a href="CoolingSolutions.php" class="a">Cooling Solutions</a>
                        </div>
                        <div class="mega-column">
                            <a href="desktopcomputers.php" class="a">Desktop Computers</a>
                            <a href="gamingconsoles.php" class="a">Gaming Consoles</a>
                            <a href="gaminproducts.php" class="a">Gaming Products</a>
                            <a href="gpu.php" class="a">Graphic Cards</a>
                            <a href="graphictablets.php" class="a">Graphic Tablets</a>
                            <a href="hdd.php" class="a">Hard Drives</a>
                            <a href="headset-headphone-mic.php" class="a">Headsets | Headphones | Mic</a>
                        </div>
                        <div class="mega-column">
                            <a href="keyboard.php" class="a">Keyboard</a>
                            <a href="monitor.php" class="a">LCD/LED Monitors</a>
                            <a href="memorycard.php" class="a">Memory Cards</a>
                            <a href="ram.php" class="a">Memory Module / RAM</a>
                            <a href="motherboard.php" class="a">Motherboards</a>
                            <a href="mouse.php" class="a">Mouse</a>
                            <a href="network.php" class="a">Network Products</a>
                        </div>
                        <div class="mega-column">
                            <a href="perpherals-mics.php" class="a">Peripherals / Misc</a>
                            <a href="pointofsales-pos.php" class="a">Point Of Sale POS</a>
                            <a href="psu.php" class="a">Power Supply</a>
                            <a href="printer.php" class="a">Printers</a>
                            <a href="processor.php" class="a">Processors</a>
                            <a href="projector.php" class="a">Projectors</a>
                            <a href="scanner.php" class="a">Scanner</a>
                        </div>
                        <div class="mega-column">
                            <a href="smartwatches.php" class="a">Smart Watches</a>
                            <a href="software.php" class="a">Softwares</a>
                            <a href="ssd.php" class="a">Solid-State Drives (SSD)</a>
                            <a href="speakers.php" class="a">Speakers</a>
                            <a href="stabilizer.php" class="a">Stabilizer</a>
                            <a href="tabletpc.php" class="a">Tablet PC</a>
                            <a href="tabletaccessories.php" class="a">Tablet Accessories</a>
                        </div>
                        <div class="mega-column">
                            <a href="tvdevices-streaming.php" class="a">TV Devices | Streaming</a>
                            <a href="mediaplayers.php" class="a">Media Players</a>
                            <a href="tv-hometheater.php" class="a">TV & Home Theater</a>
                            <a href="mobilephones.php" class="a">Mobile Phones</a>
                            <a href="ups.php" class="a">UPS</a>
                            <a href="usbflashdrrives.php" class="a">USB Flash Drives</a>
                            <a href="usedproducts.php" class="a">Used Products</a>
                        </div>
                    </div>
                </li>
                <li><a href="laptop.php">LAPTOPS</a></li>
                <li><a href="gpu.php">GPU</a></li>
                <li><a href="monitor.php">MONITORS</a></li>
                <li><a href="printer.php">PRINTERS</a></li>
                <li><a href="hdd.php">HDD</a></li>
                <li><a href="ssd.php">SSD</a></li>
                <li><a href="network.php">NETWORK</a></li>
                <li><a href="ram.php">RAM</a></li>
                <li><a href="psu.php">PSU</a></li>
            </ul>
            <div class="cont6">
                <a href="https://www.facebook.com/login.php/"><i class="fa-brands fa-facebook-f" id="logo2"></i></a>
            </div>
        </nav>
        <!-- menu bar end -->

        <!-- second bar end -->

    </header>
    
    <!-- full navbar ends here -->









    
    <!-- footer -->

    <footer>
        <div class="footerbar1">
            <div class="fcont1">
                <a href="https://www.facebook.com/login.php/"><i class="fa-brands fa-square-facebook" id="flogo1"></i></a>
            </div>

            <div class="fcont2">
                <i class="fa-solid fa-envelope-open-text" id="flogo2"></i>
                <span>SIGN UP FOR <strong>NEWSPAPER</strong></span>
            </div>

            <div class="fcont3">
                <input placeholder="Email Address" id="fsearch">
                <button id="fbutton"><a href="">SUBSCRIBE <i class="fa-solid fa-arrow-right-long" id="flogo3"></i></a></button>
            </div>
        </div>
    </footer>
    <!-- footer 2 -->
    <div class="footer">
        <div class="footercontent">
            <div class="section">
                <img src="images/logo.webp" alt="not available" class="footerlogo">
                <p>Welcome to Computer Zone. Online Computer store in Pakistan. Buy Dell, Lenovo, HP, Acer laptops at
                   the best prices in Pakistan.</p>
            </div>
            <div class="section">
                <h2>PRODUCTS</h2>
                <a href="">Laptops</a>
                <a href="">Printers</a>
                <a href="">Hard Drive</a>
                <a href="">Network Products</a>
                <a href="">Monitors</a>
            </div>

            <div class="section">
                <h2>ACCOUNT</h2>
                <a href="">Sign Up</a>
                <a href="">My Account</a>
                <a href="">Shopping Cart</a>
                <a href="">Order History</a>
            </div>

            <div class="section">
                <h2>CORPORATE</h2>
                <a href="about.php">About Us</a>
                <a href="contact.php">Contact</a>
                <a href="faqs.php">FAQs</a>
                <a href="policies.php">Policies</a>
                <a href="gallery.php">Picture Gallery</a>
            </div>

            <div class="section">
                <h2>CONTACT</h2>
                <p><i class="fa-solid fa-location-dot" id="ficons"> </i> FL 4/20, Main Rashid Minhas Road,
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Gulshan-e-Iqbal Block-5, Karachi,
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pakistan.</p>
                <p><i class="fa-solid fa-phone" id="ficons"> </i>&nbsp;+922134817355 | +922134155030 |
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +922134960583 | +923366842938
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WhatsApp Message Only</p>
                <p><i class="fa-solid fa-envelope" id="ficons"> </i> info@czone.com.pk</p>
            </div>
        </div>
    </div>

    <!-- footer 3 -->

    <div class="footerbar3">
        <div class="fcont4">
            <p>Copyright © Computer Zone 2025. All rights reserved</p>
        </div>

        <div class="fcont5">
            <img src="images/google_wallet.webp" alt="not found" class="fimages">
            <img src="images/discover_network.webp" alt="not found" class="fimages">
            <img src="images/american_express.webp" alt="not found" class="fimages">
            <img src="images/paypal.webp" alt="not found" class="fimages">
            <img src="images/visa_card.webp" alt="not found" class="fimages">
            <img src="images/master_card.webp" alt="not found" class="fimages">
        </div>

        <div class="fcont4">
            <p>Powered by Webx Ecommerce ®</p>
        </div>
    </div>

    <!-- footer end -->

</body>
</html>