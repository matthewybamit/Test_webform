// Get query parameters from the URL
const params = new URLSearchParams(window.location.search);
const name = params.get("name");
const photoUrl = params.get("photoUrl");

// Get a reference to the profile container element
const profileContainer = document.getElementById("profile");

const usernameSpan = document.getElementById("username");



const profileImage = document.createElement("img");
profileImage.src = photoUrl;
profileImage.alt = "Profile Picture";

// Apply styles to make the image circular
profileImage.style.borderRadius = "50%";
profileImage.style.width = "100px"; // Adjust width as needed
profileImage.style.height = "100px"; // Adjust height as needed


// Set the text content of the username span to the username
usernameSpan.textContent = name;

// Append elements to the profile container
//profileContainer.appendChild(nameElement);
profileContainer.appendChild(photoElement);