<html>
	<head>
		<title>Registra Meccanico</title>
	</head>

	<body>
		
		
		<div class="div" style="margin-top:5%;">
			<center><h1>Registra Meccanico</h1></center>
			<form action=" " method="POST">
				<table align="center">
					<tr><td>Matricola: 			</td><td><input type="text" name="matricola" maxlength="10" required><br></td></tr>
					<tr><td>Nome: 				</td><td><input type="text" name="nome" maxlength="10" required ><br></td></tr>
					<tr><td>Cognome: 			</td><td><input type="text" name="cognome" maxlength="15" required><br></td></tr>
					<tr><td>Livello: 			</td><td><input type="number" name="livello" min="1" max="10"><br></td></tr>
					<tr><td>Password: 			</td><td><input type="pass" name="pass" maxlength="20"><br></td></tr>
					
				</table>

		  	<center><input type="submit" name="btn" value="Invia"></center>
			</form>
		
			<?php
				include "utils.php";

				// controlla se ho premuto il bottone invia
				if(isset($_POST["btn"])){
					if($_SERVER['REQUEST_METHOD'] === 'POST'){
						$matricola 	=	$_POST["matricola"];
						$nome 		=	$_POST["nome"];
						$cognome 	=	$_POST["cognome"];
						$livello 	=	$_POST["livello"];
						$pass 		=	$_POST["pass"];
					}
					
					$conn = connect();
					
					if($conn -> connect_error){
						die("errore connessione db");
					}
					
					$sql = 
						"INSERT INTO meccanico (matricola, nome_m, cognome_m, livello, pass_meccanico) VALUES(".
						"\"". $matricola . "\"" . "," .
						"\"". $nome . "\"". "," .
						"\"". $cognome . "\"". "," .
						$livello ."," .
						"\"". $pass . "\"" . ");";

					// esegue query e vede se e' andata a buon fine
					$ris = $conn -> query($sql);

					if(!$ris){
						echo "<center><h3>Inserimento nuovo meccanico fallito!</h3></center>";
					}else{
						echo "<center><h3>Inserimento nuovo meccanico eseguito con successo</h3></center>";
					}
				}

			?>
		</div>	
	</body>
</html>