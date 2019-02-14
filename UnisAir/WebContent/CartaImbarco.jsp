<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UnisAir</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link rel="icon" href="img/ms-icon-310x310.png" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">

<link rel="stylesheet" href="css/template.css" type="text/css">
<link rel="stylesheet" href="css/CartaImbarco.css" type="text/css">
</head>
<body>
	<!-- NAVBAR -->
	<nav>
		<a> <img src="img/logo.png" width="200" height="100" alt="">
		</a> <a> <span class="l">Accedi</span>
		</a>
		<div id="menu">
			Email:<br> <input class="campo-login" type="text"
				placeholder="E-mail"><br> Password:<br> <input
				class="campo-login" type="text" placeholder="Password"><br>
			<input class="btnR" type="submit" value="Accedi">
			<p>Non sei ancora registrato?</p>
			<a href="#" class="link">Registrati!</a>
		</div>


	</nav>

	<div class="infoVolo">
		<h2>
			Stampa carta di imbarco per il volo <span id="numvolo"> 000000 </span> da <span id="partenza"> aeroporto </span> a <span
				id="arrivo"> aeroporto </span> <br> nel giorno <span
				id="data_partenza"> 00/00/00 </span> 
		</h2>
	</div>
	

				
	<div id="dettagliVolo" style=" background:  linear-gradient(to bottom right,rgba(250,120,0,0.7),rgba(250,150,0,0.7)) , url(img/logo.png) ; background-repeat: no-repeat;  background-size: contain;">
		
		<div class="bordisup">
		<img src="img/logoBianco.png" width="200" height="100">
		</div>

		<div class="dettagliVoloAeroporto">
			<h2 class="biglietto">
				Volo numero: <span id="numVolo"> 555566698</span> <br> <br>
				Gate <span id="gate"> C66</span> <br>
				<br> Ora di partenza: <span id="orpar"> 00:00</span> <br>
				<br> Ora di arrivo: <span id="orarr"> 03:35</span>
			</h2>
		</div>

	<div class="dettagliVoloPosto">
			<h2 class="biglietto">
				Nome: <span id="nomePass"> Tiziano</span> <br> <br> 
				Cognome: <span id="cognomePass"> Ferro</span> <br> 
				<br> Posto <span id="Posto"> A6</span> <br>
				<br> Classe <span id="ClasseViaggio"> Premium</span>
		</h2>
		</div>
			

	<div class="bordiinf">
		<input class="btnStampa" type="submit" value="Stampa">
	</div>	
	</div>




	<footer>
		<div id="imgContent">
			<img src="img/logoBianco.png" width="200" height="100" alt="">
			<div id="socialBar">
				<span id="labelSocial">Seguici su:</span> <span><a href="#"
					class="linkFooter"><img src="img/facebook.svg" width="32"
						height="32"></a></span> <span><a href="#" class="linkFooter"><img
						src="img/instagram.svg" width="32" height="32"></a></span> <span><a
					href="#" class="linkFooter"><img src="img/twitter.svg"
						width="32" height="32"></a></span> <span><a href="#"
					class="linkFooter"><img src="img/linkedin.svg" width="32"
						height="32"></a></span>
			</div>
		</div>
		<div id="contentWrapper">
			<div id="assistenza" class="footerComponent">
				<h5 class="text-uppercase">ASSISTENZA</h5>
				<a href="#" class="linkFooter"><p>Domande frequenti</p></a> <a
					href="#" class="linkFooter"><p>Check-in online</p></a> <a href="#"
					class="linkFooter"><p>Metodi di pagamento</p></a> <a href="#"
					class="linkFooter"><p>Bagagli</p></a> <a href="#"
					class="linkFooter"><p>Ritardi e cancellazione</p></a>
			</div>
			<div id="contatti" class="footerComponent">
				<h5 class="text-uppercase">CONTATTI</h5>
				<a href="#" class="linkFooter"><p>Tel: 555-00000</p></a> <a href="#"
					class="linkFooter"><p>e-mail:info@unisair.com</p></a>

			</div>
			<div id="Partner" class="footerComponent">
				<h5 class="text-uppercase">BUSINESS PARTNERS</h5>
				<a href="#" class="linkFooter"><p>Affiliate marketing</p></a> <a
					href="#" class="linkFooter"><p>e-Procurement</p></a>

			</div>
		</div>
		<div id="infoFooter">
			<span class="titleInfo">UnisAir</span> <span class="info"><a
				href="#">Utilizzo dei cookie</a></span> <span class="info"><a
				href="#">Infotmazioni legali</a></span> <span class="info"><a
				href="#">Informativa sulla privacy</a></span>
		</div>
	</footer>

	
<script type="text/JavaScript" src="js/jsTemplate.js"></script>
</body>
</html>