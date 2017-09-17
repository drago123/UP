package gestion.Servlet;

import gestion.Conexion.ConexionDb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class CrearUsuario
 */
@WebServlet("/CrearUsuario")
public class CrearUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    protected void ProcessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {   	
    	String idusuario = request.getAttribute("idusuario").toString();
		HttpSession session = request.getSession();
        session.setAttribute("idusuario", "test value");
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idusuario = request.getParameter("idusuario").toString();
		HttpSession session = request.getSession();
        session.setAttribute("idusuario", idusuario);
        response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
    	try {
    		
    		String nombre = request.getParameter("nombre");
    		String apellido = request.getParameter("apellido");
    		String fechanacimiento = request.getParameter("bday");
    		String idpais = request.getParameter("idpais");
    		
    		Connection con =  ConexionDb.conectar();
    		con.createStatement().executeUpdate("INSERT INTO Cliente (nombre, apellidos, fechanacimiento, idpais) VALUES ('"+nombre+"','"+apellido+"', TO_DATE('"+fechanacimiento+"', 'YYYY-MM-DD'),'"+idpais+"')");
    		con.close();
    		response.sendRedirect("index.jsp");			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getCause());
		}
    	
	}

}
