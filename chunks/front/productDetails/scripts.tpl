<script type="text/javascript">
    var currPage = parseInt($("#currPage").val());
    var catID;
    $(document).ready(function() {
        // hide video section if there is no vidoe for product
        if ($('#hideVideo').val() == 1) {
            $('#videoHidden').hide();
        }

        $("#loadingCont").hide();

        var lastCatID = $('#lastCatID').val();


        // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1;
            catID = $('#categoryID').val();


            getProducts(catID, currPage, 1);

        });

        //getProducts(lastCatID,1,0);

        $('.cat').click(function() {
            $("#prodLoader").removeClass('hide');

        });

    });

    function getProducts(catID, toPage, type) {
        // catID = catID;
        $('#categoryID').val(catID);
        $.ajax({
            url: 'handlers/ProductsHandler.php',
            type: 'POST',
            data: {
                operation: 'getProductsPerCategory',
                catID: catID,
                currentpage: toPage
            },
            success: function(data) {
                $("#loadingContainer").show();

                if (type == 0) {
                    $("#products_widget").html('');
                    $("#products_widget").html(data);
                } else if (type == 1) {
                    $("#products_widget").append(data);
                }

                if ($(".totalpages").last().val() == currPage) {
                    $("#loadMore").hide();
                } else {
                    $("#loadMore").show();
                }

                if (!$('.totalpages').length) {
                    $("#loadMore").hide();
                }

                $("#loadingContainer").hide();


            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);

                $("#loadingContainer").hide();
            }
        });
    }


    function fbShare(e, t, a, o, i, n) {
        var r = screen.height / 2 - n / 2,
            s = screen.width / 2 - i / 2;
        window.open("http://www.facebook.com/sharer.php?s=100&caption=" + t + "&description=" + a + "&picture=" + o + "&u=" + e, "sharer", "top=" + r + ",left=" + s + ",toolbar=0,status=0,width=" + i + ",height=" + n)
    }
</script>