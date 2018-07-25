<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/VacanciesHelper.php');
require_once('helpers/AdminUsersHelper.php');
if (!isset($_SESSION)) session_start();

/*if(!AdminUsersHelper::IsLoggedIn()||$_SESSION['AdminUser']['role']=='user') {
	UtilityHelper::RedirectTo('index.php');
}
*/
$post_ID=$_GET['id'];

$vacanciesHelper = new VacanciesHelper();
$vacanciesHelper->DeletePost($post_ID);
UtilityHelper::RedirectTo('index.php');
