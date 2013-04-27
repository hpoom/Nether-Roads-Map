<?php

header( 'Content-type: application/json' );

$xml = simplexml_load_file( "map.xml" );

//echo json_encode($xml);
$portals = array();
foreach( $xml->portals->portal as $portal ) {
	$current = array(
		'name' => (string) $portal[name],
		'x' => (string) $portal[x],
		'z' => (string) $portal[z],
		'abbr' => (string) $portal[abbr],
		'locked' => false,
		'griefed' => false,
		'uninhabited' => false,
	);
	$status = explode( ',', (string) $portal[status] );
	foreach( $status as $flag ) {
		switch ( trim( $flag ) ) {
			case 'locked':
				$current[locked] = true;
				break;
			case 'griefed':
				$current[griefed] = true;
				break;
			case 'uninhabited':
				$current[uninhabited] = true;
				break;
		}	
	}
	$portals[] = $current;
}

if ( isset( $_GET['callback'] ) ) {
	print $_GET['callback'] . '(' . json_encode( $portals ) . ');';
} else {
	print json_encode( $portals );
}

?>