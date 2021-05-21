package edu.vinaenter.controllers.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.vinaenter.models.User;
import edu.vinaenter.services.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/index")
	public String index(HttpServletRequest request) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		String username = loggedInUser.getName();
		User user = userService.getByName(username);
		HttpSession ss = request.getSession();
		ss.setAttribute("user", user);
		return "admin.index";
	}
	
	@GetMapping("/cat")
	public String cat() {
		return "admin.cat";
	}
	
	@GetMapping("/add")
	public String add() {
		return "admin.add";
	}
	
	@GetMapping("/news")
	public String news() {
		return "admin.news";
	}
	
	@GetMapping("/login")
	public String login() {
		return "admin.login";
	}


}
