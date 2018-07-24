<script type="text/javascript">
var storyID = $('#storyID').val();

	$(document).ready(function(){
		fnGetImages(storyID);

		// Open Modal
		$('#addItem').on('click', function(event) {
			event.preventDefault();
			$('#addImageModal').openModal();
		});

		//save button in the add modal
        $("#btnAdd").click(function(event) {
            event.preventDefault();

            isValid = true;

        	//form validations
			$('#addGL .validate').each(function () {
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
	            $("#addGL").submit();
        });

		// add form submission
        $("#addGL").submit(function(event) {
            event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 
    		values.append("storyID" , storyID);

    		$.ajax({
    			url: "../handlers/StoriesHandler.php",
    			type: "post",
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {

    				$('#addGL')[0].reset();
    				fnGetImages(storyID);
    				$("#loadingContainer").hide();
                    $('#addImageModal').closeModal();
    			},
    			error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.responseText);

        			$("#loadingContainer").hide();
                }
    		});
        });

        //edit story image
        $('#btnEditImage').on('click', function(event){
        	event.preventDefault();

            isValid = true;
    		$('#editGL .validate').each(function () {
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
            $("#editGL").submit();
        });

        // edit form submission
        $('#editGL').submit(function(event) {
        	event.preventDefault();
        	$("#loadingContainer").show();

        	var values = new FormData($(this)[0]);

        	$.ajax({
        		url: '../handlers/StoriesHandler.php',
        		type: 'POST',
        		data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
        		success: function(data) {
        			$('#editGL')[0].reset();
    				$("#loadingContainer").hide();
                    fnGetImages(storyID);
                    $('#editImageModal').closeModal();
        		}
        	});
        });
	});

	function fnGetImages(storyID) {
		$('#loadingContainer').show();

		$.ajax({
			url: '../handlers/StoriesHandler.php',
			type: 'POST',
			data: {operation: 'getImages', storyID: storyID},
			success: function(images) {
				$('#contentContainer').html('');
				$('#contentContainer').append(images);
				$("#loadingContainer").hide();
			},
			error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);
    			$("#loadingContainer").hide();
            }
		});
	}

   function fnOpenEdit(imageID) {
	    $('#loadingContainer').show();

	    $.ajax({
	        url: "../handlers/StoriesHandler.php",
	        type: "POST",
	        data: { operation: 'getImage',  imageID: imageID },
			dataType : 'json',
	        success: function(image) {

	            $('#itemID').val(image.id);
				$('#editNumber').val(image.number);
	            Materialize.updateTextFields();
	            $('#editImageModal').openModal();
	            $("#loadingContainer").hide();
	        },
	        error: function(xhr, ajaxOptions, thrownError) {
	            console.log(xhr.responseText);
				$("#loadingContainer").hide();
	        }
	    });
   }

   function fnDel(imageID) {
    	swal({
            title: "Are you sure?",
            text: "This Image will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: "../handlers/StoriesHandler.php",
                type: "post",
                data: { imageID: imageID, operation: 'deleteImage' },
                success: function(data) {
                        swal("Deleted!", "Press has been deleted.", "success");
                        fnGetImages(storyID);
                        console.log("Deleted");

                    $("#loadingContainer").hide();
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $("#loadingContainer").hide();
                }
            });
        });
    }

</script>