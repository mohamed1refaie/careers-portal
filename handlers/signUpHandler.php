<?php
require_once('../helpers/signUpHelper.php');

if (isset($_POST['operation'])) {
    $signUpHelper = new signUpHelper();
    switch ($_POST['operation']) {
        case 'add':
            echo $signUpHelper->Add();
            break;
        case 'getAll':
            echo $signUpHelper->GetAll();
            break;
		case 'delete':
			echo $signUpHelper->Delete();
		break;
    }
}
