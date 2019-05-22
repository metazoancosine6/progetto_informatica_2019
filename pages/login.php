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
                    echo "<a href='profilo.php'>";
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
                        
                        echo "<a href='LicenziaMeccanico.php'>Licenzia Meccanico</a>";
                    }
                } else {
                    echo " ";
                }
                ?>

            </div>
        </div>  

        <form action="" method="POST">
            <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
                <table>
                    <tr>
                    <h1 style="color:black; text-align:center;">Accedi</h1>
                    <td>Username:</td><td><input type="text" name="username" size="20"><br></td>
                    </tr>
                    <tr>
                        <td>Password:</td><td><input type="password" name="password" size="20"><br></td>
                    </tr>
                </table>
                <input type="submit" value="login" name="login">
                <input type="radio" name="privilegi" value="1" checked="checked">Utente
                <input type="radio" name="privilegi" value="2">Meccanico
                <input type="radio" name="privilegi" value="3">Amministratore



<?php
include ("utils.php");


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $myconn = connect();
    if ($myconn->connect_error) {
        die("errore connesione");
    }
    $username = $_POST['username'];
    $password = $_POST['password'];
    $privilegio = $_POST['privilegi'];
    //implementare nel database 
    if ($privilegio == 1) {
        $query = "SELECT * FROM registrazione WHERE username='$username' AND password='$password'";
    } else if ($privilegio == 2) {
        $query = "SELECT * FROM meccanico WHERE matricola='$username' AND pass_meccanico='$password'";
    } else if ($privilegio == 3) {

        $query = "SELECT * FROM amministratore WHERE username='$username' AND password='$password'";
    } else {
        
    }
    $_SESSION["privilegi"] = $privilegio;
    $rSet = execute($myconn, $query);
    if (isset($_POST["login"])) {
        if ($rSet == null) {

            echo "login fallito!";
            session_unset();
            header("Refresh:0; url=AccessoNegato.php");
            //header("Refresh:0");
            //showQueryTable($rSet);
        } else {

            $_SESSION["username"] = $username;
            $_SESSION['privilegi'] = $privilegio;
            
            echo "login riuscito!";
            echo $_SESSION["username"];

            header("Refresh:0; url=AccessoRiuscito.php");
            //header("Refresh:0");
        }
    }
}
?>
            </div>
        </form>
    </body>
</html>
