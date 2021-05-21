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

import edu.vinaenter.models.Size;
import edu.vinaenter.services.SizeService;

@Controller
@RequestMapping("admin/size")
public class AdminSizeController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminSizeController.class);
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private SizeService sizeService;
	
	@GetMapping("index")
	public String index(Model model) {
		logger.info("this is log");
		List<Size> listsizes = null;
		listsizes = sizeService.getAll();
		model.addAttribute("listsizes", listsizes);
		return "admin.size.index";
	}

	@GetMapping("add")
	public String add() {
		return "admin.size.add";
	}

	@GetMapping({"edit/{id}","edit"})
	public String edit(@PathVariable Integer id, Model model) {
		Size size = sizeService.getById(id);
		model.addAttribute("size",size);
		return "admin.size.edit";
	}
	
	@PostMapping("edit") // can't set name if the name is the same in form
	public String edit(@Valid @ModelAttribute("size") Size size, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.size.edit";
		}
		Size c = null;
		int save = 0;
		c = sizeService.validateUpdate(size);
		if (c == null) {
			save = sizeService.edit(size);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/size/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		int cid = size.getId();
		return "redirect:/admin/size/edit/"+cid;
	}

	
	@PostMapping("add") // can't set name if the name is the same in form
	public String add(@Valid @ModelAttribute("size") Size size, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			System.out.println(rs.getFieldError().getField());
			return "admin.size.add";
		}
		Size c = null;
		int save = 0;
		c = sizeService.findOne(size);
		if (c == null) {
			save = sizeService.save(size);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/size/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		return "redirect:/admin/size/add";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Integer id,Model model
			, RedirectAttributes msg) {
		int delete = sizeService.deleteById(id);
		if (delete > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/size/index";
		}
		return "admin.size.index";
	}
	
	@GetMapping("/search")
	public String index(Model model,@RequestParam("search") String search, RedirectAttributes msg) {
		List<Size> listsizes = new ArrayList<Size>();
		listsizes = sizeService.getBySearch(search);
		if (listsizes.size() > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			model.addAttribute("listSizes", listsizes);
			return "admin.size.index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.empty", null, Locale.ENGLISH));
		return "admin.size.index";
	}

}
