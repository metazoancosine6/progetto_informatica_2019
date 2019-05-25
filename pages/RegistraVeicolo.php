<html>
<head>
	<title>Registra Veicolo</title>
	<link rel="stylesheet" href="../css/style.css"  >
</head>

<body>
	<h1 class="center bgblack header_page">Registra Veicolo</h1>

	<div class = 'navbar bgblack maxwidth' id='menu'>
		<?php
		include("utils.php");
		session_start();
		checkMeccPermissions();
		createNavBar();
		?>
	</div>

	<?php
	$myconn = connect();
	?>

	<div class=" bgwhite center">
		<form action="" method="POST">
			<table align="center">
				<tr><td>Marca: 			</td><td><input type="text" maxlength="10" name="marca" required><br></td></tr>
				<tr><td>Targa: 			</td><td><input type="text" maxlength="7"  name="targa" required><br></td></tr>
				<tr><td>Tipo: 			</td><td><input type="text" maxlength="10" name="tipo"><br></td></tr>

				<tr><td>Proprietario:	</td>
					<td>
						<!-- Combobox dinamica php -->
						<?php


						$sql = "SELECT * FROM cliente ORDER BY cod_fisc ASC";

						$ris = $myconn->query($sql);

						echo "<select name='lista_clienti'>";

						while ($row = $ris->fetch_assoc()){
							echo "<option id= " . $row['id_cliente'] . ">"  . $row["cod_fisc"] . "</option>";								
						}

						echo "</select>";
						?>

					</td>
				</tr>

				<tr><td>Cavalli: 		</td><td><input type="number" name="cavalli" min="1" max="9999"><br></td></tr>
				<tr><td>Cilindrata: 	</td><td><input type="number" name="cilindr" min="1" max="9999"><br></td></tr>

			</table>

			<center><input type="submit" name="btnInvia" value="Invia"></center>

		</form>

		<?php
		if ($_SERVER["REQUEST_METHOD"] == "POST") {
			$marca 			= $_POST['marca'];
			$targa 			= $_POST['targa'];
			$tipo 			= $_POST['tipo'];
			$cavalli		= $_POST['cavalli'];
			$cilindrata 	= $_POST['cilindr'];
                $proprietario 	= $_POST['lista_clienti']; //proprietario
                
                // vado a recuperarmi l'id_cliente associato a quel codice fiscale
                $sql = "SELECT id_cliente FROM cliente WHERE cod_fisc = \"" . $proprietario . "\"";
                $rSet = $conn -> query($sql);
                
                // controllo se l'ha trovato
                if(!$rSet -> num_rows > 0) {
                	die("NESSUN CLIENTE TROVATO!");
                }

                // memorizzo l'id
                $row = $rSet -> fetch_assoc();
                $id_cliente = $row['id_cliente'];

                $sql = "INSERT INTO veicolo".
                "(nomeV, targa, tipo, cavalli, cilindrata, fk_id_cliente) VALUES (".
                "\"" . $marca . "\"" . "," . 
                "\"" . $targa . "\"" . "," . 
                "\"" . $tipo . "\"" . "," . 
                $cavalli . "," . 
                $cilindrata . "," . 
                $id_cliente . 
                ")";

                echo $sql;

                $rSet = $conn -> query($sql);

				// controllo se l'ha trovato
                if(!$rSet) {
                	die("Errore nell'inserimento!");
                }
                else {
                	echo "Il veicolo e' stato inserito con successo!";
                }
            }
            ?>
        </div>
    </body>
    </html>