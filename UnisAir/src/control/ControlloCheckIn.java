package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Passeggero;
import model.Prenotazione;

/**
 * Servlet implementation class ControlloCheckIn
 */
@WebServlet("/ControlloCheckIn")
public class ControlloCheckIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlloCheckIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i;
		String[] Controllo = request.getParameterValues("stringa");
		ArrayList<Passeggero> passeggeriVolo = (ArrayList<Passeggero>)request.getSession().getAttribute("passeggeriVolo");
		Prenotazione prenotazione = (Prenotazione)request.getSession().getAttribute("prenotazione");
		if(Controllo != null){
			for(String a : Controllo){
				for(i = 0;i<passeggeriVolo.size();i++){
					String codFiscale = passeggeriVolo.get(i).getCodFiscale();
					if(a.equals(codFiscale)){
						passeggeriVolo.remove(i);
						prenotazione.getPasseggeri().remove(i);
					}
				}
			}
		}
		request.getSession().setAttribute("passeggeriVolo", passeggeriVolo);
		request.getSession().setAttribute("prenotazione", prenotazione);
		RequestDispatcher d= request.getRequestDispatcher("CartaImbarco.jsp");
		d.forward(request, response);
		
		
	}
}
