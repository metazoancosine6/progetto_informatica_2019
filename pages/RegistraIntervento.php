<!DOCTYPE html>
<!--
  Pagina che inserisce un nuovo intervento nell'anagrafica intervento
-->
<html>
<head>
  <title>Nuovo Intervento</title>
  <link rel="stylesheet" href="../css/style.css"  >    
</head>
<body>
  <h1 class="center bgblack header_page">Registra Meccanico nel DB</h1>

  <div class = 'navbar bgblack maxwidth' id='menu'>
    <?php
    include("utils.php");
    session_start();
    checkAdminPermissions();
    createNavBar();
    ?>
  </div>

  <?php
  $myconn = connect();
  ?>

  <div class=" bgwhite center">

    <form action="" method="POST">
      <table>
        <tr>
          <td>
            <p>Inserire nome intervento</p>
          </td>
          <td>
            <input type="text" name="nome">
          </td>
        </tr>
        <tr>
          <td>
            <p>Inserire costo dell' intervento</p>
          </td>
          <td>
            <input type="text" name="costo">
          </td>
        </tr>
        <tr>
          <td>
            <p>Inserire tempo di lavorazione</p>
          </td>
          <td>
            <input type="number" step="0.10" max="999.990" min="0.01" name="tempo" value="0.00">
          </td>
        </tr>
      </table>
      <input type="submit" name="btn" value="Inserisci">
    </form>
  </div>

  <?php
  if(isset($_POST["btn"])){
    $nome=$_POST["nome"];
    $costo=$_POST["costo"];
    $tempo=$_POST["tempo"];

    if($myconn->connect_error){
     die("errore connessione db");
   }

   $query="INSERT INTO anagrafica_intervento (nome_intervento, costo_intervento, tempo_lavorazione) "
   . "VALUES('".$nome."','".$costo."','".$tempo."')";
   $ris=$myconn->query($query);
   if(!$ris){
    echo "query error";
  }else{
    echo "<center><h3>inserimento eseguito con successo</h3></center>";
  }
}
?>
</body>
</html>
