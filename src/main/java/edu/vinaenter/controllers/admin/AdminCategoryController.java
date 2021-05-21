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

import edu.vinaenter.models.Category;
import edu.vinaenter.services.CategoryService;


@Controller
@RequestMapping("admin/cat")
public class AdminCategoryController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminCategoryController.class);
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private CategoryService catService;
	
	@GetMapping("index")
	public String index(Model model) {
		logger.info("this is log");
		List<Category> listcats = null;
		listcats = catService.getAll();
		model.addAttribute("listcats", listcats);
		return "admin.cat.index";
	}

	@GetMapping("add")
	public String add() {
		return "admin.cat.add";
	}

	@GetMapping({"edit/{id}","edit"})
	public String edit(@PathVariable Integer id, Model model) {
		Category cat = catService.getById(id);
		model.addAttribute("cat",cat);
		return "admin.cat.edit";
	}
	
	@PostMapping("edit") // can't set name if the name is the same in form
	public String edit(@Valid @ModelAttribute("category") Category cat, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.cat.edit";
		}
		Category c = null;
		int save = 0;
		c = catService.validateUpdate(cat);
		if (c == null) {
			save = catService.edit(cat);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/cat/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		int cid = cat.getId();
		return "redirect:/admin/cat/edit/"+cid;
	}

	@PostMapping("add") // can't set name if the name is the same in form
	public String add(@Valid @ModelAttribute("cat") Category cat, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.cat.add";
		}
		Category c = null;
		int save = 0;
		c = catService.findOne(cat);
		if (c == null) {
			save = catService.save(cat);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/cat/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		return "redirect:/admin/cat/add";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Integer id,Model model
			, RedirectAttributes msg) {
		int delete = catService.deleteById(id);
		if (delete > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/cat/index";
		}
		return "admin.cat.index";
	}
	
	@GetMapping("/search")
	public String index(Model model,@RequestParam("search") String search, RedirectAttributes msg) {
		List<Category> listcats = new ArrayList<Category>();
		listcats = catService.getBySearch(search);
		if (listcats.size() > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			model.addAttribute("listcats", listcats);
			return "admin.cat.index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.empty", null, Locale.ENGLISH));
		return "admin.cat.index";
	}

}
