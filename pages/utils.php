<?php
function createNavBar() {
	echo "<h1 class = 'bgblack'>Simauto</h1>";

	echo "<nav class = 'navbar'>";

	switch($_SESSION['privilegi']) {
		// non loggato
		case 0:
			echo "<a href='index.php'> " . "Home" . "</a>";
			echo "<a href='login.php'> " . "Login" . "</a>";
			break;

		// utente
		case 1:
			echo "<a href='storico.php'> " . "Storico Fatture / Operazioni" . "</a>";
			echo "<a href='login.php'> " . "Login" . "</a>";
			echo "<a href='logout.php'> " . "Logout" . "</a>";
			break;

		// meccanico
		case 2:
			echo "<a href='meccanicoOperazioni.php'> " . "Operazioni Meccanico" . "</a>";
			echo "<a href='logout.php'> " . "Logout" . "</a>";
			break;

		// amministrazione
		case 3:
			echo "<a href='RegistraMeccanico.php'> " . "Registra Meccanico" . "</a>";
			echo "<a href='LicenziaMeccanico.php'> " . "Licenzia Meccanico" . "</a>";
			echo "<a href='RegistraProdottoDb.php'> " . "Registra Prodotto Db" . "</a>";
			
			echo "<a href='logout.php'> " . "Logout" . "</a>";
		
			break;
	}

	echo "</nav>";
}

function logout() {
	session_unset();
    session_destroy();
    header("Refresh:0; url=index.php");
}

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