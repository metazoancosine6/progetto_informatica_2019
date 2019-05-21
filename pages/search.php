<?php
/*La pagina riceve da collegaIntervento.php il la targa del veicolo e andrà a restituire
una select composta dagli interventi attualmente in corso su quel veicolo*/
include ("utils.php");
$myconn = connect();

$targa = $_GET["targa"];
//Si crea una view per selezionare l'operazione ancora il corso sul veicolo
$view1 = "CREATE VIEW operazioni AS
			SELECT id_operazione
			FROM veicolo
			JOIN operazione
			ON id_veicolo = fk_id_veicolo
			WHERE targa = '" . $targa . "'" . "AND data_riconsegna_effettiva IS NULL";
$ris = $myconn->query($view1);

/*Si crea una view per selezionare la lista dei nomi degli interventi possibili
e delle il codice identificativo di tutte le operazioni*/
$view2 = "CREATE VIEW interventi AS
			SELECT nome_intervento, fk_id_operazione
			FROM anagrafica_intervento
			JOIN intervento
			ON id_anagrafico = fk_id_anagrafico";
$ris = $myconn->query($view2);

//Si seleziona il nome degli interventi che sono collegati all'operazione presente nella view operazioni
$sql = "SELECT nome_intervento
			FROM interventi
			JOIN operazioni
			ON id_operazione = fk_id_operazione";
$ris = $myconn->query($sql);

//Si restituisce la select
echo "<select id='scelta'>";
while ($row = $ris->fetch_assoc()) {
    echo "<option value='".$row["nome_intervento"]."'>".$row["nome_intervento"]."</option>";
}
echo "</select>";

//Si eliminano le view precedentemente create
$view1 = "DROP VIEW operazioni";
$ris = $myconn->query($view1);
$view2 = "DROP VIEW interventi";
$ris = $myconn->query($view2);
?>
