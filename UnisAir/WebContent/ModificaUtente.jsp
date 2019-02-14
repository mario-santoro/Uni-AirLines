<%@page import="model.Utente"%>
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
<link rel="stylesheet" href="css/ModificaUtente.css" type="text/css">


</head>
<body>

<%Utente u=(Utente)session.getAttribute("userBean"); %>
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
	
	<h2>Modifica dati</h2>
<br>
	
		<div id="modificadati">

			<form id="ModificaDatiUtente" onsubmit="return validateForm()" action="ModificaUtente" method="post">

				<div class="dati">
					<table>
						<tr class="tr">
							<td align="right"><label>Nome: &nbsp;</label></td>
							<td align="left"><label id="nome" class="special"> <%=u.getNome() %> </label></td>
						</tr>
						<tr>
							<td align="right"><label>Cognome: &nbsp;</label></td>
							<td align="left"><label id="cognome" class="special"><%=u.getCognome() %></label></td>
						</tr>
						<tr>
							<td align="right"><label>E-mail:&nbsp; </label></td>
							<td align="left"><label id="email" class="special"> <%=u.getEmail() %>
							</label></td>
						</tr>
						<tr>
							<td align="right"><label>Password: </label></td>
							<td align="left"><input class="FormInput" type="password"
								name="Password" id="Password" placeholder="Password" /></td>
						</tr>
						<tr>
							<td align="right"><label>Conferma Password: </label></td>
							<td align="left"><input class="FormInput" type="password"
								name="ConfermaPassword" placeholder="ConfermaPassword" /></td>
						</tr>
						<tr>
							<td align="right"><label>Documento: </label></td>
							<td align="left"><select name="Documento" class="FormInput"
								id="Documento" required>
									<option value="CartaIdentità">Carta Identità</option>
									<option value="Passaporto">Passaporto</option>
							</select></td>
						</tr>
						<tr>
							<td align="right"><label>Numero Documento: </label></td>
							<td align="left"><input class="FormInput" type="text"
								name="NumeroDocumento" placeholder="Numero Documento" /></td>
						</tr>



					</table>
				</div>

				<br>


				<div id="datipagamento">
					<table>
						<tr>
							<td align="center">

								<table>
									<tr>
										<td align="center"><label>Dati pagamento: </label></td>
									</tr>

									<tr>
										<td align="center"><label>Numero carta pagamento:
										</label></td>
									</tr>
									<tr>
										<td align="center"><input class="FormInput" type="text"
											id="numcarta" name="numcarta" placeholder="**** 5555" /></td>
									</tr>
									<tr>
										<td align="center"><label>Nome proprietario </label></td>
									</tr>
									<tr>
										<td align="center"><input class="FormInput" type="text" disabled="disabled"
											name="ProprietarioCarta" placeholder="<%=u.getNome()+" "+u.getCognome() %>" /></td>
									</tr>
									<tr>
										<td align="center"><label>Data di scandenza </label></td>
									</tr>
									<tr>
										<td align="center"><input class="FormInput" type="date"
											name="scadenza" placeholder="12-31-2019" /></td>
									</tr>
									<tr>
										<td align="center"><label>CVC/CVV </label></td>
									</tr>
									<tr>
										<td align="center"><input class="FormInput" type="number"
											id="cvc" name="cvc" /></td>
									</tr>
								</table>

							</td>
						</tr>
					</table>
				</div>
				<br>
				<div class="dati">

					<table>
						<tr>
							<td align="right"></td>
							<td align="left"><input id="ButtonModificaDatiUtente"
								class="btnR" type="submit" value="Conferma" /></td>
						</tr>
					</table>
				</div>


			</form>
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


	<script type="text/JavaScript" src="js/jsTemplate.js"></script>
	<script type="text/JavaScript" src="js/jsSelBagaglio.js"></script>
	<script>
function validateForm()
{
	 var form = document.forms["ModificaDatiUtente"];
	  
		if (!validatePassword(form.Password))
	        return false;
		if (!validateConfermaPassword(form.ConfermaPassword))
	        return false;
		if (!validateNumeroDocumento(form.NumeroDocumento))
	        return false;
		if (!validateNumeroCarta(form.numcarta))
			return false;
		if (!validateScadenza(form.scadenza))
			return false;
		if (!validateCVC(form.cvc))
			return false;
		
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
	var password = document.getElementById("Password").value;
	if(ConfermaPassword.value.match(password))
		return true;
	else{
		alert('La password non corrisponde!');
		ConfermaPassword.focus();
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
function validateNumeroCarta(numcarta){
	var Regexp =/^[0-9]{16}$/
	if(numcarta.value.match(Regexp))
		return true;
	else{
		alert('Il campo Numero Carta deve contenere solo numeri per un minimo di 16 cifre!');
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
	

</script>
</body>
</html>