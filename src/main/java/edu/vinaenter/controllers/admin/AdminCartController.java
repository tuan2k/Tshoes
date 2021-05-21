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
import edu.vinaenter.models.Cart;
import edu.vinaenter.services.CartService;

@Controller
@RequestMapping("admin/cart")
public class AdminCartController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminCartController.class);
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("index")
	public String index(Model model) {
		logger.info("this is log");
		List<Cart> listCarts = null;
		listCarts = cartService.getAll();
		model.addAttribute("listcarts", listCarts);
		return "admin.cart.index";
	}

	@GetMapping("add")
	public String add() {
		return "admin.cart.add";
	}

	@GetMapping({"edit/{id}","edit"})
	public String edit(@PathVariable Integer id, Model model) {
		Cart cart = cartService.getById(id);
		model.addAttribute("cart",cart);
		return "admin.cart.edit";
	}
	
	@PostMapping("edit") // can't set name if the name is the same in form
	public String edit(@Valid @ModelAttribute("Cart") Cart cart, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.cart.edit";
		}
		Cart c = null;
		int save = 0;
		c = cartService.validateUpdate(cart);
		if (c == null) {
			save = cartService.edit(cart);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/cart/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		int cid = cart.getId();
		return "redirect:/admin/cart/edit/"+cid;
	}

	
	@PostMapping("add") // can't set name if the name is the same in form
	public String add(@Valid @ModelAttribute("Cart") Cart cart, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.Cart.add";
		}
		Cart c = null;
		int save = 0;
		c = cartService.findOne(cart);
		if (c == null) {
			save = cartService.save(cart);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/cart/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		return "redirect:/admin/cart/add";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Integer id,Model model
			, RedirectAttributes msg) {
		int delete = cartService.deleteById(id);
		if (delete > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/cart/index";
		}
		return "admin.cart.index";
	}
	
	@GetMapping("/search")
	public String index(Model model,@RequestParam("search") String search, RedirectAttributes msg) {
		List<Cart> listCarts = new ArrayList<Cart>();
		listCarts = cartService.getBySearch(search);
		if (listCarts.size() > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			model.addAttribute("listcarts", listCarts);
			return "admin.cart.index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.empty", null, Locale.ENGLISH));
		return "admin.cart.index";
	}

}
