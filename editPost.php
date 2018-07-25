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
global $xpdo;
$post   = $xpdo->getObject('Posts', array('id' => $post_ID));
if($post==null)
{
		UtilityHelper::RedirectTo('index.php');
}

$page_title       = "Edit a job post";
$page_description = "";

$titleTPL        = new LoadChunk('titleTPL', 'front/videos', array('page_title'       => $page_title,
													  			   'page_description' => $page_description), '');

if (AdminUsersHelper::IsLoggedIn())
{
	$header          = new LoadChunk('headerAdmin', 'front', array(
														  'titleTPL'     => $titleTPL,
														  ), '');
	$footer         = new LoadChunk ('footerAdmin','front',array(),'');
}

else {
	$header          = new LoadChunk('header', 'front', array(
														  'titleTPL'     => $titleTPL,
														  'home_h'       => "Home",
														  'signup'		 => "Signup",
														  'login'		 => "Login"
														  ), '');
}

$extraScript = new LoadChunk('scripts', 'front/editPost', array(), '');


$output      = new LoadChunk('editPost', 'front/editPost', array(
															   'footer'      => $footer,
													  		   'head'        => $head,
													  		   'header'      => $header,
													  		   'title'       => $post->Get('title'),
													  		   'experience'  => $post->Get('experience'),
													  		   'breif'       => $post->Get('breif'),
													  		   'start_date'  => $post->Get('start_date'),
													  		   'end_date'    => $post->Get('end_date'),
													  		   'id'			 => $post_ID,
													           'extraScript' => $extraScript), '');

echo $output;
