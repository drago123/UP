<%@page import="gestion.Conexion.ConexionDb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" %> 
<%@ page import = "gestion.Modelo.MovimientoBancario"%> 
<%@ page import = "java.util.LinkedList"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/CssMenu.css"/>
<title>Busqueda movimientos bancarios</title>
</head>
<body>
<nav>
<ul>
	<li><a title="Opcion 1" href="index.jsp">Registro de cliente</a></li>
	<li><a title="Opcion 2" href="RegistroMovimientos.jsp">Registro movimientos bancarios</a></li>
	<li><a title="Opcion 3" href="BusquedaMovimientos.jsp">Busqueda de movimientos bancarios</a></li>
</ul>
</nav>

<div align="center">
<h1>
Busqueda movimientos bancarios
</h1>
</div>
<div align="center">
<table border="1"> 
<tr> 
<td>Cuenta origen</td> 
<td>Cuenta destino</td> 
<td>Descripcion</td> 
</tr> 
<% 
HttpSession getsession = request.getSession();
String strUsuarioActual = (String) getsession.getAttribute("idusuario");
long id = Long.parseLong(strUsuarioActual);
LinkedList<MovimientoBancario> lista = ConexionDb.consultaMovimientos(id); 

for (int i=0;i<lista.size();i++) 
{ %>
<tr> 
<td><%=lista.get(i).GetCuentaOrigen()%></td> 
<td><%=lista.get(i).GetCuentaDestino()%></td> 
<td><%=lista.get(i).GetDescripcion()%></td> 
</tr>
<%} 
%>

</table> 
</div>
</body>
</html>