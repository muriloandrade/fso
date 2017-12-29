package mtm2017.fsoapp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mtm2017.fsoapp.model.Costumer;
import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrderItem;
import mtm2017.fsoapp.model.OrdersTotal;
import mtm2017.fsoapp.model.OrdersTotalRT;

@Repository
@Transactional
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	@Transactional
	public void addOrder(Order o) {
		Session session = this.sessionFactory.getCurrentSession();

		session.persist(o);

		for (OrderItem oi : o.getOrderItems()) {
			oi.setOrder(o);
			session.persist(oi);
		}
	}

	@Override
	@Transactional
	public void updateOrder(Order o) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(o);
	}

	@Override
	@Transactional
	public Order getOrder(Order o) {
		Session session = this.sessionFactory.getCurrentSession();
		Order order = (Order) session.get(Order.class, o.getOID());
		return order;
	}

	@Override
	@Transactional
	public void removeOrder(int OID) {
		Session session = this.sessionFactory.getCurrentSession();
		Order o = (Order) session.load(Order.class, new Integer(OID));
		if (null != o) {
			session.delete(o);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Order> getOrdersByClient(Costumer c) {
		Session session = this.sessionFactory.getCurrentSession();
		Criteria c1 = session.createCriteria(Order.class);
		c1.add(Restrictions.eq("costumer", c));
		c1.addOrder(org.hibernate.criterion.Order.asc("OID"));
		List<Order> ordersList = c1.list();

		return ordersList;
	}

	@Override
	public OrdersTotal getOrdersTotal(int qt_days) {

		Session session = this.sessionFactory.getCurrentSession();		
		
		StringBuilder query_str = new StringBuilder();
		query_str.append("SELECT SUM(TOTAL) AS TOTAL_SALES, COUNT(*) AS COUNT_ORDERS, AVG(TOTAL) AS AVERAGE ");
		query_str.append("FROM Z02351.B02351 ");
		query_str.append("WHERE ORDERDATE >= (CURRENT_DATE - ? DAYS)");
		
		SQLQuery query = session.createSQLQuery(query_str.toString());
		query.setInteger(0, qt_days);
		query.setResultTransformer(new OrdersTotalRT());
		
		OrdersTotal ot = (OrdersTotal) query.uniqueResult();
		return ot;
	}	
}
