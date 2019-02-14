package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AereoDAO;

/**
 * Servlet implementation class VerificaAereo
 */
@WebServlet("/VerificaAereo")
public class VerificaAereo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerificaAereo() {
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
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String data = request.getParameter("data");
        String oraP =request.getParameter("oraP");
        String oraA = request.getParameter("oraA"); 
        String minutoP =request.getParameter("minutoP");
        String minutoA = request.getParameter("minutoA"); 
        String orarioA = oraA+":"+minutoA;
        String orarioP = oraP+":"+minutoP;
        AereoDAO a = new AereoDAO();
        ArrayList<Integer> lista = a.availableAir(data, orarioP, orarioA);
        for(int x : lista) {
        out.print(
                "<option value='"+x+"'>Aereo codice:"+x+"</option>"
            );
        }
    }

}
