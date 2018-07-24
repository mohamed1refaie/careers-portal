<script type="text/javascript">
var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
		fnGetPage(1, 0);

        // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1 ;

            fnGetPage(currPage, 1);

        });
		//open the add modal
        $('#addItem').on('click', function(event) {
            event.preventDefault();
            $('#addModal').openModal();
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


		//add form submission
        $("#addGL").submit(function(event) {
            event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

    		$.ajax({
    			url: "../handlers/CategoriesHandler.php",
    			type: "post",
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {

    				$('#addGL')[0].reset();
    				$("#loadingContainer").hide();
                    $('#addModal').closeModal();
                    swal({
                        title: "Category Created",
                        text: "Category has been Created.",
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


		//edit category validations
        $("#btnEdit").click(function(event) {
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

		//edit form submission
        $("#editGL").submit(function(event) {
    	   event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

    		$.ajax({
    			url: "../handlers/CategoriesHandler.php",
    			type: "post",
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {
				
    				$('#editGL')[0].reset();
    				$("#loadingContainer").hide();
                    $('#editModal').closeModal();
                    swal({
                        title: "Category Edited",
                        text: "Category has been Edited.",
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

	//get the edit information for this category
    function fnOpenEdit(currID) {
        $('#loadingContainer').show();

        $.ajax({
            url: "../handlers/CategoriesHandler.php",
            type: "POST",
            data: { operation: 'get',  currID: currID },
    		dataType : 'json',
            success: function(category) {

                $('#itemID').val(category.id);
                $('#edit_name_ar').val(category.name_ar);
                $('#edit_name_en').val(category.name_en);
                $('#edit_description_ar').val(category.description_ar);
    			$('#edit_description_en').val(category.description_en);
                Materialize.updateTextFields();
                $('#editModal').openModal();
                $("#loadingContainer").hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);
    			$("#loadingContainer").hide();
            }
        });
    }

	//get all categories
    function fnGetPage(toPage, type) {
        $("#loadingContainer").show();
    	$.ajax({
            url: "../handlers/CategoriesHandler.php",
            type: "post",
            data: { operation: 'getall', currentpage: toPage },
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

	//delete category
    function fnDel(currID) {
    	swal({
            title: "Are you sure?",
            text: "This Category will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: "../handlers/CategoriesHandler.php",
                type: "post",
                data: { currID: currID, operation: 'delete' },
                success: function(data) {
                        // swal("Deleted!", "Story has been deleted.", "success");
                        swal({
                        title: "Deleted",
                        text: "Category has been deleted.",
                        type: "success",
                        confirmButtonText: "Close"
                    },  function(isConfirm2) {
                        if (isConfirm2)
                            location.reload();
                    });

                    $("#loadingContainer").hide();
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $("#loadingContainer").hide();
                }
            });
        });
    }
</script>
