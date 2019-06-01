<!DOCTYPE>
<html>
    <head>
        <title>Licenzia Meccanico</title>
        <link rel="stylesheet" href="../css/style.css"  >
    </head>

    <body>
        <h1 class="center bgblack header_page">Licenzia Meccanico</h1>
        
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
                        <h2 style="color: black">Licenzia Meccanico</h2>
                        </th>
                        <tr>				
                            <td>
								<!--Name per php, mentre Id per script-->
                                <select name="meccanico" id="meccanico" onchange=stampaNomCog()>
								<?php
                                    //Creazione select della matricola
                                    $query = "SELECT matricola FROM meccanico WHERE stato='1';";
                                    $ris = execute($myconn, $query);
                                    while ($row = $ris->fetch_assoc()) {
                                        echo "<option>" . $row["matricola"] . "</option>";
                                    }
                                    ?>
				    </select></td>
					<td id="demo"></td>
					<td><input type="submit" name="licenzia" value="licenzia"></td>
                        </tr>

                    </table>
                    <?php
					//Query da sistemare
                    if (isset($_POST["licenzia"])) {
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {

							//matricola del meccanico
                            $meccanico = $_POST["meccanico"];
                            $query = "UPDATE meccanico
												SET stato='0'
												WHERE matricola='".$meccanico."';";

                            //dato che l'execute restituisce sempre -1 con il delete, la query è stata eseguita con la sintassi classica ad ogetti
                            $rSet = $myconn->query($query);
                            header("Refresh:3");
                        	echo "<p id=\"stampa\"> Meccanico eliminato con successo </p>";
                        }
                    }
                    ?>
			<script>
				function stampaNomCog(){
					//prendo il valore della select
					var meccanico=document.getElementById("meccanico").value;
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
					  if (this.readyState == 4 && this.status == 200) {
						  //esegue cio che e qui dentro per ultimo es. stampa dati
						  document.getElementById("demo").innerHTML=this.responseText;
					  }
					};
					xhttp.open("GET", "ajaxLicenziaMeccanico.php?meccanico="+meccanico, true);
					xhttp.send();
				}
			</script>
            </form>
    </div>
</body>
</html>
