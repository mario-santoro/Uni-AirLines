package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VoloDAO;
import model.Volo;

/**
 * Servlet implementation class ModificaVolo
 */
@WebServlet("/ModificaVolo")
public class ModificaVolo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaVolo() {
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
		doGet(request, response);
		Volo v = (Volo) request.getSession().getAttribute("volo");
		v.setAeroportoPartenza(request.getParameter("ARpartenza"));
		
		v.setAeroportoDestinazione(request.getParameter("ARarrivo"));
		v.setData(request.getParameter("data"));
		
		String oraPartenza =request.getParameter("oraP");
		String minutoPartenza = request.getParameter("minutoP");
		String oraArrivo = request.getParameter("oraA");
		String minutoArrivo = request.getParameter("minutoA");
	
		String giornodopo = request.getParameter("giornodp");
		if(giornodopo==null) {
			
			v.setNextDay(false);
			
		}else {
			
			v.setNextDay(true);
			
		}
		
		
		
		
		v.setOraPartenza(oraPartenza+":"+minutoPartenza);
		v.setOraArrivo(oraArrivo+":"+minutoArrivo);
		v.setPrezzoEconomy(Double.parseDouble(request.getParameter("economy")));
		v.setPrezzoBusiness(Double.parseDouble(request.getParameter("business")));
		v.setPrezzoPremium(Double.parseDouble(request.getParameter("premium")));
		v.setCod_aereo(Integer.parseInt(request.getParameter("Aereo")));
		String durata = calcolaDurataVolo( Integer.parseInt(oraPartenza) ,  Integer.parseInt(minutoPartenza) ,  Integer.parseInt(oraArrivo),  Integer.parseInt(minutoArrivo),v.isNextDay() );
		v.setDurataVolo(durata);
	
		VoloDAO voloDao = new VoloDAO();
		voloDao.doUpdate(v);
		request.getSession().setAttribute("mostra", true);
        int controllo = 3;
        request.getSession().setAttribute("controllo", controllo);
		RequestDispatcher d= request.getRequestDispatcher("AdminVisualizzaVoli");
		d.forward(request, response);
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
