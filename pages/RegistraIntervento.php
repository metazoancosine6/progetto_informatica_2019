<!DOCTYPE html>
<!--
  Pagina che inserisce un nuovo intervento nell'anagrafica intervento
-->
<html>
    <head>
    </head>
    <body>
    <center>
        <h1>Nuovo intervento</h1>
        <form action="" method="POST">
          <table>
            <tr>
              <td>
                <p>Inserire nome intervento</p>
              </td>
              <td>
                <input type="text" name="nome">
              </td>
            </tr>
            <tr>
              <td>
                <p>Inserire costo dell' intervento</p>
              </td>
              <td>
                <input type="text" name="costo">
              </td>
            </tr>
            <tr>
              <td>
                <p>Inserire tempo di lavorazione</p>
              </td>
              <td>
                <input type="number" step="0.10" max="999.990" min="0.00" name="tempo" value="0.00">
              </td>
            </tr>
          </table>
          <input type="submit" name="btn" value="Inserisci">
        </form>
    </center>
			<?php
				include "utils.php";
				if(isset($_POST["btn"])){
						$nome=$_POST["nome"];
						$costo=$_POST["costo"];
						$tempo=$_POST["tempo"];

					$myconn=connect();
					if($myconn->connect_error){

						die("errore connessione db");
					}

          $query="INSERT INTO anagrafica_intervento (nome_intervento, costo_intervento, tempo_lavorazione) "
                . "VALUES('".$nome."','".$costo."','".$tempo."')";
					$ris=$myconn->query($query);
					if(!$ris){
						echo "query error";
					}else{
						echo "<center><h3>inserimento eseguito con successo</h3></center>";
					}
				}
			?>
</body>
</html>
