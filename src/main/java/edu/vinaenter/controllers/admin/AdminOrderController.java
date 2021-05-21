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
import edu.vinaenter.models.Color;
import edu.vinaenter.models.Order;
import edu.vinaenter.models.Product;
import edu.vinaenter.models.Size;
import edu.vinaenter.models.User;
import edu.vinaenter.services.CartService;
import edu.vinaenter.services.ColorService;
import edu.vinaenter.services.OrderService;
import edu.vinaenter.services.ProductService;
import edu.vinaenter.services.SizeService;
import edu.vinaenter.services.UserService;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminOrderController.class);
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ColorService colorService;
	
	@Autowired
	private SizeService sizeService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("index")
	public String index(Model model) {
		List<User> listUsers = new ArrayList<User>();
		List<Order> listorders = null;
		listorders = orderService.getAll();
		for (Order o : listorders) {
			listUsers.add(userService.getById(o.getUser_id()));
		}
		model.addAttribute("listusers",listUsers);
		model.addAttribute("listorders", listorders);
		return "admin.order.index";
	}

	@GetMapping("add")
	public String add() {
		return "admin.order.add";
	}

	@GetMapping({"edit/{id}","edit"})
	public String edit(@PathVariable Integer id, Model model) {
		Order order = orderService.getById(id);
		model.addAttribute("order",order);
		return "admin.order.edit";
	}
	
	@GetMapping("view/{id}")
	public String view(@PathVariable Integer id, Model model) {
		Order order = orderService.getById(id);
		List<Cart> listCarts = cartService.getCartByOrderId(order.getId());
		User user = userService.getById(order.getUser_id());
		List<Color> listColors = colorService.getAll();
		List<Size> listSizes = sizeService.getAll();
		List<Product> listProducts = new ArrayList<Product>();
		for (Cart c: listCarts) {
			listProducts.add(productService.getById(c.getProduct_id()));
		}
		model.addAttribute("listColors",listColors);
		model.addAttribute("listSizes",listSizes);
		model.addAttribute("listProducts",listProducts);
		model.addAttribute("listCarts",listCarts);
		model.addAttribute("user",user);
		model.addAttribute("order",order);
		return "admin.order.view";
	}
	
	@PostMapping("edit") // can't set name if the name is the same in form
	public String edit(@Valid @ModelAttribute("order") Order order, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.order.edit";
		}
		Order c = null;
		int save = 0;
		c = orderService.validateUpdate(order);
		if (c == null) {
			save = orderService.edit(order);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/order/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		int cid = order.getId();
		return "redirect:/admin/order/edit/"+cid;
	}

	
	@PostMapping("add") // can't set name if the name is the same in form
	public String add(@Valid @ModelAttribute("order") Order order, BindingResult rs
			, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.order.add";
		}
		Order c = null;
		int save = 0;
		c = orderService.findOne(order);
		if (c == null) {
			save = orderService.save(order);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/order/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		return "redirect:/admin/order/add";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Integer id,Model model
			, RedirectAttributes msg) {
		int delete = orderService.deleteById(id);
		if (delete > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/order/index";
		}
		return "admin.order.index";
	}
	
	@GetMapping("/search")
	public String index(Model model,@RequestParam("search") String search, RedirectAttributes msg) {
		List<Order> listorders = new ArrayList<Order>();
		listorders = orderService.getBySearch(search);
		if (listorders.size() > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			model.addAttribute("listorders", listorders);
			return "admin.order.index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.empty", null, Locale.ENGLISH));
		return "admin.order.index";
	}

}
