<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/AdminUsersHelper.php');
require_once('helpers/UtilityHelper.php');

if (AdminUsersHelper::IsLoggedIn()==true)
{
	echo "test";
	UtilityHelper::RedirectTo('index.php');
}

$langFile  = json_decode(file_get_contents('lang/videos.json'), true);
$lang     = (isset($_GET['lang'])) ? $_GET['lang'] : 'en';

$page_title       = "Login";
$page_description = "";

$titleTPL        = new LoadChunk('titleTPL', 'front/videos', array('page_title'       => $page_title,
													  			   'page_description' => $page_description), '');
$header          = new LoadChunk('header', 'front', array(
													  'titleTPL'     => $titleTPL,
													  'home_h'       => "Home",
													  'signup'		 => "Signup",
													  'login'		 => "Login"
													  ), '');


$extraScript = new LoadChunk('scripts', 'front/login', array(), '');


$output      = new LoadChunk('login', 'front/login', array(
															   'footer'      => $footer,
													  		   'head'        => $head,
													  		   'header'      => $header,
													           'extraScript' => $extraScript), '');

echo $output;






/*
$head   = new LoadChunk('head', 'admin/master', array(), '../');
$footer = new LoadChunk('footer', 'admin/master', array('extraScripts' => ''), '../');
$output = new LoadChunk('login', 'admin', array(
												'head'   => $head,
												'footer' => $footer
											), '../');

echo $output;
*/