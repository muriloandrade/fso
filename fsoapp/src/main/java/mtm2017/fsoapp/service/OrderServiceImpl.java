package mtm2017.fsoapp.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mtm2017.fsoapp.dao.OrderDAO;
import mtm2017.fsoapp.model.Costumer;
import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrdersTotal;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	@Override
	@Transactional
	public void addOrder(Order o) {
		this.orderDAO.addOrder(o);
	}

	@Override
	@Transactional
	public void updateOrder(Order o) {
		this.orderDAO.updateOrder(o);
	}

	@Override
	@Transactional
	public Order getOrder(Order o) {
		return this.orderDAO.getOrder(o);
	}

	@Override
	@Transactional
	public void removeOrder(int OID) {
		this.orderDAO.removeOrder(OID);
	}

	@Override
	@Transactional
	public List<Order> getOrdersByClient(Costumer c) {
		return this.orderDAO.getOrdersByClient(c);
	}

	@Override
	public OrdersTotal getOrdersTotal(int qt_days) {
		return this.orderDAO.getOrdersTotal(qt_days);
	}
}
