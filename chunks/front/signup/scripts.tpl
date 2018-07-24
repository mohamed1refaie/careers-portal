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

            let password1=$('#contact #password').val();
            let password2=$('#contact #password2').val();
            if(password1!=password2) {
            	swal({
                        title: "Passwords Matching",
                        text: "Your passwords must match",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
            }

            if (!isValid) return;

            //submit the form after validations
            $("#contact").submit();
        });




    });

    //add form submission
    $("#contact").submit(function(event) {
        event.preventDefault();
        $("#loadingCont").show();
        var values = new FormData($(this)[0]);
        $.ajax({
            url: "handlers/signUpHandler.php",
            type: "post",
            data: values,
            cache: false,
            contentType: false,
            processData: false,
            success: function(data) {

                $('#contact')[0].reset();
                $("#loadingContainer").hide();
                data = $.parseJSON(data);
                if (data.res == 1) {
                    window.location = 'index.php';
                } else {
                    swal({
                    title: "Already Exist!",
                    text: data.message,
                    type: "error",
                    confirmButtonText: "Close"
                });
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);
                $("#loadingContainer").hide();
            }
        });
    });
</script>