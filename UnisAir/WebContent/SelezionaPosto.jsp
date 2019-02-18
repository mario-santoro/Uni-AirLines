<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <%@page import="model.Utente"%>
	 	 <%@page import="model.Prenotazione"%>
	 	  <%@page import="java.util.ArrayList"%>
<%@page import="model.Posto"%>
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
  alert("tornando indietro la ricerca verrà annullata");
  window.location = "http://localhost:8080/UnisAir/index.jsp";
}
</script>
</head>
<body>
<%Utente u=(Utente)session.getAttribute("userBean");%>
<%Prenotazione pA=(Prenotazione)session.getAttribute("prenotazioneA");%>
<%Prenotazione pR=(Prenotazione)session.getAttribute("prenotazioneR");%>
<%ArrayList<Posto> postiA = (ArrayList<Posto>) session.getAttribute("postiA");%>
<%ArrayList<Posto> postiR = (ArrayList<Posto>) session.getAttribute("postiR");%>
	
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
        <a href="Storico" class="link">Storico</a>
        <br>

        <a href="#" class="link">Modifica dati</a>
        <br>

        <a href="Logout" class="link">Logout</a>
     </div>
     </div>

    
  
</nav>

	

	<div id="contenitore">
	
	<div class="legenda">
		<h2>Legenda sovrapprezzi classi di viaggio</h2>
		<br>
		<h3>Premium: <span class="special">+<%=pA.getVolo().getPrezzoPremium()-pA.getVolo().getPrezzoEconomy() %>&euro;</span></h3>
		<br>
		<h3>Business: <span class="special">+<%=pA.getVolo().getPrezzoBusiness()-pA.getVolo().getPrezzoEconomy() %>&euro;</span></h3>
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
			Seleziona posto per il volo  di andata
		</h2>
	</div>
		<div class="aereo">
		
		
			<br> <span class="tipologiaPosto">PREMIUM</span>
			<hr color="white">
		
			<%int i=0, p=0;
		for( i=0;i<1;i++){ 
		for(p=0;p<6;p++){
		%>
			<%if(postiA.get(p).isPrenotato()){ %>
			<button class="btnPrenota" type="button" style="background-color:red;" disabled><%=postiA.get(p).getNumPosto() %></button>
			<%}else{ %>
			<button class="btnPrenota" type="button" onclick="scelgoPosto(<%=pA.getNumBiglietti()%>,<%=pA.getVolo().getPrezzoPremium()-pA.getVolo().getPrezzoEconomy() %>,<%=p%>,this)"><%=postiA.get(p).getNumPosto() %></button>
			<%} %>
			<%if(p%6==2) {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>



			<br> <span class="tipologiaPosto">BUSINESS</span>
			<hr color="white">
			<%for(;i<4;i++){for(;p<24;p++){
			%>
<%if(postiA.get(p).isPrenotato()){ %>
			<button class="btnPrenota" type="button" style="background-color:red;" disabled><%=postiA.get(p).getNumPosto() %></button>
			<%}else{ %>
			<button class="btnPrenota" type="button" onclick="scelgoPosto(<%=pA.getNumBiglietti()%>,<%=pA.getVolo().getPrezzoBusiness()-pA.getVolo().getPrezzoEconomy() %>,<%=p%>,this)"><%=postiA.get(p).getNumPosto() %></button>
			<%} %>
			<%if(p%6==2) {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>

			<br> <span class="tipologiaPosto">ECONOMY</span>
			<hr color="white">
			<%for(;i<9;i++){for(;p<54;p++){
			%>
<%if(postiA.get(p).isPrenotato()){ %>
			<button class="btnPrenota" type="button" style="background-color:red;" disabled><%=postiA.get(p).getNumPosto() %></button>
			<%}else{ %>
			<button class="btnPrenota" type="button" onclick="scelgoPosto(<%=pA.getNumBiglietti()%>,0,<%=p%>,this)"><%=postiA.get(p).getNumPosto() %></button>
			<%} %>
			<%if(p%6==2)  {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>
		</div>
		<br>
		<div class="prezzoAttuale">
		
		<h3>
		Prezzo base: <span id="prezzobase" class="special"> <%=pA.getVolo().getPrezzoEconomy()*pA.getNumBiglietti()%></span>&euro;
		<br>
		<br>
		Sovrapprezzo posti: +<span id="sovrapprezzo" class="special"> 0</span>&euro;
		<br>
		<br>
		Totale: <span id="totale" class="special"><%=pA.getVolo().getPrezzoEconomy()*pA.getNumBiglietti()%></span>&euro;
		</h3>
		<br>
		<button class="btnR"  onCLick="Avvertimento()" >Indietro</button>
		<button class="btnR" onClick="continua(<%=pA.getNumBiglietti()%>)" >Continua</button>
	</div>
		
	</div>


<%if(pR!=null){ %>

<div id="contenitoreRitorno">
	
	<div class="legenda">
		<h2>Legenda sovrapprezzi classi di viaggio</h2>
		<br>
		<h3>Premium: <span class="special">+<%=pR.getVolo().getPrezzoPremium()-pR.getVolo().getPrezzoEconomy() %>&euro;</span></h3>
		<br>
		<h3>Business: <span class="special">+<%=pR.getVolo().getPrezzoBusiness()-pR.getVolo().getPrezzoEconomy() %>&euro;</span></h3>
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
			Seleziona posto per il volo  di ritorno
		</h2>
	</div>
		<div class="aereo">
		
		
			<br> <span class="tipologiaPosto">PREMIUM</span>
			<hr color="white">
		
			<% p=0;
		for( i=0;i<1;i++){ 
		for(p=0;p<6;p++){
		%>
			<%if(postiR.get(p).isPrenotato()){ %>
			<button class="btnPrenotaR" type="button" style="background-color:red;" disabled><%=postiR.get(p).getNumPosto() %></button>
			<%}else{ %>
			<button class="btnPrenotaR" type="button" onclick="scelgoPostoR(<%=pR.getNumBiglietti()%>,<%=pR.getVolo().getPrezzoPremium()-pR.getVolo().getPrezzoEconomy() %>,<%=p%>,this)"><%=postiR.get(p).getNumPosto() %></button>
			<%} %>
			<%if(p%6==2) {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>



			<br> <span class="tipologiaPosto">BUSINESS</span>
			<hr color="white">
			<%for(;i<4;i++){for(;p<24;p++){
			%>
<%if(postiR.get(p).isPrenotato()){ %>
			<button class="btnPrenotaR" type="button" style="background-color:red;" disabled><%=postiR.get(p).getNumPosto()%></button>
			<%}else{ %>
			<button class="btnPrenotaR" type="button" onclick="scelgoPostoR(<%=pR.getNumBiglietti()%>,<%=pR.getVolo().getPrezzoBusiness()-pR.getVolo().getPrezzoEconomy() %>,<%=p%>,this)"><%=postiR.get(p).getNumPosto() %></button>
			<%} %>
			<%if(p%6==2) {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>

			<br> <span class="tipologiaPosto">ECONOMY</span>
			<hr color="white">
			<%for(;i<9;i++){for(;p<54;p++){
			%>
<%if(postiR.get(p).isPrenotato()){ %>
			<button class="btnPrenotaR" type="button" style="background-color:red;" disabled><%=postiR.get(p).getNumPosto() %></button>
			<%}else{ %>
			<button class="btnPrenotaR" type="button" onclick="scelgoPostoR(<%=pR.getNumBiglietti()%>,0,<%=p%>,this)"><%=postiR.get(p).getNumPosto() %></button>
			<%} %>
			<%if(p%6==2)  {%>
			<span class="tipologiaPosto"><%=i+1 %></span>
			<%}} %>


			<%} %>
		</div>
		<br>
		<div class="prezzoAttuale">
		
		<h3>
		Prezzo base: <span id="prezzobaseR" class="special"> <%=pR.getVolo().getPrezzoEconomy()*pR.getNumBiglietti()%></span>&euro;
		<br>
		<br>
		Sovrapprezzo posti: +<span id="sovrapprezzoR" class="special"> 0</span>&euro;
		<br>
		<br>
		Totale: <span id="totaleR" class="special"><%=pR.getVolo().getPrezzoEconomy()*pR.getNumBiglietti()%></span>&euro;
		</h3>
		<br>
		<button class="btnR"  onCLick="Avvertimento()" >Indietro</button>
		<button class="btnR" onClick="continuaR(<%=pR.getNumBiglietti()%>)" >Continua</button>
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
		<%} %>
	</footer>
<script type="text/javascript">
var bas=document.getElementById("prezzobase").innerHTML*1;

var sov = document.getElementById("sovrapprezzo").innerHTML*1;

var tot=bas+sov;

document.getElementById("totale").innerHTML=tot;
var count=0;
var countR=0;
var stringa = "";
var x = document.getElementsByClassName("btnPrenota");
var xR = document.getElementsByClassName("btnPrenotaR");
var a=[];
var r=[];
function scelgoPosto(persone,prezzo,index,codice){
	
	count++;
	if(count<=persone){
		 x[index].style.background= "yellow";
		 x[index].disabled="false";
		var sov = document.getElementById("sovrapprezzo").innerHTML*1;
		var tot = document.getElementById("totale").innerHTML*1;
	
		sov=(sov+prezzo);
		document.getElementById("sovrapprezzo").innerHTML=sov;
		 tot=(tot+prezzo);

		document.getElementById("totale").innerHTML=tot;
	
		a.push(codice.innerHTML);
	}
}
function scelgoPostoR(persone,prezzo,index,codice){
	countR++;
	if(countR<=persone){
		 xR[index].style.background= "yellow";
		 xR[index].disabled="false";
		var sov = document.getElementById("sovrapprezzoR").innerHTML*1;
		var totR = document.getElementById("totaleR").innerHTML*1;
		sov=(sov+prezzo);
		document.getElementById("sovrapprezzoR").innerHTML=sov;
		 totR=(totR+prezzo);

		document.getElementById("totaleR").innerHTML=totR;
	
	r.push(codice.innerHTML);
	}
}

function continua(persona){
	if(count>=persona){
		  var n = a.length;
		     var i = 0;
		     var j = 0;
		  
		     for(i = 0;i<n;i++){
		             
		                stringa= stringa+"stringa="+a[i]+"&";
		          
		         
		     }
		     stringa = stringa.substring(0, stringa.length - 1);
		    
	<%String Checked=(String) session.getAttribute("Andata/Ritorno");
	
	if(Checked.equals("a/r")){%>
		{	
			var tot = document.getElementById("totale").innerHTML*1;
			var baseR = document.getElementById("prezzobaseR").innerHTML*1;	
	baseR+=tot;
	 document.getElementById("prezzobaseR").innerHTML=baseR;
			document.getElementById("totaleR").innerHTML=baseR;
			
			
			document.getElementById("contenitore").style.display="none";
			document.getElementById("contenitoreRitorno").style.display="block";
		}
		<%}else{%>
		
	   
	window.location = "http://localhost:8080/UnisAir/SalvaPosti?"+stringa;
		<%}%>
		
	}else{
		alert("non hai selezionato i posti");
	}
}
function continuaR(persona){
	if(countR>=persona){
		 var n = r.length;
	     var i = 0;
	     var j = 0;
	     var stringaR = "";
	     for(i = 0;i<n;i++){
	             
	                stringaR= stringaR+"stringaR="+r[i]+"&";
	          
	         
	     }
	     stringaR = stringaR.substring(0, stringaR.length - 1);
	window.location = "http://localhost:8080/UnisAir/SalvaPosti?"+stringa+"&"+stringaR;
		
	}else{
		
		alert("non hai selezionato i posti")
	}
}

</script>

	<script type="text/JavaScript" src="js/jsTemplate.js"></script>
</body>
</html>