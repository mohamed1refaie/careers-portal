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
        $("#loadMore").hide();
        $.ajax({
            url: 'handlers/NewsHandler.php',
            type: 'POST',
            data: {
                operation: 'getAllNews',
                currentpage: toPage
            },
            success: function(data) {

                if (type == 0) {
                    $("#contentContainer").html('');
                    $("#contentContainer").html(data);
                } else if (type == 1) {
                    $("#contentContainer").append(data);
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

     function fbShare(e,t,a,o,i,n)
    {
        var r=screen.height/2-n/2,s=screen.width/2-i/2;window.open("http://www.facebook.com/sharer.php?s=100&caption="+t+"&description="+a+"&picture="+o+"&u="+e,"sharer","top="+r+",left="+s+",toolbar=0,status=0,width="+i+",height="+n)
    }
</script>