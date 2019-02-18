package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AereoDAO;
import model.Aereo;
import model.Posto;

/**
 * Servlet implementation class InserimentoAereo
 */
@WebServlet("/InserimentoAereo")
public class InserimentoAereo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InserimentoAereo() {
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

		int e,b,p;
		e=5;
		b=3;
		p=1;
		Aereo a=new Aereo();
	int i,j,count=0;
		ArrayList <Posto> posti= new ArrayList<Posto>();
		Posto posto=null;
		for( i=0;i<p;i++){
			for( j=1;j<=6;j++){
				
				posto=new Posto();
				String stringValueOf = String.valueOf(printChar(count));
				posto.setNumPosto(stringValueOf+j);
				posto.setTipologia("premium");
			posti.add(posto);
			
		
		}
			count++;
		}
		for( i=0;i<b;i++){
			for( j=1;j<=6;j++){
				posto=new Posto();
				String stringValueOf = String.valueOf(printChar(count));
				posto.setNumPosto(stringValueOf+j);
				posto.setTipologia("business");
				posti.add(posto);
				
		}
			count++;
		}
		for(i=0;i<e;i++){
			for( j=1;j<=6;j++){
		
				posto=new Posto();
				String stringValueOf = String.valueOf(printChar(count));
				posto.setNumPosto(stringValueOf+j);
				posto.setTipologia("economy");
				posti.add(posto);
				
		}
			count++;
		}
		a.setNome(request.getParameter("nome"));
		
		a.setPosti(posti);
		AereoDAO ad=new AereoDAO();
		ad.doSave(a);
		request.getSession().setAttribute("mostra", true);
        int controllo = 5;
        request.getSession().setAttribute("controllo", controllo);
		RequestDispatcher d= request.getRequestDispatcher("AdminVisualizzaVoli");
		d.forward(request, response);
	}
	private static char printChar(int numP){
		int mod=numP%21;
		mod+=65;
		
		char lettera=(char)mod;
		
		return lettera;
	}
}
