<script src="../js/lightgallery/lightgallery.min.js"></script>
<script src="../js/lightgallery/lg-thumbnail.min.js"></script>
<script src="../js/lightgallery/lg-fullscreen.min.js"></script>
<script src="../js/lightgallery/lg-share.min.js"></script>

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

            if ($( "#flavourIDs" ).val().length === 0) {
                swal({
                        title: "Required Fields",
                        text: "Fields has * next to it are required",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
            }

            if ($( "#categoryID option:selected" ).val() == "0") {
                swal({
                        title: "Required Fields",
                        text: "Fields has * next to it are required",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
            }

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
            var categoryID = $("#categoryID option:selected").val(); 
            var videoID    = $("#videoID option:selected").val(); 
            var flavourIDs = [];

            $. each($("#flavourIDs option:selected"), function(){
            flavourIDs. push($(this). val());
            });

            var len = flavourIDs.length;
            len = len - 1;

            values.append('categoryID', categoryID);
            values.append('videoID', videoID);
            values.append('flavourIDs', flavourIDs);
            values.append('len', len);

            $.ajax({
                url: "../handlers/ProductsHandler.php",
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
                        title: "Product Created",
                        text: "Product has been Created.",
                        type: "success",
                        confirmButtonText: "Close"
                    },  function(isConfirm2) {
                        if (isConfirm2)
                            location.reload();
                    });
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    console.log(xhr.responseText);

                    swal({
                        title: "Product Created Error",
                        text: xhr.responseText,
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    $("#loadingContainer").hide();
                }
            });
        });


        //edit product validations
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


    });


    function fnViewPhotosModal(currID) {
        $('#loadingContainer').show();

        $.ajax({
            url: "../handlers/ProductsHandler.php",
            type: "POST",
            data: {
                operation: 'getProductPhotos',
                currID: currID
            },
            success: function(photos) {
                
                photos = JSON.parse(photos).message;
                $(".viewPhotosModal .modal-content .photos").html("");
                $(".viewPhotosModal .modal-content .photos").html(photos);

                var $lg = $('.lightgallery');

                 $lg.lightGallery();

                var onModalHide = function() {
                    $lg.data('lightGallery').destroy(true);

                    // $lg.lightGallery();
                };
                // $("#viewPhotosModal").openModal();
                $("#viewPhotosModal").openModal({
                    complete: onModalHide
                });

                $lg.lightGallery();

                $("#loadingContainer").hide();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                console.log(xhr.responseText);
                $("#loadingContainer").hide();
            }
        });
    }
    //get the edit information for this product
    function fnOpenEdit(currID) {
        $('#loadingContainer').show();

        $.ajax({
            url: "../handlers/ProductsHandler.php",
            type: "POST",
            data: { operation: 'get',  currID: currID },
            // dataType : 'json',
            success: function(product) {

                $('#editForm').html('');
                $('#editForm').append(product);
                $('ul.tabs').tabs();
                $('select').material_select();
                Materialize.updateTextFields();
                $('#editModal').openModal();
                $("#loadingContainer").hide();

        //edit form submission
        $("#editGL").on('submit', function(event) {

           event.preventDefault();
            $("#loadingContainer").show();

            var values = new FormData($(this)[0]);

            var categoryID = $("#editCategoryID option:selected").val();
            var videoID    = $("#editVideoID option:selected").val();
            var flavourIDs = [];


            $. each($("#editFlavourIDs option:selected"), function(){
            flavourIDs. push($(this). val());
            });

            var len = flavourIDs.length;
            len = len - 1;

            values.append('categoryID', categoryID);
            values.append('videoID', videoID);
            values.append('flavourIDs', flavourIDs);
            values.append('len', len);
            $.ajax({
                url: "../handlers/ProductsHandler.php",
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
                        title: "Product Edited",
                        text: "Product has been Edited.",
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
            url: "../handlers/ProductsHandler.php",
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

    //delete product
    function fnDel(currID) {
        swal({
            title: "Are you sure?",
            text: "This product will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: "../handlers/ProductsHandler.php",
                type: "post",
                data: { currID: currID, operation: 'delete' },
                success: function(data) {
                        // swal("Deleted!", "Story has been deleted.", "success");
                        swal({
                        title: "Deleted",
                        text: "product has been deleted.",
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

    function fnOpenDeletePhoto(currID) {

        swal({
            title: "Are you sure?",
            text: "This Photo will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            var $Lg = $('.lightgallery');

            $Lg.data('lightGallery').destroy(true);

            $("#loadingContainer").show();
            $.ajax({
                url: "../handlers/ProductsHandler.php",
                type: "post",
                data: {
                    currID: currID,
                    operation: 'deletephoto'
                },
                success: function(data) {
                    

                    jsonData = JSON.parse(data).message;
                    swal("Deleted!", jsonData.message, "success");

                    console.log(jsonData.productID);

                    fnViewPhotosModal(jsonData.productID);

                    $Lg.data('lightGallery').destroy(true);
                    $Lg.lightGallery();

                    $("#loadingContainer").hide();


                },
                error: function(xhr, ajaxOptions, thrownError) {
                    $("#loadingContainer").hide();
                }
            });
        });
    }
</script>
