package gestion.Servlet;

import gestion.Conexion.ConexionDb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistroMovimientos
 */
@WebServlet("/RegistroMovimientos")
public class RegistroMovimientos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroMovimientos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idCliente = request.getParameter("id").toString();
		long id = Long.parseLong(idCliente);
		response.sendRedirect("RegistroMovimientos.jsp?id=" + id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("idcliente");
		String nombre = request.getParameter("nombre");
		String cuenta = request.getParameter("idcuenta");
		String operacion = request.getParameter("operacion");
		String monto = request.getParameter("monto");
		String fecha = request.getParameter("fecha");		
		try {
			Connection con =  ConexionDb.conectar();
    		con.createStatement().executeUpdate("INSERT INTO MovimientoBancario (idcuenta, monto, fecha, idtipomovimientobancario) VALUES ('"+cuenta+"','"+monto+"', TO_DATE('"+fecha+"', 'YYYY-MM-DD'),'"+operacion+"')");
    		con.close();
    		response.sendRedirect("RegistroMovimientos.jsp?id="+id);		
			
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.sendRedirect("RegistroMovimientos.jsp?id="+id);
		}
		
	}

}
