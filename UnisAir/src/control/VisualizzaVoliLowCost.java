package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VoloDAO;
import model.LowCost;


/**
 * Servlet implementation class VisualizzaVoliLowCost
 */
@WebServlet("/VisualizzaVoliLowCost")
public class VisualizzaVoliLowCost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisualizzaVoliLowCost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		VoloDAO vd=new VoloDAO();
		ArrayList<LowCost> l;
		GregorianCalendar data=new GregorianCalendar();
		String giorno = "" + data.get(Calendar.DAY_OF_MONTH);
		String mese = "" + (data.get(Calendar.MONTH) + 1);
		String anno = "" + data.get(Calendar.YEAR);
		String dataV = anno+"-" + mese+"-"  + giorno;
		String ora = data.get(Calendar.HOUR_OF_DAY) + ":" + data.get(Calendar.MINUTE) + ":"+ data.get(Calendar.SECOND);
		l=vd.showAllLowCost(dataV, ora);
		response.getWriter().append("[");
		int i=0;
		
		double minorPrezzo=0.00;
		double sconto=0.00;
		
		for ( i = 0; i < l.size(); i++) {
			minorPrezzo= l.get(i).getPrezzoEconomy()*l.get(i).getQuant();
			
			sconto= (minorPrezzo*l.get(i).getPercentuale())/100;
			minorPrezzo= minorPrezzo- sconto;
			double val = minorPrezzo*100;
			val = (double)((int) val);
			minorPrezzo = val /100;
		
			if(i==l.size()-1){

				response.getWriter().append("{\"nome\":\""+l.get(i).getNome()+"\",\"prezzo\":\""+minorPrezzo+"\",\"immagine\":\""+l.get(i).getImg()+"\",\"quant\":\""+l.get(i).getQuant()+"\",\"codVolo\":\""+l.get(i).getCodVolo()+"\"}");
			
				
			}else{
			response.getWriter().append("{\"nome\":\""+l.get(i).getNome()+"\",\"prezzo\":\""+minorPrezzo+"\",\"immagine\":\""+l.get(i).getImg()+"\",\"quant\":\""+l.get(i).getQuant()+"\",\"codVolo\":\""+l.get(i).getCodVolo()+"\"},");
			}
			
		}


		
		response.getWriter().append("]");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
