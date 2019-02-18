package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AereoDAO;
import dao.VoloDAO;
import model.LowCost;
import model.Posto;
import model.Prenotazione;
import model.Utente;
import model.Volo;

/**
 * Servlet implementation class ScelgoVoloOfferta
 */
@WebServlet("/ScelgoVoloOfferta")
public class ScelgoVoloOfferta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScelgoVoloOfferta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente u= (Utente) request.getSession().getAttribute("userBean");
		String path=(String)request.getSession().getAttribute("path");
		if(u==null){
			request.getSession().setAttribute("denied2", true);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);//pagina corrente
			requestDispatcher.forward(request, response);

		}else{
			String email=u.getEmail();

			int quant;
			int codVolo=Integer.parseInt(request.getParameter("cod"));
			
			VoloDAO vd=new VoloDAO();
		//	Volo v=vd.doRetriveByCod(codVolo);
			LowCost l=vd.LowCostByCodVolo(codVolo);
			
			
				double minorPrezzo= l.getPrezzoEconomy()*l.getQuant();

				double sconto= (minorPrezzo*l.getPercentuale())/100;
				minorPrezzo= minorPrezzo- sconto;
				double val = minorPrezzo*100;
				val = (double)((int) val);
				minorPrezzo = val /100;
				l.setPrezzoEconomy(minorPrezzo);


				minorPrezzo= l.getPrezzoBusiness()*l.getQuant();
				sconto= (minorPrezzo*l.getPercentuale())/100;
				minorPrezzo= minorPrezzo- sconto;
				val = minorPrezzo*100;
				val = (double)((int) val);
				minorPrezzo = val /100;
				l.setPrezzoBusiness(minorPrezzo);

				minorPrezzo= l.getPrezzoPremium()*l.getQuant();
				sconto= (minorPrezzo*l.getPercentuale())/100;
				minorPrezzo= minorPrezzo- sconto;
				val = minorPrezzo*100;
				val = (double)((int) val);
				minorPrezzo = val /100;
				l.setPrezzoPremium(minorPrezzo);
				
				quant=l.getQuant();
			
			GregorianCalendar data=new GregorianCalendar();
			String giorno = "" + data.get(Calendar.DAY_OF_MONTH);
			String mese = "" + (data.get(Calendar.MONTH) + 1);
			String anno = "" + data.get(Calendar.YEAR);
			String dataV = anno+"-" + mese+"-"  + giorno;
			String ora = data.get(Calendar.HOUR_OF_DAY) + ":" + data.get(Calendar.MINUTE) + ":"+ data.get(Calendar.SECOND);
			Prenotazione p=new Prenotazione();
			p.setData(dataV);
			p.setEmail(email);
			p.setNumBiglietti(quant);
			p.setOra(ora);
			p.setVolo(l);
			request.getSession().setAttribute("prenotazioneA", p);
			AereoDAO ad=new AereoDAO();
			ArrayList<Posto> postiA=ad.getPostiPrenotabili(p.getVolo().getCodVolo());
			request.getSession().setAttribute("postiA", postiA);
			
			
	

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SelezionaPosto.jsp");
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
