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
                        if ( $_SESSION["privilegi"] == 1) {
                            echo "Utente:";
                        } else if ( $_SESSION["privilegi"] == 2) {
                            echo "Meccanico:";
                        } else if ( $_SESSION["privilegi"] == 3) {
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

        <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
            <h3 style="color: black">Accesso negato</h3>
        </div>
</body>
</html>