<script type="text/javascript">
    var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
        $("#loadingCont").hide();
        getAll(1, 0);


        // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1;

            getAll(currPage, 1);

        });

    });


    //get all items
    function getAll(toPage, type) {

        // $("#loadingContainer").show();
        $("#loadMore").hide();
        $("#contentContainer").html("<h2>refaieh2</h2>");
        // $("#loadingContainer").hide();
    }

    function fbShare(e, t, a, o, i, n) {
        var r = screen.height / 2 - n / 2,
            s = screen.width / 2 - i / 2;
        window.open("http://www.facebook.com/sharer.php?s=100&caption=" + t + "&description=" + a + "&picture=" + o + "&u=" + e, "sharer", "top=" + r + ",left=" + s + ",toolbar=0,status=0,width=" + i + ",height=" + n)
    }
</script>