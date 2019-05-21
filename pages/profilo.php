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

        <?php session_start(); ?>
        <div class="navbar max-widht bgblack">
            <h1 style="border-bottom: 3px solid white;" class="center max-widht">Simauto</h1>
            <div class="navbar-left" id="menu">
                <a href="index.php">Home</a>
                
                <?php
                if((!isset($_SESSION["username"] )|| $_SESSION["privilegi"] == 1)){
               echo  "<a href='#'>Servizi</a>";
                echo "<a href='#'>Chi siamo</a>";
               echo "<a href='#'>Registrati</a>";
               echo" <a href='login.php'>Login</a>";
                }
                if (isset($_SESSION["username"])) {
                    echo "<a>";
                    if ($_SESSION["privilegi"] == 1) {
                        echo "Utente:";
                    } else if ($_SESSION["privilegi"] == 2) {
                        echo "Meccanico:";
                    } else if ($_SESSION["privilegi"] == 3) {
                        echo "Amministratore:";
                    } else {
                        
                    }


                    echo $_SESSION["username"] . "</a>";
                    if ($_SESSION["privilegi"] == 2) {
                        echo "<a href='meccanicoOperazioni.php'>Operazioni meccanico</a>";
                    }else if($_SESSION["privilegi"] == 3) {
                        echo "<a href='RegistraMeccanico.php'>Registra Meccanico</a>";
                        echo "<a href='LicenziaMeccanico.php'>Licenzia Meccanico</a>";
                        echo "<a href='RegistraProdottoDb.php'>Registra Prodotto DB</a>";
                    }
                } else {
                    echo " ";
                }
                ?>

            </div>
        </div>  

        <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
            <?php
            include ("utils.php");
            $myconn = connect();
            if ($myconn->connect_error) {
                die("errore connesione");
            }
            $username=$_SESSION['username'];
            if ($_SESSION["privilegi"] == 1) {
                        $query="SELECT username,nome,cognome FROM `cliente` join registrazione on fk_id_cliente=id_cliente WHERE username='$username'";
                    } else if ($_SESSION["privilegi"] == 2) {
                        $query="SELECT matricola,nome_m,cognome_m FROM `meccanico`where matricola='$username'";
                    } else if ($_SESSION["privilegi"] == 3) {
                        $query="SELECT username,nome,cognome FROM `amministratore`where username='$username'";
                    } else {
                        
                    }
                    
                     $rSet = execute($myconn, $query);
                    $rSet=$rSet->fetch_all();
                    echo "<h3 style='color: black'>Dati</h3>";
                    echo "Username:".$rSet[0][0]."<br>";
                    echo "Nome:".$rSet[0][1]."<br>";
                    echo "Cognome:".$rSet[0][2];
                    echo "";
                    
            ?>
            <form action=" " method="POST">
                <input type='submit' value='esci' name='esci'>
                <?php
                if(isset($_POST["esci"])){
                    session_unset();
                    session_destroy();
                     header("Refresh:0; url=index.php");
                }
                ?>
            </form>
        </div>
    </body>
</html>