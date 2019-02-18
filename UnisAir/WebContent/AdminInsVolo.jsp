<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="css/AdminInsVolo.css" type="text/css">


</head>
<body>
	<!-- NAVBAR -->
	<nav>
		<a href="AdminPannello.jsp"> <img src="img/logo.png" width="200"
			height="100" alt=""></a>
		<div id="Logout">
			<span id="Admin">Admin</span><br> <a href="Logout"><button
					class="btnR">Logout</button> </a>
		</div>


	</nav>








	<div class="spazio"></div>


	<h2>Inserisci dati volo</h2>
	<br>

	<div id="modificadati">

		<form id="InserisciVolo" onsubmit="return validateForm()"
			method="post" action="InserimentoVolo">

			<div class="dati">
				<table>
					<tr class="tr">
						<td align="right"><label>Aeroporto di partenza: </label></td>
						<td align="left"><select id="ARpartenza" name="ARpartenza">
								</select></td>
					</tr>
					<tr>
						<td align="right"><label>Aeroporto di arrivo: </label></td>
						<td align="left"><select id="ARarrivo" name="ARarrivo">
						</select></td>
					</tr>
					<tr>
						<td align="right"><label>Data partenza:</label></td>
						<td align="left"><input class="FormInput" type="date"
							id="data" name="data" /></td>
					</tr>
					<tr>
						<td align="right"><label>Ora partenza: </label></td>
						<td align="left"><select id="oraP" name="oraP">
								<%for(int i = 0; i < 24; i++){ %>
								<option><%= i %></option>
								<%} %>
						</select> &nbsp;<label>Minuto partenza:</label> <select id="minutoP"
							name="minutoP">
								<%for(int i = 0; i < 60 ; i+=5){ %>
								<option><%= i %></option>
								<%} %>
						</select></td>
					</tr>
					<tr>
						<td align="right"><label>Ora arrivo: </label></td>
						<td align="left"><select id="oraA" name="oraA">
								<%for(int i = 0; i < 24; i++){ %>
								<option><%= i %></option>
								<%} %>
						</select> &nbsp;<label>Minuto arrivo:</label> <select id="minutoA"
							name="minutoA">
								<%for(int i = 0; i < 60 ; i+=5){ %>
								<option><%= i %></option>
								<%} %>
						</select></td>


					</tr>

				</table>

				<label>L'ora di arrivo è prevista per il giorno successivo?</label>
				<br> <label>Spunta qui!</label> <input type="checkbox"
					id="giornodopo" name="giornodp" value="0"> <br> <br>
				<button id="verifica" type="button" class="btnR" >Controlla disponibilità aereo </button>


			</div>

			<br>


			<div id="datipagamento">
				<table>
					<tr>
						<td align="center">

							<table>
								<tr>
									<td align="center"><label>Aerei disponibili: </label></td>
								</tr>

								<tr>
									<td align="left"><select name="Aereo" class="FormInput"
										id="Aereo" required>
										
									</select></td>
								</tr>


							</table>

						</td>
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
									<td align="center"><label>Prezzo per classe: </label></td>
								</tr>

								<tr>
									<td align="center"><label>Economy: </label></td>
								</tr>
								<tr>
									<td align="center"><input class="FormInput" type="text"
										name="economy" id="economy" /></td>
								</tr>
								<tr>
									<td align="center"><label>Business: </label></td>
								</tr>
								<tr>
									<td align="center"><input class="FormInput" type="text"
										name="business" id="business" /></td>
								</tr>
								<tr>
									<td align="center"><label>Premium: </label></td>
								</tr>
								<tr>
									<td align="center"><input class="FormInput" type="text"
										name="premium" id="premium" /></td>
								</tr>

							</table>

						</td>
					</tr>
				</table>
			</div>
			<br> <br>
			<div class="dati">

				<table>
					<tr>
						<td align="right"></td>
						<td align="left"><input id="ButtonConferma" class="btnR"
							type="submit" value="Conferma"/></td>
					</tr>
				</table>
			</div>


		</form>
	</div>

	<script type="text/JavaScript" src="js/jsTemplate.js"></script>

	<script>
	function validateAereoporti(){
		
		var Partenza = document.getElementById("ARpartenza");
		
		var Arrivo = document.getElementById("ARarrivo");
		if (Partenza.options[Partenza.selectedIndex].value != Arrivo.options[Arrivo.selectedIndex].value){
			return true;
		}else{
			alert('Gli areoporti di partenza ed arrivo devono essere diversi!');
			
			return false;
		}
	}
		
		
function validateForm()
{ 
	 var form = document.forms["InserisciVolo"];
	    if (!validateAereoporti())
	        return false;
	    if (!validatePrezzi(form.economy,form.business,form.premium))
	        return false;
	    if (!controlloOra())
	        return false;
	  
	}
	
	
	function validatePrezzi(economy,business,premium)
	{
		var Regexp = /^[0-9]+[.][0-9]{2}$/;
		var Regexp2 = /^[0-9]+[.][0-9]{1}$/;
		var Regexp3 = /^[0-9]+$/;
		if ((economy.value.match(Regexp) || economy.value.match(Regexp2) || economy.value.match(Regexp3)) 
				&&  (business.value.match(Regexp) || business.value.match(Regexp2) || business.value.match(Regexp3))
				&&  (premium.value.match(Regexp) || premium.value.match(Regexp2) || premium.value.match(Regexp3)) ){
			return true;
		}else {
			alert('Il campo deve contenere un numero in formato virgola mobile!');
			economy.focus();
			business.focus();
			premium.focus();
			return false;
	}
		
	}
	
	

	
	
	
	function controlloOra(){

        var oraPartenza= document.getElementById("oraP");
        var oraArrivo = document.getElementById("oraA");
        var minutoPartenza = document.getElementById("minutoP");
        var minutoArrivo = document.getElementById("minutoA");

        var oP = oraPartenza.options[oraPartenza.selectedIndex].value;
        var oA = oraArrivo.options[oraArrivo.selectedIndex].value;
        var mP = minutoPartenza.options[minutoPartenza.selectedIndex].value;
        var mA = minutoArrivo.options[minutoArrivo.selectedIndex].value;
        var tempoP = (oP*3600)+(mP*60);
        var tempoA = (oA*3600)+(mA*60);
        var durata = tempoA - tempoP;
        var check = document.getElementById("giornodopo").checked;

        if(durata<=0 && !check){

            alert("RICORDA! se l'ora di arrivo prevista è il giorno seguente devi mettere la spunta");

            return false;

        }else{

            return true;
        }


     }
	

	 
	 $(document).ready(function() {
		  $('#verifica').click(function ()
			         {
			             $.ajax({
			                 type: "post",
			                 url: "VerificaAereo",
			                 data: "data=" +$('#data').val()+"&oraP="+$('#oraP').val()+"&oraA="+$('#oraA').val()+"&minutoP="+$('#minutoP').val()+"&minutoA="+$('#minutoA').val(),
			                 success: function(msg){

			                     $('#Aereo').html(msg);


			                 }
			             });
			         });
		 
		  
		  
		  $(document).ready(function(){
			  
				$.post("DaiAeroporto",function(data){
					
					$('#ARpartenza').html(data);
					$('#ARarrivo').html(data);
					
				});
				});

		  
		  
		  
		  
		 $( "#giornodopo" ).click(function() {
			 
			
			 
			 if ($("#giornodopo").is(':checked')) {
				
				 $("#giornodopo").val("1");
				 
				
				 
				  }else{
					  
					  
					  $("#giornodopo").val("0");
					  
				  }
			  
			});
		    	
		    });
	 

	 $(document).ready(function() {

         $("#oraA").click(function() {

              $("#Aereo").empty();
         });

         $("#oraP").click(function() {

              $("#Aereo").empty();
         });

         $("#minutoA").click(function() {

              $("#Aereo").empty();
         });


         $("#minutoP").click(function() {

              $("#Aereo").empty();
         });

     });
		var now = new Date();
	    var day = ("0" + now.getDate()).slice(-2);
	    var month = ("0" + (now.getMonth() + 1)).slice(-2);
	    var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
	    var traUnAnno= now.getFullYear()+1;
	    var massimo = traUnAnno+"-"+(month)+"-"+(day) ;

		document.getElementById("data").value = today;
		document.getElementById("data").min = today;
		document.getElementById("data").max = massimo;
	</script>


</body>
</html>