package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        
		// per fare in modo che un cookie venga cancellato dal browser
		// bisogna ri-crearlo con valore "", dargli MaxAge pari a 0 e rinviarglielo.
			Cookie email = new Cookie("email", "");
	        email.setMaxAge(0);
	        response.addCookie(email);
	        
	        Cookie psw = new Cookie("psw", "");
	        psw.setMaxAge(0);
	        response.addCookie(psw);
	        
	        request.getSession().invalidate();
	        // reinvio anche il form di login
	        response.sendRedirect("index.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
