<%@page import="gestion.Conexion.ConexionDb"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" %> 
<%@page import="gestion.Conexion.ConexionDb"%>
<%@ page import = "gestion.Modelo.Cliente"%> 
<%@ page import = "java.util.LinkedList"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/CssMenu.css"/>
<title>REGISTRAR USUARIO</title>
</head>
<body>

<nav>
<ul>
	<li><a title="Opcion 1" href="index.jsp">Registrar usuario</a></li>
</ul>
</nav>
<div align="center">
<h1>
Registrar usuario
</h1>
</div>
<div align="center">
<table border="1"> 
<tr> 
<td>Id</td> 
<td>Nombre</td> 
<td>Apellido</td> 
<td>Pais</td> 
<td>Fecha nacimiento</td> 
</tr> 
<% 
LinkedList<Cliente> lista = ConexionDb.ConsultaClientes(); 

for (int i=0;i<lista.size();i++) 
{ %>
<tr> 
<td><%=lista.get(i).GetId()%></td> 
<td><%=lista.get(i).GetNombre()%></td> 
<td><%=lista.get(i).GetApellidos()%></td> 
<td><%=lista.get(i).GetPais()%></td> 
<td><%=lista.get(i).GetfechaNacimiento()%></td> 
<td><a title='Opcion 1' href='/Gestion/RegistroMovimientos?id=<%=lista.get(i).GetId()%>' >Gestionar</a></td> 
<td><a title='Opcion 2' href='/Gestion/EliminarCliente?id=<%=lista.get(i).GetId()%>' >Eliminar</a></td> 
</tr>
<%} 
%>
</table> 
</div>


<div align="center">
<form action="CrearUsuario" method="post">
<p>Nombre: <input type="text" name="nombre" id="nombre" required/></p>
<p>Apellido: <input type="text" name="apellido" id="apellido" required/></p>
<p>Fecha nacimiento: <input type="date" name="bday"></p>
Pais: 
<% 
	ResultSet resultado = ConexionDb.ObtenerPais();
	out.write("<select name='idpais'>");
	while(resultado.next()){
	out.write("<option value=" + resultado.getString("idpais") + ">" + resultado.getString("nombre") + "</option>");
	}
	out.write("</select>");
	resultado.close();
%>
<p><input type="submit" name="Crear" id="Crear" value="Crear cliente"/></p>
</form>

</div>

</body>
</html>