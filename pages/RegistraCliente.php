<html>
	<head>
		<title>Registra Cliente</title>
		<link rel="stylesheet" href="../css/style.css"  >    
	</head>

	<body>
		<h1 class="center bgblack header_page">Registra Cliente </h1>
        
        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include("utils.php");
                session_start();
                //checkAdminPermissions();
                createNavBar();
            ?>
        </div>

		<div class="bgwhite">
			<form action=" " method="POST">
				<table align="center">
					<tr><td>Nome: 				</td><td><input type="text" name="nome" ><br></td></tr>
					<tr><td>Cognome: 			</td><td><input type="text" name="cognome" ><br></td></tr>
					<tr><td>Telefono: 			</td><td><input type="text" name="tel"><br></td></tr>
					<tr><td>Data di nascita: 	</td><td><input type="date" name="dataN" ><br></td></tr>
					<tr><td>Codice Fiscale: 	</td><td><input type="text" name="codF"><span></span><br></td></tr>
					<tr><td>Username: 			</td><td><input type="text" name="user"><br></td></tr>
					<tr><td>Via: 			</td><td><input type="text" name="via"><br></td></tr>
					<tr><td>Civico: 			</td><td><input type="text" name="civ"><br></td></tr>
					<tr><td>Cap: 			</td><td><input type="text" name="cap"><br></td></tr>
					<tr><td>Password: 			</td><td><input type="pass" name="pass"><br></td></tr>
					<tr><td>Email: 				</td><td><input type="email" name="mail"><br></td></tr>
				</table>

		  	<center><input type="submit" name="btn" value="Invia"></center>
			</form>
		
			<?php
				if(isset($_POST["btn"])){
					if($_SERVER['REQUEST_METHOD'] === 'POST'){
						$nome=$_POST["nome"];
						$cognome=$_POST["cognome"];
						$tel=$_POST["tel"];
						$dataN=$_POST["dataN"];
						$codF=$_POST["codF"];
						$user=$_POST["user"];
						$via=$_POST["via"];
						$civ=$_POST["civ"];
						$cap=$_POST["cap"];
						$pass=$_POST["pass"];
						$email=$_POST["mail"];
					}else{}
					$myconn=connect();
					if($myconn->connect_error){
						
						die("errore connessione db");
					}
					
					$query="INSERT INTO cliente (data_nascita,cod_fisc,cognome,nome,cap,via,civico,telefono,email) VALUE("."'".$dataN."','".$codF."','".$cognome."','"
					.$nome."','".$cap."','".$via."','".$civ."','".$tel."','".$email."');";
					$ris=$myconn->query($query);
					if(!$ris){
						echo "query error";
					}else{
						echo "<center><h3>inserimento eseguito con successo</h3></center>";
					}
				}

				//echo $query;
			?>
		</div>	
	</body>
</html>