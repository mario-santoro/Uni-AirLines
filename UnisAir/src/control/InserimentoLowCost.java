package control;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.VoloDAO;
import model.LowCost;
import model.Volo;

/**
 * Servlet implementation class InserimentoLowCost
 */
@WebServlet("/InserimentoLowCost")
@MultipartConfig
public class InserimentoLowCost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InserimentoLowCost() {
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
		doGet(request,response);
		response.setContentType("text/html);charset=UTF-8");
		 int cod=Integer.parseInt(request.getParameter("cod"));
		LowCost l=new LowCost();
		int quant=Integer.parseInt(request.getParameter("quant"));
		int percentuale=Integer.parseInt(request.getParameter("percentuale"));
  String nome=request.getParameter("nome");


	//in filePart carichiamo il file inviato dal form
	String applicationPath = request.getServletContext().getRealPath("");
	
	
	System.out.println(applicationPath);
	
	Part filePart = request.getPart("immagine");

	
    //salviamo in nomeFIle in nome del file
    String nomeFile = getFilename(filePart);
    
    
//indirizzo della cartella dove salvare il file 
/* se si vuole utilizzare un diverso indirizzo per salvarle, 
 * inizializzare diversamente la viariabile applicationPath
 */
File uploads = new File(applicationPath+"/img/lowcost",nomeFile); 
// File uploads = new File("../1",nomeFile);

//carichiamo il file in stream
InputStream is = filePart.getInputStream();


//parte scrittura file
FileOutputStream fos = new FileOutputStream(uploads);
BufferedOutputStream bos= new BufferedOutputStream(fos);
int read = -1;

while ((read = is.read()) != -1) {
    bos.write(read);
}

bos.flush();
bos.close();
is.close();


l.setImg(nomeFile);
l.setQuant(quant);
l.setPercentuale(percentuale);
l.setCodVolo(cod);
l.setNome(nome);
VoloDAO vd=new VoloDAO();
boolean b=vd.isLowCost(l);
request.getSession().setAttribute("mostra", true);
int controllo;
if(b){
 controllo = 4;
}else{controllo=6;}
request.getSession().setAttribute("controllo", controllo);
RequestDispatcher d= request.getRequestDispatcher("AdminVisualizzaVoli");
d.forward(request, response);
}
private static String getFilename(Part part) {
	   for (String cd : part.getHeader("content-disposition").split(";")) {
	      if (cd.trim().startsWith("filename")) {
	         String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	         return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
	      }
	   }
	 
	   return null;
	}
	
}
