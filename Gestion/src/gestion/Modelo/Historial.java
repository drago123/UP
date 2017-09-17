package gestion.Modelo;

public class Historial {

private String monto;
public String getMonto() {
	return monto;
}
public void setMonto(String monto) {
	this.monto = monto;
}
public String getFecha() {
	return fecha;
}
public void setFecha(String fecha) {
	this.fecha = fecha;
}
public String getNumerocuenta() {
	return numerocuenta;
}
public void setNumerocuenta(String numerocuenta) {
	this.numerocuenta = numerocuenta;
}
public String getTipomovimiento() {
	return tipomovimiento;
}
public void setTipomovimiento(String tipomovimiento) {
	this.tipomovimiento = tipomovimiento;
}
public String getNombrecliente() {
	return nombrecliente;
}
public void setNombrecliente(String nombrecliente) {
	this.nombrecliente = nombrecliente;
}
public String getApellidos() {
	return apellidos;
}
public void setApellidos(String apellidos) {
	this.apellidos = apellidos;
}
private String fecha;
private String numerocuenta;
private String tipomovimiento;
private String nombrecliente;
private String apellidos;


}
