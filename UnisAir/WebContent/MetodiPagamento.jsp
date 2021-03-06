<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="model.Utente"%>
	 	 <%@page import="model.Prenotazione"%>
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
<link rel="stylesheet" href="css/pagamento.css" type="text/css">

</head>
<body>

<%Utente u=(Utente)session.getAttribute("userBean");%>


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
	<h2>Seleziona metodo di pagamento</h2>
	
	<button type="button" onClick="anulla()" class="btnForm">Indietro</button>
	<form id="formPagamento"  name="formPagamento"  action="ScelgoPagamento" method="post" onsubmit="return validateForm()">
	<div id="dataShow">

			Nome: <span class="result"><%=u.getNome() %></span><br>
			Cognome: <span class="result"><%=u.getCognome() %></span><br>
		
			Tipo di Pagamento:<br>
			<select name="tipoP">
				<option>Visa</option>
				<option>Mastercard</option>
				<option>AmericanExpress</option>
			</select>
			<br>
			Nome Proprietario:<br>
			<input type="text" id="proprietario" name="proprietario" placeholder="Nome Proprietario"  required><br>
			Numero Carta:<br>
			<input type="text" id="numero" name="numero" placeholder="Numero Carta(max 16)" required><br>
		Data Scadenza Carta:<br>
		<input type="date" id="scadenza" name="scadenza" placeholder="12-31-2019" required><br>
			CVC/CVV:<br>
			<input type="text" id="cvc" name="cvc" placeholder="(3 cifre)" required><br>
	</div>
	
	<input type="submit" value="Continua" class="btnForm">
	</form>
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
	<script type="text/javascript">
	function validateForm()
	{
		
		 var form = document.forms["formPagamento"];
		
			if (!validateProprietario(form.proprietario))
				return false;
			if (!validateNumeroCarta(form.numero))
				return false;
			if (!validateScadenza(form.scadenza))
				return false;
			if (!validateCVC(form.cvc))
				return false;
		}

	function validateProprietario(proprietario){
		var Regexp = /^[a-zA-Z ]{3,}$/;
		if(proprietario.value.match(Regexp))
			return true;
		else{
			alert('Il campo proprietario deve contenere solo lettere e spazi!');
			proprietario.focus();
			return false;
		}
	}
	function validateNumeroCarta(numcarta){
		var Regexp =/^[0-9]{16}$/
		if(numcarta.value.match(Regexp))
			return true;
		else{
			alert('Il campo Numero Carta deve contenere solo numeri ed essere di 16 cifre!');
			numcarta.focus();
			return false;
		}
		
	}
		
		function validateScadenza(scadenza){
			 var today = new Date();
			 var myDate = new Date(scadenza.value);
		        var today = new Date();
		        if ( myDate >= today ) 
		        	return true;
		        else{
		        	alert('Carta scaduta!');
		        	scadenza.focus();
		        	return false;
		        }
		}
		
		function validateCVC(cvc){
			var Regexp =/^[0-9]{3}$/
			if(cvc.value.match(Regexp))
				return true;
			else{
				alert('Il CVC/CVV codice scritto sul retro della carta deve essere di almeno 3 cifre!');
				cvc.focus();
				return false;
			}
		}
function annulla() {
	  alert("tornando indietro la ricerca verr� annullata");
	window.location = "http://localhost:8080/UnisAir/index.jsp";
	}

</script>

<script type="text/JavaScript" src="js/jsTemplate.js"></script>
</body>
</html>