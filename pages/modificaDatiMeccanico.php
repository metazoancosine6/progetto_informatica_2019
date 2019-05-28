<html>
    <head>
        <meta charset="UTF-8">
        <title>Modifica dati meccanico</title>
        <link rel="stylesheet" href="../css/style.css"  >
    </head>
    <body onload="cambiaMatricola();cambiaNome();cambiaCognome()">
        <h1 class="center bgblack header_page"> Modifica dati meccanico </h1>

        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include ("utils.php");
                session_start();
                createNavBar();
                checkAdminPermissions();
            ?>
        </div>

        <script>
            function cambiaMatricola() {//Funzione che mostra la matricola attuale del meccanico. Richiama "vecchiDatiMeccanico.php" e gli passa una variabile per distinguere il tipo di operazione che dovrà svolgere
              var nome = document.getElementById("selezionato").value;
              if(nome!="")
              {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                      document.getElementById("matricola_v").innerHTML = this.responseText;
                    }
                }
                xhttp.open("GET", "vecchiDatiMeccanico.php?nome=" + nome + "&controllo="+0, true);
                xhttp.send();
              }
              else
              {
                document.getElementById("matricola").value = "";
                document.getElementById("matricola_v").innerHTML = "";
              }
            }
            function cambiaNome() {//Funzione che mostra il nome attuale del meccanico. Richiama "vecchiDatiMeccanico.php"
              var nome = document.getElementById("selezionato").value;
              if(nome!="")
              {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                      document.getElementById("nome_v").innerHTML = this.responseText;
                    }
                }
                xhttp.open("GET", "vecchiDatiMeccanico.php?nome=" + nome + "&controllo="+1, true);
                xhttp.send();
              }
              else
              {
                document.getElementById("nome").value = "";
                document.getElementById("nome_v").innerHTML = "";
              }
            }
            function cambiaCognome() {//Funzione che mostra il cognome attuale del meccanico. Richiama "vecchiDatiMeccanico.php"
              var nome = document.getElementById("selezionato").value;
              if(nome!="")
              {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                      document.getElementById("cognome_v").innerHTML = this.responseText;
                    }
                }
                xhttp.open("GET", "vecchiDatiMeccanico.php?nome=" + nome + "&controllo="+2, true);
                xhttp.send();
              }
              else
              {
                document.getElementById("cognome").value = "";
                document.getElementById("cognome_v").innerHTML = "";
              }
            }
            /*
            function cambiaPassword() {//Funzione che mostra il cognome attuale del meccanico. Richiama "vecchiDatiMeccanico.php"
              var nome = document.getElementById("selezionato").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                      password = this.responseText;
                      password = password.toString();
                      var str="";
                      for(var i=0; i<password.length; i++)
                      {
                        str=str+'*';
                      }
                      document.getElementById("password_v").innerHTML=str;
                    }
                }
                xhttp.open("GET", "vecchiDatiMeccanico.php?nome=" + nome + "&controllo="+3, true);
                xhttp.send();
            }*/
            function copia()//Funzione che copia i vecchi dati nei campi di testo così da non riscrivere tutti i dati per cambiarne uno solo
            {
              document.getElementById("matricola").value = document.getElementById("matricola_v").innerHTML;
              document.getElementById("nome").value = document.getElementById("nome_v").innerHTML;
              document.getElementById("cognome").value = document.getElementById("cognome_v").innerHTML;
            }
        </script>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if (isset($_POST["btn"])){
              $myconn = connect();
              $id=explode("-",$_POST["selezionato"]);
              $matricola = $_POST["matricola"];
              $nome = $_POST["nome"];
              $cognome = $_POST["cognome"];
              $password = md5($_POST["password"]);
              if(!isset($password))
              {
                $sql="UPDATE meccanico
                    SET matricola = '".$matricola.
                    "', nome_m = '".$nome.
                    "', cognome_m = '".$cognome.
                    "' WHERE id_meccanico='".$id[0]."'";
              } 
              else
              {
                $sql="UPDATE meccanico
                    SET matricola = '".$matricola.
                    "', nome_m = '".$nome.
                    "', cognome_m = '".$cognome.
                    "', pass_meccanico = '".$password.
                    "' WHERE id_meccanico='".$id[0]."'";
              } 
              $ris = $myconn->query($sql);
            }
          }
          ?>
        <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
          <form action="" method="POST">
            <?php
              $myconn = connect();
              $query = "SELECT id_meccanico,nome_m, cognome_m "
                      . "FROM meccanico";
                      $ris = $myconn->query($query);
                      echo "<p>Seleziona il meccanico: </p>";
                      echo "<select id='selezionato' name='selezionato' onchange='cambiaMatricola();cambiaNome();cambiaCognome()'>";//Creazione select per selezionare il meccanico al quale cambiare i dati
                      while ($row = $ris->fetch_assoc()) {
                        echo "<option>" . $row["id_meccanico"] . "-" . $row["nome_m"] . "-" . $row["cognome_m"] . "</option>";
                      }
              echo "</select>";
            ?>
      <table style="border-collapse: collapse">
        <tr>
          <td style="width:3%">
            <table>
              <tr>
                <td><p>Matricola: </p></td><td><p id="matricola_v"></p></td>
              </tr>
              <tr>
                <td><p>Nome: </p></td><td><p id="nome_v"></p></td>
              </tr>
              <tr> 
                <td><p>Cognome: </p></td><td><p id="cognome_v"></p></td>
              </tr>
            </table>
          </td>
        
          <td style="width:3%">
            <table style="border-collapse: collapse;width:10%">
              <tr>
                <td><input type="button" value="->" onclick="copia()"></td>
              </tr>
            </table>
          </td>
          <td style="width:50%">
            <table>
              <tr>
                <td><p>Nuova matricola: </p></td><td style="width:50%"><input type="text" id="matricola" name="matricola" minlength="1" maxlength="9" required></td>
              </tr>
              <tr>
                <td><p>Nuovo nome: </p></td><td style="width:50%"><input type="text" id="nome" name="nome" minlength="2" maxlength="10"required></td>
              </tr>
              <tr>
                <td><p>Nuovo cognome: </p></td><td style="width:50%"><input type="text" id="cognome" name="cognome" minlength="2" maxlength="20"required></td>
              </tr>
              <tr>
                <td><p>Nuova password: </p></td><td style="width:50%"><input type="password" id="password" name="password" minlegth="1" maxlength="15"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
            <div>
              <input type="submit" name ="btn" value="Salva">
          </div>
          <?php
          if ($_SERVER["REQUEST_METHOD"] == "POST") {
              if (isset($_POST["btn"]))
              {
              if(!$ris){
                echo "<p>Errore nella modifica!</p>";
              }else{
                echo "<p>Modifica riuscita!</p>";
              }
            }
          }
          ?>
          </form>
        </div>
  </body>
</html>
