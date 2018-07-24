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
        $('#addPage').on('click', function(event) {
            event.preventDefault();
            $('#addPageModal').openModal();
        });

		//save button in the add Page modal
        $("#btnPageAdd").click(function(event) {
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


		//add Page submission
        $("#addGLI").submit(function(event) {
            event.preventDefault();

            $("#loadingContainer").show();

    		var values   = new FormData($(this)[0]);
            var inHeader = 0;
            var inFooter = 0;

            if ($('#inHeader').is(':checked')) { inHeader = 1; }
            if ($('#inFooter').is(':checked')) { inFooter = 1; }

            values.append('inHeader', inHeader);
            values.append('inFooter', inFooter);

    		$.ajax({
    			url: '../handlers/PagesHandler.php',
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {
					console.log(data);

    				$('#addGLI')[0].reset();
    				getAll(1, 0);
    				$("#loadingContainer").hide();
                    $('#addPageModal').closeModal();

                    swal({
                        title: "Page Created",
                        text: "Page has been Created.",
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

		//edit Page validations
        $("#btnPageEdit").click(function(event) {
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

		//edit Page form submission
        $("#editGLI").submit(function(event) {
    	   event.preventDefault();

            $("#loadingContainer").show();
            var values   = new FormData($(this)[0]);

            var editInHeader = 0;
            var editInFooter = 0;

            if ($('#edit_inHeader').is(':checked')) { editInHeader = 1; }
            if ($('#edit_inFooter').is(':checked')) { editInFooter = 1; }

            values.append('edit_inHeader', editInHeader);
            values.append('edit_inFooter', editInFooter);

    		$.ajax({
    			url: "../handlers/PagesHandler.php",
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {
    				$('#editGLI')[0].reset();
    				$("#loadingContainer").hide();
                    getAll(1, 0);
                    $('#editPageModal').closeModal();

                    swal({
                        title: "Page Edited",
                        text: "Page has been Edited.",
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
            url: "../handlers/PagesHandler.php",
            type: "POST",
            data: { operation: 'get',  itemID: itemID },
    		// dataType : 'json',
            success: function(item) {
                item = $.parseJSON(item);
                    $('#editGLI')[0].reset();
                    $('#itemID').val(item.id);
                    $('#edit_name_ar').val(item.name_ar);
                    $('#edit_name_en').val(item.name_en);
                    if (item.in_header == 1) {
                        $('#edit_inHeader').prop('checked', true); } 
                    if (item.in_footer == 1) {
                        $('#edit_inFooter').prop('checked', true); } 
                    
                    if( item.description_en!=undefined && item.description_en!="" ) {tinyMCE.get('edit_description_en').setContent(item.description_en);}

                    if( item.description_ar!=undefined && item.description_ar!="" ) {tinyMCE.get('edit_description_ar').setContent(item.description_ar);}

                    $('#edit_publish_date').val(item.publish_date);
                    Materialize.updateTextFields();
                    $('#editPageModal').openModal();
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
            url : '../handlers/PagesHandler.php',
            type: 'POST',
            data: { operation: 'getAll', currentpage: toPage },
            success: function(data) {
				console.log(data);

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
            text: "This Page will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: '../handlers/PagesHandler.php',
                type: 'POST',
                data: { itemID: itemID, operation: 'delete' },
                success: function(data) {
                    
                    swal({
                        title: "Page Deleted",
                        text: "Page has been Deleted.",
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
