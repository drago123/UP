<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" %> 
<%@page import="gestion.Conexion.ConexionDb"%>
<%@ page import = "gestion.Modelo.Cuenta"%> 
<%@ page import = "gestion.Modelo.MovimientoBancario"%> 
<%@ page import = "gestion.Modelo.Historial"%> 
<%@ page import = "java.util.LinkedList"%> 
<%@page import="gestion.Conexion.ConexionDb"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/CssMenu.css"/>
<title>Registro movimientos bancarios</title>
</head>
<body>
<nav>
<ul>
	<li><a title="Opcion 1" href="index.jsp">Registro de cliente</a></li>
</ul>
</nav>

<div align="center">
<h1>
Registro movimientos bancarios
</h1>
</div>
<div align="center">
<form action="RegistroMovimientos" method="post">
<p>Id: <input type="text" name="idcliente" id="idcliente" value="<%=request.getParameter("id").toString()%>"/></p>
<p>Nombre: <input type="text" name="nombre" id="nombre" value="<%=ConexionDb.ConsultarNombre(Long.parseLong(request.getParameter("id").toString()))%>"/></p>
<p>Cuenta: 

<% 
   String idCliente = request.getParameter("id").toString();
   long id = Long.parseLong(idCliente);
	ResultSet resultado = ConexionDb.ObtenerCuenta(id);
	out.write("<select name='idcuenta'>");
	
	if (!resultado.next() ) {
		out.write("<option value='0'>No tiene cuentas asignadas, insertar en db</option>");
	} else {
		while(resultado.next()){
			out.write("<option value=" + resultado.getString("idcuenta") + ">" + resultado.getString("numerocuenta") + "</option>");
			}
	}
	

	out.write("</select>");
	resultado.close();
%>


</p>
<p>Operación: <% 
   String idCliente1 = request.getParameter("id").toString();
   long id1 = Long.parseLong(idCliente);
	ResultSet resultado1 = ConexionDb.ObtenerTipo();
	out.write("<select name='operacion'>");
	while(resultado1.next()){
	out.write("<option value=" + resultado1.getLong("idtipomovimientobancario") + ">" + resultado1.getString("nombre") + "</option>");
	}
	out.write("</select>");
	resultado1.close();
	
%></p>
<p>Monto: <input type="number" name="monto" id="monto" required/></p>
<p>Fecha: <input type="date" name="fecha" id="fecha"/></p>
<p><input type="submit" name="guardar" id="guardar" value="Guardar"/></p>
</form>
</div>
<div align="center">
<h1>
Historial movimientos bancarios
</h1>
</div>
<div align="center">
<table border="1"> 
<tr> 
<td>monto</td> 
<td>numerocuenta</td> 
<td>tipomovimiento</td> 
<td>nombrecliente</td> 
<td>apellidos</td> 
</tr> 
<% 
String idCliente_ = request.getParameter("id").toString();
long id_ = Long.parseLong(idCliente);
LinkedList<Historial> lista = ConexionDb.consultaHistorial(id_); 

for (int i=0;i<lista.size();i++) 
{ %>
<tr> 
<td><%=lista.get(i).getMonto()%></td> 
<td><%=lista.get(i).getNumerocuenta()%></td> 
<td><%=lista.get(i).getTipomovimiento()%></td> 
<td><%=lista.get(i).getNombrecliente()%></td> 
<td><%=lista.get(i).getApellidos()%></td> 
</tr>
<%} 
%>

</table> 
</div>

</body>
</html>