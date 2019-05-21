<?php
/*La pagina riceve da collegaIntervento.php il nome del prodotto selezionato e la quantita selezionata
e restituisce il costo totale*/
include ("utils.php");
$myconn = connect();

$nome = $_GET["nome"];//contiene il nome del prodotto
$quantita = $_GET["quantita"];//contiene la quantita

//Si va a selezionare il costo unitario del prodotto selezionato
$query  = "SELECT costo_unitario "
        . "FROM prodotto "
        . "WHERE nome_prod = '".$nome."'";
//Si esegue la query e si verifica che sia andata a buon fine
$ris = $myconn->query($query);
if(!$ris){
  echo "Error";
}else{
  $result=$ris->fetch_assoc();
  $costo=$result["costo_unitario"]*$quantita;
  echo $costo;
}
?>
