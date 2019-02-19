<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		 <%@page import="model.Utente"%>
	 	 <%@page import="model.Prenotazione"%>
	 	  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UnisAir</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Popper JS -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed"
	rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">
<link rel="stylesheet" href="css/template.css" type="text/css">
<link rel="stylesheet" href="css/InserimentoDatiAnagrafici.css" type="text/css">
<link rel="icon" href="img/ms-icon-310x310.png" />
</head>
<body>
<%Utente u=(Utente)session.getAttribute("userBean");%>
<%Prenotazione pA=(Prenotazione)session.getAttribute("prenotazioneA");
int count=(int)request.getSession().getAttribute("count");
count++;
	request.getSession().setAttribute("count",count);%>

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

        <a href="ModificaUtente.jsp" class="link">Modifica dati</a>
        <br>

        <a href="Logout" class="link">Logout</a>
     </div>
     </div>

    
  
</nav>
	
		
<div class="spazio"></div>
	<main>
		<h2>Inserimento dati anagrafici dei passeggeri</h2>
		<h3>Passeggero n:<%=count+1 %></h3>
		<!-- Form di Inserimento Dati Anagrafici -->
		<div id="DatiAnagrafici">
			<div class="ContenitoreInserimentoDatiAnagraficiForm">
			    <form id="FormDatiAnagrafici"  method="post" action="SalvaPasseggeri" onSubmit="return validateForm()">
				      <label>Codice Fiscale</label><br>
				      <input type="text" class="FormInput"  name="CodiceFiscale" placeholder="Codice fiscale" required/><br>
				      <label>Nome</label><br>
				      <input type="text" class="FormInput"  name="Nome" placeholder="Nome" required/><br>
				      <label>Cognome</label><br>
				      <input type="text" class="FormInput" name="Cognome" placeholder="Cognome" required /><br>
				      <label>Documento</label><br>
				      <select name="Documento" class="FormInput" id="Documento"  required>
						  <option value="CartaIdentità">Carta Identità</option>
						  <option value="Passaporto">Passaporto</option>
					  </select><br>
				      <label>Numero Documento</label><br>
				      <input class="FormInput"  type="text" name="NumeroDocumento" placeholder="Numero Documento" required /><br>
				      <label>Età</label><br>
				      <input class="FormInput" type="number" name="Eta" placeholder="Età" min="3" max="100" required /><br>
				      <label>Nazione</label><br>
				      <input class="FormInput"  type="text" name="Nazione" placeholder="Nazione" required /><br>
				      <label>Città</label><br>
				      <input class="FormInput"  type="text" name="Citta" placeholder="Città" required /><br>
				      <label>Indirizzo</label><br>
				      <input class="FormInput"  type="text" name="Indirizzo" placeholder="Indirizzo" required /><br>
				      <label>Cap</label><br>
				      <input class="FormInput"  type="text" name="Cap" placeholder="Cap" required /><br>
				      <div id="btnContainer">
					      <input id="ButtonAnnulla" class="btnR" type="submit" onClick="annulla()" value="Annulla"  />
					      <input id="ButtonConferma"  class="btnR" type="submit" value="Continua"  />
				      </div>
			     </form>
		     </div>
		</div>
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
	<script type="text/JavaScript" src="js/jsHome.js"></script>
<script>
function validateForm()
{
	 var form = document.forms["FormDatiAnagrafici"];
	    if (!validateNome(form.Nome))
	        return false;
		if(!validateCittà(form.Città))
	        return false;
		if (!validateIndirizzo(form.Indirizzo))
	        return false;
		if (!validateCap(form.Cap))
	        return false;
		if (!validateCognome(form.Cognome))
	        return false;
		if (!validateNumeroDocumento(form.NumeroDocumento))
	        return false;
		if (!validateNazione(form.Nazione))
	        return false;
		if (!validateEtà(form.Età))
	        return false;
		if (!validateCodFisc(form.CodiceFiscale))
	        return false;
	}
function validateNome(Nome){
	var Regexp = /^[a-zA-Z]{3,}$/;
	if(Nome.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nome deve contenere solo lettere e spazi!');
		Nome.focus();
		return false;
	}
}
function validateCodFisc(cod){
	
	var Regexp =  /^[a-zA-Z0-9]{16}$/;
	if(Password.value.match(Regexp))
		return true;
	else{
		alert('Il campo Codice Fiscale deve contenere solo lettere e numeri  deve essere di 16 caratteri!');
		CodiceFiscale.focus();
		return false;
	}
	
}
function validateNazione(Nazione){
	var Regexp =  /^[a-zA-Z ]{3,}$/;
	if(Password.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nazione deve contenere solo lettere e spazi!');
		Nazione.focus();
		return false;
	}
}
function validateCittà(Città){
	var Regexp =  /^[a-zA-Z ]{3,}$/;
	if(Città.value.match(Regexp))
		return true;
	else{
		alert('Il campo Città deve contenere solo lettere e spazi!');
		Città.focus();
		return false;
	}
}
function validateCap(Cap){
	var Regexp =  /^[0-9]{2,}$/;
	if(Cap.value.match(Regexp))
		return true;
	else{
		alert('Il campo CAP deve contenere solo numeri!');
		Cap.focus();
		return false;
	}
}
function validateIndirizzo(Indirizzo){
	var Regexp =  /^[a-zA-Z0-9 ]{6,}$/;
	if(Indirizzo.value.match(Regexp))
		return true;
	else{
		alert('Il campo Indirizzo deve contenere solo lettere,numeri e spazi e almeno di lunghezza 6!');
		Indirizzo.focus();
		return false;
	}
}
function validateCognome(Cognome){
	var Regexp = /^[a-zA-Z ]{3,}$/;
	if(Cognome.value.match(Regexp))
		return true;
	else{
		alert('Il campo Cognome deve contenere solo lettere e spazi!');
		Cognome.focus();
		return false;
	}
}
function validateNumeroDocumento(NumeroDocumento){
	var Regexp = /^[a-zA-Z0-9]{9}$/;
	if(NumeroDocumento.value.match(Regexp))
		return true;
	else{
		alert('Il campo Numero Documento deve contenere solo lettere e numeri e deve essere di lunghezza 9!');
		NumeroDocumento.focus();
		return false;
	}
}
function annulla() {
	  alert("tornando indietro la ricerca verrà annullata");
	  window.location = "http://localhost:8080/UnisAir/index.jsp";
	}
</script>
</body>
</html>