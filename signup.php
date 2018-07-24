<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/AdminUsersHelper.php');
require_once('helpers/UtilityHelper.php');

if (AdminUsersHelper::IsLoggedIn())
{
	UtilityHelper::RedirectTo('index.php');
}
$langFile  = json_decode(file_get_contents('lang/videos.json'), true);
$lang     = (isset($_GET['lang'])) ? $_GET['lang'] : 'en';

$page_title       = "Signup";
$page_description = "Signup to join the career portal";
$view_more        =	"loadmore";

$titleTPL        = new LoadChunk('titleTPL', 'front/videos', array('page_title'       => $page_title,
													  			   'page_description' => $page_description), '');
$header          = new LoadChunk('header', 'front', array(
													  'titleTPL'     => $titleTPL,
													  'home_h'       => "Home",
													  'signup'		 => "Signup",
													  'login'		 => "Login"
													  ), '');


$extraScript = new LoadChunk('scripts', 'front/signup', array(), '');


$output      = new LoadChunk('signup', 'front/signup', array(
															   'footer'      => $footer,
													  		   'head'        => $head,
													  		   'header'      => $header,
													  		   'view_more'   => $view_more,
													           'extraScript' => $extraScript), '');

echo $output;

