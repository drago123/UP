package gestion.Conexion;

import gestion.Modelo.*;
import gestion.Servlet.RegistroMovimientos;

import java.awt.List;
import java.sql.*;
import java.util.LinkedList;

import sun.nio.cs.HistoricallyNamedCharset;
public class ConexionDb {

	public static Connection conectar()
	{
		try 
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "luis", "ganador123");
			return con;
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage() + "luis sanchfe");
		}
		return null;
	}
	
	public static LinkedList<MovimientoBancario> consultaMovimientos(long id){
		LinkedList<MovimientoBancario> listaClientes = new LinkedList<MovimientoBancario>(); 
		
		Connection con =  conectar();
		
		Statement st;
		try {
			st = con.createStatement();
			String sql = "select * from MovimientosBancarios where idusuario="+id;	
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) 
			{ 
			MovimientoBancario cliente = new MovimientoBancario(); 
			cliente.SetCuentaDestino(rs.getString("CuentaDestino")); 
			cliente.SetCuentaOrigen(rs.getString("CuentaOrigen")); 
			cliente.SetDescripcion(rs.getString("Descripcion")); 
			listaClientes.add(cliente); 
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return listaClientes;
	}
	
	public static ResultSet ObtenerPais(){

		ResultSet resultado = null;
		
		Connection con = ConexionDb.conectar();
		
		Statement st;
		
		try{
			st = con.createStatement();
			String sql = "select * from Pais";	
			resultado = st.executeQuery(sql);
		}catch(Exception e){
			
		}
		
		return resultado;
	}

	public static ResultSet ObtenerCuenta(long id){

		ResultSet resultado = null;
		
		Connection con = ConexionDb.conectar();
		
		Statement st;
		
		try{
			st = con.createStatement();
			String sql = "select * from Cuenta where idcliente=" + id;	
			resultado = st.executeQuery(sql);
		}catch(Exception e){
			
		}
		
		return resultado;
	}
	
	public static ResultSet ObtenerTipo(){

		ResultSet resultado = null;
		
		Connection con = ConexionDb.conectar();
		
		Statement st;
		
		try{
			st = con.createStatement();
			String sql = "select * from TipoMovimientoBancario";	
			resultado = st.executeQuery(sql);
		}catch(Exception e){
			
		}
		
		return resultado;
	}
		
	public static LinkedList<Cliente> ConsultaClientes(){

LinkedList<Cliente> listaClientes = new LinkedList<Cliente>(); 
		
		Connection con =  conectar();
		
		Statement st;
		try {
			st = con.createStatement();
			String sql = "SELECT a.idcliente AS Id, a.nombre AS Nombre, a.apellidos AS Apellido, b.nombre AS Pais, a.fechanacimiento AS Fecha FROM Cliente a JOIN Pais b ON a.idpais = b.idpais";	
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) 
			{ 
			Cliente cliente = new Cliente(); 
			cliente.SetNombre(rs.getString("Nombre")); 
			cliente.SetApellidos(rs.getString("Apellido")); 
			cliente.SetfechaNacimiento(rs.getString("Fecha")); 
			cliente.SetPais(rs.getString("Pais")); 
			cliente.SetId(rs.getLong("Id")); 
			listaClientes.add(cliente); 
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return listaClientes;
	}

	public static void EliminarCliente(long id){
		Connection con = ConexionDb.conectar();
		
		Statement st;
		
		try{
			st = con.createStatement();
			String sql = "delete from Cliente where idcliente="+id;	
			st.executeQuery(sql);
			con.close();
		}catch(Exception e){
			
		}
	}

	public static LinkedList<Historial> consultaHistorial(long id){
LinkedList<Historial> listaClientes = new LinkedList<Historial>(); 
		
		Connection con =  conectar();
		
		Statement st;
		try {
			st = con.createStatement();
			String sql = "SELECT a.monto AS monto, a.fecha as fecha, b.numerocuenta as numerocuenta, c.nombre as tipomovimiento, d.nombre as nombrecliente, d.apellidos FROM MovimientoBancario a join cuenta b on a.idcuenta = b.idcuenta join TipoMovimientoBancario c on a.idtipomovimientobancario = c.idtipomovimientobancario join Cliente d on b.idcliente = d.idcliente where d.idcliente = "+id;	
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) 
			{ 
				Historial cliente = new Historial(); 
			cliente.setMonto(rs.getString("monto")); 
			cliente.setNumerocuenta(rs.getString("numerocuenta")); 
			cliente.setTipomovimiento(rs.getString("tipomovimiento")); 
			cliente.setNombrecliente(rs.getString("nombrecliente")); 
			cliente.setApellidos(rs.getString("apellidos")); 
			listaClientes.add(cliente); 
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return listaClientes;

	}

	public static String ConsultarNombre(long id){
		Connection con =  conectar();
		String nombre ="";
		Statement st;
		try {
			st = con.createStatement();
			String sql = "SELECT nombre, apellidos from Cliente where idcliente = "+id;	
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) 
			{ 
				nombre = rs.getString("nombre") + " " + rs.getString("apellidos"); 
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return nombre;
	}
}
