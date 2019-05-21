<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<center>
		<h1>Inserimento del prodotto</h1>
		<h4>Inserisce nuovo prodotto nel db</h4>
		<form method="POST">
			<table>
				<tr>
					<td>
						Nome del prodotto
					</td>
					<td>
						<input type="text" name="nomeP" maxlength="25">
					</td>
				</tr>
				<tr>
					<td>
						Costo del prodotto
					</td>
					<td>
						<input type=number name="costo" step=0.01 max="999.99" min="0.01" />
					</td>
				</tr>
				<tr>
					<td>
						Aliquota iva
					</td>
					<td>
						<input type=number name="iva" step=1 max="99" min="0" />
					</td>
				</tr>
				<tr>
					<td>
						Categoria del prodotto
					</td>
					<td>
						<?php
        					include ("utils.php");
							$myconn = connect();
							
							$sql = "SELECT distinct categoria FROM prodotto";

							$ris = $myconn->query($sql);
							echo "<select name='categ'>";
							while ($row = $ris->fetch_assoc()){
								echo "<option name = " . $row["categoria"] . ">" .$row["categoria"]."</option>";
							}
							echo "</select>";
						?>
					</td>
				</tr>
			</table>
			<input type="submit">
		</form>

		<?php
			if ($_SERVER["REQUEST_METHOD"] == "POST") {
				$conn = connect();
 				var_dump($_POST);
 				$nomeP 			= $_POST['nomeP'];
                $costo 			= $_POST['costo'];
                $iva 			= $_POST['iva'];
                $categ			= $_POST['categ'];
                
                $sql = "INSERT INTO prodotto".
				"(nome_prod, costo_unitario, aliquota_iva, categoria) VALUES (".
				"\"" . $nomeP . "\"" . "," . 
				$costo . "," . 
				$iva . "," . 
				"\"" . $categ . "\"" .
				")";

				echo $sql;

				$rSet = $conn -> query($sql);

				// controllo se l'ha trovato
                if(!$rSet) {
                	die("Errore nell'inserimento!");
                }
                else {
                	echo "Il prodotto e' stato inserito con successo!";
                }
            }
		?>
	</center>
</body>
</html>