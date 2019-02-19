<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="model.Volo"%>
<%@page import="model.Aereo"%>
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
        <a href="Storico" class="link">Storico</a>
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
	 	<div id="overlay" >
    <div id="popupcontrollo"  >
            <span class="campitestopopup">Per procedere devi inserire</span>
            <br>
             <form >
            <span class="campitestopopup">email: <input class="campoEm" type="text"></span>
            <br>
            <span class="campitestopopup">password: <input class="campoPass" type="text"></span>
            <br>
            <input class="btnlog" type="submit" value="login" onclick="off()"  >
            </form>
        </div>
    </div>
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
<%session.setAttribute("denied", false);
session.setAttribute("denied2",false);
%>
<%		
		ArrayList<Volo> voli = (ArrayList<Volo>) session.getAttribute("voliAndata");
		String AereoportoPartenza=(String) session.getAttribute("AereoportoPartenza");
		String AereoportoDestinazione=(String) session.getAttribute("AereoportoDestinazione");
		String Data=(String) session.getAttribute("Data");
		String DataR=(String) session.getAttribute("DataRitorno");
		int Passeggeri=(int) session.getAttribute("Passeggeri");
		ArrayList<Volo> voliR = (ArrayList<Volo>) session.getAttribute("voliRitorno");
		
	%>
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
			
				<span class="special">Email o Password errate, riprova. </span> 
			 
				<br> 
			</div>
		
		
	</div>
					<div id="infoRicerca"> 
						Voli  da: <%=AereoportoPartenza %>	a: <%=AereoportoDestinazione %> <br>
						in data: <%=Data %><br>
						per <%=Passeggeri %> passeggeri
					</div>
					<%if(DataR!=null){ %>
					<div id="infoRicercaRitorno"> 
						Voli  da: <%=AereoportoDestinazione %> 	a: <%=AereoportoPartenza %><br>
						in data: <%=DataR %><br>
						per <%=Passeggeri %> passeggeri
					</div>
					<%} %>
					<div class="filtri">
							Ordina per: <select>
								<option>Ora</option>
								<option>Prezzo Crescente</option>
								<option>Prezzo Decrescente</option>
							</select>
						</div>
						
						
					<div id="ContenitoreVoli">
					<%if(voli.size()==0){ %><h2 class="vuoto">Non ci sono voli disponibili al momento</h2><%} %>
	<%for(int i=0;i<voli.size();i++){ %>
						<div class="volo">
								Volo num:	<%=voli.get(i).getCodVolo() %>	<div class="prezzo"> <%=voli.get(i).getPrezzoEconomy() %></div><br>
								<span class="orarioVoli"><%=voli.get(i).getOraPartenza().substring(0,5) %> <span class="gl">&#9866; &#9866; &#9992; </span><%=voli.get(i).getOraArrivo().substring(0,5) %></span>
								<br>
								Durata volo: <%=voli.get(i).getDurataVolo().substring(0,5) %><br>
								<button onclick="AndataeRitorno(<%=voli.get(i).getCodVolo() %>)"  > Prenota ora</button>
						</div>
						<%} %>
						
					</div>
					
					
					<%if(voliR!=null){ %>
								
					<div id="ContenitoreVoliRitorno">
					<%if(voliR.size()==0){ %><h2 class="vuoto">Non ci sono voli disponibili al momento</h2><%} %>
	<%for(int i=0;i<voliR.size();i++){ %>
						<div class="volo">
								Volo num:	<%=voliR.get(i).getCodVolo() %>	<div class="prezzo"> <%=voliR.get(i).getPrezzoEconomy() %></div><br>
								<span class="orarioVoli"><%=voli.get(i).getOraPartenza().substring(0,5) %> <span class="gl">&#9866; &#9866; &#9992; </span><%=voliR.get(i).getOraArrivo().substring(0,5) %></span>
								<br>
								Durata volo: <%=voliR.get(i).getDurataVolo().substring(0,5) %><br>
								<button onclick="Ritorno(<%=voliR.get(i).getCodVolo() %>)"  > Prenota ora</button>
						</div>
						<%} %>
						
					</div>
					<%} %>
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
<script>
var codA;
function AndataeRitorno(codV){

	<%String Checked=(String) session.getAttribute("Andata/Ritorno");
	if(Checked.equals("a/r")){%>
		{	
			alert("ora scegli volo per il ritorno");
			document.getElementById("ContenitoreVoli").style.display="none";
			document.getElementById("ContenitoreVoliRitorno").style.display="block";
			document.getElementById("infoRicerca").style.display="none";
			document.getElementById("infoRicercaRitorno").style.display="block";
			codA=codV;
		}
		<%}else{%>
	
		window.location = "http://localhost:8080/UnisAir/ScelgoVolo?cod="+codV;
		<%}%>
}
function Ritorno(codR){
	
	window.location = "http://localhost:8080/UnisAir/ScelgoVolo?cod="+codA+"&codRitorno="+codR;
	
}
</script>
	<script type="text/JavaScript" src="js/jsTemplate.js"></script>
</body>
</html>