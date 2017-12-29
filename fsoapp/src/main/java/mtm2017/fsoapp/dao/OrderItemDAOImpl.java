package mtm2017.fsoapp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrderItem;

@Repository
@Transactional
public class OrderItemDAOImpl implements OrderItemDAO
{
	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf)
	{
		this.sessionFactory = sf;
	}

	@Override
	@Transactional
	public void addOrderItem(OrderItem oi)
	{
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(oi);		
	}

	@Override
	@Transactional
	public OrderItem getOrderItem(OrderItem oi)
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void removeOrderItem(int OIID)
	{
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderItem> getOrderItemsByOrder(Order o) {
		
		Session session = this.sessionFactory.getCurrentSession();
		Criteria c1 = session.createCriteria(OrderItem.class);
		c1.add(Restrictions.eq("order", o));
		c1.addOrder(org.hibernate.criterion.Order.asc("OIID"));
		List<OrderItem> orderItemsList = c1.list();
		
		return orderItemsList;
	}

}
