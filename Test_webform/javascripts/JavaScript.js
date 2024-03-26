document.addEventListener('DOMContentLoaded', function () {
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const iconContainer = document.querySelector('.topnav-right');

    hamburgerMenu.addEventListener('click', function () {
        iconContainer.classList.toggle('show-icons');
    });
});