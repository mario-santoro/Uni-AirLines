package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UtenteDAO;
import model.Utente;

/**
 * Servlet implementation class ScelgoPagamento
 */
@WebServlet("/ScelgoPagamento")
public class ScelgoPagamento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScelgoPagamento() {
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
		Utente u=(Utente) request.getSession().getAttribute("userBean");
		String tipoP=request.getParameter("tipoP");
		request.getSession().setAttribute("tipoP",tipoP);
		String data= request.getParameter("scadenza");
		int cvc=Integer.parseInt(request.getParameter("cvc"));
		long numero=Long.parseLong(request.getParameter("numero"));
		u.setScadenzaCarta(data);
		u.setNumCartaCredito(numero);
		u.setCVC(cvc);
		UtenteDAO ud=new UtenteDAO();
		ud.doUpdate(u);
		RequestDispatcher d=request.getRequestDispatcher("RiepilogoPrenotazione.jsp");
		d.forward(request, response);
		
		
	}

}
