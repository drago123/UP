package login.Visual;


import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GridLayout;


import javax.swing.*;

public class Ventana extends JFrame {

private static final long serialVersionUID = 1L;

public Ventana()
{
	super("Login Oracle");
	 setSize(400, 300);
	 setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	 

	 // Panel de datos
	 JPanel panelDatos = new JPanel();
	 GridLayout gl = new GridLayout(3,2,0,5);
	 panelDatos.setLayout(gl);
	 panelDatos.add(new JLabel("Usuario:"));
	 JTextField usuario = new JTextField(10);
	 panelDatos.add(usuario);
	 panelDatos.add(new JLabel("Clave:"));
	 JPasswordField  password = new JPasswordField(10);
	 panelDatos.add(password);
	// Panel de botones
	 JPanel panelBotones = new JPanel();
	 panelBotones.setLayout(new FlowLayout());	 
	 JButton btnlogin = new JButton("Login");	 
	 panelBotones.add(btnlogin);
	 Container cp = getContentPane();
	 cp.add(panelDatos, BorderLayout.CENTER);
	 cp.add(panelBotones, BorderLayout.SOUTH);
	 btnlogin.addActionListener(new EventoLogin(usuario, password));

}


}
