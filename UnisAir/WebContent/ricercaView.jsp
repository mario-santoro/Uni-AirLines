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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link rel="icon" href="img/ms-icon-310x310.png" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" href="css/template.css" type="text/css">
<link rel="stylesheet" href="css/ricerca.css" type="text/css">
</head>
<body>
<!-- NAVBAR -->
<nav>
  <a>
    <img src="img/logo.png" width="200" height="100" alt="">
  </a>
      <a>
       <span class="l">Accedi</span> 
      </a>
      <div id="menu">
        Email:<br>
        <input class="campo-login"  type="text" placeholder="E-mail"><br>
        Password:<br>
        <input class="campo-login" type="text" placeholder="Password"><br>
        <input class="btnR" type="submit" value="Accedi">
       	<p>Non sei ancora registrato?</p>
       	<a href="#" class="link">Registrati!</a>
      </div>
    
  
</nav>
	  <div class="spazio"></div>
<div id="corpo">
<aside>
	<div id="partenzaBox" class="boxAside">
		<h2>FILTRA VOLI</h2>
		<div class="sliderBox">
		<h3 class="labelAside">Ora:</h3>
		<span class="multi-range">
			<input type="range" min="0" max="50" value="5">
			<input type="range" min="0" max="50" value="45">
		</span>
		</div>
		<div class="sliderBox">
		<h3 class="labelAside">Prezzo:</h3>
		<span class="multi-range">
			<input type="range" min="0" max="50" value="5">
			<input type="range" min="0" max="50" value="45">
		</span>
		</div>
		<div class="sliderBox">
		<h3 class="labelAside">Durata del volo:</h3>
		<span class="multi-range">
			<input type="range" min="0" max="50" value="5">
			<input type="range" min="0" max="50" value="45">
		</span>
		</div>
  
	</div>
</aside>
<main>
					
					<div class="infoRicerca"> 
						Voli  da: Napoli	a: Parigi<br>
						in data: 25/12/2019<br>
						per 2 passeggeri
					</div>
					<div class="filtri">
							Ordina per: <select>
								<option>Ora</option>
								<option>Prezzo Crescente</option>
								<option>Prezzo Decrescente</option>
							</select>
						</div>
					<div class="ContenitoreVoli">
						<div class="volo">
								Volo num:	01	<div class="prezzo"> 70 &euro;</div><br>
								<span class="orarioVoli">10:30 <span class="gl">&#9866; &#9866; &#9992; </span>12:30</span>
								<br>
								Durata volo: 2 ore<br>
								<button> Prenota ora</button>
						</div>
						<div class="volo">
								Volo num:	01	<div class="prezzo"> 70 &euro;</div><br>
								<span class="orarioVoli">10:30 <span class="gl">&#9866; &#9866; &#9992; </span>12:30</span>
								<br>
								Durata volo: 2 ore<br>
								<button> Prenota ora</button>
						</div>
						<div class="volo">
								Volo num:	01	<div class="prezzo"> 70 &euro;</div><br>
								<span class="orarioVoli">10:30 <span class="gl">&#9866; &#9866; &#9992; </span>12:30</span>
								<br>
								Durata volo: 2 ore<br>
								<button> Prenota ora</button>
						</div>
						<div class="volo">
								Volo num:	01	<div class="prezzo"> 70 &euro;</div><br>
								<span class="orarioVoli">10:30 <span class="gl">&#9866; &#9866; &#9992; </span>12:30</span>
								<br>
								Durata volo: 2 ore<br>
								<button> Prenota ora</button>
						</div>
						<div class="volo">
								Volo num:	01	<div class="prezzo"> 70 &euro;</div><br>
								<span class="orarioVoli">10:30 <span class="gl">&#9866; &#9866; &#9992; </span>12:30</span>
								<br>
								Durata volo: 2 ore<br>
								<button> Prenota ora</button>
						</div>
						<div class="volo">
								Volo num:	01	<div class="prezzo"> 70 &euro;</div><br>
								<span class="orarioVoli">10:30 <span class="gl">&#9866; &#9866; &#9992; </span>12:30</span>
								<br>
								Durata volo: 2 ore<br>
								<button> Prenota ora</button>
						</div>
					</div>
</main>


</div>
<footer> 
		<div id="imgContent">
			<img src="img/logoBianco.png" width="200" height="100" alt="">
			<div id="socialBar">
				<span id="labelSocial">Seguici su:</span>
				<span><a href="#" class="linkFooter"><img src="img/facebook.svg" width="32" height="32"></a></span>
				<span><a href="#" class="linkFooter"><img src="img/instagram.svg" width="32" height="32"></a></span>
				<span><a href="#" class="linkFooter"><img src="img/twitter.svg" width="32" height="32"></a></span>
				<span><a href="#" class="linkFooter"><img src="img/linkedin.svg" width="32" height="32"></a></span>
			</div>
		</div>
		<div id="contentWrapper">	
				<div id="assistenza" class="footerComponent">
							<h5 class="text-uppercase">ASSISTENZA</h5>
							<a href="#" class="linkFooter"><p>Domande frequenti</p></a>
							<a href="#" class="linkFooter"><p>Check-in online</p></a>
							<a href="#" class="linkFooter"><p>Metodi di pagamento</p></a>
							<a href="#" class="linkFooter"><p>Bagagli</p></a>
							<a href="#" class="linkFooter"><p>Ritardi e cancellazione</p></a>
				</div>
				<div id="contatti" class="footerComponent">
							<h5 class="text-uppercase">CONTATTI</h5>
							<a href="#" class="linkFooter"><p>Tel: 555-00000</p></a>
							<a href="#" class="linkFooter"><p>e-mail:info@unisair.com</p></a>

				</div>
				<div id="Partner" class="footerComponent">
							<h5 class="text-uppercase">BUSINESS PARTNERS</h5>
							<a href="#" class="linkFooter"><p>Affiliate marketing</p></a>
							<a href="#" class="linkFooter"><p>e-Procurement</p></a>

				</div>
		</div>	
		<div id="infoFooter">
					<span class="titleInfo">UnisAir</span>
					<span class="info"><a href="#">Utilizzo dei cookie</a></span>
					<span class="info"><a href="#">Infotmazioni legali</a></span>
					<span class="info"><a href="#">Informativa sulla privacy</a></span>
				</div>
	</footer>
	
</body>
</html>