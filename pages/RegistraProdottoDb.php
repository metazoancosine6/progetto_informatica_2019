<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../css/style.css"  >
</head>
<body>
	<center>
		<form method="POST">
			  <h1 class="center bgblack header_page">Inserimento del prodotto nel DB</h1>

			  <div class = 'navbar bgblack maxwidth' id='menu'>
			    <?php
			    include("utils.php");
			    session_start();
			    checkAdminPermissions();
			    createNavBar();
			    ?>
			  </div>

			  <?php
			  $myconn = connect();
			  ?>

			  <div class=" bgwhite center">


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

			</div>
			<input type="submit" value="Registra">
		</form>

		<?php
			if ($_SERVER["REQUEST_METHOD"] == "POST") {
				
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