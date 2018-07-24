<script type="text/javascript">
var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {

        // $('.modal').modal();

         fnOpenEdit();

		//open the add modal
        $('#addPage').on('click', function(event) {
            event.preventDefault();
            $('#addPageModal').openModal();
        });

		//save button in the add Page modal
        $("#btnAdd").click(function(event) {
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

            var values = new FormData($(this)[0]); 

    		$.ajax({
    			url: '../handlers/AboutHandler.php',
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {

    				//$('#addGLI')[0].reset();
                    location.reload();
    				$("#loadingContainer").hide();
    			},
    			error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.responseText);

        			$("#loadingContainer").hide();
                }
    		});
        });

    });

	//get the edit information for this item
    function fnOpenEdit() {
        $('#loadingContainer').show();

        $.ajax({
            url: "../handlers/AboutHandler.php",
            type: "POST",
            data: { operation: 'getExport'},
    		// dataType : 'json',
            success: function(item) {
                // tinyMCE.triggerSave();
                item = $.parseJSON(item);
                    $('#addGLI')[0].reset();
                    $('#title_en').val(item.title_en);
                    $('#title_ar').val(item.title_ar);
                    $('#export_url').val(item.export_url);
                    
                    if( item.description_ar!=undefined && item.description_ar!="" ) {tinyMCE.get('description_ar').setContent(item.description_ar);}

                    if( item.description_en!=undefined && item.description_en!="" ) {tinyMCE.get('description_en').setContent(item.description_en);}

                    Materialize.updateTextFields();
                    $('#addModal').openModal({
                        dismissible: false
                      });

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
