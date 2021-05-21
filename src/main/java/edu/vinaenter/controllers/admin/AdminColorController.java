package edu.vinaenter.controllers.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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

import edu.vinaenter.models.Color;
import edu.vinaenter.services.ColorService;

@Controller
@RequestMapping("admin/color")
public class AdminColorController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminColorController.class);
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private ColorService colorService;
	
	@GetMapping("index")
	public String index(Model model) {
		logger.info("this is log");
		List<Color> listcolors = null;
		listcolors = colorService.getAll();
		model.addAttribute("listcolors", listcolors);
		return "admin.color.index";
	}

	@GetMapping("add")
	public String add() {
		return "admin.color.add";
	}

	@GetMapping({"edit/{id}","edit"})
	public String edit(@PathVariable Integer id, Model model) {
		Color color = colorService.getById(id);
		model.addAttribute("color",color);
		return "admin.color.edit";
	}
	
	@PostMapping("edit") // can't set name if the name is the same in form
	public String edit(@Valid @ModelAttribute("Color") Color color, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.color.edit";
		}
		Color c = null;
		int save = 0;
		c = colorService.validateUpdate(color);
		if (c == null) {
			save = colorService.edit(color);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/color/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		int cid = color.getId();
		return "redirect:/admin/color/edit/"+cid;
	}

	
	@PostMapping("add") // can't set name if the name is the same in form
	public String add(@Valid @ModelAttribute("color") Color color, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.color.add";
		}
		Color c = null;
		int save = 0;
		c = colorService.findOne(color);
		if (c == null) {
			save = colorService.save(color);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/color/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		return "redirect:/admin/color/add";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Integer id,Model model
			, RedirectAttributes msg) {
		int delete = colorService.deleteById(id);
		if (delete > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/color/index";
		}
		return "admin.color.index";
	}
	
	@GetMapping("/search")
	public String index(Model model,@RequestParam("search") String search, RedirectAttributes msg) {
		List<Color> listcolors = new ArrayList<Color>();
		listcolors = colorService.getBySearch(search);
		if (listcolors.size() > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			model.addAttribute("listcolors", listcolors);
			return "admin.color.index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.empty", null, Locale.ENGLISH));
		return "admin.color.index";
	}

}
