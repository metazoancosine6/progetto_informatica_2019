<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="../css/style.css"  >    
    </head>
    <body>

        <h1 class="center bgblack header_page">Profilo</h1>
        
        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include("utils.php");
                session_start();

                createNavBar();
            ?>
        </div>

        <?php
            $myconn = connect();
        ?>

            <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
            <?php
            $myconn = connect();
            if ($myconn->connect_error) {
                die("errore connesione");
            }
            

            // se non sono un visitatore
            if($_SESSION['privilegi'] != 0) {
                $username=$_SESSION['username'];
                
                switch($_SESSION['privilegi']) {
                    case 1:
                        $query="SELECT username,nome,cognome FROM `cliente` join registrazione on fk_id_cliente=id_cliente WHERE username='$username'";
                        break;
                    case 2:
                        $query="SELECT matricola,nome_m,cognome_m FROM `meccanico`where matricola='$username'";
                        break;
                    case 3:
                        $query="SELECT username,nome,cognome FROM `amministratore`where username='$username'";
                        break;
                }

            
                $rSet = execute($myconn, $query);
                $rSet=$rSet->fetch_all();
                    
                echo "<h3 style='color: black'>Dati</h3>";
                echo "Username:".$rSet[0][0]."<br>";
                echo "Nome:".$rSet[0][1]."<br>";
                echo "Cognome:".$rSet[0][2];
                echo "";
            }
            else {  // sono un visitatore
                echo "<h3 style='color: black'>Dati</h3>";
                echo "Sei un visitatore, non hai un profilo!";
                echo "";
            }
                    
            ?>
            <form action=" " method="POST">
                <input type='submit' value='esci' name='esci'>
                <?php
                if(isset($_POST["esci"])){
                    logout();
                }
                ?>
            </form>
        </div>
    </body>
</html>