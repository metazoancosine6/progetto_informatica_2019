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
            ?>
        </div>

        <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
            <h3 style="color: black">Accesso effettuato</h3>
        </div>
    </body>
</html>