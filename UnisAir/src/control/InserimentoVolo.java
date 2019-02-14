package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AereoDAO;
import dao.VoloDAO;
import model.Volo;

/**
 * Servlet implementation class InserimentoVolo
 */
@WebServlet("/InserimentoVolo")
public class InserimentoVolo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InserimentoVolo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Volo v = new Volo();
		doGet(request, response);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String aeroportoPartenza = request.getParameter("ARpartenza");
	
		String aeroportoArrivo = request.getParameter("ARarrivo");
		String data = request.getParameter("data");
		String oraPartenza =request.getParameter("oraP");
		String minutoPartenza = request.getParameter("minutoP");
		String oraArrivo = request.getParameter("oraA");
		String minutoArrivo = request.getParameter("minutoA");
	
		
		
		
		
		double economy = Double.parseDouble(request.getParameter("economy"));
		double business =  Double.parseDouble(request.getParameter("business"));
		double premium =  Double.parseDouble(request.getParameter("premium"));
		int aereo = Integer.parseInt(request.getParameter("Aereo"));
		String giornodopo = request.getParameter("giornodp");
		v.setAeroportoPartenza(aeroportoPartenza);
		v.setAeroportoDestinazione(aeroportoArrivo);
		v.setData(data);
		v.setOraPartenza(oraPartenza+":"+minutoPartenza);
		v.setOraArrivo(oraArrivo+":"+minutoArrivo);
		
		v.setPrezzoEconomy(economy);
		v.setPrezzoBusiness(business);
		v.setPrezzoPremium(premium);
		v.setCod_aereo(aereo);
		
		
		
		
		
		if(giornodopo==null) {
			
			v.setNextDay(false);
			
		}else {
			
			v.setNextDay(true);
			
		}
		
		String durata = calcolaDurataVolo( Integer.parseInt(oraPartenza) ,  Integer.parseInt(minutoPartenza) ,  Integer.parseInt(oraArrivo),  Integer.parseInt(minutoArrivo),v.isNextDay() );
		v.setDurataVolo(durata);
		
		VoloDAO voloDao = new VoloDAO();
		AereoDAO ad=new AereoDAO();
		ArrayList<String> posti=ad.getCodPosti(aereo);
		voloDao.doSave(v,posti);
		request.getSession().setAttribute("mostra", true);
        int controllo = 2;
        request.getSession().setAttribute("controllo", controllo);
		RequestDispatcher d= request.getRequestDispatcher("AdminVisualizzaVoli");
		d.include(request, response);
	}
	
	private String calcolaDurataVolo(int oraPartenza , int minutoPartenza , int oraArrivo , int minutoArrivo, boolean b) {
		int tempoP = (oraPartenza*3600)+(minutoPartenza*60);
		int tempoA = (oraArrivo*3600)+(minutoArrivo*60);
		
		int durata = tempoA - tempoP;
	
		if(b) {
			
			durata = durata + 86400;
			
		}
		int minutes = durata / 60;
		int hours = minutes / 60;
	    minutes %= 60;
	    return String.format("%02d:%02d:%02d", hours, minutes,0);
	}

}

