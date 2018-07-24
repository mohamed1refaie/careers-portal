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
            $("#contact").submit();
        });


        $('#branch_mail').text($('#firstMail').val());
        $('#branch_phone').text($('#firstphone').val());
        $('#branch_address').text($('#firstAddress').val());


        $('#cairoBranch').click(function() {
            
            $('#branch_mail').text($('#firstMail').val());
            $('#branch_phone').text($('#firstphone').val());
            $('#branch_address').text($('#firstAddress').val());

        });

        $('#secondBranch').click(function() {
            
            $('#branch_mail').text($('#secondMail').val());
            $('#branch_phone').text($('#secondPhone').val());
            $('#branch_address').text($('#secondAddress').val());

        });

    });

    //add form submission
    $("#contact").submit(function(event) {
        event.preventDefault();

        $("#loadingContainer").show();

        var values = new FormData($(this)[0]);

        $.ajax({
            url: "handlers/ContactHandler.php",
            type: "post",
            data: values,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {

                $('#contact')[0].reset();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);

                $("#loadingContainer").hide();
            }
        });
    });
</script>