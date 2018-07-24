<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/LangHelper.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/AdminUsersHelper.php');

$langFile  = json_decode(file_get_contents('lang/videos.json'), true);
$lang     = (isset($_GET['lang'])) ? $_GET['lang'] : 'en';

$page_title       = "Refaies website";
$page_description = "this is the description of the website";
$view_more        =	"loadmore";

$titleTPL        = new LoadChunk('titleTPL', 'front/videos', array('page_title'       => $page_title,
													  			   'page_description' => $page_description), '');
$header;
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

$extraScript = new LoadChunk('mainScripts', 'front', array(), '');



$output      = new LoadChunk('main', 'front', array(
															   'footer'      => $footer,
													  		   'head'        => $head,
													  		   'header'      => $header,
													  		   'view_more'   => $view_more,
													           'extraScript' => $extraScript), '');

echo $output;

