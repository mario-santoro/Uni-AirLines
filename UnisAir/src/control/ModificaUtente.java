package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UtenteDAO;
import model.Utente;

/**
 * Servlet implementation class ModificaUtente
 */
@WebServlet("/ModificaUtente")
public class ModificaUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaUtente() {
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
		// 
		doGet(request, response);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		Utente utente = new Utente();
		UtenteDAO uDao = new UtenteDAO();
		utente = (Utente)request.getSession().getAttribute("userBean");
		utente = uDao.doRetrieveByKey(utente.getEmail(), utente.getPassword());
		
		
		utente.setPassword(request.getParameter("Password"));
		//confermaPsw = request.getParameter("ConfermaPassword");
		utente.setTipoDocumento(request.getParameter("Documento"));
		utente.setNumDocumento(request.getParameter("NumeroDocumento"));
	
		utente.setScadenzaCarta(request.getParameter("scadenza"));
		utente.setNumCartaCredito(Long.parseLong(request.getParameter("numcarta")));
		utente.setCVC(Integer.parseInt(request.getParameter("cvc")) );
		uDao.doUpdate(utente);
		Cookie pswcookie = new Cookie("psw", utente.getPassword());
		response.addCookie(pswcookie);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");//pagina corrente
		requestDispatcher.forward(request, response);
	}
	
	

}
