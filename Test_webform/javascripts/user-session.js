window.onload = function () {
    // Retrieve user data from session storage
    const uid = sessionStorage.getItem('uid');
    const username = sessionStorage.getItem('username');
    const email = sessionStorage.getItem('email');
    const profilePicture = sessionStorage.getItem('profilePicture');

    // Check if any of the necessary session data is missing
    if (!uid || !username || !email || !profilePicture) {
        redirectToLogin();
        return; // Stop further execution
    }

    // Display the data in your HTML elements
    document.getElementById('user-uid').textContent = uid; // Display UID
    document.getElementById('profile-name').textContent = username;
    document.getElementById('profile-picture').src = profilePicture;
    document.getElementById('user-email').textContent = email; // Display email

    // Send user data to server-side code for database insertion
    sendUserDataToServer(uid, username, email, profilePicture);
};

function redirectToLogin() {
    window.location.href = 'login-page.aspx';
}


function clearAllCookies() {
    const cookies = document.cookie.split(';');

    for (let i = 0; i < cookies.length; i++) {
        const cookie = cookies[i].trim(); // Trim the cookie to remove leading spaces
        const eqPos = cookie.indexOf('=');
        const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;`;
    }
}