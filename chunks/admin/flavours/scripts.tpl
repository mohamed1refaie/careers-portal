<script type="text/javascript">
var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
		getAll(1, 0);

        // Load More button
        $('#loadMore').on('click', function(event) {
            currPage = currPage + 1 ;

            getAll(currPage, 1);

        });

		//open the add modal
        $('#addFlavour').on('click', function(event) {
            event.preventDefault();
            $('#addFlavourModal').openModal();
        });

		//save button in the add flavour modal
        $("#btnFlavourAdd").click(function(event) {
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


		//add Flavour submission
        $("#addGLI").submit(function(event) {
            event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

    		$.ajax({
    			url: '../handlers/FlavoursHandler.php',
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {

    				$('#addGLI')[0].reset();
    				getAll(1, 0);
    				$("#loadingContainer").hide();
                    $('#addFlavourModal').closeModal();

                    swal({
                        title: "Flavour Created",
                        text: "Flavour has been Created.",
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

		//edit flavour validations
        $("#btnFlavourEdit").click(function(event) {
            event.preventDefault();

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

		//edit flavour form submission
        $("#editGLI").submit(function(event) {
    	   event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

    		$.ajax({
    			url: "../handlers/FlavoursHandler.php",
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {
    				$('#editGLI')[0].reset();
    				$("#loadingContainer").hide();
                    getAll(1, 0);
                    $('#editFlavourModal').closeModal();

                    swal({
                        title: "Flavour Edited",
                        text: "Flavour has been Edited.",
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
    function fnOpenItemEdit(itemID) {
        $('#loadingContainer').show();

        $.ajax({
            url: "../handlers/FlavoursHandler.php",
            type: "POST",
            data: { operation: 'get',  itemID: itemID },
    		//dataType : 'json',
            success: function(item) {
                item = $.parseJSON(item);
    
                    $('#itemID').val(item.id);
                    $('#edit_name_ar').val(item.name_ar);
                    $('#edit_name_en').val(item.name_en);
                    $('#edit_sort').val(item.sort_number);
                    Materialize.updateTextFields();
                    $('#editFlavourModal').openModal();
                        
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
            url : '../handlers/FlavoursHandler.php',
            type: 'POST',
            data: { operation: 'getAll', currentpage: toPage },
            success: function(data) {

                if (type == 0) {
    			    $("#contentContainerc").html('');
                    $("#contentContainerc").html(data);
    			} else if (type == 1) {
    			    $("#contentContainerc").append(data);
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
            text: "This Flavour will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: '../handlers/FlavoursHandler.php',
                type: 'POST',
                data: { itemID: itemID, operation: 'delete' },
                success: function(data) {
                        swal({
                        title: "Deleted",
                        text: "Flavour has been deleted.",
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
