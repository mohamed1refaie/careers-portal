<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/LangHelper.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/AdminUsersHelper.php');

if(AdminUsersHelper::IsLoggedIn()==false) {
	UtilityHelper::RedirectTo('index.php');
}
$langFile  = json_decode(file_get_contents('lang/videos.json'), true);
$lang     = (isset($_GET['lang'])) ? $_GET['lang'] : 'en';

$page_title       = "Create a job post";
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

$extraScript = new LoadChunk('scripts', 'front/createPost', array(), '');


$output      = new LoadChunk('createPost', 'front/createPost', array(
															   'footer'      => $footer,
													  		   'head'        => $head,
													  		   'header'      => $header,
													           'extraScript' => $extraScript), '');

echo $output;

