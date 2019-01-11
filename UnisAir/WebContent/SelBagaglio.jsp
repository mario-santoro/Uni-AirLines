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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link rel="icon" href="img/ms-icon-310x310.png" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">

<script src="js/jquery.js"></script>
<script type="text/JavaScript" src="js/jsVoloOfferta.js"></script>

<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">

<link rel="stylesheet" href="css/template.css" type="text/css">
<link rel="stylesheet" href="css/SelBagaglio.css" type="text/css">


<script type="text/javascript">

function incrementbag15(){
	var val = document.getElementById("bagNumber15").value;
	if(val<20)
		val++;
	document.getElementById("bagNumber15").value = val;
}

function decrementbag15(){
	var val = document.getElementById("bagNumber15").value;
	if(val>0)
		val--;
	else
		val = 0;
	document.getElementById("bagNumber15").value = val;
}
	
	
	
function incrementbag20(){
	var val = document.getElementById("bagNumber20").value;
	if(val<20)
		val++;
	document.getElementById("bagNumber20").value = val;
}

function decrementbag20(){
	var val = document.getElementById("bagNumber20").value;
	if(val>0)
		val--;
	else
		val = 0;
	document.getElementById("bagNumber20").value = val;
}
		
	
	
function incrementbag25(){
	var val = document.getElementById("bagNumber25").value;
	if(val<20)
		val++;
	document.getElementById("bagNumber25").value = val;
}

function decrementbag25(){
	var val = document.getElementById("bagNumber25").value;
	if(val>0)
		val--;
	else
		val = 0;
	document.getElementById("bagNumber25").value = val;
}
	

</script>

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


	<div id="contenuto">
	<h2>
		seleziona bagaglio per volo num: <span id="infoVolo"> 0000000 </span>
		in data: <span id="dataVolo"> 00/00/00</span> del passeggero <span id="passeggero"> tizio</span>
	</h2>
		<br>

		<div class="bagaglio">
		<h2>
			Bagaglio minore di 15kg
			<br>
			<img src="img/bagagli/valiigia15kg.jpg">
			<br>Quantita'?<br>
			<button type="button" class="btnSel"  onClick="decrementbag15()">-</button>
				 <input  class="campoSel" type="number" min="0" max="20" value="0" id="bagNumber15">
				 <button type="button" class="btnSel"  onClick="incrementbag15()">+</button>
			</h2>
		</div>

		<div class="bagaglio">
		<h2>
			Bagaglio tra 15kg e 25kg
			<br>
			<img src="img/bagagli/15e25.jpg">
			<br>Quantita'?<br>
			<button type="button" class="btnSel"  onClick="decrementbag20()">-</button>
				 <input  class="campoSel" type="number" min="0" max="20" value="0" id="bagNumber20">
				 <button type="button" class="btnSel"  onClick="incrementbag20()">+</button>
			</h2>
		</div>

		<div class="bagaglio">
		<h2>
			Bagaglio maggiore di 25kg
			<br>
			<img src="img/bagagli/valigia25kg.jpg">
			<br> Quantita'?<br>
			<button type="button" class="btnSel"  onClick="decrementbag25()">-</button>
				 <input  class="campoSel" type="number" min="0" max="20" value="0" id="bagNumber25">
				 <button type="button" class="btnSel"  onClick="incrementbag25()">+</button>
			</h2>
		</div>

<br>
<button type="button" class="btnSel" id="indietro"  >Indietro</button>
<button type="button" class="btnSel" id="continua"  >Continua</button>

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



</body>
</html>