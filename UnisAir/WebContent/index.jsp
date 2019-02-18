<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.Utente"%>

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
	<script type="text/javascript">
	  
	  $(document).ready(function(){ 
		  

	            $.post("DaiAeroporto",function(data){

	                $('#ARpartenza').html(data);
	                $('#ARarrivo').html(data);

	            });
		  $.get("VisualizzaVoliLowCost", function(data, status){
				    Low(data);
						});

				function Low(data) {
					var i=0;
					 var data = JSON.parse(data);
					  var s="";
					  for (i = 0; i <data.length; i++) { 
						
						s+=" <div class=\"annuncio\"><a href=\"VisualizzaOfferta?codVolo="+data[i].codVolo+"\">"+
						"<img src=\"img/lowcost/"+data[i].immagine +"\" width=\"350\" height=\"200\" /><div class=\"nomeCitta\">"+
								data[i].nome +"</div> <div class=\"prezzo\">da "+data[i].prezzo+"&euro;</div></a></div>";
					  
					}
					  if(i==0){
						 
						  s+="<h2> Non ci sono voli Low Cost disponibili al momento</h2>"
							
					  }
					
					  document.getElementById("ContenitoreAnnunci").innerHTML = s;
					  
					}

	
			var denied="${denied}"
			if(denied=="true"){
				
				      document.getElementById("menu").style.display = "block";
				      document.getElementById("overlay3").style.display = "block";

				
			}
	});
	function offErr() {
		document.getElementById("menu").style.display = "none";
		document.getElementById("overlay3").style.display = "none";
		}
	function validate(){

	       var Partenza = document.getElementById("ARpartenza");

	       var Arrivo = document.getElementById("ARarrivo");
	       if (Partenza.options[Partenza.selectedIndex].value != Arrivo.options[Arrivo.selectedIndex].value){
	           return true;
	       }else{
	           alert('Gli areoporti di partenza ed arrivo devono essere diversi!');

	           return false;
	       }
	   }
	  
			
	</script>
</head>
<body>
<%session.setAttribute("denied", false); %>
<%Utente u=(Utente)session.getAttribute("userBean");
String path=request.getServletPath();	
session.setAttribute("path", path); %>
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

<div id="overlay3">
		<div id="accessoerrato">
		<span onclick="offErr()" id="x" class="glyphicon glyphicon-remove"></span>
			<h2>Credenziali Errate</h2>
			
				<span class="special">Email o Password errate, riprova. </span> 
			 
				<br> 
			</div>
		
		
	</div>


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
		
			<form id="RicercaVolo" method="post" action="RicercaVolo" onSubmit="return validate()">
			<input type="radio" id="rad1" name="a/r" value="a/r" checked="checked"> <span class="rad">Andata e ritorno</span> 
			 <input type="radio" id="rad2" name="a/r" value="a"> <span class="rad">Solo andata</span><br>
			 <div class="separetor">
				 Aereoporto di partenza<br>
				<select id="ARpartenza" name="ARpartenza" class="campo">
								</select>
			</div>
			<div class="separetor">
				Aereoporto di destinazione<br>
				<select id="ARarrivo" name="ARarrivo" class="campo" >
						</select>
			</div>
			<br>
			<div class="separetor">
				Data partenza<br>
				<input class="campo" onchange="dat()" id="datPartenza" name="dataPartenzaVolo" type="date" required>
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
<div id="sconto"><h2>Sconti e offerte last minute</h2> </div>
<div id="ContenitoreAnnunci">

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
	
	 <script type="text/JavaScript" src="js/jsHome.js"></script>
 <script type="text/JavaScript" src="js/selezionaVolo.js"></script>
</body>
</html>