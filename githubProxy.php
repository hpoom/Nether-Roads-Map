<?php

header( 'Content-Type:text/xml' );

$urlBase = 'https://raw.github.com/hpoom/Nether-Roads-Map/master/';
$ch = curl_init( $urlBase . $_GET['file'] );

curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, true );
curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );

curl_setopt( $ch, CURLOPT_USERAGENT, $_GET['user_agent'] ? $_GET['user_agent'] : $_SERVER['HTTP_USER_AGENT'] );

print curl_exec( $ch );

$status = curl_getinfo( $ch );
curl_close( $ch );

?>