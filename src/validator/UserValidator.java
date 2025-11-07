package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import dominio.User;

public class UserValidator implements Validator {

	String Caractinvalidos = "1234567890!@#$?{}[]',;:~`_+=^&*().-|";
	
	public boolean ValidaCaracteres( String Cadena ) {
		
		for( int i=0; i < Cadena.length(); i++ )
		   if ( Caractinvalidos.indexOf( Cadena.charAt(i)) >= 0)		   
			   return false;
		return true;			
	}
	
	@Override
	public boolean supports( Class<?> clazz ) {
		return User.class.isAssignableFrom( clazz );
     }

	@Override
	public void validate( Object target, Errors errors ) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace( errors, "nombre","nombre.required" );
		ValidationUtils.rejectIfEmptyOrWhitespace( errors, "apellidos","apellidos.required" );
		ValidationUtils.rejectIfEmpty( errors, "genero", "genero.required" );
		ValidationUtils.rejectIfEmpty( errors, "direccion","direccion.required" );
		ValidationUtils.rejectIfEmptyOrWhitespace( errors, "fecha","fecha.required" );
        ValidationUtils.rejectIfEmpty( errors, "moneda","moneda.required" );
        ValidationUtils.rejectIfEmpty( errors, "monto","monto.required" );
        ValidationUtils.rejectIfEmptyOrWhitespace( errors, "fechaVencimiento","fechaVencimiento.required" );
        
        
				
		User user = (User) target;
				 
		System.out.println( "Validando Nombre: " + user.getNombre());		
		if ( !ValidaCaracteres( user.getNombre() ))
			errors.rejectValue( "nombre", "nombre.invalido");
		System.out.println( "Validando Apellidos: " + user.getApellidos());		
		if ( !ValidaCaracteres( user.getApellidos() ))
			errors.rejectValue( "apellidos", "apellidos.invalidos");
		try {
			int edad = Integer.parseInt( user.getEdad());
			if(edad <=0) {
				errors.rejectValue("edad", "edad.invalida");
			}
		}
		catch( NumberFormatException e  ) {
			errors.rejectValue( "edad", "edad.invalida");
		  }
		
		
		if ( !ValidaCaracteres( user.getDireccion() ))
			errors.rejectValue( "direccion", "direccion.invalida");
		
		if (user.getMonto() <= 0) {
            errors.rejectValue("monto", "monto.invalido");
        }
        if (user.getPeriodo() <= 0) {
            errors.rejectValue("periodo", "periodo.invalido");
        }
        if (user.getCuota() <= 0) {
            errors.rejectValue("cuota", "cuota.invalida");
        }
        if (user.getTEA() <= 0) {
            errors.rejectValue("TEA", "TEA.invalida");    
        }
	}
	
	public boolean validadorSQL( User user )
	  {
		String pReservadas[] = {"SELECT ", "INSERT ", "DELETE ","UPDATE ", "CREATE ", "LIKE "};
		boolean error = false;
		for( int i=0; i<pReservadas.length; i++)
		  {
			if( user.getGenero().contains( pReservadas[i] ))			  
				error = true;			  			  			 
			if( user.getEdad().contains(pReservadas[i] ))
			  	error = true;			  
			if( user.getNombre().contains(pReservadas[i] ))
			  	error = true;			  
			if( user.getApellidos().contains(pReservadas[i] ))
			  	error = true;			  
			if( user.getDireccion().contains(pReservadas[i] ))			  
				error = true;			  
		  }
		return error;
	  }	
}

