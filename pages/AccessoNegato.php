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
        <h1 class="center bgblack header_page">Login</h1>
        
        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include("utils.php");
                session_start();
                createNavBar();
            ?>
        </div>
        <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
            <h3 style="color: black">Accesso negato</h3>
            <?php header('Refresh:5; URL="login.php"') ?>
        </div>
</body>
</html>