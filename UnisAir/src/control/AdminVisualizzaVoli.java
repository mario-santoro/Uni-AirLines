package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VoloDAO;
import model.Volo;
/**
 * Servlet implementation class AdminVisualizzaVoli
 */
@WebServlet("/AdminVisualizzaVoli")
public class AdminVisualizzaVoli extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminVisualizzaVoli() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Volo> voli=new ArrayList<Volo>();
		GregorianCalendar data=new GregorianCalendar();
		String giorno = "" + data.get(Calendar.DAY_OF_MONTH);
		String mese = "" + (data.get(Calendar.MONTH) + 1);
		String anno = "" + data.get(Calendar.YEAR);
		String dataV = anno+"-" + mese+"-"  + giorno;
		String ora = data.get(Calendar.HOUR_OF_DAY) + ":" + data.get(Calendar.MINUTE) + ":"+ data.get(Calendar.SECOND);
		VoloDAO vd= new VoloDAO();
		
		voli=vd.showAll(dataV,ora);
		request.getSession().setAttribute("voli", voli);
		RequestDispatcher d= request.getRequestDispatcher("AdminPannello.jsp");
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
