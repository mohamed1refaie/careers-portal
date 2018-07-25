<script type="text/javascript">
    
    $(document).ready(function() {
        //save button in the add modal
        $("#btnAdd").click(function(event) {
            event.preventDefault();

            isValid = true;

            //form validations
            $('#contact .validate').each(function() {
                if ($.trim($(this).val()) == "") {
                    swal({
                        title: "Required Fields",
                        text: "All Fields are required",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
                }
            });


            if (!isValid) return;

            //submit the form after validations
            let values=new FormData($("#contact")[0]);
            $.ajax({
                url: 'handlers/VacanciesHandler.php',
                type: 'post',
                data: values ,
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {

                $('#contact')[0].reset();
                $("#loadingContainer").hide();
                window.location = 'index.php';

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.responseText);
                    $("#loadingContainer").hide();
                }

            });
        });




    });

</script>