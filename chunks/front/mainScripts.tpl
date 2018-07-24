<script type="text/javascript">
    var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
        $("#loadingCont").hide();
        $('#loadMore').hide();
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1;

        });

        $("#loadingCont").show();
        $.ajax({
            url: 'handlers/VacanciesHandler.php',
            type: 'POST',
            data: {
                operation: 'getAllCareers',
            },
            success: function(data) {
                $("#careers").html(data);
                $("#loadingCont").hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);

                $("#loadingCont").hide();
            }
        });

    });

</script>