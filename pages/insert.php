<?php
/*La pagina ricevera da collegaIntervento.php la targa del veicolo, il nome del prodotto selezionato, l'intervento selezionato e la quantita
e dovra inserire l'id dell'intervento, l'id del prodotto e la quantita nella tabella utilizzo presente nel database*/

    include ("utils.php");
    $myconn = connect();

    $targa=$_GET["targa"];
    $nome=$_GET["nome"];
    $intervento=$_GET["intervento"];
    $quantita=$_GET["quantita"];

/*Si crea una view per selezionare gli id degli interventi e gli id delle operazioni che contengono quegli intervento
dove il nome dell'intervento è uguale al nome dell'intervento selezionato*/
    $view1="CREATE VIEW interventi AS "
	       ."SELECT id_intervento, fk_id_operazione "
         ."FROM intervento "
         ."JOIN anagrafica_intervento "
         ."ON fk_id_anagrafico=id_anagrafico "
         ."WHERE nome_intervento='".$intervento."'";
    $ris1 = $myconn->query($view1);

//Si crea una view per selezionare l'id dell'operazione ancora in colso sul veicolo con la targa selezionata
    $view2="CREATE VIEW operazioni AS "
         ."SELECT id_operazione "
         ."FROM operazione "
         ."JOIN veicolo "
         ."ON fk_id_veicolo=id_veicolo "
         ."WHERE targa='".$targa."'"."AND data_riconsegna_effettiva IS NULL";
    $ris2 = $myconn->query($view2);

//Si prende l'id dell'intervento
    $query1="SELECT id_intervento "
	        . "FROM interventi "
          . "JOIN operazioni "
          . "ON id_operazione=fk_id_operazione";
    $ris1 = $myconn->query($query1);
    $result1=$ris1->fetch_assoc();

//Si prende l'id del prodotto
    $query2="SELECT id_prodotto "
          . "FROM prodotto "
          . "WHERE nome_prod='".$nome."'";
    $ris2 = $myconn->query($query2);
    $result2=$ris2->fetch_assoc();

//Si inseriscono i dati nella tabella
    $query3="INSERT INTO utilizzo(fk_id_intervento, fk_id_prodotto, quantita) "
          . "VALUES('".$result1["id_intervento"]."','".$result2["id_prodotto"]."','".$quantita."')";
    $ris = $myconn->query($query3);

    //Si eliminano le view precedentemente create
    $view1 = "DROP VIEW interventi";
    $ris1 = $myconn->query($view1);
    $view2 = "DROP VIEW operazioni";
    $ris2 = $myconn->query($view2);

    if(!$ris){
      echo "Errore nell'inserimento!";
    }else{
      echo "Inserimento eseguito con successo!";
    }
?>
