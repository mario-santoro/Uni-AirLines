<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="model.Volo"%>
<%@page import="model.Aereo"%>
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
<link rel="stylesheet" href="css/AdminPannello.css" type="text/css">
<link rel="icon" href="img/ms-icon-310x310.png" />
<script type="text/javascript">
      $(document).ready(function(){ 
            var mostra="${mostra}"
            if(mostra=="true"){
                      document.getElementById("overlay3").style.display = "block";
            }
    });
    function offval() {
        document.getElementById("overlay3").style.display = "none";
        }

    </script>
</head>
<body>
<%session.setAttribute("mostra", false); %>
	<%
		ArrayList<Volo> voli = (ArrayList<Volo>) session.getAttribute("voli");
	%>
	
	
	<!-- NAVBAR -->
	<nav>
		<a> <img src="img/logo.png" width="200" height="100" alt=""></a> 
		<div id="Logout">
			<span id="Admin">Admin</span><br>
				<a href="Logout"><button  class="btnR">Logout</button> </a>
		
		</div>


	</nav>



	<div class="spazio"></div>



	<div id="overlay">
		<div id="popOfferta">
		<span class="glyphicon glyphicon-remove" onclick="off()"></span>
			<h2>Volo Scontato</h2>
				<form action="InserimentoLowCost" enctype="multipart/form-data" method="post">
			<div class="popContent">
		
				<span class="special">Immagine:</span>  <input id="campoImg" type="file" name="immagine" placeholder="inserire immagine" required>
				<span class="special">Percentuale di sconto: </span>  <input id="campoPerc" name="percentuale" type="number" min="5" max="90" required>
				<br> 
				<span class="special">Per persone n:</span> <input id="campoNum"  name="quant" type="number" value="1" min="1" max="5" required>  
				<br> 
				<span class="special">Nome Città:</span> <input id="campoNum"  name="nome" type="text" placeholder="inserisci città destinazione" required>  
				<br> 
				<input type="number" name="cod" id="cod" hidden="true">
			</div>
			<div id="btnContent">
				<input class="btnR" value="Conferma" type="submit" >
				
			</div>
			</form>
		</div>
	</div>

<div id="overlay3">
        <div id="accessoerrato">

        <% session= request.getSession();
            String valore = String.valueOf(session.getAttribute("controllo"));
            if(valore != null){
            if(valore.equals("1")){
        %>
            <span onclick="offval()" id="x" class="glyphicon glyphicon-remove"></span>
            <h2>Cancellazione</h2>
                <span class="special">Cancellazione avvenuta con successo </span> 

                <br> 
                <%}     if(valore.equals("2")){
                    %><span onclick="offval()" id="x" class="glyphicon glyphicon-remove"></span>
                        <h2>Inserimento</h2>
                            <span class="special">Inserimento avvenuto con successo </span> 

                            <br> 
                            <%}     if(valore.equals("3")){
        %><span onclick="offval()" id="x" class="glyphicon glyphicon-remove"></span>
            <h2>Modifica</h2>
                <span class="special">Modifica avvenuta con successo </span> 

                <br> 
                <%} if(valore.equals("4")){
                    %><span onclick="offval()" id="x" class="glyphicon glyphicon-remove"></span>
                    <h2>Volo in offerta</h2>
                        <span class="special">operazione avvenuta con successo </span> 

                        <br> 
                        <%}     if(valore.equals("5")){
    %><span onclick="offval()" id="x" class="glyphicon glyphicon-remove"></span>
        <h2>Inserimento Aereo</h2>
            <span class="special">Aereo inserito con successo </span> 

            <br> 
            <%} if(valore.equals("6")){
                %><span onclick="offval()" id="x" class="glyphicon glyphicon-remove"></span>
                <h2>Errore Volo in offerta</h2>
                    <span class="special" style="color:red;">questo volo risulta gia scontato alle stesse condizioni </span> 

                    <br> 
                    <%}
            } %>

            </div>


    </div>

<div id="overlay2">
		<div id="popAereo">
		<span onclick="offAereo()"  class="glyphicon glyphicon-remove"></span>
			<h2>Aereo nuovo</h2>
			<form action="InserimentoAereo" method="post">
			<div class="popContent"> 
				<span class="special">Aereo codice: </span> <span class="special2" id="codaereonuovo">  </span> 
				<br>
				<span class="special">Nome aereo: </span>  <input id="NomeAereo" name="nome" type="text" required>
				<br>
				<span class="special">File per Premium: </span>  <input id="PostiPerPremium" name="premium" type="number" value="1" min="1" max="3" >
				<br> 
				<span class="special">File per Business: </span> <input id="PostiPerBusiness" name="business" type="number" value="3" min="3" max="5" >  
				<br> 
				<span class="special">File per Economy: </span> <input id="PostiPerEconomy" name="economy" type="number" value="5" min="5" max="8" >  
				<br> 
			</div>
			<div id="btnContent">
				<input class="btnR" value="Conferma" type="submit" >
			</div>
			</form>
		</div>
	</div>




	
	
		<aside>
				<h2>INSERIMENTO</h2>
				<span class="labelAside"><a href="AdminInsVolo.jsp"><span class="glyphicon glyphicon-plus"></span><span class="textLabel">Volo</span></a></span> <!-- c'è la pagina fai il collegamento -->
				<span class="labelAside" onclick="onAereo()"><span class="glyphicon glyphicon-plus"></span><span class="textLabel">Aereo</span></span> <!-- c'è la pagina fai il collegamento -->
		</aside>
	<div id="corpo">
	<%if(voli.size()==0){ %><h2 class="vuoto">Non ci sono voli disponibili al momento</h2><%} %>
	<%for(int i=0;i<voli.size();i++){ %>
		<div class="volo">
					<div class="infoVolo">
						Volo num: <span class="special"><%=voli.get(i).getCodVolo() %></span> 
						<br>
						 Voli da: <span class="special"><%=voli.get(i).getAeroportoPartenza() %></span> a: <span class="special"> <%=voli.get(i).getAeroportoDestinazione() %></span>
						 <br> 
						 in data: <span class="special"><%=voli.get(i).getData() %></span>
						 <br> 
						 <span class="orari"><%=voli.get(i).getOraPartenza().substring(0,5) %><span class="gl"> &#9866; &#9866; &#9992; </span><%=voli.get(i).getOraArrivo().substring(0,5) %><% if(voli.get(i).isNextDay()){   %><span class="special" id="nextDay">*</span><% }  %></span> 
						 <% if(voli.get(i).isNextDay()){   %><br>
						 <span class="special" id="nextDay">*L'ora di arrivo è da intendersi per il giorno dopo</span> 
						 <br><% }  %>
						 <br>  
						 Durata volo: <span class="special"><%=voli.get(i).getDurataVolo().substring(0,5) %></span>
						 <br> 
						 codice Aereo: <span class="special"><%=voli.get(i).getCod_aereo() %></span>
						 <br>
					</div>
					<div class="prezzo">
						<div class="prezzoContent">
							Economy: <span class="special"><%=voli.get(i).getPrezzoEconomy() %></span> &euro;
							<br> 
							Business: <span class="special"><%=voli.get(i).getPrezzoBusiness()%></span> &euro;
							<br> 
							Premium: <span class="special"><%=voli.get(i).getPrezzoPremium()%></span> &euro;
						</div>
					</div>
					<div class="bottoni">
						<a href="CancellaVolo?cod=<%=voli.get(i).getCodVolo() %>"><button  onclick="">Cancella</button> </a> 
						<a href="RiempioVolo?cod=<%=voli.get(i).getCodVolo() %>"><button  onclick="">Modifica</button> </a><!-- c'è la pagina -->
						<button  onclick="onLow(<%=voli.get(i).getCodVolo()%>)">Inserisci Sconto</button>
					</div>
		</div>
		<%} %>
	</div>




	<script type="text/JavaScript" src="js/jsTemplate.js"></script>

</body>
<script>

function onLow( value) {
    document.getElementById("overlay").style.display = "block";
    document.getElementById("cod").value=value;
}
	$(document).ready(function(){
  $(".glyphicon-remove").click(function(){
    $("#overlay").hide();
  });
  
});
	
	
	$(document).ready(function(){
		$.post("CodMaxAereo",function(data){
			
			$("#codaereonuovo").html(data);
		});
		});
	
	</script>
</html>