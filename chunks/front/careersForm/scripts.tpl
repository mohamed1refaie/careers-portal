<script type="text/javascript">
	
$(document).ready(function() {
	//save button in the add modal
    $("#btnAdd").click(function(event) {
        event.preventDefault();

        isValid = true;

        //form validations
        $('#careersForm .validate').each(function() {
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
        $("#careersForm").submit();
    });
});


	//add form submission
    $("#careersForm").submit(function(event) {
        event.preventDefault();

        $("#loadingContainer").show();

        var values = new FormData($(this)[0]);

        $.ajax({
            url: "handlers/VacanciesHandler.php",
            type: "post",
            data: values,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {

                $('#careersForm')[0].reset();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);

                $("#loadingContainer").hide();
            }
        });
    });

</script>