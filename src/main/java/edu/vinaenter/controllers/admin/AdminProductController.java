package edu.vinaenter.controllers.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.contant.GlobalContant;
import edu.vinaenter.models.Category;
import edu.vinaenter.models.Color;
import edu.vinaenter.models.Image;
import edu.vinaenter.models.Product;
import edu.vinaenter.models.Size;
import edu.vinaenter.services.CategoryService;
import edu.vinaenter.services.ColorService;
import edu.vinaenter.services.ImageService;
import edu.vinaenter.services.ProductService;
import edu.vinaenter.services.SizeService;
import edu.vinaenter.util.FileUtil;
import edu.vinaenter.util.PageUtil;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(AdminProductController.class);
	
	@Resource
	MessageSource messageSource;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private ColorService colorService;
	
	@Autowired
	private SizeService sizeService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping({"index","/index/{page}"})
	public String index(Model model, HttpServletRequest request,@PathVariable(required = false) Integer page) {
		logger.info("this is log");
		List<Product> listProducts = null;
		int totalPage = PageUtil.getTotalRow(productService.getTotalProduct());
		if ( page == null) {
			page = 1;
		}
		if (page < 1 || page > totalPage) {
			page = 1 ;
		}
		listProducts = productService.getByPagination(PageUtil.getOffset(page), GlobalContant.TOTAL_PAGE);
		model.addAttribute("currentPage",page);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("listproducts", listProducts);
		return "admin.product.index";
	}

	@GetMapping("add")
	public String add(Model model) {
		List<Color> listColors = colorService.getAll();
		List<Size> listSizes = sizeService.getAll();
		List<Category> listcatss = categoryService.getAll();
		List<Category> listcats = new ArrayList<Category>();
		for (Category c : listcatss) {
			if (c.getParent_id()==2) {
				listcats.add(c);
			}
		}
		model.addAttribute("listcolors",listColors);
		model.addAttribute("listsizes",listSizes);
		model.addAttribute("listcats",listcats);
		return "admin.product.add";
	}

	@GetMapping({"edit/{id}","edit"})
	public String edit(@PathVariable Integer id, Model model) {
		List<Color> listColors = colorService.getAll();
		List<Size> listSizes = sizeService.getAll();
		List<Category> listcatss = categoryService.getAll();
		List<Category> listcats = new ArrayList<Category>();
		for (Category c : listcatss) {
			if (c.getParent_id()==2) {
				listcats.add(c);
			}
		}
		Product Product = productService.getById(id);
		model.addAttribute("listcolors",listColors);
		model.addAttribute("listsizes",listSizes);
		model.addAttribute("listcats",listcats);
		model.addAttribute("product",Product);
		return "admin.product.edit";
	}
	
	@GetMapping("view/{id}")
	public String view(@PathVariable Integer id, Model model) {
		Product product = productService.getById(id);
		List<Color> listColors = new ArrayList<Color>();
		List<Size> listSizes = new ArrayList<Size>();
		List<Image> listImages = new ArrayList<Image>();
		String arrC[] =product.getColor().split(",");
		String arrS[] =product.getSize().split(",");
		ArrayList<Integer> arrImage = product.getArImage();
		for (int i=0;i<arrC.length;i++) {
			listColors.add(colorService.getById(Integer.parseInt(arrC[i])));
		}
		for (int i=0;i<arrS.length;i++) {
			listSizes.add(sizeService.getById(Integer.parseInt(arrS[i])));
		}
		for (int i :arrImage) {
			listImages.add(imageService.getById(i));
		}
		List<Category> listcatss = categoryService.getAll();
		List<Category> listcats = new ArrayList<Category>();
		for (Category c : listcatss) {
			if (c.getParent_id()==2) {
				listcats.add(c);
			}
		}
		model.addAttribute("listcolors",listColors);
		model.addAttribute("listsizes",listSizes);
		model.addAttribute("listcats",listcats);
		model.addAttribute("listImages",listImages);
		model.addAttribute("product",product);
		return "admin.product.view";
	}
	
	@PostMapping("edit")
	public String edit(@Valid @ModelAttribute("product") Product product,@RequestParam("imagef") List<MultipartFile> listImage, BindingResult rs
			,@RequestParam(name="color",required=false) List<String> color,@RequestParam(name="size",required=false) List<String> size,HttpServletRequest HttpServletRequest, RedirectAttributes msg) {
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			return "admin.product.edit";
		}
		// if don't select image , size , color get old value
		Product old = productService.getById(product.getId());
		if (listImage.size() == 1 && "".equals(listImage.get(0).getOriginalFilename()) ) {
			product.setArImage(old.getArImage());
		}else {
			List<Image> aI = new ArrayList<Image>();
			int numImg = listImage.size();
			ArrayList<Integer> arImage = new ArrayList<Integer>();
			for (MultipartFile f : listImage) {
				FileUtil.upload(f,HttpServletRequest);
				imageService.save(new Image(f.getOriginalFilename()));
			}
			aI = imageService.getAll();
			for (int i=numImg;i>=1;i--) {
				 arImage.add(aI.get(aI.size()-i).getId());
			}
			product.setArImage(arImage);
		}
		if (color == null ) {
			product.setColor(old.getColor());
		}
		if (size == null) {
			product.setSize(old.getSize());
		}
		// validate 
		Product c = null;
		int save = 0;
		c = productService.validateUpdate(product);
		if (c == null) {
			save = productService.edit(product);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/product/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		int cid = product.getId();
		return "redirect:/admin/product/edit/"+cid;
	}

	
	@PostMapping("add") // can't set name if the name is the same in form
	public String add(@Valid @ModelAttribute("product") Product product,@RequestParam("imagef") List<MultipartFile> listImage, BindingResult rs
			,@RequestParam("color") List<String> color,@RequestParam("size") List<String> size,HttpServletRequest HttpServletRequest, RedirectAttributes msg) {
		logger.debug("this is log");
		if (rs.hasErrors()) {
			System.out.println("Có lỗi dữ liệu");
			System.out.println(rs.getFieldError().getField());
			return "admin.product.add";
		}
		// get final id for image list
		List<Image> aI = new ArrayList<Image>();
		int numImg = listImage.size();
		ArrayList<Integer> arImage = new ArrayList<Integer>();
		for (MultipartFile f : listImage) {
			String fileName = FileUtil.upload(f,HttpServletRequest);
			imageService.save(new Image(fileName));
		}
		aI = imageService.getAll();
		for (int i=numImg;i>=1;i--) {
			 arImage.add(aI.get(aI.size()-i).getId());
		}
		product.setArImage(arImage);
		Product p = null;
		p = productService.findOne(product);
		int save = 0;
		if (p == null) {
			 save = productService.save(product);
		}
		if (save > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/product/index";
		}
		msg.addFlashAttribute("msg",messageSource.getMessage("msg.exist", null, Locale.ENGLISH));
		return "redirect:/admin/product/add";

	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Integer id,Model model
			, RedirectAttributes msg) {
		int delete = productService.deleteById(id);
		if (delete > 0) {
			msg.addFlashAttribute("msg",messageSource.getMessage("msg.success", null, Locale.ENGLISH));
			return "redirect:/admin/product/index";
		}
		return "admin.product.index";
	}
	
	@GetMapping({"/search","/{page}/search"})
	public String index(Model model,@PathVariable(required = false) Integer page,@RequestParam("search") String search) {
		if ( page == null) {
			page = 1;
		}
		int totalPage = PageUtil.getTotalRow(productService.totalRowSearch(search));
		List<Product> listproducts = new ArrayList<Product>();
		listproducts = productService.getBySearch(search,PageUtil.getOffset(page),GlobalContant.TOTAL_PAGE);
		model.addAttribute("search",search);
		model.addAttribute("listproducts", listproducts);
		model.addAttribute("currentPage",page);
		model.addAttribute("totalPage",totalPage);
		return "admin.product.index";
	}

}
