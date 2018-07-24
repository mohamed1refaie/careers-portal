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
            $.ajax({
                url: 'handlers/AdminUsersHandler.php',
                type: 'POST',
                data: {
                    user_name: $('#user_name').val(),
                    password: $('#password').val(),
                    operation: 'login'
                },
                cache: false,
                success: function(data) {
                    data = $.parseJSON(data);

                    if (data.res == 1) {
                        window.location = 'index.php';
                    } else {
                        swal({
                            title: "Error",
                            text: data.message,
                            type: "error",
                            confirmButtonText: "Close"
                        });
                        $('#loadingContainer').hide();
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.statusText);
                    console.log(xhr.responseText);
                    console.log(xhr.status);
                    swal({
                        title: "Something went wrong",
                        text: xhr.responseText,
                        type: "error",
                        confirmButtonText: "close"
                    });
                    $('#loadingContainer').hide();
                }
            });
        });




    });

</script>