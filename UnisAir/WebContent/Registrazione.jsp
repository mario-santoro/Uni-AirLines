<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UnisAir - Registrazione</title>
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
	<link rel="icon" href="img/ms-icon-310x310.png" />
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway"
	rel="stylesheet">
<link rel="stylesheet" href="css/template.css" type="text/css">
<link rel="stylesheet" href="css/Registrazione.css" type="text/css">
<script type="text/javascript">
$(document).ready(function(){ 
	var denied="${err}"
		if(denied=="true"){
			
			      document.getElementById("overlay3").style.display = "block";
			    

			
		}
	});
	function offErr() {
	document.getElementById("overlay3").style.display = "none";
	}

</script>
</head>
<body>
<%session.setAttribute("err", false); %>
	<!-- NAVBAR -->
<nav>
  <a>
    <img src="img/logo.png" width="200" height="100" alt="">
  </a>
      <a href="index.jsp">
       <span class="l">HOME</span> 
      </a>

</nav>
<div class="spazio"></div>
	
	
<div id="overlay3">
		<div id="accessoerrato">
		<span onclick="offErr()" id="x" class="glyphicon glyphicon-remove"></span>
			<h2>Credenziali Errate</h2>
			
				<span class="special">Email già presente, riprova. </span> 
			 
				<br> 
			</div>
		
		
	</div>
	
	<div id="ContenitoreRegistrazione">
	
<h2>La tua registrazione richiederà solo un minuto</h2>
<br>
	<!-- Form di Registrazione -->
	
	<div id="registrazione">

	<form id="FormRegistrazione" action="RegistrazioneUtente" method="POST" onsubmit="return validateForm()">
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
      <td align="right"><label>E-mail</label></td>
      <td align="left"><input class="FormInput" type="email" name="Email" placeholder="Email" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Password</label></td>
      <td align="left"><input class="FormInput"  type="password" name="Password" id="Password" placeholder="Password" required /></td>
    </tr>
    <tr>
      <td align="right"><label>Conferma Password</label></td>
      <td align="left"><input class="FormInput"  type="password" name="ConfermaPassword" placeholder="ConfermaPassword" required /></td>
    </tr>
     <tr>
      <td align="right"></td>
      <td align="left"><input id="ButtonRegistrazione" class="btnR" type="submit" value="Registrati"  /></td>
    </tr>
  </table>
</form>
	</div>

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
<script>
function validateForm()
{
	 var form = document.forms["FormRegistrazione"];
	    if (!validateNome(form.Nome))
	        return false;
		if(!validateEmail(form.Email))
	        return false;
		if (!validatePassword(form.Password))
	        return false;
		if (!validateConfermaPassword(form.ConfermaPassword))
	        return false;
		if (!validateCognome(form.Cognome))
	        return false;
		if (!validateNumeroDocumento(form.NumeroDocumento))
	        return false;
	}
function validateNome(Nome){
	var Regexp =/^[A-Za-z ]{2,}$/
	if(Nome.value.match(Regexp))
		return true;
	else{
		alert('Il campo Nome deve contenere solo lettere e spazi e almeno 2 caratteri!');
		Nome.focus();
		return false;
	}
}
function validateEmail(Email){
	var Regexp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
	if(Email.value.match(Regexp))
		return true;
	else{
		alert('Il campo Email deve contenere solo lettere, trattini e spazi!');
		Email.focus();
		return false;
	}
}
function validatePassword(Password){
	var Regexp =  /^[A-Za-z0-9]{5,}$/
	if(Password.value.match(Regexp))
		return true;
	else{
		alert('Il campo Password deve contenere solo lettere e numeri ed essere almeno 5 caratteri!');
		Password.focus();
		return false;
	}
}
function validateConfermaPassword(ConfermaPassword){
	var password= document.getElementById("Password").value;
	if(ConfermaPassword.value.match(password))
		return true;
	else{
		alert('La password non corrisponde!');
		ConfermaPassword.focus();
		return false;
	}
}
function validateCognome(Cognome){
	var Regexp = /^[A-Za-z ]{3,}$/
	if(Cognome.value.match(Regexp))
		return true;
	else{ 
		alert('Il campo Cognome deve contenere solo lettere e spazi ed almeno 3 caratteri!');
		Cognome.focus();
		return false;
	}
}
function validateNumeroDocumento(NumeroDocumento){
	var Regexp =/^[A-Za-z0-9]{9,}$/
	if(NumeroDocumento.value.match(Regexp))
		return true;
	else{
		alert('Il campo Numero Documento deve contenere solo lettere e numeri e per un massimo di 9!');
		NumeroDocumento.focus();
		return false;
	}
	

}


</script>
</body>
</html>