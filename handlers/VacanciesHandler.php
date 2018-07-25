<?php
require_once('../helpers/VacanciesHelper.php');

if(isset($_POST['operation']))
{
	$vacanciesHelper = new VacanciesHelper();
	switch ($_POST['operation']) {
		case 'getall':
			echo $vacanciesHelper->GetAll();
			break;
		case 'add':
			echo $vacanciesHelper->Add();
			break;

		case 'addApplication':
			echo $vacanciesHelper->AddApplication();
			break;

		case 'get':
			echo $vacanciesHelper->GetVacancy();
			break;

		case 'edit':
			echo $vacanciesHelper->EditVacancy();
			break;

		case 'editPost':
			echo $vacanciesHelper->EditPost();
			break;

		case 'delete':
			echo $vacanciesHelper->DeleteVacancy();
			break;

		case 'getAllCareers':
			echo $vacanciesHelper->GetAllVacancies();
			break;

		case 'apply':
			echo $vacanciesHelper->AddNewSub();
			break;

		case 'getAllApplicants':
			echo $vacanciesHelper->GetAllApplicants();
			break;

		case 'getAllApplications':
			echo $vacanciesHelper->GetAllApplications();
			break;	

		case 'deleteApplicant':
			echo $vacanciesHelper->DeleteApplication();
			break;
		default:
			# code...
			break;
	}
}
?>