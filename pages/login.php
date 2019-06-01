<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="../css/style.css"  >    
    </head>
    <body>
        <h1 class="center bgblack header_page">Login</h1>
        
        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include("utils.php");
                session_start();
                createNavBar();

                checkNotLoggedPermissions();
            ?>
        </div>

        <form action="" method="POST">
            <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
                <table>
                    <tr>
                        <h1 style="color:black; text-align:center;">Accedi</h1>
                        <td>Username:</td><td><input type="text" name="username" size="20" required><br></td>
                    </tr>

                    <tr>
                        <td>Password:</td><td><input type="password" name="password" size="20" required><br></td>
                    </tr>
                </table>
                
                <input type="submit" value="login" name="login">

                <input type="radio" name="privilegi" value="1" checked="checked">Utente
                <input type="radio" name="privilegi" value="2">Meccanico
                <input type="radio" name="privilegi" value="3">Amministratore

            </div>
        </form>

<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $myconn = connect();
    
    if ($myconn->connect_error) {
        die("errore connesione");
    }
    
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $privilegio = $_POST['privilegi'];
    
    //implementare nel database 
    switch ($privilegio) {
        case 1:
            $query = "SELECT * FROM registrazione WHERE username='$username' AND password='$password' AND stato_reg=1";    
            break;
        
        case 2:
            $query = "SELECT * FROM meccanico WHERE matricola='$username' AND pass_meccanico='$password' AND stato=1";
            break;
        
        case 3:
            $query = "SELECT * FROM amministratore WHERE username='$username' AND password='$password' AND stato=1";    
            break;


    }

    echo $query;
    
    $rSet = execute($myconn, $query);
    
    if (isset($_POST["login"])) {
        if ($rSet == null) {

            echo "login fallito!";
            
            header("Refresh:0; url=AccessoNegato.php");
            
        } else {

            $_SESSION["username"] = $username;
            $_SESSION['privilegi'] = $privilegio;
            
            echo "login riuscito!";
            echo "Benvenuto: " . $_SESSION["username"];

            header("Refresh:0; url=AccessoRiuscito.php");
        }
    }
}
?>
    </body>
</html>
