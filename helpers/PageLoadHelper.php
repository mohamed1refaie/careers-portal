<?php

if(!isset($_COOKIE['lang'])) {
    $lang = (isset($_GET['lang'])) ? $_GET['lang'] : 'en' ;
    setcookie('lang', $lang, time() + (86400 * 30 * 30), "/");
} else {
    $langCookie = $_COOKIE['lang'];
    $lang = (isset($_GET['lang'])) ? $_GET['lang'] : 'en' ;
}
$_SESSION['lang'] = $lang;

$arLink = '';
if ($lang == 'ar') {
	$arLink = '<link type="text/css" rel="stylesheet" href="css/style_ar.css" media="screen,projection" />';
}

// Base URL

if ($_SERVER['HTTP_HOST'] != 'localhost') {
    $server        = $_SERVER['HTTP_HOST'];
} else {
    $fullPath      = explode("\\", __DIR__);
    $mainDirectory = $fullPath[sizeof($fullPath) - 2];
    $server        = $_SERVER['HTTP_HOST'] . "/" . $mainDirectory;
}

//==============


$langFile  = json_decode(file_get_contents('lang/main.json'), true);

global $xpdo;
//$obj = $xpdo->getObject('Settings', array('id' => 1));

//$news_status = $obj->get('status');


$home_h         = $langFile['home'][$lang];
$products_h     = $langFile['products'][$lang];
$videos_h       = $langFile['videos'][$lang];
$news_h         = $langFile['news'][$lang];
$investors_h    = $langFile['investors'][$lang];
$careers_h      = $langFile['careers'][$lang];
$aboutus_h      = $langFile['aboutus'][$lang];
$contactus_h    = $langFile['contactus'][$lang];
$footerText_h   = $langFile['footerText'][$lang];
$headText_h     = $langFile['headText'][$lang];
$important      = $langFile['important'][$lang];

$head        = new LoadChunk('head', 'front', array('arLink' => $arLink,
													'headText_h' => $headText_h), '');

$footer      = new LoadChunk('footer', 'front', array('lang'             => $lang,
													  'home_h'		     => $home_h,
													  'signup'		 => "Signup",
													  'login'		 => "Login",
													  'important'        => $important), '');




?>