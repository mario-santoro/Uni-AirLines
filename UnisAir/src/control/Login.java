package control;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;
import dao.UtenteDAO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		}

			
		private Utente getUsrPsw(HttpServletRequest request) {
			
			Utente ub = null;
			String email = null, psw = null;

			Cookie[] c = request.getCookies();   // tramite cookie
			if (c!=null) { 
				for(int i=0;i<c.length;i++) {
					if (c[i].getName().equals("email")) 
						email = c[i].getValue();
					if (c[i].getName().equals("psw")) 
						psw = c[i].getValue();	
				}
			} 	
		Utente u=(Utente)request.getSession().getAttribute("utente");
			if(u!=null){
				email=u.getEmail();
				psw=u.getPassword();
			}
			
			if (email == null || psw == null){		// se recupero tramite cookie fallisce, allora tramite parametri	
				String temp;                        
				temp = request.getParameter("email");
				if (temp!= null) {
					email = temp;
					temp = request.getParameter("psw");   
					if (temp!= null) {
						psw = temp;
					}
				}
			}
			
		
			if (email != null && psw != null)    // se recupero ha avuto successo riempio bean
				 
				 ub = new Utente();  
				ub.setEmail(email);
				ub.setPassword(psw);
			return ub;
		}
			
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String path=(String) request.getSession().getAttribute("path");
		
		// recupero login e password e li memorizzo in user se presenti
		Utente user = getUsrPsw(request);

		if (user == null)     // no login e/o no password -> redirigo a login form 
			response.sendRedirect(path);    // non ho bisogno di mandargli parametri. Il nome login.jsp si vedrà nel browser
		else {
			try{
				UtenteDAO ubd = new UtenteDAO();
				Utente ub = ubd.doRetrieveByKey(user.getEmail(), user.getPassword());
				if (ub==null) {    // login e/o password sbagliati -> chiamo login form  con messaggio errore
									// il nome login.jsp non si vedrà nel browser
					request.getSession().setAttribute("denied", true);
					RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);//pagina corrente
					requestDispatcher.forward(request, response);
				}else {
					// l'utente è ammesso al sito: inserisco dati di login in cookies e do risposta
					
					Cookie emcookie = new Cookie("email", ub.getEmail());
					Cookie pswcookie = new Cookie("psw", ub.getPassword());
					response.addCookie(emcookie);
					response.addCookie(pswcookie);
					
					HttpSession s=request.getSession();
					s.setAttribute("userBean", ub);  // l'output ha bisogno di queste informazioni
				
					if(ub.getEmail().equals("unisair@outlook.it")&&ub.getPassword().equals("admin")){
						Cookie email = new Cookie("email", "");
				        email.setMaxAge(0);
				        response.addCookie(email);
				        
				        Cookie psw = new Cookie("psw", "");
				        psw.setMaxAge(0);
				        response.addCookie(psw);
				        request.getSession().invalidate();
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminVisualizzaVoli");//servlet per stampare i voli
						requestDispatcher.forward(request, response);
					}else{
					RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);//pagina corrente
					requestDispatcher.forward(request, response);
				
					}
				}
			}
			catch(Exception e)
			{  
				request.setAttribute("exception", e);
			
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("exception.jsp");
				requestDispatcher.forward(request, response);
			}
		}
	}

}
