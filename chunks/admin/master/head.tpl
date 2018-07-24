<!-- Head + header-->
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Egypt Foods Admin Panel</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/materialize.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/animate.min.css" />
    <link type="text/css" rel="stylesheet" href="../css/lightgallery/lightgallery.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
    <!-- Favicon -->
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon">
    <link rel="icon" href="../favicon.ico" type="image/x-icon">
    <!-- Sweet Alert -->
    <link rel="stylesheet" href="css/sweetalert2.css" />
    <!-- TinyMCE -->
    <script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
    <script>
      tinymce.init({
        selector:'textarea',
        forced_root_block: false,
        plugins: [
          'advlist autolink lists link image charmap print preview anchor textcolor',
          'searchreplace visualblocks code fullscreen',
          'insertdatetime media table contextmenu paste code'
        ],
        toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | forecolor backcolor',
        setup: function (editor) {
          editor.on('change', function () {
            editor.save();
          });
        }
      });
    </script>
  </head>
  <body>
    <div id="loadingContainer" class="loader-container">
      <div class="loader">
        <img src="img/tail-spin.svg">
      </div>
    </div>