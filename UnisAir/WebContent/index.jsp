<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UnisAir - HomePage</title>
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
<link rel="stylesheet" href="css/homePage.css" type="text/css">
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
<div id="spazio"></div>
 



<!-- Carusel per le immagini -->
<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators" >
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner" >
    <div class="carousel-item active">
      <img src="img/Londra.jpg" alt="">
    </div>
    <div class="carousel-item">
      <img src="img/Venezia.jpg"  alt="">
    </div>
    <div class="carousel-item">
      <img src="img/Parigi.jpg" alt="">
    </div>
     <div class="carousel-item">
      <img src="img/Mosca.jpg" alt="">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>

<!-- form di ricerca -->
<div id="ricerca">
		
			<form action="#" >
			<input type="radio" id="rad1" name="a/r" value="a/r" checked="checked"> <span class="rad">Andata e ritorno</span> 
			 <input type="radio" id="rad2" name="a/r" value="a"> <span class="rad">Solo andata</span><br>
			 <div class="separetor">
				 Aereoporto di partenza<br>
				<input class="campo" type="text" placeholder="aereoporto di partenza" required>
			</div>
			<div class="separetor">
				Aereoporto di destinazione<br>
				<input class="campo" type="text" placeholder="aereoporto di destinazione" required>
			</div>
			<br>
			<div class="separetor">
				Data partenza<br>
				<input class="campo" onchange="dat()" id="datPartenza"  type="date" required>
			</div>
			<div class="separetor">
				Data ritorno<br>
				<input class="campo" name="datRitorno"  onchange="dat()" id="datRitorno" type="date">
			</div>
				<div id="selettore-posti">
					<button type="button" class="btnR" id="add-posti">
					  Aggiungi Posti
					</button>

					<div class="menu-posti">
					   Adulti:<br>
				 <button type="button" class="btnSel" id="btnSxAdulti" onClick="decrementAdult()">-</button>
				 <input name="numAdulti" class="campoSel" type="number" min="1" max="20" value="1" id="adultNumber">
				 <button type="button" class="btnSel" id="btnDxAdulti" onClick="incrementAdult()">+</button>
				 <br>
				  Bambini:<br>
				 <button type="button"  class="btnSel" id="btnSxBambini" onClick="decrementChild()">-</button>
				 <input name="numBambini" class="campoSel" type="number" min="0" max="20" value="0" id="childNumber">
				 <button type="button" class="btnSel" id="btnDxBambini" onClick="incrementChild()">+</button>
					</div>
				</div>
				<br>

			<input type="submit" class="btnR" value="Ricerca">
			</form>
	
</div>
<!-- Offerte -->
<div id="sconto">Sconti e offerte last minute </div>
<div id="ContenitoreAnnunci">

	<div class="annuncio">
	<a href=""><img alt="" src="img/praga.jpg" width="350" height="200"></a>
		<div class="nomeCitta">     
			Praga 
		</div>
		<div class="prezzo">
		da 50 &euro;
		</div>
	</div>
<div class="annuncio">
	<a href=""><img alt="" src="img/amsterdam_14.jpeg" width="350" height="200"></a>
		<div class="nomeCitta">     
			Amsterdam 
		</div>
		<div class="prezzo">
		da 70 &euro;
		</div>
	</div>
	<div class="annuncio">
	<a href=""><img alt="" src="img/el-cairo-m.jpg" width="350" height="200"></a>
		<div class="nomeCitta">     
			El Cairo 
		</div>
		<div class="prezzo">
		da 100 &euro;
		</div>
	</div>
<div class="annuncio">
	<a href=""><img alt="" src="img/budapest.jpg" width="350" height="200"></a>
		<div class="nomeCitta">     
			Budapest 
		</div>
		<div class="prezzo">
		da 50 &euro;
		</div>
	</div>
	<div class="annuncio">
	<a href=""><img alt="" src="img/Parigi.jpg" width="350" height="200"></a>
		<div class="nomeCitta">     
			Parigi
		</div>
		<div class="prezzo">
		da 70 &euro;
		</div>
	</div>
	
	<div class="annuncio">	
	<a href=""><img alt="" src="img/Londra.jpg" width="350" height="200"></a>
		<div class="nomeCitta">     
			Londra
		</div>
		<div class="prezzo">
		da 80 &euro;
		</div>
			
	</div>

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
	
	 <script type="text/JavaScript" src="js/jsHome.js"></script>
	
</body>
</html>