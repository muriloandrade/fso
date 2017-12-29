package mtm2017.fsoapp.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mtm2017.fsoapp.model.Product;
import mtm2017.fsoapp.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private RequestMappingHandlerAdapter requestMappingHandlerAdapter;

	@Autowired
	private ServletContext servletContext;

	@PostConstruct
	public void init() {
		requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
	}

	private ProductService productService;

	@Autowired(required = true)
	@Qualifier(value = "productService")
	public void setProductService(ProductService ps) {
		this.productService = ps;
	}

	// List all products
	@RequestMapping(value = "/product/list")
	public String list(Model model, HttpSession session, HttpServletRequest request) {

		List<Product> productsList = this.productService.listAllProducts();

		// Passa os objetos obtidos para a pagina de resposta
		model.addAttribute("productsList", productsList);

		return "product_list_all";
	}

	// New product screen
	@RequestMapping(value = "/product/addscreen")
	public String addscreen(Model model, HttpSession session, HttpServletRequest request) {

		return "product_new";
	}

	// Add new product
	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute("product") Product p, HttpSession session, RedirectAttributes ra)
			throws IOException {
		// Variáveis para retornar mensagens de validação, erro ou sucesso
		String msgRetornoTipo = "danger";
		String msgRetorno = "";

		String return_page = "";

		// Procura pra ver se já existe com o SKU informado
		Product p2 = this.productService.getProduct(p);
		if (p2 != null) {
			// Retorna uma mensagem ao usuário
			msgRetornoTipo = "danger";
			msgRetorno = "Could not insert new product. " + p2.getSKU() + " already exists.";

			model.addAttribute("product", p);
			model.addAttribute("msgRetornoTipo", msgRetornoTipo);
			model.addAttribute("msgRetorno", msgRetorno);

			return_page = "product_new";
		} else {
			// Persiste o novo produto
			p.setAllUppercase();
			Product added = this.productService.addProduct(p);

			// Retorna uma mensagem ao usuário
			msgRetornoTipo = "success";
			msgRetorno = "Product " + added.getSKU() + " successfully inserted.";

			ra.addFlashAttribute("msgRetornoTipo", msgRetornoTipo);
			ra.addFlashAttribute("msgRetorno", msgRetorno);

			return_page = "redirect:/product/lookup?sku=" + added.getSKU();
		}

		return return_page;
	}

	// Edit product screen
	@RequestMapping(value = "/product/editscreen")
	public String editscreen(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page;

		Product p = new Product();
		String SKU = request.getParameter("sku").toUpperCase();
		p.setSKU(SKU);

		Product product = this.productService.getProduct(p);

		if (product == null) {

			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Product " + SKU + " not found.");

			return_page = "redirect:/";
		} else {
			model.addAttribute("product", product);
			return_page = "product_edit";
		}

		return return_page;
	}

	// Edit product
	@RequestMapping(value = "/product/edit", method = RequestMethod.POST)
	public String edit(Model model, @ModelAttribute("product") Product p, @RequestParam String old_sku,
			HttpSession session, RedirectAttributes ra) throws IOException {
		// Variáveis para retornar mensagens de validação, erro ou sucesso
		String msgRetornoTipo = "danger";
		String msgRetorno = "";

		String return_page = "";

		Product p2 = null;
		p.setAllUppercase();

		if (!p.getSKU().equals(old_sku)) {
			p2 = this.productService.getProduct(p);
		}

		if (p2 != null) {

			p.setSKU(old_sku);

			// Retorna uma mensagem ao usuário
			msgRetornoTipo = "danger";
			msgRetorno = "Could not update product. " + p2.getSKU() + " already exists.";

			model.addAttribute("product", p);
			model.addAttribute("msgRetornoTipo", msgRetornoTipo);
			model.addAttribute("msgRetorno", msgRetorno);

			return_page = "product_edit";
		} else {

			try {
				// Atualiza o produto
				p.setAllUppercase();
				this.productService.updateProduct(p, old_sku);

				// Retorna uma mensagem ao usuário
				msgRetornoTipo = "success";
				msgRetorno = "Product successfully updated.";

				ra.addFlashAttribute("msgRetornoTipo", msgRetornoTipo);
				ra.addFlashAttribute("msgRetorno", msgRetorno);

				return_page = "redirect:/product/lookup?sku=" + p.getSKU();

			} catch (ConstraintViolationException e) {
				
				ra.addFlashAttribute("msgRetornoTipo", "warning");
				ra.addFlashAttribute("msgRetorno",
						"Fail to update product. Cannot alter product's SKU because it is contained in purchase orders.");

				return_page = "redirect:/product/editscreen?sku=" + old_sku;
			}
		}

		return return_page;
	}

	// Remove product
	@RequestMapping(value = "/product/remove")
	public String remove(HttpServletRequest request, HttpSession session, RedirectAttributes ra) {
		// Variáveis para retornar mensagens de validação, erro ou sucesso
		String msgRetornoTipo = "danger";
		String msgRetorno = "";
		String return_page = "";

		Product p = new Product();
		String SKU = request.getParameter("sku").toUpperCase();
		p.setSKU(SKU);

		Product product = this.productService.getProduct(p);

		if (product == null) {

			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Product " + SKU + " not found.");

			return_page = "redirect:/";
		} else {

			try {
				// Remove o produto
				this.productService.removeProduct(SKU);

				// Retorna uma mensagem ao usuário
				msgRetornoTipo = "success";
				msgRetorno = "Product " + SKU + " successfully removed.";
				ra.addFlashAttribute("msgRetornoTipo", msgRetornoTipo);
				ra.addFlashAttribute("msgRetorno", msgRetorno);

				return_page = "redirect:/product/list";

			} catch (DataIntegrityViolationException e) {
				ra.addFlashAttribute("msgRetornoTipo", "warning");
				ra.addFlashAttribute("msgRetorno",
						"Could not remove product " + SKU + ". It is contained in purchase orders.");

				return_page = "redirect:/product/list";
			}
		}

		return return_page;
	}

	// Product lookup
	@RequestMapping(value = "/product/lookup")
	public String lookup(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page;

		Product p = new Product();
		String SKU = request.getParameter("sku").toUpperCase();
		p.setSKU(SKU);

		Product product = this.productService.getProduct(p);

		if (product == null) {

			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Product " + SKU + " not found.");

			return_page = "redirect:/";
		} else {
			model.addAttribute("product", product);
			return_page = "product_lookup";
		}

		return return_page;

	}

	// Obtem produto (item do pedido) a partir de seu SKU
	@RequestMapping("/product/getItem")
	@ResponseBody
	public Product getItem(@ModelAttribute("product") Product p, @RequestParam String sku) {
		Product prod = new Product();
		prod.setSKU(sku.toUpperCase());

		Product find_prod = this.productService.getProduct(prod);

		if (find_prod != null) {
			return find_prod;
		} else {
			return prod;
		}
	}

}
