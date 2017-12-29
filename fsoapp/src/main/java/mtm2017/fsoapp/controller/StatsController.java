package mtm2017.fsoapp.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mtm2017.fsoapp.model.ClientRanking;
import mtm2017.fsoapp.model.OrdersTotal;
import mtm2017.fsoapp.model.ProdRanking;
import mtm2017.fsoapp.service.CostumerService;
import mtm2017.fsoapp.service.OrderService;
import mtm2017.fsoapp.service.ProductService;

@Controller
public class StatsController {

	@Autowired
	private RequestMappingHandlerAdapter requestMappingHandlerAdapter;

	@Autowired
	private ServletContext servletContext;

	@PostConstruct
	public void init() {
		requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
	}

	private ProductService productService;
	private OrderService orderService;
	private CostumerService costumerService;

	@Autowired(required = true)
	@Qualifier(value = "productService")
	public void setProductService(ProductService ps) {
		this.productService = ps;
	}

	@Autowired(required = true)
	@Qualifier(value = "orderService")
	public void setOrderService(OrderService os) {
		this.orderService = os;
	}

	@Autowired(required = true)
	@Qualifier(value = "costumerService")
	public void setCostumerService(CostumerService cs) {
		this.costumerService = cs;
	}

	// Products Ranking
	@RequestMapping(value = "/stats/prod_ranking")
	public String prod_ranking(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page = "";

		String qt_days = request.getParameter("d");
		if (StringUtils.isNumeric(qt_days)
				&& (qt_days.equals("30") || qt_days.equals("90") || qt_days.equals("180") || qt_days.equals("360"))) {
			List<ProdRanking> prodRanking = this.productService.getProdRanking(Integer.valueOf(qt_days));

			Double total = 0.0;
			for (ProdRanking pr : prodRanking) {
				total += pr.getSum_sales().doubleValue();
			}

			for (ProdRanking pr : prodRanking) {
				pr.setRatio(pr.getSum_sales().floatValue() / total.floatValue());
			}

			String period = "";
			switch (qt_days) {
			case "30":
				period = "30 days";
				break;
			case "90":
				period = "90 days";
				break;
			case "180":
				period = "180 days";
				break;
			case "360":
				period = "1 year";
				break;
			default:
				break;
			}

			model.addAttribute("prodRanking", prodRanking);
			model.addAttribute("period", period);

			return_page = "stats_prod_ranking";

		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Could not perform statistic results. Invalid period provided.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// Client Ranking
	@RequestMapping(value = "/stats/client_ranking")
	public String client_ranking(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page = "";

		String qt_days = request.getParameter("d");
		if (StringUtils.isNumeric(qt_days)
				&& (qt_days.equals("30") || qt_days.equals("90") || qt_days.equals("180") || qt_days.equals("360"))) {
			List<ClientRanking> clientRanking = this.costumerService.getClientRanking(Integer.valueOf(qt_days));

			Double total = 0.0;
			for (ClientRanking cr : clientRanking) {
				total += cr.getSum_sales().doubleValue();
			}

			for (ClientRanking cr : clientRanking) {
				cr.setRatio(cr.getSum_sales().floatValue() / total.floatValue());
			}

			String period = "";
			switch (qt_days) {
			case "30":
				period = "30 days";
				break;
			case "90":
				period = "90 days";
				break;
			case "180":
				period = "180 days";
				break;
			case "360":
				period = "1 year";
				break;
			default:
				break;
			}

			model.addAttribute("clientRanking", clientRanking);
			model.addAttribute("period", period);

			return_page = "stats_client_ranking";

		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Could not perform statistic results. Invalid period provided.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// Total Sales / Avg. Value of Orders
	@RequestMapping(value = "/stats/total")
	public String total(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page = "";

		OrdersTotal total30 = this.orderService.getOrdersTotal(30);
		OrdersTotal total90 = this.orderService.getOrdersTotal(90);
		OrdersTotal total180 = this.orderService.getOrdersTotal(180);
		OrdersTotal total360 = this.orderService.getOrdersTotal(360);
		
		model.addAttribute("total30", total30);
		model.addAttribute("total90", total90);
		model.addAttribute("total180", total180);
		model.addAttribute("total360", total360);

		return "stats_total_ranking";
	}

}
