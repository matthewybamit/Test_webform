// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { GoogleAuthProvider } from "firebase/auth";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyACt_Ikqw2zL9_BWh94lNdRbXBh8uKnG",
    authDomain: "authentication-1e241.firebaspp.",
    projectId: "authentication-1e241",
    storageBucket: "authentication-1e241.appspm",
    messagingSenderId: "618444640527",
    appId: "1:618444640527:web:baa90290b5a94ae7a"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Get a reference to the authentication service
const auth = getAuth();

// Get a reference to the sign-in button
const signInWithGoogleButton = document.getElementById("signInWithGoogle");

// Add click event listener to the sign-in button
GoogleImage.addEventListener("click", () => {
    // Create an instance of the Google provider object
    const provider = new GoogleAuthProvider();

    // Sign in with Google using the provider object
    signInWithPopup(auth, provider)
        .then((result) => {
            // This function runs when the user signs in successfully
            const user = result.user;
            // Redirect to the home page
            window.location.href = "Landing-page.aspx";
        })
        .catch((error) => {
            // Handle errors here
            console.error("Authentication failed:", error.message);
        });
});