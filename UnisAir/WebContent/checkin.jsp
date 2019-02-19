<%@page import="java.util.ArrayList"%>
<%@page import="model.Passeggero"%>
<%@page import="model.Prenotazione"%>
<%@page import="model.Utente"%>
<%@page import="dao.PrenotazioneDAO"%>
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
<link href="css/checkin.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- NAVBAR -->

<%

ArrayList<Passeggero> passeggeriVolo = (ArrayList<Passeggero>)request.getSession().getAttribute("passeggeriVolo");
Prenotazione prenotazione = (Prenotazione)request.getSession().getAttribute("prenotazione");



%>

<%Utente u=(Utente)session.getAttribute("userBean");
PrenotazioneDAO pdao = new PrenotazioneDAO();
Boolean check = pdao.getCheckInIsDone(prenotazione.getCodPrenotazione());
session.setAttribute("check", check);
String path=request.getServletPath();	
session.setAttribute("path", path); %>
<!-- NAVBAR -->
<nav>
  <a href="index.jsp">
    <img src="img/logo.png" width="200" height="100" alt="">
  </a>
  
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
  
</nav>
	  <div class="spazio"></div>


<main>
	<div class="storico">
		<span class="infoStorico">
			Volo Prenotato in data <span class="special"><%=prenotazione.getData() %></span> da <span class="special"><%=prenotazione.getVolo().getAeroportoPartenza() %></span> a
			 <span class="special"><%=prenotazione.getVolo().getAeroportoDestinazione() %></span> il giorno <span class="special"><%=prenotazione.getVolo().getData() %></span>
		</span>
		<div class="infoVolo">
			Numero volo: <span class="special"><%=prenotazione.getVolo().getCodVolo() %></span><br>
			Posti prenotati: <span class="special"><%=prenotazione.getNumBiglietti() %>(Posti:
				<%for(int j=0;j<prenotazione.getPasseggeri().size();j++){ %> <%=prenotazione.getPasseggeri().get(j).getPosto() %>-<%} %>)</span><br>
			Totale bagagli: <span class="special"><%=prenotazione.getNumBagagliTot() %></span><br>
			Prezzo: <span class="special"><%=prenotazione.getPrezzoTotale() %>&euro;</span><br>
		</div>
		<div class="confermaPasseggeri">
			<h2>PASSEGGERI - <span class="sottotitolo">Spunta per confermare passeggero</span></h2>
			<%for(Passeggero p : passeggeriVolo){%>
				<%=p.getNome()+" "+p.getCognome()+" "%> <input type="checkbox" value="<%=p.getCodFiscale()%>"><br>
			<%} %>
		</div>
		<div class="buttonContent">
			<a href="#"><button type="button"  id="bottone" class="BtnStorico" onclick="f()">Procedi al check-in</button></a>
		</div>
	</div>
</main>



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
$(document).ready(function(){

	var check="${check}"
	if(check == "true"){
		$('#bottone').attr('disabled','disabled');
		$('#bottone').css('opacity', '0.6');
	}
    });


 function f(){
	 var a = document.getElementsByTagName("input");
	 var s = [];
	 var n = a.length;
	 var i = 0;
	 var j = 0;
	 var stringa = "";
	 for(i = 0;i<n;i++){
		 
		 if (!($(a[i]).is(":checked"))){
			 s[j] = a[i];
			 	stringa= stringa+"stringa="+s[j].value+"&";
			 j++;
		 }
	 }
	 stringa = stringa.substring(0, stringa.length - 1);
	window.location="ControlloCheckIn?"+stringa;
 }
</script>
</body>
</html>