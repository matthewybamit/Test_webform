<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login-page.aspx.cs" Inherits="Test_webform.WebForm1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="javascripts/login.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/login-page.css" />
</head>
<body style="background-image: url('background.png'); background-size: cover;">
    
<div class="container">
    <div class="login-container">
        <div class="logo">
            <img src="logo.png" alt="Logo">
            <h1>Dresserve</h1>
        </div>
        <div class="login">
            <div class="login-content">
                <h2 class="text-center">Log in</h2>
                <div class="divider">
                    <hr>
                    <p>with</p>
                    <hr>
                </div>
                
                    <!-- <form id="form1" runat="server"> 
                        <asp:ImageButton ID="GoogleImage" ImageUrl="googlelogo1.png" runat="server"  style="height: 50px; margin: 0 10px; cursor: pointer;"/>
                        <asp:ImageButton ID="FacebookImage" ImageUrl="fblogo1.png" runat="server" OnClick="FBLogin" />
                    
                    </form> -->

                    
                

                <div class="social-icons">
    

    <button class="GoogleImage">
        <img src="googlelogo1.png" id="gimage" alt="Google Logo" style="height: 50px; margin: 0 10px; cursor: pointer;">
    </button>

    <button class="FacebookImage">
        <img src="fblogo1.png" id="fbimage" alt="Google Logo" style="height: 50px; margin: 0 10px; cursor: pointer;">
    </button>

</div>
            </div>
        </div>
    </div>
</div>

        <script type="module">
        // Import the functions you need from the SDKs you need
            import {initializeApp} from "https://www.gstatic.com/firebasejs/10.11.1/firebase-app.js";
       
            import { getAuth, signInWithPopup, GoogleAuthProvider, FacebookAuthProvider, setPersistence, browserSessionPersistence } from "https://www.gstatic.com/firebasejs/10.11.1/firebase-auth.js";            // TODO: Add SDKs for Firebase products that you want to use
            // https://firebase.google.com/docs/web/setup#available-libraries

            // Your web app's Firebase configuration
            // For Firebase JS SDK v7.20.0 and later, measurementId is optional
            const firebaseConfig = {
                apiKey: "AIzaSyCleDtO3LZ6hnkM6JaNZ7i5PygTRWeq3qA",
            authDomain: "ultra-palisade-420202.firebaseapp.com",
            projectId: "ultra-palisade-420202",
            storageBucket: "ultra-palisade-420202.appspot.com",
            messagingSenderId: "35298655443",
            appId: "1:35298655443:web:18e39dfee6f727212ae826",
            measurementId: "G-FK5MZYG8EX"
  };

            const firebaseConfig2 = {
                apiKey: "AIzaSyCleDtO3LZ6hnkM6JaNZ7i5PygTRWeq3qA",
                authDomain: "ultra-palisade-420202.firebaseapp.com",
                projectId: "ultra-palisade-420202",
                storageBucket: "ultra-palisade-420202.appspot.com",
                messagingSenderId: "35298655443",
                appId: "1:35298655443:web:2b792eda8344e80e2ae826",
                measurementId: "G-CW9XKDR8YW"
            };

            // Initialize Firebase
            const app = initializeApp(firebaseConfig);
            const app2 = initializeApp(firebaseConfig2, "facebook");
            //const analytics = getAnalytics(app);
            const auth = getAuth(app);
            const authFacebook = getAuth(app2);
            const provider = new GoogleAuthProvider();
            provider.setCustomParameters({ prompt: 'select_account' });
            const facebookProvider = new FacebookAuthProvider();
            facebookProvider.setCustomParameters({ prompt: 'select_account' });
            
            setPersistence(authFacebook, browserSessionPersistence);
        // Get a reference to the authentication service
       

        // Get a reference to the sign-in button
            const signInWithGoogleButtons = document.querySelectorAll('.GoogleImage');
            setPersistence(auth, browserSessionPersistence);
            signInWithGoogleButtons.forEach(button => {
                button.addEventListener('click', () => {
                    signInWithPopup(auth, provider)
                        .then((result) => {
                            const user = result.user;
                            console.log("User data before stored:", user);
                            if (user) {
                                // Store user data in session storage
                                sessionStorage.setItem('username', user.displayName);
                                sessionStorage.setItem('name', user.displayName); // Assuming 'name' is the same as 'displayName'
                                sessionStorage.setItem('profilePicture', user.photoURL);
                                sessionStorage.setItem('email', user.email); // Store email
                                sessionStorage.setItem('uid', user.uid); // Store UID

                                console.log("User data after storing in session storage:");
                                console.log("Username:", sessionStorage.getItem('username'));
                                console.log("Name:", sessionStorage.getItem('name'));
                                console.log("Profile Picture URL:", sessionStorage.getItem('profilePicture'));
                                console.log("Email:", sessionStorage.getItem('email')); // Display email
                                console.log("UID:", sessionStorage.getItem('uid')); // Display UID
                             
                                // Store user data in cookies
                                document.cookie = `username=${user.displayName}; path=/`;
                                document.cookie = `name=${user.displayName}; path=/`;
                                document.cookie = `profilePicture=${user.photoURL}; path=/`;
                                document.cookie = `email=${user.email}; path=/`;
                                document.cookie = `uid=${user.uid}; path=/`;

                                console.log("User data after storing in cookies:");
                                console.log("Username:", getCookie('username'));
                                console.log("Name:", getCookie('name'));
                                console.log("Profile Picture URL:", getCookie('profilePicture'));
                                console.log("Email:", getCookie('email'));
                                console.log("UID:", getCookie('uid'));

                                

                                // Redirect to another page where you want to display the data
                                window.location.href = 'Landing-page.aspx'; // Replace with your actual path
                                alert("Welcome, " + user.displayName);
                            } else {
                                console.error("User object is null or undefined");
                            }
                        })
                        .catch((error) => {
                            console.error(error.message);
                        });
                });
            });

            // Function to get cookie value by name
            function getCookie(name) {
                const value = `; ${document.cookie}`;
                const parts = value.split(`; ${name}=`);
                if (parts.length === 2) return parts.pop().split(';').shift();
            }

            const signInWithFacebookButtons = document.querySelectorAll('.FacebookImage');

            signInWithFacebookButtons.forEach(button => {
                button.addEventListener('click', () => {
                    signInWithPopup(authFacebook, facebookProvider)
                        .then((result) => {
                            const user = result.user;
                            console.log("User data before stored:", user);
                            if (user) {
                                // Store user data in session storage
                                sessionStorage.setItem('username', user.displayName);
                                sessionStorage.setItem('name', user.displayName); // Assuming 'name' is the same as 'displayName'
                                sessionStorage.setItem('profilePicture', user.photoURL);
                                sessionStorage.setItem('email', user.email); // Store email
                                sessionStorage.setItem('uid', user.uid); // Store UID

                                console.log("User data after storing in session storage:");
                                console.log("Username:", sessionStorage.getItem('username'));
                                console.log("Name:", sessionStorage.getItem('name'));
                                console.log("Profile Picture URL:", sessionStorage.getItem('profilePicture'));
                                console.log("Email:", sessionStorage.getItem('email')); // Display email
                                console.log("UID:", sessionStorage.getItem('uid')); // Display UID

                                // Store user data in cookies
                                document.cookie = `username=${user.displayName}; path=/`;
                                document.cookie = `name=${user.displayName}; path=/`;
                                document.cookie = `profilePicture=${user.photoURL}; path=/`;
                                document.cookie = `email=${user.email}; path=/`;
                                document.cookie = `uid=${user.uid}; path=/`;

                                console.log("User data after storing in cookies:");
                                console.log("Username:", getCookie('username'));
                                console.log("Name:", getCookie('name'));
                                console.log("Profile Picture URL:", getCookie('profilePicture'));
                                console.log("Email:", getCookie('email'));
                                console.log("UID:", getCookie('uid'));



                                // Redirect to another page where you want to display the data
                                window.location.href = 'Landing-page.aspx'; // Replace with your actual path
                                alert("Welcome, " + user.displayName);
                            } else {
                                console.error("User object is null or undefined");
                            }
                        })
                        .catch((error) => {
                            console.error(error.message);
                        });
                });
            });

        </script>

    <div class="footer">
        <p class="left">Terms and Conditions</p>
        <p class="left"> Privacy and Policy</p>
        <p class="right">2024 Dresserve All rights reserved.</p>

    </div>

    

</body>
</html>