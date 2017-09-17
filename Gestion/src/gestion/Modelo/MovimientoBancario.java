package gestion.Modelo;

public class MovimientoBancario {

	private String CuentaOrigen;
	private String CuentaDestino;
	private String Descripcion;

	public String GetCuentaOrigen(){
		return this.CuentaOrigen;
	}

	public void SetCuentaOrigen(String CuentaOrigen){
		 this.CuentaOrigen = CuentaOrigen;
	}
	
	
	public String GetCuentaDestino(){
		return this.CuentaDestino;
	}

	public void SetCuentaDestino(String CuentaDestino){
		 this.CuentaDestino = CuentaDestino;
	}
	
	public String GetDescripcion(){
		return this.Descripcion;
	}

	public void SetDescripcion(String Descripcion){
		 this.Descripcion = Descripcion;
	}
}
