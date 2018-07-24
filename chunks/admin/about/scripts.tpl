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
            data: { operation: 'get'},
    		// dataType : 'json',
            success: function(item) {
                item = $.parseJSON(item);
                    $('#addGLI')[0].reset();
                    $('#history_ar').val(item.history_ar);
                    $('#history_en').val(item.history_en);
                    
                    if( item.history_en!=undefined && item.history_en!="" ) {tinyMCE.get('history_content_en').setContent(item.history_en);}

                    if( item.history_ar!=undefined && item.history_ar!="" ) {tinyMCE.get('history_content_ar').setContent(item.history_ar);}

                    if( item.mission_en!=undefined && item.mission_en!="" ) {tinyMCE.get('mission_content_en').setContent(item.mission_en);}

                    if( item.mission_ar!=undefined && item.mission_ar!="" ) {tinyMCE.get('mission_content_ar').setContent(item.mission_ar);}

                    if( item.quality_en!=undefined && item.quality_en!="" ) {tinyMCE.get('quality_content_en').setContent(item.quality_en);}

                    if( item.quality_ar!=undefined && item.quality_ar!="" ) {tinyMCE.get('quality_content_ar').setContent(item.quality_ar);}

                    Materialize.updateTextFields();
                    $('#addModal').openModal({
                        dismissible: false
                      });

                    tinymce.init({selector:'textarea'}); 
                    $("#loadingContainer").hide();

                    // $('.modal').modal({
                    //     dismissible: false
                    //   });
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
