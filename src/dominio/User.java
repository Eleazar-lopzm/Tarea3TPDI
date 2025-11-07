package dominio;

import java.util.List;

public class User {

	private String nombre;
	private String edad = "0";
	private String genero;
	private String apellidos;
	private String direccion;
	private String fecha;
	private Double monto;
	private int periodo;
	private String moneda;
	private Double cuota;
	private int TEA;
	private String fechaVencimiento;
        private List<Gasto> gastos;
        
	public String getNombre() {
		return nombre;
	  }
	public String getEdad() {
		return edad;
	  }		
	
	public String getGenero() {
		return genero;
	  }

	public void setNombre( String nombre ) {
		this.nombre = nombre;
	  }
	public void setEdad( String edad ) {
		this.edad = edad;
	  }	
	
	public void setGenero( String genero ) {
		this.genero = genero;
	  }
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getFecha() {
		return fecha;
	}
	public Double getMonto() {
		return monto;
	}
	public int getPeriodo() {
		return periodo;
	}
	public String getMoneda() {
		return moneda;
	}
	public Double getCuota() {
		return cuota;
	}
	public int getTEA() {
		return TEA;
	}
	public String getFechaVencimiento() {
		return fechaVencimiento;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public void setMonto(Double monto) {
		this.monto = monto;
	}
	public void setPeriodo(int periodo) {
		this.periodo = periodo;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	public void setCuota(Double cuota) {
		this.cuota = cuota;
	}
	public void setTEA(int tEA) {
		TEA = tEA;
	}
	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}
        
        public List<Gasto> getGastos(){
            return gastos;
        }
	
        public void setGastos(List<Gasto> gastos){
            this.gastos = gastos;
        }
        
}
