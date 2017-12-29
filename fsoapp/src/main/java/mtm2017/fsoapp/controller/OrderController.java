package mtm2017.fsoapp.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mtm2017.fsoapp.model.Costumer;
import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrderItem;
import mtm2017.fsoapp.model.Product;
import mtm2017.fsoapp.service.CostumerService;
import mtm2017.fsoapp.service.OrderItemService;
import mtm2017.fsoapp.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	private RequestMappingHandlerAdapter requestMappingHandlerAdapter;

	@Autowired
	private ServletContext servletContext;

	@PostConstruct
	public void init() {
		requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
	}

	private CostumerService costumerService;
	private OrderService orderService;
	private OrderItemService orderItemService;

	@Autowired(required = true)
	@Qualifier(value = "costumerService")
	public void setCostumerService(CostumerService cs) {
		this.costumerService = cs;
	}

	@Autowired(required = true)
	@Qualifier(value = "orderService")
	public void setOrderService(OrderService os) {
		this.orderService = os;
	}

	@Autowired(required = true)
	@Qualifier(value = "orderItemService")
	public void setOrderItemService(OrderItemService ois) {
		this.orderItemService = ois;
	}

	// List all orders by clients
	@RequestMapping(value = "/order/list")
	public String list(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

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

				List<Order> ordersList = this.orderService.getOrdersByClient(costumer);

				model.addAttribute("costumer", costumer);
				model.addAttribute("ordersList", ordersList);

				return_page = "order_list";
			}
		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Client " + CID_string + " not found.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// New order screen
	@RequestMapping(value = "/order/addscreen")
	public String addscreen(Model model, HttpSession session, HttpServletRequest request) {

		return "order_new";
	}

	// Add order
	@RequestMapping(value = "/order/add", method = RequestMethod.POST)
	public String add(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra)
			throws ParseException {

		Integer CID = Integer.parseInt(request.getParameter("cid"));
		Date orderdate = new Date(Calendar.getInstance().getTimeInMillis());
		
		// Converte string para java.sql.Date
		Date shipdate = null;
		String shipdate_str_1 = request.getParameter("shipdate");
		if (!shipdate_str_1.isEmpty()) {
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
			java.util.Date shipdate_date_1 = sdf1.parse(shipdate_str_1);

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String shipdate2 = sdf2.format(shipdate_date_1);
			shipdate = Date.valueOf(shipdate2);
		}

		String orderstatus = "PENDING";

		String total_str = request.getParameter("total");
		total_str = total_str.substring(9).replace(",", "");
		BigDecimal total = new BigDecimal(Double.valueOf(total_str));

		ArrayList<OrderItem> orderItems = new ArrayList<>();
		OrderItem oi = null;
		Product p = null;
		String sku = "";
		BigDecimal price = new BigDecimal(0.0);
		Integer quant = 0;

		for (int i = 1; i <= 10; i++) {
			sku = request.getParameter("sku_" + i).toUpperCase();
			if (!sku.isEmpty()) {
				quant = Integer.parseInt(request.getParameter("qty_" + i));
				String price_str = request.getParameter("price_" + i).substring(2);
				price = BigDecimal.valueOf(Double.valueOf(price_str));

				p = new Product();
				p.setSKU(sku);

				oi = new OrderItem();
				oi.setProduct(p);
				oi.setPrice(price);
				oi.setQuant(quant);				

				orderItems.add(oi);
			}
		}

		Costumer costumer = new Costumer();
		costumer.setCID(CID);

		Order order = new Order();
		order.setCostumer(costumer);
		order.setOrderdate(orderdate);
		order.setShipdate(shipdate);
		order.setOrderstatus(orderstatus);
		order.setTotal(total);
		order.setOrderItems(orderItems);

		this.orderService.addOrder(order);

		String OID = ("000000" + order.getOID()).substring(order.getOID().toString().length());

		ra.addFlashAttribute("msgRetornoTipo", "success");
		ra.addFlashAttribute("msgRetorno", "Order #" + OID + " successfully created.");

		return "redirect:/order/lookup?oid=" + OID;
	}

	// Order lookup
	@RequestMapping(value = "/order/lookup")
	public String lookup(Model model, HttpSession session, HttpServletRequest request, RedirectAttributes ra) {

		String return_page;

		Order o = new Order();
		String OID_string = request.getParameter("oid").toUpperCase();

		if (StringUtils.isNumeric(OID_string)) {
			Integer OID = Integer.valueOf(OID_string);
			o.setOID(OID);

			Order order = this.orderService.getOrder(o);

			if (order == null) {

				String OID_str = ("000000" + OID).substring(OID.toString().length());
				ra.addFlashAttribute("msgRetornoTipo", "warning");
				ra.addFlashAttribute("msgRetorno", "Order #" + OID_str + " not found.");

				return_page = "redirect:/";
			} else {

				List<OrderItem> orderItems = this.orderItemService.getOrderItemsByOrder(order);

				if (orderItems != null)
					model.addAttribute("orderItems", orderItems);
				model.addAttribute("order", order);

				return_page = "order_lookup";
			}
		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Order " + OID_string + " not found.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// Update Status screen
	@RequestMapping(value = "/order/update_status_screen")
	public String updateStatusScreen(Model model, HttpSession session, HttpServletRequest request,
			RedirectAttributes ra) {

		String return_page = "";

		String OID_string = request.getParameter("oid").toUpperCase();

		if (StringUtils.isNumeric(OID_string)) {

			Integer OID = Integer.parseInt(OID_string);
			Order o = new Order();
			o.setOID(OID);
			Order order = this.orderService.getOrder(o);

			if (order == null) {

				String OID_str = ("000000" + OID_string).substring(OID_string.length());
				ra.addFlashAttribute("msgRetornoTipo", "warning");
				ra.addFlashAttribute("msgRetorno", "Order #" + OID_str + " not found.");

				return_page = "redirect:/";
			} else {

				model.addAttribute("order", order);

				return_page = "order_update_status";
			}
		} else {
			ra.addFlashAttribute("msgRetornoTipo", "warning");
			ra.addFlashAttribute("msgRetorno", "Order " + OID_string + " not found.");

			return_page = "redirect:/";
		}

		return return_page;
	}

	// Update Status
	@RequestMapping(value = "/order/update_status", method = RequestMethod.POST)
	public String updateStatus(@ModelAttribute("order") Order o, HttpServletRequest request, HttpSession session,
			RedirectAttributes ra) throws IOException {
		// Variáveis para retornar mensagens de validação, erro ou sucesso
		String msgRetornoTipo = "danger";
		String msgRetorno = "";

		Integer CID = Integer.parseInt((String) request.getParameter("CID"));
		Costumer costumer = new Costumer();
		costumer.setCID(CID);

		o.setCostumer(costumer);

		// Atualiza o status
		o.setOrderstatus(o.getOrderstatus().toUpperCase());
		this.orderService.updateOrder(o);

		String OID = ("000000" + o.getOID()).substring(o.getOID().toString().length());

		// Retorna uma mensagem ao usuário
		msgRetornoTipo = "success";
		msgRetorno = "Status of order #" + OID + " successfully updated to " + o.getOrderstatus() + ".";
		ra.addFlashAttribute("msgRetornoTipo", msgRetornoTipo);
		ra.addFlashAttribute("msgRetorno", msgRetorno);

		return "redirect:/order/list?cid=" + CID;
	}

}