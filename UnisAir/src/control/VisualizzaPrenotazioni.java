package control;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PrenotazioneDAO;
import model.Prenotazione;
import model.Utente;

/**
 * Servlet implementation class VisualizzaPrenotazioni
 */
@WebServlet("/VisualizzaPrenotazioni")
public class VisualizzaPrenotazioni extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizzaPrenotazioni() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Prenotazione> p=null;
		PrenotazioneDAO pd=new PrenotazioneDAO();
		Utente u=(Utente) request.getSession().getAttribute("userBean");
		
		p=pd.showAllReservations(u.getEmail());
		
		
		
		request.getSession().setAttribute("prenotazioni",p);
		RequestDispatcher d= request.getRequestDispatcher("Storico.jsp");
		d.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
