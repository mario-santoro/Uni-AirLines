package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UtenteDAO;
import model.Utente;

/**
 * Servlet implementation class RegistrazioneUtente
 */
@WebServlet("/RegistrazioneUtente")
public class RegistrazioneUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrazioneUtente() {
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
		String nome=request.getParameter("Nome");
		String cognome=request.getParameter("Cognome");
		String documento=request.getParameter("Documento");
		String email=request.getParameter("Email");
        String password=request.getParameter("Password");
        String num_documento=request.getParameter("NumeroDocumento");

        Utente u = new Utente(email,password,nome,cognome,documento,num_documento);


        RequestDispatcher d;
        UtenteDAO ud = new UtenteDAO();
        boolean b=ud.doSave(u);
        if(b){

            HttpSession s=request.getSession();
            s.setAttribute("utente",u);

            d = request.getRequestDispatcher("Login");

            d.forward(request, response);

        }else{
            request.getSession().setAttribute("err", true);
            d=request.getRequestDispatcher("Registrazione.jsp");
            d.forward(request, response);
		
	}

	}
	
}
