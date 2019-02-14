<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<!-- NAVBAR -->
	<nav>
  <a>
    <img src="img/logo.png" width="200" height="100" alt="">
  </a>
      <a>
       <span class="l">Accedi</span> 
      </a>
      <div id="menu">
        Email:<br>
        <input class="campo-login"  type="text" placeholder="E-mail"><br>
        Password:<br>
        <input class="campo-login" type="text" placeholder="Password"><br>
        <input class="btnR" type="submit" value="Accedi">
       	<p>Non sei ancora registrato?</p>
       	<a href="#" class="link">Registrati!</a>
      </div>
    
  
</nav>
	
		
<div class="spazio"></div>
	

	<!-- Form di Inserimento Dati Anagrafici -->
		
	<h2>Inserimento dati anagrafici dei passeggeri</h2>
	

	<%for(int i=0;i<4;i++){ %>
	<div class="ContenitoreInserimentoDatiAnagraficiForm">
		<h3>Passeggero n:</h3>
	<div id="DatiAnagrafici">
	
	<form id="FormDatiAnagrafici">
  <table>
    <tr>
      <td align="right"><label>Nome</label></td>
      <td align="left"><input type="text" class="FormInput"  name="Nome" placeholder="Nome" required/></td>
    </tr> 
    <tr> 
      <td align="right"><label>Cognome</label></td>
      <td align="left"><input type="text" class="FormInput" name="Cognome" placeholder="Cognome" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Documento</label></td>
      <td align="left"> <select name="Documento" class="FormInput" id="Documento"  required>
				<option value="CartaIdentità">Carta Identità</option>
				<option value="Passaporto">Passaporto</option>
			</select></td>
    </tr>
    <tr>
      <td align="right"><label>Numero Documento</label></td>
      <td align="left"><input class="FormInput"  type="text" name="NumeroDocumento" placeholder="Numero Documento" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Età</label></td>
      <td align="left"><input class="FormInput" type="text" name="Età" placeholder="Età" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Nazione</label></td>
      <td align="left"><input class="FormInput"  type="text" name="Nazione" placeholder="Nazione" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Città</label></td>
      <td align="left"><input class="FormInput"  type="text" name="Città" placeholder="Città" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Indirizzo</label></td>
      <td align="left"><input class="FormInput"  type="text" name="Indirizzo" placeholder="Indirizzo" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Cap</label></td>
      <td align="left"><input class="FormInput"  type="text" name="Cap" placeholder="Cap" required /></td>
    </tr>
   
     
  </table>
</form>
</div>

</div>
	<%} %>
<div class="SpazioFooter">
</div>
    <div class="SpazioFooter" align="center">
<table >

<tr>
  
      <td align="left"><input id="ButtonAnnulla" class="btnR" type="submit" value="Annulla"  />
      <td align="right"></td>
      <td align="left"><input id="ButtonConferma" onclick="return validateForm() " class="btnR" type="submit" value="Continua"  /></td>
    </tr>
    </table></div>
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
							<a href="#" class="linkFooter"><p>Domande frequenti</p></a>
							<a href="#" class="linkFooter"><p>Check-in online</p></a>
							<a href="#" class="linkFooter"><p>Metodi di pagamento</p></a>
							<a href="#" class="linkFooter"><p>Bagagli</p></a>
							<a href="#" class="linkFooter"><p>Ritardi e cancellazione</p></a>
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
	 var form = document.forms["FormRegistrazione"];
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
		if (!validateCap(form.Cap))
	        return false;
	}
function validateNome(Nome){
	var Regexp = /^[a-zA-Z ]+$/;
	if(Nome.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nome deve contenere solo lettere e spazi!');
		Nome.focus();
		return false;
	}
}
function validateEtà(Età){
	var Regexp = /^[0-9]+$/;
	if(Età.value.match(Regexp))
		return true;
	else{
		alert('Il campo Età deve contenere solo numeri!');
		Età.focus();
		return false;
	}
}
function validateNazione(Nazione){
	var Regexp =  /^[a-zA-Z ]+$/;
	if(Password.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nazione deve contenere solo lettere e spazi!');
		Nazione.focus();
		return false;
	}
}
function validateCittà(Città){
	var Regexp =  /^[a-zA-Z ]+$/;
	if(Città.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nazione deve contenere solo lettere e spazi!');
		Nazione.focus();
		return false;
	}
}
function validateCap(Cap){
	var Regexp =  /^[0-9]+$/;
	if(Cap.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nazione deve contenere solo numeri!');
		Cap.focus();
		return false;
	}
}
function validateIndirizzo(Indirizzo){
	var Regexp =  /^[a-zA-Z0-9 ]+$/;
	if(Indirizzo.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nazione deve contenere solo lettere,numeri e spazi!');
		Indirizzo.focus();
		return false;
	}
}
function validateCognome(Cognome){
	var Regexp = /^[a-zA-Z ]+$/;
	if(Cognome.value.match(Regexp))
		return true;
	else{
		alert('Il campo Cognome deve contenere solo lettere e spazi!');
		Cognome.focus();
		return false;
	}
}
function validateNumeroDocumento(NumeroDocumento){
	var Regexp = /^[a-zA-Z0-9]+$/;
	if(NumeroDocumento.value.match(Regexp))
		return true;
	else{
		alert('Il campo Numero Documento deve contenere solo lettere e numeri!');
		NumeroDocumento.focus();
		return false;
	}
}
</script>
</body>
</html>