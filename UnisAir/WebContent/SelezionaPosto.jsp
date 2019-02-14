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
<link rel="stylesheet" href="css/selezionaPosto.css" type="text/css">


<script>
function Avvertimento() {
  alert("tornando indietro cancelli tutto");
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


	

	<div id="contenitore">
	
	<div id="legenda">
		<h2>Legenda sovrapprezzi classi di viaggio</h2>
		<br>
		<h3>Premium: <span class="special">+50&euro;</span></h3>
		<br>
		<h3>Business: <span class="special">+20&euro;</span></h3>
		<br>
		<h3>Economy: <span class="special">+0&euro;</span></h3>
		<br>
		<h3>Posto Libero: </h3><button class="btnPrenotalegendalib" type="button" >Z1</button>
		<br>
		<h3>Posto Occupato: </h3><button class="btnPrenotalegendaocc" type="button" >Z1</button>
	</div>
	<br>
	
	
	<div class="infooff">
		<h2>
			Seleziona posto per il volo <span id="volo">Volo</span>
		</h2>
	</div>
		<div id="aereo">
		
		
			<br> <span class="tipologiaPosto">PREMIUM</span>
			<hr color="white">
			<%!public static char printChar(int numP){
			int mod=numP%21;
			mod+=65;
			
			char lettera=(char)mod;
			
			return lettera;
		} %>
			<%int i=0, p=0;
		for( i=0;i<3;i++){ 
		for(p=0;p<6;p++){
		%>

			<button class="btnPrenota" type="button" onclick=""><%=printChar(i)  %><%=p+1 %></button>
			<%if(p==2) {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>



			<br> <span class="tipologiaPosto">BUSINESS</span>
			<hr color="white">
			<%for(;i<8;i++){for(p=0;p<6;p++){
			%>

			<button class="btnPrenota" type="button" onclick=""><%=printChar(i)  %><%=p+1 %></button>
			<%if(p==2) {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>

			<br> <span class="tipologiaPosto">ECONOMY</span>
			<hr color="white">
			<%for(;i<18;i++){for(p=0;p<6;p++){
			%>

			<button class="btnPrenota" type="button" onclick=""><%=printChar(i)  %><%=p+1 %></button>
			<%if(p==2) {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>
		</div>
		<br>
		<div id="prezzoAttuale">
		
		<h3>
		Prezzo base: <span id="prezzobase" class="special"> tanti&euro;</span>
		<br>
		<br>
		Sovrapprezzo posti: <span id="sovrapprezzo" class="special"> piu' tanti&euro;</span>
		<br>
		<br>
		Totale: <span id="totale" class="special"> un botto&euro;</span>
		</h3>
		<br>
		<button class="btnR"  onCLick="Avvertimento()" >Indietro</button>
		<button class="btnR"  >Continua</button>
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