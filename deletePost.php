<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/LangHelper.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/AdminUsersHelper.php');
require_once('helpers/VacanciesHelper.php');


if(AdminUsersHelper::IsLoggedIn()==false) {
	UtilityHelper::RedirectTo('index.php');
}

$post_ID=$_GET['id'];

$vacanciesHelper = new VacanciesHelper();
$vacanciesHelper->DeletePost($post_ID);
UtilityHelper::RedirectTo('index.php');

