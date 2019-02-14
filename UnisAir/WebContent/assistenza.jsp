<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 <link href="css/assistenza.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/template.css" type="text/css">

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
  <div class="spazio"></div>

<div id="overlay3">
		<div id="accessoerrato">
		<span onclick="offErr()" id="x" class="glyphicon glyphicon-remove"></span>
			<h2>Credenziali Errate</h2>
			
				<span class="special">Email o Password errate, riprova. </span> 
			 
				<br> 
			</div>
		
		
	</div>
    
  

	

<main>
	<div id="infoContainer">
		<div class="info">
			<h2>Domande frequenti</h2>
			<span class="domanda">Quali sono i dati dei passeggeri di cui dispone UnisAir?</span><br>
			<span class="risposta">I dati di cui dispone UnisAir sono quelli necessari per la prestazione del servizio. Si tratta ad esempio delle informazioni contenute nel passaporto o documento d'identità, eventuali servizi di assistenza speciale richiesti, dati di pagamento e informazioni per il contatto.</span><br>
			<span class="domanda">A chi verranno resi noti i dati?</span><br>
			<span class="risposta">I dati potrebbero essere forniti alle autorità di frontiera, legalmente autorizzate a riceverli, che potrebbero condividerli con altri enti allo scopo di prevenire e combattere il terrorismo e altri atti criminali.</span><br>
			<span class="domanda">Quali sono i paesi in cui la legge consente di accedere ai dati personali?</span><br>
			<span class="risposta">UnisAir è tenuta a registrare i dati contenuti nei passaporti o nei documenti di identità emessi dai paesi UE/SEE di tutti i passeggeri che partono dal Regno Unito, dall'Irlanda e dal Marocco diretti verso la Spagna o le Canarie e le Baleari, Portugal o da e verso il Marocco da e verso il Regno Unito.</span><br>
			<span class="domanda">Come verranno utilizzati i dati dei passeggeri da parte della autorità?</span><br>
			<span class="risposta">I dati dei passeggeri potrebbero essere utilizzati al fine di far rispettare la legge e prevenire il crimine.</span><br>
			<span class="domanda">È possibile fornire queste informazioni online?</span><br>
			<span class="risposta">Tali informazioni vengono raccolte automaticamente al momento del check-in online.</span><br>
		</div>
		<div class="info" id="checkin">
			<h2>Check-in Online</h2>
			<p class="tutorial"><span class="testo"><img class="immagineTutorial" src="img/check.jpg" width="300" height="120">Effettuare il check-in online è facile e veloce attraverso il nostro sito. L'opzione è disponibile da tre giorni prima della partenza e bastano pochi click nella nostra piattaforma, accedendo alla sezione <span class="special">Storico Acquisti</span> è necessario soltanto verificare che i dati
			 riportati dal modulo siano corretti e procedere con il check-in tramite l'apposito bottone <span class="special">Prosegui check-in</span>.</span></p>
		</div>
		<div class="info" id="pagamento">
			<h2>Metodi di pagamento</h2>
			<p class="tutorial"><span class="testo"><img class="immagineTutorial" src="img/pagamento.png" width="300" height="120">Pagare non è mai stato così semplice!<br> Nel processo di acquisto del biglietto, infatti, il pagamento viene effettuato con carta di credito. Le informazioni richieste per procedere tramite questa metodologia di pagamento sono il <span class="special">Nome Proprietario</span>, ovvero l'intestatario della carta, la <span class="special">Data di Scadenza</span> della carta oltre la quale non ha più validità e il codice di sicurezza <span class="special">CVC/CVV</span>. Tali dati verranno gestiti secondo le normative della privacy accordate nel momento della registrazione.</span></p>
		</div>
	  <div class="info">
			<h2>Bagaglio</h2>
		<p class="tutorial">Puoi portare UN solo bagaglio a mano per persona a bordo. Quanto basta per un paio di notti fuori casa! Non ci sono limiti di peso ma devi essere in grado di sollevarlo e riporlo nell'alloggiamento superiore.<br>
			Lo spazio a bordo è limitato e non è possibile collocare più di 70 bagagli a mano negli alloggiamenti superiori, che quindi si riempiono velocemente. Tutti i rimanenti bagagli a mano verranno alloggiati nella stiva e possono essere ritirati al terminal dal nastro trasportatore all'arrivo.<br>
			Verifichiamo le dimensioni dei bagagli prima dell'imbarco. Se superano le dimensioni massime consentite di 56x45x25 cm (maniglie e ruote comprese), non possono essere portati in cabina e dovremo imbarcarli in stiva addebitandoti i costi.</p>
			<div class="contentBagaglio">
		  		<img src="img/bagaglio-a-mano.png" width="140" height="140" alt=""/> 
		  		<div class="spiegazioneBagaglio">
		  			<h3>Bagaglio a mano</h3>
		  			Dimensioni massime 56x45x25 cm, comprese maniglie e ruote. I bagagli a mano devono essere sistemati nei vani portabagagli o, se sono sufficientemente piccoli, sotto il sedile di fronte.
		  		</div>
		  	</div>
		  	<div class="contentBagaglio">
		  		<img src="img/bagagli/valiigia15kg.jpg" width="140" height="140" alt=""/> 
		  		<div class="spiegazioneBagaglio">
		  			<h3>Bagaglio da stiva(15 Kg o meno)</h3>
		  			Bagaglio trasportato in stiva e consegnato prima dell'ingresso al gate. La seguente opzione consente il trasporto di un bagaglio con un peso minore o uguale a 15 Kg.
		  		</div>
		  	</div>
		  	<div class="contentBagaglio">
		  		<img src="img/bagagli/15e25.jpg" width="140" height="140" alt=""/> 
		  		<div class="spiegazioneBagaglio">
		  			<h3>Bagaglio da stiva(Tra 15 e 25 Kg)</h3>
		  			Bagaglio trasportato in stiva e consegnato prima dell'ingresso al gate. La seguente opzione consente il trasporto di un bagaglio con un peso compreso tra i 15 e 25 Kg.
		  		</div>
		  	</div>
		  	<div class="contentBagaglio">
		  		<img src="img/bagagli/valigia25kg.jpg" width="140" height="140" alt=""/> 
		  		<div class="spiegazioneBagaglio">
		  			<h3>Bagaglio da stiva(Superiore ai 25 Kg)</h3>
		  			Bagaglio trasportato in stiva e consegnato prima dell'ingresso al gate. La seguente opzione consente il trasporto di un bagaglio con un peso superiore a 25 Kg.
		  		</div>
		  	</div>
	  </div>
	  <div class="info">
			<h2>Ritardi e cancellazioni</h2>
		<p class="tutorial">Siamo consapevoli che ritardi e cancellazioni dei voli siano incredibilmente frustranti per cui, nel caso accadano, faremo del nostro meglio per portarti a destinazione e aiutarti a fare le scelte giuste per arrivare dove devi.<br>
		Nel caso di posticipo partenza del volo sarai avvertito via e-mail e avrai la possibilità di recedere l'acquisto del biglietto nella sezione <span class="special">Storico Acquisti</span> del nostro sito web con conseguente rimborso sulla carta con cui hai effettuato il pagamento.<br>
		Se, sfortunatamente, il tuo volo fosse cancellato, anche i questo caso sarai avvertito via e-mail e avrai diritto al rimborso del biglietto.</p>
			
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

</body>
</html>