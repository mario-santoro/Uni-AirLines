package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VoloDAO;

/**
 * Servlet implementation class CancellaVolo
 */
@WebServlet("/CancellaVolo")
public class CancellaVolo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancellaVolo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cod=Integer.parseInt(request.getParameter("cod"));
		
        VoloDAO vd = new VoloDAO();
        vd.doDelete(cod);
		request.getSession().setAttribute("mostra", true);
        int controllo = 1;
        request.getSession().setAttribute("controllo", controllo);
        RequestDispatcher d=request.getRequestDispatcher("AdminVisualizzaVoli");
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
