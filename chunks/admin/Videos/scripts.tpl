<script type="text/javascript">
var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
		getAll(1, 0);

        //Initialize datepicker
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15 // Creates a dropdown of 15 years to control year
          });

        // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1 ;

            getAll(currPage, 1);

        });

		//open the add modal
        $('#addVideo').on('click', function(event) {
            event.preventDefault();
            $('#addVideoModal').openModal();
        });

		//save button in the add Video modal
        $("#btnVideoAdd").click(function(event) {
            event.preventDefault();

            isValid = true;

            //form validations
    		$('#addGLI .validate').each(function () {
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
            $("#addGLI").submit();
        });


		//add Video submission
        $("#addGLI").submit(function(event) {
            event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

    		$.ajax({
    			url: '../handlers/VideosHandler.php',
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {

    				$('#addGLI')[0].reset();
    				getAll(1, 0);
    				$("#loadingContainer").hide();
                    $('#addVideoModal').closeModal();

                    swal({
                        title: "Video Created",
                        text: "Video has been Created.",
                        type: "success",
                        confirmButtonText: "Close"
                    },  function(isConfirm2) {
                        if (isConfirm2)
                            location.reload();
                    });
    			},
    			error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.responseText);

        			$("#loadingContainer").hide();
                }
    		});
        });

		//edit Video validations
        $("#btnVideoEdit").click(function(event) {
            event.preventDefault();
            tinyMCE.triggerSave();
            isValid = true;
    		$('#editGLI .validate').each(function () {
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
            $("#editGLI").submit();
        });

		//edit Video form submission
        $("#editGLI").submit(function(event) {
    	   event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

    		$.ajax({
    			url: "../handlers/VideosHandler.php",
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {
    				$('#editGLI')[0].reset();
    				$("#loadingContainer").hide();
                    getAll(1, 0);
                    $('#editVideoModal').closeModal();

                    swal({
                        title: "Video Edited",
                        text: "Video has been Edited.",
                        type: "success",
                        confirmButtonText: "Close"
                    },  function(isConfirm2) {
                        if (isConfirm2)
                            location.reload();
                    });
    			},
    			error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.responseText);

        			$("#loadingContainer").hide();
                }
    		});
        });

    });

	//get the edit information for this item
    function fnOpenEdit(itemID) {
        $('#loadingContainer').show();

        $.ajax({
            url: "../handlers/VideosHandler.php",
            type: "POST",
            data: { operation: 'get',  itemID: itemID },
    		//dataType : 'json',
            success: function(item) {
                item = $.parseJSON(item);
    
                    $('#itemID').val(item.id);
                    $('#edit_name_ar').val(item.title_ar);
                    $('#edit_name_en').val(item.title_en);
                    $('#edit_video_url').val(item.video_url);
                    
                    Materialize.updateTextFields();
                    $('#editVideoModal').openModal();
                    tinymce.init({selector:'textarea'}); 
                $("#loadingContainer").hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);
    			$("#loadingContainer").hide();
            }
        });
    }

	//get all items
    function getAll(toPage, type) {
        $("#loadingContainer").show();
    	$.ajax({
            url : '../handlers/VideosHandler.php',
            type: 'POST',
            data: { operation: 'getAll', currentpage: toPage },
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

    			$("#loadingContainer").hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);

    			$("#loadingContainer").hide();
            }
        });
    }

	//delete item
    function fnDel(itemID) {
    	swal({
            title: "Are you sure?",
            text: "This Video will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: '../handlers/VideosHandler.php',
                type: 'POST',
                data: { itemID: itemID, operation: 'delete' },
                success: function(data) {
                    swal({
                        title: "Video Deleted",
                        text: "Video has been Deleted.",
                        type: "success",
                        confirmButtonText: "Close"
                    },  function(isConfirm2) {
                        if (isConfirm2)
                            location.reload();
                    });
                        getAll(1, 0);

                    $("#loadingContainer").hide();
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $("#loadingContainer").hide();
                }
            });
        });
    }
</script>
