<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="Test_webform.user_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DRESSERVE</title>
    <link href="https://fonts.cdnfonts.com/css/kapakana" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="CSS/Copy.css" rel="stylesheet" />
    <link href="CSS/Carousel.css" rel="stylesheet" />
    <link href="CSS/for_him_for_her.css" rel="stylesheet" />
    <link href="CSS/Collection-list.css" rel="stylesheet" />
    <link href="CSS/Quote.css" rel="stylesheet" />
    <link href="CSS/inquire-view.css" rel="stylesheet" />
    <link href="CSS/Shopping-cart.css" rel="stylesheet" />
    <link href="CSS/profile.css" rel="stylesheet" />
    <link href="CSS/Footer.css" rel="stylesheet" />
    <link href="CSS/search-box-animation.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-info">
            <div class="texthead">YOUR ACCOUNT</div>
            <div class="container-uid">
                <p id="user-uid"></p>
            </div>
            <div class="profile-container">
                <div class="profile">
                    <img src="" id="profile-picture" />
                </div>
            </div>
            <hr class="divider" />
            <div class="container-name">
                <p id="profile-name"></p>
            </div>
            <div class="container-email">
                <p id="user-email"></p>
            </div>
            <div class="logout-btn">
                <button id="btnLogout" onclick="logout()">Logout</button>
            </div>
        </div>
    </form>

    <script>
        window.onload = function () {
            // Retrieve user data from session storage
            const uid = sessionStorage.getItem('uid');
            const username = sessionStorage.getItem('username');
            const name = sessionStorage.getItem('name');
            const email = sessionStorage.getItem('email');
            const profilePicture = sessionStorage.getItem('profilePicture');

            // Check if any of the necessary session data is missing
            if (!username || !name || !profilePicture || !uid || !email) {
                redirectToLogin();
                return; // Stop further execution
            }

            // Display the data in your HTML elements
            document.getElementById('user-uid').textContent = uid; // Display UID
            document.getElementById('profile-name').textContent = name;
            document.getElementById('profile-picture').src = profilePicture;
            document.getElementById('user-email').textContent = email; // Display email
        };

        function redirectToLogin() {
            window.location.href = 'login-page.aspx';
        }

        // Function to logout
        function logout() {
            sessionStorage.clear(); // Clear session storage
            clearAllCookies();
            window.location.href = 'login-page.aspx'; // Redirect to login page
        }

        function clearAllCookies() {
            const cookies = document.cookie.split(';');

            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i];
                const eqPos = cookie.indexOf('=');
                const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
                document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;`;
            }
        }

        $(document).ready(function () {
            // Send user data to server-side code for database insertion
            sendUserDataToServer();
        });

        function sendUserDataToServer() {
            const uid = sessionStorage.getItem('uid');
            const username = sessionStorage.getItem('username');
            const email = sessionStorage.getItem('email');
            const profilePicture = sessionStorage.getItem('profilePicture');

            $.ajax({
                url: 'user-profile.aspx/InsertUserData',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ uid: uid, username: username, email: email, profilePicture: profilePicture }),
                success: function (response) {
                    alert('User data inserted successfully into the database.'); // Alert success message
                    console.log(response); // Log response to console
                },
                error: function (xhr, status, error) {
                    alert('Error inserting user data into the database.'); // Alert error message
                    console.error(xhr.responseText); // Log error message to console
                }
            });
        }
    </script>
    <script src="javascripts/profile.js"></script>
</body>
</html>
