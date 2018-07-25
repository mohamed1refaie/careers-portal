<?php
require_once('helpers/LoadChunk.php');
require_once('helpers/LangHelper.php');
require_once('helpers/PageLoadHelper.php');
require_once('helpers/AdminUsersHelper.php');

if(AdminUsersHelper::IsLoggedIn()==false) {
	UtilityHelper::RedirectTo('index.php');
}


$page_title       = "All Applications";
$page_description = "";

$titleTPL        = new LoadChunk('titleTPL', 'front/videos', array('page_title'       => $page_title,
													  			   'page_description' => $page_description), '');



$header          = new LoadChunk('headerAdmin', 'front', array(
														  'titleTPL'     => $titleTPL,
														  ), '');
$footer         = new LoadChunk ('footerAdmin','front',array(),'');



$extraScript = new LoadChunk('scripts', 'front/applications', array(), '');


$output      = new LoadChunk('applications', 'front/applications', array(
															   'footer'      => $footer,
													  		   'head'        => $head,
													  		   'header'      => $header,
													           'extraScript' => $extraScript), '');

echo $output;

