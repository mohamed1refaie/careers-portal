<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/LangHelper.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/AdminUsersHelper.php');

if (AdminUsersHelper::IsLoggedIn())
{
	UtilityHelper::RedirectTo('index.php');
}

$page_title       = "Submit Your Application";
$page_description = "";

$post_ID=$_GET['id'];
global $xpdo;
$post   = $xpdo->getObject('Posts', array('id' => $post_ID));
if($post==null)
{
		UtilityHelper::RedirectTo('index.php');
}

$titleTPL        = new LoadChunk('titleTPL', 'front/videos', array('page_title'       => $page_title,
													  			   'page_description' => $page_description), '');


$header          = new LoadChunk('header', 'front', array(
														  'titleTPL'     => $titleTPL,
														  'home_h'       => "Home",
														  'signup'		 => "Signup",
														  'login'		 => "Login"
														  ), '');

$extraScript = new LoadChunk('scripts', 'front/careerDetails', array(), '');


$output      = new LoadChunk('careerDetails', 'front/careerDetails', array(
															   'footer'      => $footer,
															   'title'       => $post->Get('title'),
													  		   'experience'  => $post->Get('experience'),
													  		   'breif'       => $post->Get('breif'),
													  		   'id'			 => $post_ID,
													  		   'head'        => $head,
													  		   'header'      => $header,
													           'extraScript' => $extraScript), '');

echo $output;

