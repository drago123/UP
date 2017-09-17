package gestion.Servlet;

import gestion.Conexion.ConexionDb;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.myfaces.view.facelets.tag.jsf.core.ConvertDateTimeHandler;

/**
 * Servlet implementation class CrearMovimiento
 */
@WebServlet("/CrearMovimiento")
public class CrearMovimiento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearMovimiento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String origen = request.getParameter("CuentaOrigen");
		String destino =request.getParameter("CuentaDestino");
		String descripcion = request.getParameter("Descripcion");
		HttpSession session = request.getSession();
		String strUsuarioActual = (String) session.getAttribute("idusuario");
		long id = Long.parseLong(strUsuarioActual);
		try {
    		Connection con =  ConexionDb.conectar();
    		con.createStatement().executeUpdate("INSERT INTO MovimientosBancarios (CuentaOrigen, CuentaDestino, Descripcion, idusuario) VALUES ('"+origen+"','"+destino+"', '"+descripcion+"','"+id+"')");
    		con.close();
    		response.sendRedirect("RegistroMovimientos.jsp");			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getCause());
		}
		
	}

}
