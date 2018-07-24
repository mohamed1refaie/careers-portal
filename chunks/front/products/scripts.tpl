<script type="text/javascript">
var currPage = parseInt($("#currPage").val());
var catID;
$(document).ready(function() {

    var lastCatID = $('#lastCatID').val();
    

    // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1;
            catID = $('#categoryID').val();

            getProducts(catID,currPage, 1, 0);

        });

    getProducts(lastCatID,1,0,0);

    $('.cat').click(function() {
        $("#prodLoader").removeClass('hide');

    });

});

function getProducts(catID,toPage, type, resetPage) {

   if (resetPage == 1) {
    currPage = 1;
   }

   $("#loadMore").hide();
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
            $("#prodLoader").addClass('hide');

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

</script>