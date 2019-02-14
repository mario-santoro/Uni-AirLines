<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>

<%@page import="model.Prenotazione"%>
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
<link href="css/storico.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- NAVBAR -->

	<%ArrayList<Prenotazione> p=(ArrayList<Prenotazione>)session.getAttribute("prenotazioni");
Utente u=(Utente)session.getAttribute("userBean");%>
	<!-- NAVBAR -->
	<nav>
		<a href="index.jsp"> <img src="img/logo.png" width="200"
			height="100" alt="">
		</a> <a> <span class="l"><span class="glyphicon glyphicon-user"></span>
				<%=u.getNome() %></span>
		</a>
		<div id="menu">
			<div id="contenutimenu">
				<a href="VisualizzaPrenotazioni" class="link">Storico</a> <br>

				<a href="ModificaUtente.jsp" class="link">Modifica dati</a> <br>

				<a href="Logout" class="link">Logout</a>
			</div>
		</div>
	</nav>
	<div class="spazio"></div>


	<main> <%if(p.size()==0){ %> <br>
	<br>
	<h2>Non ci sono prenotazioni effettuate</h2>
	<br>
	<br>
	<br>
	<br>
	<%} %> <% for(int i=0;i<p.size();i++){%>
	<div class="storico">
		<span class="infoStorico"> Volo Prenotato in data <span
			class="special"><%=p.get(i).getData() %></span> da <span
			class="special"><%=p.get(i).getVolo().getAeroportoPartenza() %></span>
			a <span class="special"><%=p.get(i).getVolo().getAeroportoDestinazione() %></span>
			il giorno <span class="special"><%=p.get(i).getVolo().getData() %></span>
		</span>
		<div class="infoVolo">
			Numero volo: <span class="special"><%=p.get(i).getVolo().getCodVolo() %></span><br>
			Posti prenotati: <span class="special"><%=p.get(i).getNumBiglietti() %>(Posti:
				<%for(int j=0;j<p.get(i).getPasseggeri().size();j++){ %> <%=p.get(i).getPasseggeri().get(j).getPosto() %>-
				<%} %>)</span><br> Totale bagagli: <span class="special"><%=p.get(i).getNumBagagliTot() %></span><br>
			Prezzo: <span class="special"><%=p.get(i).getPrezzoTotale() %>&euro;</span><br>
		</div>
		<div class="buttonContent">
		
			<button type="button" class="BtnStorico">Procedi al check-in</button>
		</div>
	</div>
	<%} %> </main>

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

	<script type="text/JavaScript" src="js/jsHome.js"></script>

</body>
</html>