
       // JavaScript to toggle visibility of the top navigation on scroll
    $(document).ready(function () {
           var lastScrollTop = 0;

    $(window).scroll(function (event) {
               var st = $(this).scrollTop();
               if (st > lastScrollTop) {
        // Scroll down
        $("#topnav").removeClass("visible").addClass("hidden");
               } else {
        // Scroll up
        $("#topnav").removeClass("hidden").addClass("visible");
               }
    lastScrollTop = st;
           });
       });


    const carouselContainer = document.querySelector('.carousel-container');
    const prevBtn = document.querySelector('.btn-prev');
    const nextBtn = document.querySelector('.btn-next');
    const carouselItems = document.querySelectorAll('.carousel-item');
    const totalItems = carouselItems.length;
    let currentIndex = 0;

    function updateCarousel() {
        carouselContainer.style.transform = `translateX(-${currentIndex * 100}%)`;
        }

    function prevSlide() {
        currentIndex = (currentIndex === 0) ? totalItems - 1 : currentIndex - 1;
    updateCarousel();
        }

    function nextSlide() {
        currentIndex = (currentIndex === totalItems - 1) ? 0 : currentIndex + 1;
    updateCarousel();
        }

    prevBtn.addEventListener('click', prevSlide);
    nextBtn.addEventListener('click', nextSlide);
