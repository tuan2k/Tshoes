package edu.vinaenter.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.contant.GlobalContant;
import edu.vinaenter.models.Cart;
import edu.vinaenter.models.Category;
import edu.vinaenter.models.Color;
import edu.vinaenter.models.Comment;
import edu.vinaenter.models.Image;
import edu.vinaenter.models.Order;
import edu.vinaenter.models.Product;
import edu.vinaenter.models.SignupRequest;
import edu.vinaenter.models.Size;
import edu.vinaenter.models.User;
import edu.vinaenter.services.CartService;
import edu.vinaenter.services.CategoryService;
import edu.vinaenter.services.ColorService;
import edu.vinaenter.services.CommentService;
import edu.vinaenter.services.ImageService;
import edu.vinaenter.services.OrderService;
import edu.vinaenter.services.ProductService;
import edu.vinaenter.services.SizeService;
import edu.vinaenter.services.UserService;
import edu.vinaenter.util.PageUtil;

@Controller
public class TshoesController {

	List<Cart> listCarts;

	@Autowired
	private ProductService productService;

	@Autowired
	private ImageService imageService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private UserService userService;

	@Autowired
	private ColorService colorService;

	@Autowired
	private SizeService sizeService;

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired  PasswordEncoder passwordEncoder;

	@Resource
	MessageSource messageSource;

	@GetMapping({ "index", "/","/{page}" })
	public String index(Model model, HttpServletRequest request,@PathVariable(required = false) Integer page) {
		Authentication loggedInUser = SecurityContextHolder.getContext().getAuthentication();
		if (!"anonymousUser".equals(loggedInUser.getName())) {
			String username = loggedInUser.getName();
			User user = userService.getByName(username);
			HttpSession ss = request.getSession();
			ss.setAttribute("userLogin", user);
		}
		int totalPage = PageUtil.getTotalRow(productService.getTotalProduct());
		if ( page == null) {
			page = 1;
		}
		if (page < 1 || page > totalPage) {
			page = 1 ;
		}
		List<Product> listProductsP = productService.getByPagination(PageUtil.getOffset(page), GlobalContant.TOTAL_PAGE);
		List<Integer> imageId = new ArrayList<Integer>();
		//List<Product> listProducts = productService.getAll();
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		for (Product p : listProductsP) {
			imageId = p.getArImage();
			Image img = imageService.getById(imageId.get(0));
			p.setString(img.getName());
		}
		model.addAttribute("currentPage",page);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		model.addAttribute("listproducts", listProductsP);
		return "tshoes.index";
	}
	
	@GetMapping("/cat/{id}")
	public String cat(Model model, HttpServletRequest request,@PathVariable(required = false) Integer page
			,@PathVariable(required = false) Integer id) {
		int totalPage = PageUtil.getTotalRow(productService.getTotalRowCategory(id));
		if ( page == null) {
			page = 1;
		}
		if (page < 1 || page > totalPage) {
			page = 1 ;
		}
		List<Product> listProductsP = productService.getByCatPagination(id,PageUtil.getOffset(page), GlobalContant.TOTAL_PAGE);
		List<Integer> imageId = new ArrayList<Integer>();
		//List<Product> listProducts = productService.getAll();
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		for (Product p : listProductsP) {
			imageId = p.getArImage();
			Image img = imageService.getById(imageId.get(0));
			p.setString(img.getName());
		}
		model.addAttribute("currentPage",page);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		model.addAttribute("listproducts", listProductsP);
		return "tshoes.index";
	}

	@PostMapping("/search")
	public String index(HttpServletRequest request, Model model,@RequestParam("cat_id") Integer cat_id,
			@RequestParam("catname") String catname,@PathVariable(required = false) Integer page) {
		List<Integer> imageId = new ArrayList<Integer>();
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		int totalPage = PageUtil.getTotalRow(productService.totalRowSearch(catname,cat_id));
		if ( page == null) {
			page = 1;
		}
		if (page < 1 || page > totalPage) {
			page = 1 ;
		}
		List<Product> listProducts = productService.getBySearch(catname,cat_id,PageUtil.getOffset(page), GlobalContant.TOTAL_PAGE);
		for (Product p : listProducts) {
			imageId = p.getArImage();
			Image img = imageService.getById(imageId.get(0));
			p.setString(img.getName());
		}
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		model.addAttribute("listproducts", listProducts);
		return "tshoes.index";
	}

	@GetMapping("detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id, RedirectAttributes msg) {
		Product product = productService.getById(id);
		List<Product> similarProducts = productService.getProductByCatId(product.getCat_id());
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		List<Size> listSizes = new ArrayList<Size>();
		List<Color> listColors = new ArrayList<Color>();
		List<Image> listImages = new ArrayList<Image>();
		List<Integer> imageId = new ArrayList<Integer>();
		String arrSize[] = product.getSize().split(",");
		String arrColor[] = product.getColor().split(",");
		for (int i = 0; i < arrSize.length; i++) {
			listSizes.add(sizeService.getById(Integer.parseInt(arrSize[i])));
		}
		for (int i = 0; i < arrColor.length; i++) {
			listColors.add(colorService.getById(Integer.parseInt(arrColor[i])));
		}
		imageId = product.getArImage();
		for (int idd : imageId) {
			listImages.add(imageService.getById(idd));
		}
		for (Product p : similarProducts) {
			imageId = null;
			imageId = p.getArImage();
			Image img = imageService.getById(imageId.get(0));
			p.setString(img.getName());
		}
		List<Comment> listComments = commentService.getByProductId(id);
		List<User> listUsers  = new ArrayList<User>();
		if (listComments.size() >= 1) {
			for (Comment cm: listComments) {
				listUsers.add(userService.getById(cm.getUser_id()));
			}
		}
		model.addAttribute("listUsers",listUsers);
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		model.addAttribute("similarProducts",similarProducts);
		model.addAttribute("listComments",listComments);
		model.addAttribute("listimages", listImages);
		model.addAttribute("product", product);
		model.addAttribute("listsizes", listSizes);
		model.addAttribute("listcolors", listColors);
		return "tshoes.detail";
	}

	@PostMapping("buy")
	public void buy(@RequestParam(required = false) Integer aidPro, @RequestParam(required = false) Integer idColor,
			@RequestParam(required = false) Integer idSize, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		HttpSession session = request.getSession();
		session.getAttribute("userLogin");
		if (session.getAttribute("listCarts") != null) {
			listCarts = (List<Cart>) session.getAttribute("listCarts");
		} else {
			listCarts = new ArrayList<Cart>();
		}
		boolean check = false;
		boolean newbie = false;
		// Kiểm tra sản phẩm đã có trong giỏ hàng chưa?
		if (listCarts.size() > 0) {
			for (Cart objCart : listCarts) {
				if (objCart.getProduct_id() == aidPro && objCart.getColor_id() == idColor
						&& objCart.getSize_id() == idSize) {
					objCart.setNumber(1 + objCart.getNumber());
					check = true;
					break;
				}
			}
		}
		// kiem tra ton tai order chua
		if (check == false) {
			Cart c = new Cart(1, idColor, idSize, aidPro, 1);
			listCarts.add(c);
		}
		// check first time add product to cart
		if (session.getAttribute("listCarts") == null) {
			session.setAttribute("listCarts", listCarts);
		}
		response.getWriter().print(listCarts.size());
	}

	@GetMapping("buy")
	public String index2(Model model) {
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		List<Product> listProducts = productService.getAll();
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		model.addAttribute("listproducts", listProducts);
		return "tshoes.index";
	}

	@GetMapping("contact")
	public String contact() {
		return "tshoes.contact";
	}

	@GetMapping("login")
	public String login(Model model) {
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		return "tshoes.login";
	}

	@GetMapping("register")
	public String register(Model model) {
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		return "tshoes.register";
	}
	
	@GetMapping("logout")
	public String logout(Model model,HttpServletRequest request) {
		HttpSession ss = request.getSession();
		ss.removeAttribute("userLogin");
		if (ss.getAttribute("listCarts") != null) {
			ss.removeAttribute("listCarts");
		}
		
		
		return "tshoes.index";
	}
	
	@PostMapping("register")
	public String register(Model model,@Valid @ModelAttribute("signuprequest") SignupRequest signupRequest,BindingResult rs,
			RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("có lỗi dữ liệu");
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.faile", null, Locale.ENGLISH));
			return "tshoes.register";
		}
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		if (signupRequest != null) {
			if (signupRequest.getPassword().equals(signupRequest.getRpassword())) {
				User u = new User(signupRequest.getUsername(), passwordEncoder.encode(signupRequest.getPassword()), signupRequest.getAddress(),
						signupRequest.getPhone(), signupRequest.getFullname(), 3);
				int sav=0;
				User uuu = null;
				uuu = userService.findOne(u);
				if (uuu == null) {
					sav = userService.saveSignup(u);
					if (sav > 0) {
						//sucess
						return "redirect:/login";
					}else {
						msg.addFlashAttribute("msg",messageSource.getMessage("msg.password", null, Locale.ENGLISH));
						return "tshoes.register";
					}
				}else {
					msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
					return "tshoes.register";
				}
				
			}else {
				msg.addFlashAttribute("msg",messageSource.getMessage("msg.password", null, Locale.ENGLISH));
				return "tshoes.register";
			}
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.faile", null, Locale.ENGLISH));
		return "tshoes.register";
	}

	@GetMapping("order")
	public String checkout(HttpServletResponse response, HttpServletRequest request,Model model) {
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		listCarts = (List<Cart>) session.getAttribute("listCarts");
		int totalPrice=0;
		Product product = null;
		for (Cart c : listCarts) {
			product = productService.getById(c.getProduct_id());
			totalPrice += product.getPrice()*c.getNumber();
		}
		Order order = new Order(userLogin.getId(), totalPrice, 0 , "");
		orderService.save(order);
		Order o = orderService.getByUserIdAndTotal(userLogin.getId(),totalPrice);
		for (Cart c : listCarts) {
			c.setOrder_id(o.getId());
			cartService.save(c);
		}
		model.addAttribute("order",o);
		model.addAttribute("user",userLogin);
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		return "tshoes.order";
	}

	@GetMapping("cart")
	public String cart(Model model, HttpServletRequest request) {
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		List<Product> listProducts = new ArrayList<Product>();
		List<Size> listSizes = null;
		List<Color> listColors = null;
		Size size = new Size();
		Color color = new Color();
		boolean checkC = true;
		boolean checkS = true;
		HttpSession session = request.getSession();
		if (session.getAttribute("listCarts") != null) {
			listCarts = (List<Cart>) session.getAttribute("listCarts");
			for (Cart c : listCarts) {
				checkC = true;
				checkS = true;
				if (listColors == null) {
					listColors = new ArrayList<Color>();
					listColors.add(colorService.getById(c.getColor_id()));
				} else {
					color = colorService.getById(c.getColor_id());
					for (Color cc : listColors) {
						if (color.getName().equals(cc.getName())) {
							checkC = false;
						}
					}
					if (checkC == true) {
						listColors.add(color);
					}
				}

				if (listSizes == null) {
					listSizes = new ArrayList<Size>();
					listSizes.add(sizeService.getById(c.getSize_id()));
				} else {
					size = sizeService.getById(c.getSize_id());
					for (int i = 0; i < listSizes.size(); i++) {
						if (size.getSize() == listSizes.get(i).getSize()) {
							checkS = false;
						}
					}
					if (checkS == true) {
						listSizes.add(size);
					}
				}

				listProducts.add(productService.getById(c.getProduct_id()));
			}
		}
		model.addAttribute("listCarts", listCarts);
		model.addAttribute("listColors", listColors);
		model.addAttribute("listSizes", listSizes);
		model.addAttribute("listProducts", listProducts);
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		return "tshoes.checkout";
	}

	@PostMapping("num")
	public void num(HttpServletResponse response, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		int idPro = Integer.parseInt(request.getParameter("aidPro"));
		int cId = Integer.parseInt(request.getParameter("cId"));
		int sId = Integer.parseInt(request.getParameter("sId"));
		int number = Integer.parseInt(request.getParameter("check"));
		List<Integer> listNumber = new ArrayList<>();
		listCarts = (List<Cart>) session.getAttribute("listCarts");
		// tang giam so luong
		for (Cart c : listCarts) {
			if (c.getProduct_id() == idPro && c.getColor_id() == cId && c.getSize_id() == sId) {
				Product p = productService.getById(c.getProduct_id());
				if (number == 1) {
					c.setNumber(c.getNumber() + 1);
					listNumber.add(c.getNumber());
				} else if (c.getNumber() > 1) {
					c.setNumber(c.getNumber() - 1);
					listNumber.add(c.getNumber());
				} else {
					response.getWriter().print(listNumber);
					return;
				}
				break;
			}
		}
		response.getWriter().print(listNumber);
	}

	@GetMapping("num")
	public void num2(HttpServletResponse response, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int pid = Integer.parseInt(request.getParameter("pid"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		int sid = Integer.parseInt(request.getParameter("sid"));
		listCarts = (List<Cart>) session.getAttribute("listCarts");
		Cart cart = null;
		for (Cart ca : listCarts) {
			if (ca.getProduct_id() == pid && ca.getColor_id() == cid && ca.getSize_id() ==sid)
				cart = ca;
		}
		listCarts.remove(cart);
	}
	
	@GetMapping("success")
	public String sucess(Model model,HttpServletRequest request,RedirectAttributes msg) {
		List<Category> listCategoryG = categoryService.getByGrand();
		List<Category> listCategoryP = categoryService.getByParent();
		List<Category> listCategoryC = categoryService.getByChild();
		HttpSession session = request.getSession();
		session.removeAttribute("listCarts");
		List<Integer> imageId = new ArrayList<Integer>();
		List<Product> listProducts = productService.getAll();
		for (Product p : listProducts) {
			imageId = p.getArImage();
			Image img = imageService.getById(imageId.get(0));
			p.setString(img.getName());
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.buysuccess", null, Locale.ENGLISH));
		model.addAttribute("listproducts", listProducts);
		model.addAttribute("listCategoryG",listCategoryG);
		model.addAttribute("listCategoryP",listCategoryP);
		model.addAttribute("listCategoryC",listCategoryC);
		return "tshoes.index";
	}

	@PostMapping("comment")
	public void comment(HttpServletRequest request, HttpServletResponse response,Model model) {
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
		String content = request.getParameter("comment");
		int rate = Integer.parseInt(request.getParameter("rate"));
		Comment comment = new Comment(uid, pid, content, rate);
		commentService.save(comment);
		List<Comment> listComments = commentService.getByProductId(pid);
		model.addAttribute("listComments",listComments);
	}
}
