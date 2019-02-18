package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AeroportoDAO;
import model.Aeroporto;

/**
 * Servlet implementation class InserimentoAeroporto
 */
@WebServlet("/InserimentoAeroporto")
public class InserimentoAeroporto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InserimentoAeroporto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String s = request.getParameter("aeroportonew");
		Aeroporto a = new Aeroporto(s);
		AeroportoDAO a1 = new AeroportoDAO();
		a1.doSave(a);
		RequestDispatcher d= request.getRequestDispatcher("AdminPannello.jsp");
		d.forward(request, response);
		
	}

}
