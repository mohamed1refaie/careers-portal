<?php
require_once('../helpers/CreatePostHelper.php');
if (isset($_POST['operation'])) {
    $PostHelper = new CreatePostHelper();
    switch ($_POST['operation']) {
        case 'add':
            echo $PostHelper->Add();
            break;
        case 'getAll':
            echo $PostHelper->GetAll();
            break;
		case 'delete':
			echo $PostHelper->Delete();
		break;
    }
}
