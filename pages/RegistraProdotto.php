<!DOCTYPE html>
<html>
    <head>
        <script>
            //Funzione che richiama search.php e gli passa la targa del veicolo selezionato
            function cercaNomeInter() {
                var xhttp = new XMLHttpRequest();
                var targa = document.getElementById("targa").innerHTML;
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("inter").innerHTML = this.responseText;
                    }
                }
                xhttp.open("GET", "search.php?targa=" + targa, true);
                xhttp.send();
            }

            //Funzione che richiama moltiplica.php e gli passa il nome del prodotto e la quantita
            function costo() {
                var xhttp = new XMLHttpRequest();
                var nome = document.getElementById("nome").value;
                var quantita = document.getElementById("quantita").value;
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("costo").innerHTML = this.responseText + '€';
                    }
                }
                xhttp.open("GET", "moltiplica.php?nome=" + nome + "&quantita=" + quantita, true);
                xhttp.send();
            }

            //Funzione che rishiama insert.php e gli passa il nome del prodotto, la targa del veicolo, l'intervento solezionato e la quantita
            function inserisci() {
                var xhttp = new XMLHttpRequest();
                var nome = document.getElementById("nome").value;
                var targa = document.getElementById("targa").innerHTML;
                var intervento = document.getElementById("scelta").value;
                var quantita = document.getElementById("quantita").value;

                xhttp.open("GET", "insert.php?nome="+nome+"&targa="+targa+"&intervento="+intervento+"&quantita="+quantita, true);
                xhttp.send();
            }
        </script>
    </head>
    <body onload="cercaNomeInter(); costo()">
    <center>
        <h1>Inserire prodotto</h1>
        <?php
        $targa = $_GET["targa"];
        echo "<table>";
        echo "<tr>";
        echo "<td>";
        echo "<p>Targa: </p>";
        echo "</td>";
        echo "<td>";
        echo "<p id='targa'>" . $targa . "</p>";
        echo "</td>";
        echo "</tr>";
        echo "</table>";
        ?>
        <form>
            <table>
                <tr>
                    <td>
                        <p>Seleziona prodotto: </p>
                    </td>
                    <td>
                        <?php
                        //Si crea una select con i nomi dei prodtti registrati nel database
                        include ("utils.php");
                        $myconn = connect();

                        $query = "SELECT nome_prod "
                                . "FROM prodotto";

                        $ris = $myconn->query($query);
                        echo "<select id='nome' onchange='costo()'>";
                        while ($row = $ris->fetch_assoc()) {
                            echo "<option>" . $row["nome_prod"] . "</option>";
                        }
                        echo "</select>";
                        ?>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Seleziona quantità: </p>
                    </td>
                    <td>
                        <input type="number" id="quantita" step="1" max="999" min="0" value="0" onchange="costo()">
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>costo: </p>
                    </td>
                    <td>
                        <p id="costo"></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Selezionare l'intervento: </p>
                    </td>
                    <td>
                        <p id="inter"></p>
                    </td>
                </tr>
            </table>
            <a href="meccanicoOperazioni.php"><input type="button" onclick="inserisci()" value="Inserisci"></a>
        </form>
    </center>
</body>
</html>
