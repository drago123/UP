package login.Visual;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import oracle.jdbc.internal.OraclePreparedStatement;
import oracle.jdbc.internal.OracleResultSet;

import login.ConexionSql.Conexion;



	public class EventoLogin implements ActionListener {
		
		private JTextField usuario;
		
		private JPasswordField password;
		
		
		public EventoLogin(JTextField usuario, JPasswordField password){
			this.usuario = usuario;
			this.password = password;
		}
		
		
		 public void actionPerformed(ActionEvent e) {
			 
			 try{
		    //JButton botonPresionado = (JButton) e.getSource();
		 	Connection con= Conexion.conectar();		 
		 	Statement st = con.createStatement();
			String sql = "select VerificaLogin('"+this.usuario.getText()+"','"+this.password.getText()+"') from dual";	
			ResultSet rs = st.executeQuery(sql);		 
			if(rs.next()) {			
				int id = rs.getInt(1);
				if (id!=0){
					//llamar a pagina jsp
					//String url = "http://localhost:8080/Gestion/";
					String url ="http://localhost:8080/Gestion/CrearUsuario?idusuario="+id;
					java.awt.Desktop.getDesktop().browse(java.net.URI.create(url));
					//JOptionPane.showMessageDialog(null, "Login correcto");
				}else{
					//credeciales invalidas
					JOptionPane.showMessageDialog(null, "Credenciales invalidas");
				}				
			}else{
				JOptionPane.showMessageDialog(null, "Login incorrecto");
			}
		 con.close(); 
			 }catch(Exception ex)
			 {
				 JOptionPane.showMessageDialog(null, ex.getMessage());
				 
			 }
		 }
		}


