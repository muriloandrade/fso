package mtm2017.fsoapp.service;

import java.util.List;
import mtm2017.fsoapp.model.Costumer;
import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrderItem;

public interface OrderItemService
{
	public void addOrderItem(OrderItem oi);

	public OrderItem getOrderItem(OrderItem oi);

	public void removeOrderItem(int OIID);
	
	public List<OrderItem> getOrderItemsByOrder(Order o);
}