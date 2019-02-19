package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PasseggeroDAO;
import dao.PrenotazioneDAO;
import model.Prenotazione;

/**
 * Servlet implementation class SalvaPrenotazione
 */
@WebServlet("/SalvaPrenotazione")
public class SalvaPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SalvaPrenotazione() {
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
		String Checked=(String) request.getSession().getAttribute("Andata/Ritorno");
		Prenotazione pA=(Prenotazione)request.getSession().getAttribute("prenotazioneA");
		boolean eta=false;
		boolean volo=true;
		PasseggeroDAO pd=new PasseggeroDAO();
		PrenotazioneDAO prd=new PrenotazioneDAO();
		for(int i=0;i<pA.getPasseggeri().size();i++){
		if(pd.controlloPresenzaSulVolo(pA.getPasseggeri().get(i).getCodFiscale(), pA.getVolo().getCodVolo())==false){
			
			volo=false;
		}
			if(pA.getPasseggeri().get(i).getEta()>=18){
				
				eta=true;
			}
			
		}
		
		boolean codFISC=true;
		if(eta==true && volo==true){
		codFISC=prd.doSave(pA);
		}
		if(Checked.equals("a/r")){
			Prenotazione pR=(Prenotazione)request.getSession().getAttribute("prenotazioneR");
			for(int i=0;i<pA.getPasseggeri().size();i++){
				if(pd.controlloPresenzaSulVolo(pR.getPasseggeri().get(i).getCodFiscale(), pR.getVolo().getCodVolo())==false){
					
					volo=false;
				}
					
					
				}
			if(eta==true && volo==true){
			codFISC=prd.doSave(pR);
			}
		}
		
		request.getSession().setAttribute("controllo", codFISC);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Report.jsp");//pagina corrente
		requestDispatcher.forward(request, response);
		
		
	}

}
