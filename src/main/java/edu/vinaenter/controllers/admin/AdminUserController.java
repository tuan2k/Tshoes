package edu.vinaenter.controllers.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.models.Role;
import edu.vinaenter.models.User;
import edu.vinaenter.services.RoleService;
import edu.vinaenter.services.UserService;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {

	private static final Logger logger = LoggerFactory.getLogger(AdminUserController.class);

	@Resource
	MessageSource messageSource;

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@GetMapping("index")
	public String index(Model model) {
		logger.info("this is log");
		System.out.println("controller admin user index");
		List<User> listusesrs = null;
		listusesrs = userService.getAll();
		model.addAttribute("listusers", listusesrs);
		return "admin.user.index";
	}

	@GetMapping("add")
	public String add(Model model) {
		List<Role> listroles = null;
		listroles = roleService.getAll();
		model.addAttribute("listroles", listroles);
		return "admin.user.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("user") User user, BindingResult rs, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.user.add";
		}
		User u = null;
		u = userService.findOne(user);
		int save = 0;
		if (u == null) {
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			save = userService.save(user);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/user/index";
		}
		msg.addFlashAttribute("msg", messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		return "redirect:/admin/user/add";
	}

	@GetMapping("edit/{id}")
	public String edit(@PathVariable Integer id, Model model,
			HttpServletRequest request) {
		// validate url userPermisison
		HttpSession ss = request.getSession();
		User userLogin = (User) ss.getAttribute("user");
		if ( userLogin.getId() != id && userLogin.getRole_id() == 3) {
			return "redirect:/error/403";
		}
		if ( id ==1  && userLogin.getRole_id() == 2) {
			return "redirect:/error/403";
		}
		User user = userService.getById(id);
		model.addAttribute("user",user);
		return "admin.user.edit";
	}

	@PostMapping("edit") // can't set name if the name is the same in form
	public String edit(@Valid @ModelAttribute("user") User user, BindingResult rs, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.user.edit";
		}
		User u = null;
		u = userService.validateUpdate(user);
		int save = 0;
		if (u == null) {
			User uu = userService.getById(user.getId());
			if (user.getPassword() == null) {
				user.setPassword(uu.getPassword());
			} else {
				user.setPassword(passwordEncoder.encode(user.getPassword()));
			}
			user.setRole_id(uu.getRole_id());
			save = userService.edit(user);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/user/index";
		}
		msg.addFlashAttribute("msg", messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		int id = user.getId();
		return "redirect:/admin/user/edit/" + id;
	}

	@GetMapping("detail/{id}")
	public String detail(@PathVariable Integer id, Model model) {
		System.out.println("detail id:" + id);
		User user = userService.getById(id);
		model.addAttribute("user", user);
		return "admin.detail";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable Integer id, Model model, RedirectAttributes msg) {
		int delete = userService.deleteById(id);
		if (delete > 0) {
			msg.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/user/index";
		}
		return "admin.user.index";
	}

	@GetMapping("/search")
	public String index(Model model, @RequestParam("search") String search, RedirectAttributes msg) {
		List<User> listusers = new ArrayList<User>();
		listusers = userService.getBySearch(search);
		if (listusers.size() > 0) {
			msg.addFlashAttribute("msg", messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			model.addAttribute("listusers", listusers);
			return "admin.user.index";
		}
		msg.addFlashAttribute("msg", messageSource.getMessage("msg.empty", null, Locale.ENGLISH));
		return "admin.user.index";
	}

}
