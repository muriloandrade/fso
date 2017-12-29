package mtm2017.fsoapp.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mtm2017.fsoapp.dao.OrderItemDAO;
import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrderItem;

@Service
@Transactional
public class OrderItemServiceImpl implements OrderItemService
{
	@Autowired
	private OrderItemDAO orderItemDAO;
	public void setOrderItemDAO(OrderItemDAO orderItemDAO) {
		this.orderItemDAO = orderItemDAO;
	}

	@Override
	@Transactional
	public void addOrderItem(OrderItem oi)
	{
		this.orderItemDAO.addOrderItem(oi);
	}

	@Override
	@Transactional
	public OrderItem getOrderItem(OrderItem oi)
	{
		return this.orderItemDAO.getOrderItem(oi);
	}

	@Override
	@Transactional
	public void removeOrderItem(int OIID)
	{
		this.orderItemDAO.removeOrderItem(OIID);
	}

	@Override
	@Transactional
	public List<OrderItem> getOrderItemsByOrder(Order o) {

		return this.orderItemDAO.getOrderItemsByOrder(o);
	}
}
