package edu.vinaenter.controllers.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.vinaenter.models.User;
import edu.vinaenter.services.CanvasjsChartServiceImpl;
import edu.vinaenter.services.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CanvasjsChartServiceImpl canvasjsChartService;
	
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
	
	@GetMapping("/chart")
	public String chart(ModelMap modelMap) {
		List<List<Map<Object, Object>>> canvasjsDataList = canvasjsChartService.getDataChart(2021);
		modelMap.addAttribute("dataPointsList", canvasjsDataList);
		return "admin.chart";
	}
	
	@PostMapping("/ychart")
	public String ychart(ModelMap modelMap,@RequestParam("year") String year) {
		int y=2021;
		if (year != null) {
			y = Integer.parseInt(year);
		}
		List<List<Map<Object, Object>>> canvasjsDataList = canvasjsChartService.getDataChart(y);
		modelMap.addAttribute("dataPointsList", canvasjsDataList);
		return "admin.chart";
	}


}
