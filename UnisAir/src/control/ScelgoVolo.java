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
 * Servlet implementation class ScelgoVolo
 */
@WebServlet("/ScelgoVolo")
public class ScelgoVolo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ScelgoVolo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			Volo v=vd.doRetriveByCod(codVolo);
			LowCost l=vd.LowCostByCodVolo(codVolo);
		
				quant=(int)request.getSession().getAttribute("Passeggeri");
			
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
			p.setVolo(v);
			request.getSession().setAttribute("prenotazioneA", p);
			AereoDAO ad=new AereoDAO();
			ArrayList<Posto> postiA=ad.getPostiPrenotabili(p.getVolo().getCodVolo());
			request.getSession().setAttribute("postiA", postiA);
	
			
			
			String Checked=(String) request.getSession().getAttribute("Andata/Ritorno");
			if(Checked.equals("a/r")){
				int codVoloRitorno=Integer.parseInt(request.getParameter("codRitorno"));
				vd=new VoloDAO();
				Volo v2=vd.doRetriveByCod(codVoloRitorno);
				Prenotazione p2=new Prenotazione();
				p2.setData(dataV);
				p2.setEmail(email);
				
				p2.setNumBiglietti(quant);
				p2.setOra(ora);
				p2.setVolo(v2);
				request.getSession().setAttribute("prenotazioneR", p2);
				ArrayList<Posto> postiR=ad.getPostiPrenotabili(p2.getVolo().getCodVolo());
				request.getSession().setAttribute("postiR", postiR);
			}

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("SelezionaPosto.jsp");//pagina corrente
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
