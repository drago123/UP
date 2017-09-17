package login.ConexionSql;

import java.sql.*;

import javax.swing.JOptionPane;

public class Conexion {
	
	
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
			System.out.println(e.getMessage());
			//JOptionPane.showMessageDialog(null, e.getMessage() +  " " + e.getCause());
		}
		return null;
	}
}
