<!DOCTYPE>
<html>
    <head>
        <title>Licenzia Meccanico</title>
        <link rel="stylesheet" href="../css/style.css"  >
    </head>

    <body>
        <?php session_start();
	    include ("utils.php");
	    createNavBar();
	    ?>
        
        <div class="box bgwhite center " style="width:30%; margin:0px auto; margin-top:5%;">
            <?php
            //Collegamento al db
            
            $myconn = connect();
            ?>
            <form action="" method="POST">
                <center>

                    <table>
                        <th colspan="3">
                        <h2 style="color: black">Licenzia Meccanico</h2>
                        </th>
                        <!--
                        Modificato da Claudio
                        aggiustare allineamento tra componenti
                        -->
                        <tr>				
                            <td>
                                <select name="meccanico"><?php
                                    //Creazione select della matricola
                                    $query = "SELECT matricola FROM meccanico;";
                                    $ris = execute($myconn, $query);
                                    while ($row = $ris->fetch_assoc()) {
                                        echo "<option>" . $row["matricola"] . "</option>";
                                    }
                                    ?></select></td>
                            <td id="Nome"></td>
                            <td id="Cognome"></td>
                        <tr><td><input type="submit" name="licenzia" value="licenzia"></td></tr>
                        </tr>

                    </table>
                    <?php
                    if (isset($_POST["licenzia"])) {
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {

                            $meccanico = $_POST["meccanico"];
                            $query = "DELETE FROM meccanico
												WHERE meccanico.matricola=" . "'" . $meccanico . "';";
                            //modificato da Claudio
                            //dato che l'execute restituisce sempre -1 con il delete, la query è stata eseguita con la sintassi classica ad ogetti
                            $rSet = $myconn->query($query);
                            header("Refresh:0");
                            /*
                              if($ris<0){
                              echo "Errore Query";
                              }else{
                              echo "<p id=\"stampa\"> Meccanico eliminato con successo </p>";
                              } */
                        }
                    }
                    ?>

            </form>
        </center>
    </div>
</body>
</html>
