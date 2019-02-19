<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.Utente"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UnisAir - Report</title>
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
<link rel="stylesheet" href="css/report.css" type="text/css">
</head>
<body>
<%
Utente u=(Utente)session.getAttribute("userBean");
Boolean controllo = (Boolean)session.getAttribute("controllo");
%>
<!-- NAVBAR -->
<nav>
  <a href="index.jsp">
    <img src="img/logo.png" width="200" height="100" alt="">
  </a>
  <%if(u!=null){ %>
   <a>
       <span class="l"><span class="glyphicon glyphicon-user"></span>
							<%=u.getNome() %></span> 
      </a>
     <div id="menu">
          <div id="contenutimenu">
        <a href="VisualizzaPrenotazioni" class="link">Storico</a>
        <br>

        <a href="ModificaUtente.jsp" class="link">Modifica dati</a>
        <br>

        <a href="Logout" class="link">Logout</a>
     </div>
     </div>
  <%}else{ %>
      <a>
       <span class="l">Accedi</span> 
      </a>
      <div id="menu">
      <form action="Login" method="post">
        Email:<br>
        <input class="campo-login"  type="text" name="email" placeholder="E-mail"><br>
        Password:<br>
        <input class="campo-login" type="password" name="psw" placeholder="Password"><br>
        <input class="btnR" type="submit" value="Accedi">
        </form>
       	<p>Non sei ancora registrato?</p>
       	<a href="Registrazione.jsp" class="link">Registrati!</a>
       	   </div>
       	<%} %> 
</nav>
<div class="spazio"></div>
<main>
<%if(controllo == true) {%>
<h1>Prenotazione effettuata con successo</h1>
<span id="messaggio">L'acquisto da lei effettuato è andato a buon fine. <br>Per tornare alla Home-Page <a href="index.jsp">clicca qui</a>.</span>
<%} else{%>
<h1>Ops...Qualcose è andato storto</h1>
<span id="messaggio">L'acquisto da lei effettuato NON è andato a buon fine. <br> Provare a ripetere l'ordine e se il problema si ripresenta contattare assistenza.</span>
<%} %>
</main>
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
							<a href="assistenza.jsp" class="linkFooter"><p>Domande frequenti</p></a>
							<a href="assistenza.jsp" class="linkFooter"><p>Check-in online</p></a>
							<a href="assistenza.jsp" class="linkFooter"><p>Metodi di pagamento</p></a>
							<a href="assistenza.jsp" class="linkFooter"><p>Bagagli</p></a>
							<a href="assistenza.jsp" class="linkFooter"><p>Ritardi e cancellazione</p></a>
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