<script type="text/javascript">
    $(document).ajaxStop(function() {

        var owlIndex = 0;
        var imgs = [];
        var Index = 0;
        $('.owl-dot').each(function() {
            var dotID = 'Dot' + owlIndex;
            $(this).attr("id", dotID);
            owlIndex = owlIndex + 1;

        });
        $('.homeSlide').each(function(index) {
            imgs[Index] = $(this).attr("name");
            Index = Index + 1;

        });

        for (i = 0; i < imgs.length; i++) {

            var id_index = "#Dot" + i;
            $(id_index).html('<div class="sliderThumb" style="background-image: url(' + imgs[i] + ')" ></div>');
        }

    });

    $(document).ready(function() {

        var lastCatID = $('#lastCatID').val();

        getProducts(lastCatID);

        $('.cat').click(function() {
            $("#prodLoader").removeClass('hide');

        });
        //save button in the add modal
        $("#btnAdd").click(function(event) {
            event.preventDefault();

            isValid = true;

            //form validations
            $('#contact .validate').each(function() {
                if ($.trim($(this).val()) == "") {
                    swal({
                        title: "Required Fields",
                        text: "Fields has * next to it are required",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
                }
            });

            if (!isValid) return;

            //submit the form after validations
            $("#contact").submit();
        });

    });

    //add form submission
    $("#contact").submit(function(event) {
        event.preventDefault();

        $("#loadingContainer").show();

        var values = new FormData($(this)[0]);

        $.ajax({
            url: "handlers/ContactHandler.php",
            type: "post",
            data: values,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {

                $('#contact')[0].reset();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);

                $("#loadingContainer").hide();
            }
        });
    });

    function getProducts(catID) {
        $.ajax({
            url: 'handlers/ProductsHandler.php',
            type: 'POST',
            data: {
                operation: 'getCategoryProducts',
                catID: catID
            },
            success: function(data) {
                $("#prodLoader").addClass('hide');
                $('#catProducts').html('');
                $('#catProducts').append(data);
                //Corn products carosuel
                $('#catProducts').owlCarousel('destroy');
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
                });


                $(".cornCarousel img").each(function(index) {
                    $(this).css({
                        'animation-delay': 0.2 * (1 + index) + 's'
                    });
                });


            }
        })
    }


    function fbShare(e, t, a, o, i, n) {
        var r = screen.height / 2 - n / 2,
            s = screen.width / 2 - i / 2;
        window.open("http://www.facebook.com/sharer.php?s=100&caption=" + t + "&description=" + a + "&picture=" + o + "&u=" + e, "sharer", "top=" + r + ",left=" + s + ",toolbar=0,status=0,width=" + i + ",height=" + n)
    }
</script>