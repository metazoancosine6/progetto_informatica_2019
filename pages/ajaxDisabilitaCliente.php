<?php

	include("utils.php");
	$myconn=connect();
	//Matricola del meccanico
	$cliente=$_GET["cliente"];
	//ricerca del nome e cognome 
	$query="SELECT nome, cognome , username
			FROM cliente join registrazione on id_cliente=fk_id_cliente 
			WHERE cod_fisc="."'".$cliente."';";
	$ris=execute($myconn,$query);
	
	$row = $ris->fetch_assoc();
	//concatenazione del messaggio (ovvero delle caselle)
	$mex="<b>Nome :</b>  " . $row["nome"] . "<br>";
	$mex=$mex."<b>Cognome :</b> " . $row["cognome"]. "<br>";
	echo $mex;
?>
