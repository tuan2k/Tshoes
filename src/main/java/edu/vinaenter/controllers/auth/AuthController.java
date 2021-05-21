
package edu.vinaenter.controllers.auth;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@RequestMapping("/admin/auth")
@SessionAttributes("user")
public class AuthController {
	
	@Resource
	MessageSource messageSource; 
	
	@GetMapping("login")
	public String login() {
		return "admin.auth.login";
	}
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userLogin");
		return "admin.auth.login";
	}
	
		
}
