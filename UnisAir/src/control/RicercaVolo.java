package control;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class RicercaVolo
 */
@WebServlet("/RicercaVolo")
public class RicercaVolo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RicercaVolo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	VoloDAO v=new VoloDAO();
	String Checked=request.getParameter("a/r");
	request.getSession().setAttribute("Andata/Ritorno", Checked);
	String AereoportoPartenza=request.getParameter("ARpartenza");
	String AereoportoDestinazione=request.getParameter("ARarrivo");
	String dataPartenzaVolo=request.getParameter("dataPartenzaVolo");
	String dataRitornoVolo=request.getParameter("datRitorno");
	int PasseggeriAdulti=Integer.parseInt(request.getParameter("numAdulti"));
	int PasseggeriBambini=Integer.parseInt(request.getParameter("numBambini"));
	int Passeggeri=PasseggeriAdulti+PasseggeriBambini;
	if(Checked.equals("a")) {
	ArrayList<Volo> voliAndata=new ArrayList<Volo>();
	
	voliAndata=v.doRetrieveByAereoportiEdataSoloAndata(AereoportoPartenza, AereoportoDestinazione, dataPartenzaVolo);
	request.getSession().setAttribute("voliAndata", voliAndata);
	request.getSession().setAttribute("AereoportoPartenza", AereoportoPartenza);
	request.getSession().setAttribute("AereoportoDestinazione", AereoportoDestinazione);
	request.getSession().setAttribute("Data", dataPartenzaVolo);
	request.getSession().setAttribute("DataRitorno", dataRitornoVolo );
	request.getSession().setAttribute("Passeggeri", Passeggeri);
	RequestDispatcher d= request.getRequestDispatcher("ricercaView.jsp");
	d.forward(request, response);
	
	}
	else {
		
		ArrayList<Volo> voliAndata=new ArrayList<Volo>();
		ArrayList<Volo> voliRitorno=new ArrayList<Volo>();
		voliAndata=v.doRetrieveByAereoportiEdataSoloAndata(AereoportoPartenza, AereoportoDestinazione, dataPartenzaVolo);
		voliRitorno=v.doRetrieveByAereoportiEdataSoloAndata(AereoportoDestinazione, AereoportoPartenza, dataRitornoVolo);
		request.getSession().setAttribute("voliAndata", voliAndata);
		request.getSession().setAttribute("voliRitorno", voliRitorno);
		request.getSession().setAttribute("AereoportoPartenza", AereoportoPartenza);
		request.getSession().setAttribute("AereoportoDestinazione", AereoportoDestinazione);
		request.getSession().setAttribute("Data", dataPartenzaVolo);
		request.getSession().setAttribute("DataRitorno", dataRitornoVolo );
		request.getSession().setAttribute("Passeggeri", Passeggeri);
		RequestDispatcher d= request.getRequestDispatcher("ricercaView.jsp");
		d.forward(request, response);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
