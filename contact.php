<?php
$title = 'Contact Us';
include_once('navbar\productstyle.php')
?>

<!-- breadcrumb -->

<nav class="breadcrumb">
    <ul>
        <li><a href="index.php">Home</a></li>
        <li>/</li>
        <li><a href="contact.php" class="active">Contact Us</a></li>

    </ul>
</nav>

<!-- feedback -->

<div class="feedbackcontainer">
    <h2 id="h2"> <i class="fa-solid fa-rectangle-list"> </i> Contact Us</h2>
    <p>Use the following contact details to contact us or fill up the below contact form. We'll respond to your query as soon as possible.</p>
    <div class="contact-section">
        <div class="contact-details">
            <h3 id="h3">&nbsp;CONTACT DETAILS</h3>
            <div class="feed"></div>
            <p>&nbsp;Computer Zone</p>
            <p>&nbsp;Address:</strong>&nbsp; FL 4/20, Main Rashid Minhas Road,<br> &nbsp;Gulshan-e-Iqbal Block-5, Karachi, Pakistan.</p>
            <p>&nbsp;Phone:&nbsp; +92 2134817355 | +92 2134155030 |<br>&nbsp;+92 2134906583 | +92 3366842938 <br> &nbsp;(WhatsApp Only)</p>
            <p>&nbsp;Email:&nbsp; info@czone.com.pk</p>
            <p>&nbsp;Website:&nbsp; <a href="index.html">www.czone.com.pk</a></p>
        </div>

        <div class="contact-form">
            <h3 id="h3">&nbsp;CONTACT FORM</h3>
            <div class="feeds"> </div>
            <form>&nbsp;
                <label class="label">Full Name:</label>
                <div class="form-group">
                    <input type="text" placeholder="Full Name" required>
                    <input type="text" placeholder="Company Name">
                </div>
                <label class="label">Email:</label>
                <div class="form-group">
                    <input type="email" placeholder="Email Address" required>
                    <input type="text" placeholder="Phone / Mobile">
                </div>
                <label class="label">Categories:</label>
                <div class="form-group">
                    <select required>
                        <option value="">Select Category</option>
                        <option value="general">Website</option>
                        <option value="support">Products</option>
                        <option value="general">Services</option>
                        <option value="support">Order</option>
                        <option value="support">Other</option>
                    </select>
                </div>
                <label class="label">Subject:</label>
                <div class="form-group">
                    <input type="text" placeholder="Subject">
                </div>
                <label class="label">Comment:</label>
                <div class="form-group">
                    <textarea required></textarea>
                </div>
                <button id="button" type="submit">Submit</button>
            </form>
        </div>
    </div>

    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3620.392003139784!2d67.08309851500357!3d24.909314384035314!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3eb33e4fb75eb9b5%3A0x1b7f5c1ea3c6d243!2sComputer%20Zone!5e0!3m2!1sen!2s!4v1700000000000" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
</div>

<!-- feedback end -->

<?php
// 
include_once('footer/footer.php');
// 
?>


</body>

</html>

<script src="javascript/script.js"></script>