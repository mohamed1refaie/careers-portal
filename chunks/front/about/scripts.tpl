<script type="text/javascript">
    var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
        getMembers(1, 0);

        // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1;

            getMembers(currPage, 1);

        });

    });


    //get all items
    function getMembers(toPage, type) {
        $("#loadingContainer").show();
        $("#loadMore").hide();
        $.ajax({
            url: 'handlers/MembersBoardHandler.php',
            type: 'POST',
            data: {
                operation: 'getAllMembers',
                currentpage: toPage
            },
            success: function(data) {
                if (data == "") {
                    $('#board').hide();
                }
                if (type == 0) {
                    $("#membersContainer").html('');
                    $("#membersContainer").html(data);

                } else if (type == 1) {
                    $("#membersContainer").append(data);

                }

                if ($(".totalpages").last().val() == currPage) {
                    $("#loadMore").hide();
                } else {
                    $("#loadMore").show();
                }

                if (!$('.totalpages').length) {
                    $("#loadMore").hide();
                }

                $('#loadMore').on('click', function(event) {
                    $lg.data('lightGallery').destroy(true);
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