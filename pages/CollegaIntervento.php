<!DOCTYPE html>
<html>
    <head>
        <title>Registra Intervento</title>
        <link rel="stylesheet" href="../css/style.css"  >
    </head>

    <body style="background-image:url('../image/gears.png'); background-size: auto; ">
        
        <h1 class="center bgblack header_page">Registra Intervento</h1>
        
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

        <div class="bgwhite center">
            <form action="" method="POST">
                <table>
                    <!-- Dropdown -->
                    <tr>
                        <td>Tipo Intervento:</td>
                        <td>
                            <select name='intAnagrafica'>
                            <?php
                            //riempimento prima select
                            $query = "SELECT nome_intervento FROM anagrafica_intervento;";
                            $ris = $myconn->query($query);
                            while ($row = $ris->fetch_assoc()) {
                                echo "<option>" . $row["nome_intervento"] . "</option>";
                            }
                            ?>
                            </select>
                        </td>
                    </tr>
                    
                    <!-- solo visual -->
                    <tr>
                        <td><p>Descrizione Intervento:</p> </td>
                        <td><textarea name="descrizione"></textarea></td>
                    </tr>
                    <tr>
                        <td>Targa:</td>
                        <td><span id="labelTarga"> <?php echo $_GET["targa"]; ?> </span></td>
                    </tr>
                    
                    <!--
                    <tr>
                        <td><p>Targa: </p></td>
                        <td><input type="text" name="targa"/></td>
                    </tr>
                    -->
                    <tr>
                        <td><p>Operazioni in corso(data di inzio)</p></td>
                        <td>
                            <select name="data_inizio" id="selOp" >

                                <?php
                                    // la query delle operazioni ancora in corso

                                    $targa = $_GET["targa"];
                                    $query = "SELECT id_operazione, data_inizio
                                            FROM veicolo JOIN operazione on id_veicolo=fk_id_veicolo
                                            WHERE targa='" . $targa."' AND data_riconsegna_effettiva IS NULL;";
                                    $ris= execute($myconn, $query);
                                    //controllo che la query sia andata a buon fine
                                    if (!$ris) {
                                        echo "errore nella query" . "    ".$myconn->error;
                                    } else {

                                        while ($row = $ris->fetch_assoc()) {
                                            echo $row["data_inizio"];
                                            echo "<option>".$row["data_inizio"] . "</option>";
                                        }			
                                    }
                                ?>

                            </select>
                           
                        </td>
                    </tr>
                </table>
                <input class="bgblack" type="submit" value="Invia">
            </form>
            
            <?php
                //inserimento di un intervento nelle operazioni
                //bisogna fare più query in modo tale da inserire gli attr giusti nel db.
                //prendendo gli id delle opzioni selezionate
                if ($_SERVER["REQUEST_METHOD"] == "POST") {
                    //prendo la data di inzio dell'operazione 
                    $dataInizio = $_POST["data_inizio"];
                    //prendo l'id dell'operazione confrontando la data
                    $query = "SELECT id_operazione
                              FROM operazione
                              WHERE data_inizio='" . $dataInizio . "' AND data_riconsegna_effettiva IS NULL ";
                    //controllo se la query ha restituito rSet
                    $rSet = execute($myconn, $query);

                    if ($rSet->num_rows > 0) {
                        $id_op = $rSet->fetch_assoc();
                    }

                    //query per sapere id anagrafico x inserire intervento nel db
                    $intAnagrafico=$_POST["intAnagrafica"];
                    $queryAnagrafica="SELECT id_anagrafico
                                        FROM anagrafica_intervento
                                        WHERE nome_intervento='".$intAnagrafico."';";
                    //controllo se la query ha restituito rSet
                    $rSet2 = execute($myconn, $queryAnagrafica);
                    //controllo se la query ha restituito righe > 0
                    if ($rSet->num_rows > 0) {
                        $id_an = $rSet2->fetch_assoc();
                    }

                    //prendo la descrizione dal form
                    $desc=$_POST["descrizione"];
                    //query per inserire l'intervento nel db
                    $queryInserimento="INSERT INTO intervento(descrizione, fk_id_operazione, fk_id_anagrafico)
                            VALUES('".$desc."',".$id_op["id_operazione"].",".$id_an["id_anagrafico"].");";
                    //controllo risultato della query
                    //usare la sintassi mysqli quando si faanno le insert
                    $ris=$myconn -> query($queryInserimento);
                    if(!$ris){
                        echo "errore nella query" . "    ".$myconn->error;
                    }
                    else{
                        echo "<h4 style='color: green;'>Inserimento avvenuto con successo</h4>";
                        echo "<a href='meccanicoOperazioni.php'>Torna alla homepage</a>";
                    }


                }
            ?>

	   </div>

</body>
</html>