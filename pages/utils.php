<?php

function connect(){
        $myconn = new mysqli("localhost", "root", "", "officina");
        if ($myconn->connect_error) {
            echo("errore di connessione(" . $myconn->connect_errno . ")" . $myconn->connect_error);
        }else{

        }

        return $myconn;
}

// funzione generica per eseguire le query
// @return:	recordset o null se la query non e' andata a buon fine
// @params:	$myconn -> array contenente la connessione
//			$query 	-> query da eseguire

function execute($myconn, $query) {
	$ris = $myconn -> query($query);
	
	if(!$ris -> num_rows > 0) {
		$ris = null;
	}

	return $ris;
}

// funzione per stampare il ris di una query all'interno di una tabella
function showQueryTable($table){
	echo "<table class=\"stampa\">";
	for($i=0;$i<sizeof($table);$i++){
		echo "<tr>";
		for($j=0;$j<sizeof($table[$i]);$j++){
			echo "<td>";
			echo $table[$i][$j];
			echo "</tr>";
		}
		echo "</tr>";
	}
	echo "</table>";
}


?>