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
 * Servlet implementation class SalvoBagagli
 */
@WebServlet("/SalvoBagagli")
public class SalvoBagagli extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalvoBagagli() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String Checked=(String) request.getSession().getAttribute("Andata/Ritorno");
		Prenotazione pA=(Prenotazione)request.getSession().getAttribute("prenotazioneA");
		int index=(int)request.getSession().getAttribute("index");
		double prezzo=Double.parseDouble(request.getParameter("prezzo"));
		int quantBag=Integer.parseInt(request.getParameter("quanTot"));
		pA.getPasseggeri().get(index).setNumBagaglio(quantBag);
		pA.getPasseggeri().get(index).setTariffaBagaglio(prezzo);
		pA.setNumBagagliTot(pA.getNumBagagliTot()+quantBag);
		pA.setPrezzoTotale(pA.getPrezzoTotale()+prezzo);
		
		request.getSession().setAttribute("prenotazioneA", pA);
		if(Checked.equals("a/r")){
			Prenotazione pR=(Prenotazione)request.getSession().getAttribute("prenotazioneR");
			pR.getPasseggeri().get(index).setNumBagaglio(quantBag);
			pR.getPasseggeri().get(index).setTariffaBagaglio(prezzo);
			pR.setNumBagagliTot(pR.getNumBagagliTot()+quantBag);
			pR.setPrezzoTotale(pR.getPrezzoTotale()+prezzo);
			request.getSession().setAttribute("prenotazioneR", pR);
		}
		index++;
	request.getSession().setAttribute("index",index);
		if(index<pA.getNumBiglietti()){
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("SelBagaglio.jsp");//pagina corrente
		requestDispatcher.forward(request, response);
		}else{
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("MetodiPagamento.jsp");//pagina corrente
		requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
