var $document = $(document);

$document.scroll(function() {
    if ($document.scrollTop() >= 300) {
        // user scrolled 50 pixels or more;
        // do stuff
        $('.mainHeader').addClass('z-depth-2 sticky');
        $('.subHeader').addClass('zeroHeight');
    } else {
        $('.mainHeader').removeClass('z-depth-2 sticky');
        $('.subHeader').removeClass('zeroHeight');
    }
});

var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

$(document).ajaxStop(function() {


    var loaderFull = $('#loadingCont');
    loaderFull.addClass('animated fadeOut').one(animationEnd, function() {
        loaderFull.removeClass('animated fadeOut');

        loaderFull.addClass('hide');

    });

});

$(document).ready(function() {

    $(".menuContainer").click(function() {
        $(".stick").toggleClass(function() {
            return $(this).is('.open, .close') ? 'open close' : 'open';
        });

        $(".mainMenu").toggleClass(function() {
            return $(this).is('.menuOpened, .menuClosed') ? 'menuOpened menuClosed' : 'menuOpened';
        });

        $("body").toggleClass(function() {
            return $(this).is('.noscroll, scroll') ? 'noscroll scroll' : 'noscroll';
        });


    });


    $('.newsCard p').ellipsis({
        row: 4
    });

    lang = $('#lang').val();

    console.log(lang);

    if (lang == "ar") {
        // About Us Carousel
        $('.aboutCarousel').owlCarousel({
            loop: true,
            nav: true,
            rtl: true,
            navText: ["<div class='prev-campaign valign-wrapper'><i class='material-icons'>chevron_left</i></div>", "<div class='next-campaign valign-wrapper'><i class='material-icons'>chevron_right</i></div>"],
            responsive: {
                0: {
                    items: 2
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 4
                }
            }
        })

        //Corn products carosuel
        $('.prodDetailsCarousel').owlCarousel({
            center: true,
            loop: true,
            nav: true,
            rtl: true,
            autoplay: true,
            autoplayTimeout: 3500,
            autoplayHoverPause: false,
            navText: ["<div class='prev-campaign valign-wrapper'><i class='material-icons'>chevron_left</i></div>", "<div class='next-campaign valign-wrapper'><i class='material-icons'>chevron_right</i></div>"],
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1,
                    nav: true,
                }
            }
        })

        //Corn products carosuel
        $('#homeSlider').owlCarousel({
            center: true,
            loop: false,
            nav: true,
            rtl: true,
            autoplay: true,
            autoplayTimeout: 3500,
            autoplayHoverPause: false,
            navText: ["<div class='prev-slide'><i class='material-icons'>chevron_left</i></div>", "<div class='next-slide'><i class='material-icons'>chevron_right</i></div>"],
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1,
                    nav: true,
                }
            }
        })

    } else {

        // About Us Carousel
        $('.aboutCarousel').owlCarousel({
            loop: true,
            nav: true,
            navText: ["<div class='prev-campaign valign-wrapper'><i class='material-icons'>chevron_left</i></div>", "<div class='next-campaign valign-wrapper'><i class='material-icons'>chevron_right</i></div>"],
            responsive: {
                0: {
                    items: 2
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 4
                }
            }
        })

        //Corn products carosuel
        $('.prodDetailsCarousel').owlCarousel({
            center: true,
            loop: true,
            nav: true,
            rtl: false,
            autoplay: true,
            autoplayTimeout: 3500,
            autoplayHoverPause: false,
            navText: ["<div class='prev-campaign valign-wrapper'><i class='material-icons'>chevron_left</i></div>", "<div class='next-campaign valign-wrapper'><i class='material-icons'>chevron_right</i></div>"],
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1,
                    nav: true,
                }
            }
        })

        //Corn products carosuel
        $('#homeSlider').owlCarousel({
            center: true,
            loop: false,
            nav: true,
            autoplay: true,
            autoplayTimeout: 3500,
            autoplayHoverPause: false,
            navText: ["<div class='prev-slide'><i class='material-icons'>chevron_left</i></div>", "<div class='next-slide'><i class='material-icons'>chevron_right</i></div>"],
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1,
                    nav: true,
                }
            }
        })
    }

    $('#video-gallery').lightGallery({
        selector: '.videoLink',
        loadYoutubeThumbnail: true,
        youtubeThumbSize: 'default',
        loadVimeoThumbnail: true,
        vimeoThumbSize: 'thumbnail_medium',
        youtubePlayerParams: {
            modestbranding: 1,
            showinfo: 0,
            rel: 0,
            controls: 0,
            fs: 1,
        },
        vimeoPlayerParams: {
            byline: 0,
            portrait: 0,
            color: 'A90707'
        }
    });

    $('.videosSectionDetails').lightGallery({
        selector: '.videoLink',
        loadYoutubeThumbnail: true,
        youtubeThumbSize: 'default',
        loadVimeoThumbnail: true,
        vimeoThumbSize: 'thumbnail_medium',
        youtubePlayerParams: {
            modestbranding: 1,
            showinfo: 0,
            rel: 0,
            controls: 0,
            fs: 1,
        },
        vimeoPlayerParams: {
            byline: 0,
            portrait: 0,
            color: 'A90707'
        }
    });


    $(".cornCarousel img").each(function(index) {
        $(this).css({
            'animation-delay': 0.2 * (1 + index) + 's'
        });
    });


    //Corn products carosuel
    $('#catProducts').owlCarousel({
        loop: false,
        margin: 10,
        nav: true,
        navText: ["<div class='prev-campaign valign-wrapper'><i class='material-icons'>chevron_left</i></div>", "<div class='next-campaign valign-wrapper'><i class='material-icons'>chevron_right</i></div>"],
        responsive: {
            0: {
                items: 2
            },
            600: {
                items: 3
            },
            1000: {
                items: 4,
                nav: true,
            }
        }
    })

    console.log("state " + $('#new_status').val());
    var state = $('#new_status').val()
    if (state === '0') {
        $('#showF').hide();
        $('#showH').hide();
        $('#showHP').hide();

    }

});