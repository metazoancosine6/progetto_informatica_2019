<!DOCTYPE>
<html>
    <head>
        <title>Disabilita Cliente</title>
        <link rel="stylesheet" href="../css/style.css"  >
    </head>

    <body>
        <h1 class="center bgblack header_page">Disabilita Cliente</h1>
        
        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include("utils.php");
                session_start();
                checkAdminPermissions();
                createNavBar();
            ?>
        </div>

        <div class="box bgwhite center">
            <?php
            //Collegamento al db
            $myconn = connect();
            ?>
            <form action="" method="POST">

                    <table>
                        <th colspan="4">
                        <h2 style="color: black">Disabilita Cliente</h2>
                        </th>
                        <tr>				
                            <td>
								<!--Name per php, mentre Id per script-->
                                <select name="cliente" id="cliente" onchange=stampaNomCog()>
								<?php
                                    //Creazione select della matricola
                                    $query = "SELECT cod_fisc 
											FROM cliente join registrazione on id_cliente=fk_id_cliente
											WHERE stato_reg='1';";
                                    $ris = execute($myconn, $query);
                                    while ($row = $ris->fetch_assoc()) {
                                        echo "<option>" . $row["cod_fisc"] . "</option>";
                                    }
                                    ?>
				    </select></td>
					<td id="demo"></td>
					<td><input type="submit" name="cancella" value="cancella"></td>
                        </tr>

                    </table>
                    <?php
					
                    if (isset($_POST["cancella"])) {
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {

							//id della select di riferimento
                            $cod_fisc = $_POST["cliente"];
							
							//query per ricavare l'id corrispondente
							$query="SELECT id_cliente from cliente where cod_fisc='".$cod_fisc."'";
							$ris=execute($myconn,$query);
							$row = $ris->fetch_assoc();
							$id=$row["id_cliente"];
							
							//
                            $query = "UPDATE registrazione
												SET stato_reg='0'
												WHERE fk_id_cliente='".$id."';";

                            //dato che l'execute restituisce sempre -1 con il delete, la query è stata eseguita con la sintassi classica ad ogetti
                            $rSet = $myconn->query($query);
                            header("Refresh:3");
                        	echo "<p id=\"stampa\"> Utente disabilitato con successo </p>";
                        }
                    }
                    ?>
			<script>
				//Stampa nome cognome del cliente
				function stampaNomCog(){
					//prendo il valore della select
					var cliente=document.getElementById("cliente").value;
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
					  if (this.readyState == 4 && this.status == 200) {
						  //esegue cio che e qui dentro per ultimo es. stampa dati
						  document.getElementById("demo").innerHTML=this.responseText;
					  }
					};
					xhttp.open("GET", "ajaxDisabilitaCliente.php?cliente="+cliente, true);
					xhttp.send();
				}
			</script>
            </form>
    </div>
</body>
</html>
