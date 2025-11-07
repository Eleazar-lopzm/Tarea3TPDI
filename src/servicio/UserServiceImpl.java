package servicio;

import baseDeDatos.UsuariosJDBCTemplate;
import dominio.User;

public class UserServiceImpl implements UserService {

	@Override

	public void add( User user ) {
		
		System.out.println( "Usuario agregado correctamente:" );
		System.out.println( "Nombre: " + user.getNombre() );
		System.out.println( "Apellidos: " + user.getApellidos() );
		System.out.println( "Edad: " + user.getEdad() );
		System.out.println( "Género: " + user.getGenero() );
		System.out.println( "Dirección: " + user.getDireccion() );
		System.out.println( "Fecha: " + user.getFecha() );
		System.out.println( "Monto: " + user.getMonto() );
		System.out.println( "Periodo: " + user.getPeriodo() );
		System.out.println( "Moneda: " + user.getMoneda() );
		System.out.println( "Cuota: " + user.getCuota() );
		System.out.println( "TEA: " + user.getTEA() );
		

		UsuariosJDBCTemplate conn = new UsuariosJDBCTemplate();
		try {
			  conn.insertarU( user );
		  } catch(Exception e)
		{
			System.out.println("Error NamingException: " + e.toString());
		}
	}
}
