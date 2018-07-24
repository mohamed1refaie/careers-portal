<script type="text/javascript">
var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
		getAll(1, 0);
        var status = $('#status').val();

        if (status == 1) {
            $('#page_status').prop('checked', true); }
            else
            $('#page_status').prop('checked', false);  

        //show or hide News page
        var pageStatus = status;

        $('#page_status').on('change', function(event) {
            event.preventDefault();
            $("#loadingContainer").show();

            if ($('#page_status').is(':checked')) { pageStatus = 1; $('#page_status').prop('checked', false);  }
            else
            {
               pageStatus = 0; 

               $('#page_status').prop('checked', true); 
            }

            $.ajax({
                url: '../handlers/NewsHandler.php',
                type: 'POST',
                data: { pageStatus: pageStatus, operation: 'set' },
                success: function(data) {
                    location.reload();
                    $("#loadingContainer").hide();
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $("#loadingContainer").hide();
                }
            });
        });

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
        $('#addNews').on('click', function(event) {
            event.preventDefault();
            //$('ul.tabs').tabs();
            $('#addNewsModal').openModal();
            $('#addTabs').tabs('select_tab', 'TabAR');
        });

		//save button in the add News modal
        $("#btnNewsAdd").click(function(event) {
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


		//add News submission
        $("#addGLI").submit(function(event) {
            event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

            var isFeatured = 0;

            if ($('#isFeatured').is(':checked')) { isFeatured = 1; }

            values.append('isFeatured', isFeatured);

    		$.ajax({
    			url: '../handlers/NewsHandler.php',
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {

    				$('#addGLI')[0].reset();
    				getAll(1, 0);
    				$("#loadingContainer").hide();
                    $('#addNewsModal').closeModal();

                    swal({
                        title: "News Created",
                        text: "News has been Created.",
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

		//edit News validations
        $("#btnNewsEdit").click(function(event) {
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

		//edit News form submission
        $("#editGLI").submit(function(event) {
    	   event.preventDefault();

            $("#loadingContainer").show();

    		var values = new FormData($(this)[0]); 

            var editIsFeatured = 0;
            
            if ($('#editIsFeatured').is(':checked')) { editIsFeatured = 1; }

            values.append('editIsFeatured', editIsFeatured);

    		$.ajax({
    			url: "../handlers/NewsHandler.php",
    			type: 'POST',
    			data: values,
    			cache: false,
    			contentType: false,
    			processData: false,
    			success: function(data) {
    				$('#editGLI')[0].reset();
    				$("#loadingContainer").hide();
                    getAll(1, 0);
                    $('#editNewsModal').closeModal();

                    swal({
                        title: "News Edited",
                        text: "News has been Edited.",
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
            url: "../handlers/NewsHandler.php",
            type: "POST",
            data: { operation: 'get',  itemID: itemID },
    		//dataType : 'json',
            success: function(item) {
                item = $.parseJSON(item);
                    $('#editGLI')[0].reset();
                    $('#itemID').val(item.id);
                    $('#edit_name_ar').val(item.name_ar);
                    $('#edit_name_en').val(item.name_en);
                    $('#edit_intro_en').val(item.intro_en);
                    $('#edit_intro_en').val(item.intro_en);
                    if (item.featured == 1) {
                        $('#editIsFeatured').prop('checked', true); } 
                    if( item.description_en!=undefined && item.description_en!="" ) {tinyMCE.get('edit_description_en').setContent(item.description_en);}

                    if( item.description_ar!=undefined && item.description_ar!="" ) {tinyMCE.get('edit_description_ar').setContent(item.description_ar);}

                    $('#edit_publish_date').val(item.publish_date);
                    Materialize.updateTextFields();
                    $('#editNewsModal').openModal();
                    $('#editTabs').tabs('select_tab', 'EditTabAr');
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
            url : '../handlers/NewsHandler.php',
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
            text: "This News will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: '../handlers/NewsHandler.php',
                type: 'POST',
                data: { itemID: itemID, operation: 'delete' },
                success: function(data) {
                    //     swal("Deleted!", "News has been deleted.", "success", function(isConfirm2) {
                    //     if (isConfirm2)
                    //         location.reload();
                    // });
                    swal({
                        title: "News Deleted",
                        text: "News has been Deleted.",
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
