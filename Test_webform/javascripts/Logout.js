function logout() {
    sessionStorage.clear(); // Clear session storage
    clearAllCookies();
    window.location.href = 'login-page.aspx'; // Redirect to login page
}
