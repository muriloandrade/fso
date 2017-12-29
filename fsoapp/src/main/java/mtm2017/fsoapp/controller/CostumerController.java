package mtm2017.fsoapp.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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

import mtm2017.fsoapp.model.Costumer;
import mtm2017.fsoapp.service.CostumerService;

@Controller
public class CostumerController {

	@Autowired
	private RequestMappingHandlerAdapter requestMappingHandlerAdapter;

	@Autowired
	private ServletContext servletContext;

	@PostConstruct
	public void init() {
		requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
	}

	private CostumerService costumerService;

	@Autowired(required = true)
	@Qualifier(value = "costumerService")
	public void setCostumerService(CostumerService cs) {
		this.costumerService = cs;
	}

	// List all clients
	@RequestMapping(value = "/client/list")
	public String list(Model model, HttpSession session, HttpServletRequest request) {

		List<Costumer> costumersList = this.costumerService.listAllCostumers();

		// Passa os objetos obtidos para a pagina de resposta
		model.addAttribute("costumersList", costumersList);

		return "client_list_all";
	}

	// New client screen
	@RequestMapping(value = "/client/addscreen")
	public String addscreen(Model model, HttpSession session, HttpServletRequest request) {

		return "client_new";
	}

	// Add new client
	@RequestMapping(value = "/client/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("costumer") Costumer c, HttpSession session, RedirectAttributes ra)
			throws IOException {
		// Variáveis para retornar mensagens de validação, erro ou sucesso
		String msgRetornoTipo = "danger";
		String msgRetorno = "";

		// Persiste o novo cliente
		c.setAllUppercase();
		Costumer added = this.costumerService.addCostumer(c);

		String CID = ("000000" + added.getCID()).substring(added.getCID().toString().length());

		// Retorna uma mensagem ao usuário
		msgRetornoTipo = "success";
		msgRetorno = "Client #" + CID + " successfully inserted.";
		ra.addFlashAttribute("msgRetornoTipo", msgRetornoTipo);
		ra.addFlashAttribute("msgRetorno", msgRetorno);

		return "redirect:/client/lookup?cid=" + CID;
	}

	// Edit client screen
	@RequestMapping(value = "/client/editscreen")
	public String editscreen(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page = "";

		Costumer c = new Costumer();
		String CID_string = request.getParameter("cid").toUpperCase();

		if (StringUtils.isNumeric(CID_string)) {
			Integer CID = Integer.valueOf(CID_string);
			c.setCID(CID);

			Costumer costumer = this.costumerService.getCostumer(c);

			if (costumer == null) {

				String CID_str = ("000000" + CID).substring(CID.toString().length());
				ra.addFlashAttribute("msgRetornoTipo", "warning");
				ra.addFlashAttribute("msgRetorno", "Client #" + CID_str + " not found.");

				return_page = "redirect:/";

			} else {
				model.addAttribute("costumer", costumer);
				return_page = "client_edit";
			}
		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Client " + CID_string + " not found.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// Edit client
	@RequestMapping(value = "/client/edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("costumer") Costumer c, HttpSession session, RedirectAttributes ra)
			throws IOException {
		// Variáveis para retornar mensagens de validação, erro ou sucesso
		String msgRetornoTipo = "danger";
		String msgRetorno = "";

		// Persiste o novo cliente
		c.setAllUppercase();
		this.costumerService.updateCostumer(c);

		String CID = ("000000" + c.getCID()).substring(c.getCID().toString().length());

		// Retorna uma mensagem ao usuário
		msgRetornoTipo = "success";
		msgRetorno = "Client #" + CID + " successfully updated.";
		ra.addFlashAttribute("msgRetornoTipo", msgRetornoTipo);
		ra.addFlashAttribute("msgRetorno", msgRetorno);

		return "redirect:/client/lookup?cid=" + CID;
	}

	// Remove client
	@RequestMapping(value = "/client/remove")
	public String remove(HttpServletRequest request, HttpSession session, RedirectAttributes ra) {
		// Variáveis para retornar mensagens de validação, erro ou sucesso
		String msgRetornoTipo = "danger";
		String msgRetorno = "";

		String return_page = "";

		Costumer c = new Costumer();
		String CID_string = request.getParameter("cid").toUpperCase();

		if (StringUtils.isNumeric(CID_string)) {
			Integer CID = Integer.valueOf(CID_string);
			c.setCID(CID);

			Costumer costumer = this.costumerService.getCostumer(c);

			if (costumer == null) {
				
				String CID_str = ("000000" + CID).substring(CID.toString().length());
				ra.addFlashAttribute("msgRetornoTipo", "warning");
				ra.addFlashAttribute("msgRetorno", "Client #" + CID_str + " not found.");

				return_page = "redirect:/";
			} else {

				try {
					// Remove o cliente
					this.costumerService.removeCostumer(CID);

					String CID_str = ("000000" + CID.toString()).substring(CID.toString().length());

					// Retorna uma mensagem ao usuário
					msgRetornoTipo = "success";
					msgRetorno = "Client #" + CID_str + " successfully removed.";
					ra.addFlashAttribute("msgRetornoTipo", msgRetornoTipo);
					ra.addFlashAttribute("msgRetorno", msgRetorno);

					return_page = "redirect:/home";
					
					
				} catch (DataIntegrityViolationException e) {

					String CID_str = ("000000" + CID).substring(CID.toString().length());
					ra.addFlashAttribute("msgRetornoTipo", "warning");
					ra.addFlashAttribute("msgRetorno", "Could not remove client #" + CID_str + ". There are purchase orders attached to it.");

					return_page = "redirect:/client/list";
				}
			}
		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Client " + CID_string + " not found.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// Client lookup
	@RequestMapping(value = "/client/lookup")
	public String lookup(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page;

		Costumer c = new Costumer();
		String CID_string = request.getParameter("cid").toUpperCase();

		if (StringUtils.isNumeric(CID_string)) {
			Integer CID = Integer.valueOf(CID_string);
			c.setCID(CID);

			Costumer costumer = this.costumerService.getCostumer(c);

			if (costumer == null) {

				String CID_str = ("000000" + CID).substring(CID.toString().length());
				ra.addFlashAttribute("msgRetornoTipo", "warning");
				ra.addFlashAttribute("msgRetorno", "Client #" + CID_str + " not found.");

				return_page = "redirect:/";
			} else {
				model.addAttribute("costumer", costumer);
				return_page = "client_lookup";
			}
		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Client " + CID_string + " not found.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// Obtem um cliente a partir de seu CID
	@RequestMapping("/costumer/get")
	@ResponseBody
	public Costumer get(@ModelAttribute("costumer") Costumer c, @RequestParam String cid) {
		Costumer costumer = new Costumer();

		if (StringUtils.isNumeric(cid)) {

			costumer.setCID(Integer.parseInt(cid));
			Costumer find_costumer = this.costumerService.getCostumer(costumer);

			if (find_costumer != null) {
				return find_costumer;
			}
		}
		return costumer;
	}

}
