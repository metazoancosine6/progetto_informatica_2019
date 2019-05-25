<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="../css/style.css"  >    
    </head>
    <body>
        <h1 class="center bgblack header_page"> <!-- INSERIRE NOME PAGINA QUI --></h1>
        
        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include("utils.php");
                session_start();
                createNavBar();
		
		// richiamare funzione di controllo dei permessi
		// checkUserPermissions(); || checkMeccPermissions(); || checkAdminPermissions();
            ?>
        </div>
        
        <!--
        	corpo della pagina, tipicamente questo e' il riquadrone bianco classico al centro 
        	ma in caso di particolari esigenze si puo' tranquillamente eliminare
        -->
        <div class="bgwhite" style="height: 400px; padding:5%; width: 40%; margin: 0px auto ">
        	    

        </div>
	</body>
</html>
