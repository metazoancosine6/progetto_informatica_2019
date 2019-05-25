<!DOCTYPE html>
<html>
	<head>
		<title> Sito officina</title>
		<link rel="stylesheet" href="../css/style.css"  >
	</head >
	<body>
        <h1 class="center bgblack header_page">Simauto</h1>
        
        <div class = 'navbar bgblack maxwidth' id='menu'>
            <?php
                include("utils.php");
                session_start();
                createNavBar();
            ?>
        </div>

        <div class="max-widht bgwhite box">
            <h2 class="center">Descrizione</h2>    
            <p style="line-height: 30px; width: 100%;">
                    Andrea e Filippo vi danno il benvenuto nel nuovo sito web dell'officina Simauto. 
                    Dopo oltre vent'anni di esperienze fatte in prestigiose officine e concessionarie dell'hinterland fiorentino, 
                    abbiamo deciso di cogliere al volo una di quelle occasioni che solo una crisi come questa può offrire. 
                    L'occasione di metterci in proprio e coronare così il sogno di aprire la "nostra officina".
                    Simauto si occupa principalmente di manutenzione e riparazione meccanica ed elettronica multimarca di auto, suv, 
                    fuoristrada e veicoli commerciali a benzina, diesel, gpl e metano, di manutenzione di auto di tutte le case anche 
                    in garanzia secondo regolamento (UE) n. 461/2010 (ex decreto Monti) e di riparazione, sostituzione ed equilibratura 
                    gomme nonchè assistenza completa e consulenza all'acquisto per quanto riguarda ruote e pneumatici. Offre numerosi 
                    altri servizi quali revisioni statali, tagliandi, montaggio assetti e accessori, ricarica climatizzatori, servio 
                    carrozzeria e soccorso stradale....
            </p>
        </div>

        <div class="max-widht box bggrey">
            <h2 class="center">Dove siamo..</h2>  
            <div style="height: 400px; padding:5%; width: 40%; margin: 0px auto; " id="googleMap"></div>
        </div>

        <script>
            function myMap() {
                var mapProp= {
                    center:new google.maps.LatLng(51.508742,-0.120850),
                    zoom:5,
                };
                var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
            }
        </script>
        
        <script src="https://maps.googleapis.com/maps/api/js?key=myKEYmyKEY-UM4pK97SGJ3AzCuYAZGFj7Qzsg&callback=myMap"></script>

        <div class="max-widht box" style="background-color: black; overflow: hidden;">
            <div style="height: 50%; width: 49.5%; float:left; border-right: 1px solid white;">
                <h3>Contatti</h3>
                <p style="text-align: justify; font-size: 80%; color: white; margin-left: 10%;">
                    Telefono: 335 43217890<br>
                    E-Mail: officina@progettoscuola.it<br>
                    Via: Via progetto scuola 45<br>
                    p.iva - 04291940288 
                </p>
            </div>
            <div style="height: 50%; width: 49.5%; float:left;">
                <h3>Social</h3>
                <div style="width: 70%; margin: 0px auto;">
                    <img src="../image/facebook.png" style="height: 12%; width: 12%; margin-left:15%;">
                    <img src="../image/insta.png"style="height: 12%; width: 12%; margin-left:10%;">
                    <img src="../image/whtp.png"style="height: 12%; width: 12%; margin-left:10%;">
                    <img src="../image/twitter.png"style="height: 12%; width: 12%; margin-left:10%;">
                </div>
            </div>
        </div>
        
	</body>
</html>