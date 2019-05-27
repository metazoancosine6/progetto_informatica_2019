<?php
  //Pagina che restituisce i dati attuali del meccanico
  include ("utils.php");
  $myconn = connect();

  $nome=$_GET["nome"];
  $numero=$_GET["controllo"];

  switch($numero)
  {
    case 0: $attributo="matricola";
            break;
    case 1: $attributo="nome_m";
            break;
    case 2: $attributo="cognome_m";
            break;
    case 3: $attributo="pass_meccanico";
            break;
  }
  $array=explode("-",$nome);//explode è una funzione che divide una stringa in un array utilizzando una variabile separatrice.
  $sql="SELECT ".$attributo."
        FROM meccanico
        WHERE id_meccanico='".$array[0]."'";
  $ris = $myconn->query($sql);
  $result=$ris->fetch_assoc();

  echo $result[$attributo];
 ?>
