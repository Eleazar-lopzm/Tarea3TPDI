package control;

import baseDeDatos.GastoDAO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import baseDeDatos.UsuariosJDBCTemplate;
import dominio.Gasto;
import dominio.User;
import java.util.List;
import servicio.UserService;
import validator.UserValidator;


@Controller
@RequestMapping( "/" )

public class UserController {

	private UserService userService;
	private UserValidator userValidator;
        private GastoDAO gastoDAO;
 
	@Autowired
	public UserController( UserService userService, UserValidator userValidator, GastoDAO gastoDAO ) {
		this.userService = userService;
		this.userValidator = userValidator;
                this.gastoDAO = gastoDAO;
	}
	 
	@RequestMapping( method = RequestMethod.GET )
	public String showUserForm( ModelMap model, HttpServletRequest request ) {
		User user = new User();
                List<Gasto> listaGastos = gastoDAO.consultaGastos();
                user.setGastos(listaGastos);
		model.addAttribute( "user", user );
		return "userForm";
	}

	@RequestMapping( method = RequestMethod.POST )
	public String onSubmit( @ModelAttribute("user") User user, BindingResult result , HttpServletRequest request, ModelMap model) 
	 {
		int MaxIntentos = 6;
		userValidator.validate( user, result );
		if ( result.hasErrors() ) 
			return "userForm";
	   else {
			
			String formulario = "";
			final String userIpAddress = request.getRemoteAddr();
	        System.out.println( "User IpAddress: " + userIpAddress );
	        UsuariosJDBCTemplate reg = new UsuariosJDBCTemplate();
	        reg.addIntento( userIpAddress );
	        if ( reg.getIntentos(userIpAddress) >= MaxIntentos )
	            formulario = "Exceso";	          
	        else
	          {
	        	userService.add( user );
                        if(user.getGastos() != null){
                            for(Gasto gasto: user.getGastos()){
                                if(gasto.getPagos() > 0){
                                    gastoDAO.actualizarPago(gasto);
                                }
                            }
                        }
	        	model.addAttribute("user",user);
	        	formulario = "userSuccess";
	          }			
			return formulario;
		 }
	}
}

