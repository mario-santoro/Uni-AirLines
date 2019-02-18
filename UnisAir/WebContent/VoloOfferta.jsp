<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.LowCost"%>
<%@page import="model.Utente"%>
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
<link rel="stylesheet" href="css/VoloOfferta.css" type="text/css">
<script type="text/javascript">
	  
	  $(document).ready(function(){ 
			

			
			var denied="${denied}"
			if(denied=="true"){
				
				      document.getElementById("overlay3").style.display = "block";
				    

				
			}
	});
	function offErr() {
		document.getElementById("overlay3").style.display = "none";
		}
	$(document).ready(function(){ 

		var denied="${denied2}"
		if(denied=="true"){
			
			      document.getElementById("overlay4").style.display = "block";
			    

			
		}
		});
		function offE() {
		document.getElementById("overlay4").style.display = "none";
		}
	</script>
</head>
<body>
<%session.setAttribute("denied", false);
session.setAttribute("denied2",false);
%>
	<%Utente u=(Utente)session.getAttribute("userBean");
String path=request.getServletPath();	
session.setAttribute("path", path); %>
	<%LowCost l=(LowCost)session.getAttribute("lowCost"); %>
	<!-- NAVBAR -->
	<nav>
		<a href="index.jsp"> <img src="img/logo.png" width="200"
			height="100" alt="">
		</a>
		<%if(u!=null){ %>
		<a> <span class="l"><span class="glyphicon glyphicon-user"></span>
				<%=u.getNome() %></span>
		</a>
		<div id="menu">
			<div id="contenutimenu">
				<a href="#" class="link">Storico</a> <br> <a href="#"
					class="link">Modifica dati</a> <br> <a href="Logout"
					class="link">Logout</a>
			</div>
		</div>
		<%}else{ %>
		<a> <span class="l">Accedi</span>
		</a>
		<div id="menu">
			<form action="Login" method="post">
				Email:<br> <input class="campo-login" type="text" name="email"
					placeholder="E-mail"><br> Password:<br> <input
					class="campo-login" type="password" name="psw"
					placeholder="Password"><br> <input class="btnR"
					type="submit" value="Accedi">
			</form>
			<p>Non sei ancora registrato?</p>
			<a href="Registrazione.jsp" class="link">Registrati!</a>
		</div>
		<%} %>



	</nav>
<div id="overlay4">
		<div id="accesso">
		<span onclick="offE()" id="x" class="glyphicon glyphicon-remove"></span>
			<h2>Devi effettuare l'accesso</h2>
			
			 
				<br> 
			</div>
			</div>
	<div id="overlay3">
		<div id="accessoerrato">
			<span onclick="offErr()" id="x" class="glyphicon glyphicon-remove"></span>
			<h2>Credenziali Errate</h2>

			<span class="special">Email o Password errate, riprova. </span> <br>
		</div>


	</div>
	<div class="infooff">
		<h2>
			Volo offerta da <span id="partenza"> <%=l.getAeroportoPartenza() %></span>
			a <span id="arrivo"> <%=l.getAeroportoDestinazione() %>
			</span> <br> nel giorno <span id="data_partenza"> <%=l.getData()%>
			</span> per <span id="passeggeri"> <%=l.getQuant() %>
			</span> persone
		</h2>
	</div>
	<div id="overlay">
		<div id="popupcontrollo">
			<span id="x" onclick="off()" class="glyphicon glyphicon-remove"></span>
			<h2>Per procedere devi inserire</h2>
			<br>
			<form action="Login" method="post">
				<span class="campitestopopup">email: <input class="campoEm"
					type="text"></span> <br> <span class="campitestopopup">password:
					<input class="campoPass" type="text">
				</span> <br>
				<button class="btnlog" type="submit"" >login</button>
			</form>
		</div>
	</div>
	<div id="trigger"></div>


	<div id="dettagliOfferta"
		style=" background:  linear-gradient(to bottom right,rgba(0,0,0,0),rgba(220,220,255,0.7)) , url(img/lowcost/<%=l.getImg() %>) ; background-repeat: no-repeat;  background-size: cover;">
		<div class="bordisup">
			<img src="img/logoBianco.png" width="200" height="100">
		</div>


		<div class="dettagliVoloOffertaAndata">
			<h2 class="h2offerta">
				Volo numero: <span class="numVolo"> <%=l.getCodVolo() %></span> <br>
				<br> <br> Ora di partenza: <span class="orpar"> <%=l.getOraPartenza().substring(0,5) %></span>
				<br> <br> Ora di arrivo: <span class="orarr"> <%=l.getOraArrivo().substring(0,5) %>
					<% if(l.isNextDay()){   %><span class="special" id="nextDay">*</span>
					<% }  %></span>
				<% if(l.isNextDay()){   %><br> <span class="special" id="nextDay">*L'ora
					di arrivo è da intendersi per il giorno dopo</span> <br>
				<% }  %>
			</h2>
		</div>

		<%	double minorPrezzo= l.getPrezzoEconomy()*l.getQuant();
	
	double sconto= (minorPrezzo*l.getPercentuale())/100;
	minorPrezzo= minorPrezzo- sconto;
		double val = minorPrezzo*100;
			val = (double)((int) val);
			minorPrezzo = val /100;
		%>


		<div class="PrezziVoloOfferta">
			<h2 class="h2offerta">
				Prezzo precedente a partire da: <span class="numVolo"><%=l.getPrezzoEconomy()*l.getQuant() %></span>
				<br> <br> Prezzo offerta a partire da: <span class="orpar"><%=minorPrezzo %></span>
				<br> <br> Sconto del: <span class="orarr"><%=l.getPercentuale()%>%</span>
			</h2>
		</div>



<input class="btnPrenota" type="submit" onclick="scelta(<%=l.getCodVolo() %>)"
				value="Prenota Ora!">

		<div class="bordiinf">

			
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
				<a href="assistenza.jsp" class="linkFooter"><p>Domande
						frequenti</p></a> <a href="assistenza.jsp" class="linkFooter"><p>Check-in
						online</p></a> <a href="assistenza.jsp" class="linkFooter"><p>Metodi
						di pagamento</p></a> <a href="assistenza.jsp" class="linkFooter"><p>Bagagli</p></a>
				<a href="assistenza.jsp" class="linkFooter"><p>Ritardi e
						cancellazione</p></a>
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
<script type="text/javascript">
function scelta(codV){

	window.location = "http://localhost:8080/UnisAir/ScelgoVoloOfferta?cod="+codV;
		
}
</script>
	<script type="text/JavaScript" src="js/jsTemplate.js"></script>
</body>
</html>