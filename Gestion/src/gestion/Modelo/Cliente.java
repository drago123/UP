package gestion.Modelo;

public class Cliente {
	
	private long id;
	
	private String nombre;
	
	private String apellidos;
	
	private String fechaNacimiento;
	
	private String pais;
	
	
	public void SetNombre(String nombre){
		this.nombre = nombre;
	}
	
	public String GetNombre(){
		return this.nombre;
	}
	
	
	public void SetApellidos(String apellidos){
		this.apellidos = apellidos;
	}
	
	public String GetApellidos(){
		return this.apellidos;
	}
	
	
	public void SetfechaNacimiento(String fecha){
		this.fechaNacimiento = fecha;
	}
	
	public String GetfechaNacimiento(){
		return this.fechaNacimiento;
	}
	
	public void SetPais(String pais){
		this.pais = pais;
	}
	
	public String GetPais(){
		return this.pais;
	}
	
	public void SetId(long id){
		this.id = id;
	}
	
	public long GetId(){
		return this.id;
	}
}
