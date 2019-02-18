package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PasseggeroDAO;
import dao.PrenotazioneDAO;
import model.Passeggero;
import model.Prenotazione;

/**
 * Servlet implementation class Checkin
 */
@WebServlet("/Checkin")
public class Checkin extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String codPrenotazione = request.getParameter("codice");
		ArrayList<Passeggero> passeggeriVolo = new ArrayList<Passeggero>();
		Prenotazione prenotazione = new Prenotazione();
		PasseggeroDAO dao = new PasseggeroDAO();
		PrenotazioneDAO pdao = new PrenotazioneDAO();
		prenotazione = pdao.doRetrivePrenotazioneById(Integer.parseInt(codPrenotazione));
		
		passeggeriVolo = dao.doRertivePasseggeriByCodPrenotazione(Integer.parseInt(codPrenotazione));
		
		request.getSession().setAttribute("codPrenotazione", codPrenotazione);
		request.getSession().setAttribute("prenotazione", prenotazione);
		request.getSession().setAttribute("passeggeriVolo", passeggeriVolo);
		RequestDispatcher d= request.getRequestDispatcher("checkin.jsp");
		d.forward(request, response);
		
	}

}
