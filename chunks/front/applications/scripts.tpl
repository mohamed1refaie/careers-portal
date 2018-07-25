<script type="text/javascript">
    $(document).ready(function() {
        $("#loadingCont").show();
        $.ajax({
            url : '../handlers/VacanciesHandler.php',
            type: 'POST',
            data: { operation: 'getAllApplications'},
            success: function(data) {
                 $("#contentContainer").html(data);
                 $("#loadingCont").hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);
                $("#loadingCont").hide();
            }
        });


    });


</script>
