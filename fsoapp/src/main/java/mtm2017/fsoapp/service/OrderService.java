package mtm2017.fsoapp.service;

import java.util.List;

import mtm2017.fsoapp.model.Costumer;
import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrdersTotal;

public interface OrderService
{
	public void addOrder(Order o);

	public void updateOrder(Order o);

	public Order getOrder(Order o);	

	public void removeOrder(int OID);
	
	public List<Order> getOrdersByClient(Costumer c);
	
	public OrdersTotal getOrdersTotal(int qt_days);
	
}