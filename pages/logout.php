<?php
	// altrimenti non riconosce la sessione
	session_start();

	// unsetta il cookie
	session_unset();

	// distrugge la sessione
    session_destroy();
    header("Refresh:0; url=index.php");
?>