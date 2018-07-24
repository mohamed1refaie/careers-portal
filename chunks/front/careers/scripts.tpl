<script type="text/javascript">
    var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
        getAll(1, 0);

        // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1;

            getAll(currPage, 1);

        });

    });

    //get all items
    function getAll(toPage, type) {
        $("#loadingContainer").show();
        $.ajax({
            url: 'handlers/VacanciesHandler.php',
            type: 'POST',
            data: {
                operation: 'getAllCareers',
                currentpage: toPage
            },
            success: function(data) {

                if (type == 0) {
                    $("#careers").html('');
                    $("#careers").html(data);
                } else if (type == 1) {
                    $("#careers").append(data);
                }

                if ($(".totalpages").last().val() == currPage) {
                    $("#loadMore").hide();
                } else {
                    $("#loadMore").show();
                }

                if (!$('.totalpages').length) {
                    $("#loadMore").hide();
                }


                $('.newsCard p').ellipsis({
                    row: 4
                });

                $("#loadingContainer").hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);

                $("#loadingContainer").hide();
            }
        });
    }
</script>