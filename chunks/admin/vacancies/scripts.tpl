<script type="text/javascript">
var currPage = parseInt($("#currPage").val());
    $(document).ready(function() {
        fnGetPage(1, 0);

        $('select').material_select();

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

            if($( "#departmentID option:selected" ).val() == "0") {
                swal({
                        title: "Required Fields",
                        text: "Fields has * next to it are required",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
            }

            if($( "#typeID option:selected" ).val() == "0") {
                swal({
                        title: "Required Fields",
                        text: "Fields has * next to it are required",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
            }

            if($( "#governmentID option:selected" ).val() == "0") {
                swal({
                        title: "Required Fields",
                        text: "Fields has * next to it are required",
                        type: "error",
                        confirmButtonText: "Close"
                    });
                    isValid = false;
                    return;
            }
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

            var values       = new FormData($(this)[0]);
            var governmentID = $("#governmentID option:selected").val();
            var departmentID = $("#departmentID option:selected").val();
            var typeID       = $("#typeID option:selected").val();

            values.append('governmentID', governmentID);
            values.append('departmentID', departmentID);
            values.append('typeID', typeID);

            $.ajax({
                url: "../handlers/VacanciesHandler.php",
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
                        title: "Vacancy Created",
                        text: "Vacancy has been Created.",
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


        //edit vacancy validations
        $("#btnEdit").click(function(event) {
            event.preventDefault();
            tinyMCE.triggerSave();

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
            var editGovernmentID = $("#editGovernmentID option:selected").val();
            var editDepartmentID = $("#editDepartmentID option:selected").val();
            var editTypeID       = $("#editTypeID option:selected").val();

            values.append('governmentID', editGovernmentID);
            values.append('departmentID', editDepartmentID);
            values.append('typeID', editTypeID);

            $.ajax({
                url: "../handlers/VacanciesHandler.php",
                type: "post",
                data: values,
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                
                    $('select').material_select();
                    $('#editGL')[0].reset();
                    $("#loadingContainer").hide();
                    $('#editModal').closeModal();
                    swal({
                        title: "vacancy Edited",
                        text: "vacancy has been Edited.",
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

    //get the edit information for this vacancy
    function fnOpenEdit(currID) {
        $('#loadingContainer').show();

        $.ajax({
            url: "../handlers/VacanciesHandler.php",
            type: "POST",
            data: { operation: 'get',  currID: currID },
            success: function(vacancy) {
                vacancy = $.parseJSON(vacancy);
    
                $('#itemID').val(vacancy.id);
                $('#edit_title_ar').val(vacancy.title_ar);
                $('#edit_title_en').val(vacancy.title_en);
                if( vacancy.description_en!=undefined && vacancy.description_en!="" ) {tinyMCE.get('edit_description_en').setContent(vacancy.description_en);}

                if( vacancy.description_ar!=undefined && vacancy.description_ar!="" ) {tinyMCE.get('edit_description_ar').setContent(vacancy.description_ar);}

                if( vacancy.required_skills_en!=undefined && vacancy.required_skills_en!="" ) {tinyMCE.get('edit_required_skills_en').setContent(vacancy.required_skills_en);}

                if( vacancy.required_skills_ar!=undefined && vacancy.required_skills_ar!="" ) {tinyMCE.get('edit_required_skills_ar').setContent(vacancy.required_skills_ar);}
                 
                $("#editGovernmentID > option").each(function() {
                    if (vacancy.government_id == this.value) {
                        $("#editGovernmentID option[value='"+vacancy.government_id +"']").prop('selected', true);
                    }
               });

                $("#editDepartmentID > option").each(function() {
                    if (vacancy.department_id == this.value) {
                        $("#editDepartmentID option[value='"+vacancy.department_id +"']").prop('selected', true);
                    }
               });

                $("#editTypeID > option").each(function() {
                    if (vacancy.type_en == "Full Time") {
                        $("#editTypeID option[value='1']").prop('selected', true);
                    }
                    else if (vacancy.type_en == "Part Time"){
                        $("#editTypeID option[value='2']").prop('selected', true);
                    }
               });

                $('select').material_select();
                Materialize.updateTextFields();
                $('#editModal').openModal();
                tinymce.init({selector:'textarea'}); 
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
            url: "../handlers/VacanciesHandler.php",
            type: "post",
            data: { operation: 'getall', currentpage: toPage },
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

    //delete vacancy
    function fnDel(currID) {
        swal({
            title: "Are you sure?",
            text: "This vacancy will be deleted.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }, function() {
            $("#loadingContainer").show();
            $.ajax({
                url: "../handlers/VacanciesHandler.php",
                type: "post",
                data: { currID: currID, operation: 'delete' },
                success: function(data) {
                        // swal("Deleted!", "Story has been deleted.", "success");
                        swal({
                        title: "Deleted",
                        text: "vacancy has been deleted.",
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
