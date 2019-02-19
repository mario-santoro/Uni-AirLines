package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Passeggero;
import model.Prenotazione;

/**
 * Servlet implementation class SalvaPasseggeri
 */
@WebServlet("/SalvaPasseggeri")
public class SalvaPasseggeri extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalvaPasseggeri() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int count=(int)request.getSession().getAttribute("count");
		String[] postiA = request.getParameterValues("stringa");
		String Checked=(String) request.getSession().getAttribute("Andata/Ritorno");
		Prenotazione pA=(Prenotazione)request.getSession().getAttribute("prenotazioneA");
		ArrayList<Passeggero> passeggeriA =new ArrayList<Passeggero>();
		String codF=request.getParameter("CodiceFiscale");
		String nome=request.getParameter("Nome");
		String cognome=request.getParameter("Cognome");
		String eta=request.getParameter("Eta");
		String CAP=request.getParameter("Cap");
		String doc=request.getParameter("Documento");
		String ndoc=request.getParameter("NumeroDocumento");
		String nazione=request.getParameter("Nazione");
		String citta=request.getParameter("Citta");
		String indirizzo=request.getParameter("Indirizzo");
		pA.getPasseggeri().get(count).setCodFiscale(codF);
		pA.getPasseggeri().get(count).setNome(nome);
		pA.getPasseggeri().get(count).setCognome(cognome);
		pA.getPasseggeri().get(count).setEta(Integer.parseInt(eta));
		pA.getPasseggeri().get(count).setCap(Integer.parseInt(CAP));
		pA.getPasseggeri().get(count).setTipoDocumento(doc);
		pA.getPasseggeri().get(count).setNumeroDocumento(ndoc);
		pA.getPasseggeri().get(count).setPaese(nazione);
		pA.getPasseggeri().get(count).setCitta(citta);
		pA.getPasseggeri().get(count).setIndirizzo(indirizzo);
		request.getSession().setAttribute("prenotazioneA", pA);
	
		if(Checked.equals("a/r")){

			String[] postiR = request.getParameterValues("stringaR");
			Prenotazione pR=(Prenotazione)request.getSession().getAttribute("prenotazioneR");
			ArrayList<Passeggero> passeggeriR =new ArrayList<Passeggero>();

		
			pR.getPasseggeri().get(count).setCodFiscale(codF);
			pR.getPasseggeri().get(count).setNome(nome);
			pR.getPasseggeri().get(count).setCognome(cognome);
			pR.getPasseggeri().get(count).setEta(Integer.parseInt(eta));
			pR.getPasseggeri().get(count).setCap(Integer.parseInt(CAP));
			pR.getPasseggeri().get(count).setTipoDocumento(doc);
			pR.getPasseggeri().get(count).setNumeroDocumento(ndoc);
			pR.getPasseggeri().get(count).setPaese(nazione);
			pR.getPasseggeri().get(count).setCitta(citta);
			pR.getPasseggeri().get(count).setIndirizzo(indirizzo);
			request.getSession().setAttribute("prenotazioneR", pR);
		}
		count++;
		
		if(count<pA.getNumBiglietti()){
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("InserimentoDatiAnagrafici.jsp");//pagina corrente
		requestDispatcher.forward(request, response);
		}else{
			request.getSession().setAttribute("index", 0);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("SelBagaglio.jsp");//pagina corrente
		requestDispatcher.forward(request, response);
		}
	}

}
