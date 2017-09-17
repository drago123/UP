package gestion.Modelo;

public class Cuenta {

	private long idcuenta;
	private String numerocuenta;
	
	
	public long Getid(){
		return this.idcuenta;
	}
	public void Setid(long id){
		this.idcuenta = id;
	}
	public String GetNumeroCuenta(){
		return this.numerocuenta;
	}
	public void SetNumeroCuenta(String numerocuenta){
		this.numerocuenta = numerocuenta;
	}

}
