package mtm2017.fsoapp.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mtm2017.fsoapp.model.Order;
import mtm2017.fsoapp.model.OrderItem;
import mtm2017.fsoapp.model.ProdRanking;
import mtm2017.fsoapp.model.ProdRankingRT;
import mtm2017.fsoapp.model.Product;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO
{
	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf)
	{
		this.sessionFactory = sf;
	}

	@Override
	@Transactional
	public Product addProduct(Product p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		return p;
	}

	@Override
	@Transactional
	public void updateProduct(Product p, String old_sku)
	{
		Session session = this.sessionFactory.getCurrentSession();
		String update = "update Product set sku = ?, price = ?, cost = ?, codb = ?, dunit = ?, name = ? where sku = ?";
		session.createQuery(update)
			.setString(0, p.getSKU())
			.setBigDecimal(1, p.getPrice())
			.setBigDecimal(2, p.getCost())
			.setBigDecimal(3, p.getCodb())
			.setString(4, p.getDunit())
			.setString(5, p.getName())
			.setString(6, old_sku)
			.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Product> listAllProducts() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Product> costumersList = session.createCriteria(Product.class).list();
		return costumersList;
	}

	@Override
	@Transactional
	public Product getProduct(Product p)
	{
		Session session = this.sessionFactory.getCurrentSession();		
		Product product = (Product) session.get(Product.class, p.getSKU());
		return product;
	}

	@Override
	@Transactional
	public void removeProduct(String SKU)
	{
		Session session = this.sessionFactory.getCurrentSession();
		Product p = (Product) session.load(Product.class, SKU);
		if(null != p){
			session.delete(p);
		}		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProdRanking> getProdRanking(int qt_days) {

		Session session = this.sessionFactory.getCurrentSession();		
		
		StringBuilder query_str = new StringBuilder();
		query_str.append("SELECT NAME AS NAME,SUM(SALES) AS SUM_SALES FROM ");
		query_str.append("(");
		query_str.append("  SELECT NAME,(QUANT * PRICE) AS SALES FROM ");
		query_str.append("  (");
		query_str.append("    SELECT Z02351.D02351.SKU,QUANT,PRICE,NAME ");
		query_str.append("    FROM Z02351.D02351,Z02351.C02351,Z02351.B02351");
		query_str.append("    WHERE Z02351.D02351.SKU = Z02351.C02351.SKU ");
		query_str.append("    AND Z02351.D02351.OID = Z02351.B02351.OID");
		query_str.append("    AND ORDERDATE >= (CURRENT_DATE - ? DAYS)");
		query_str.append("  )");
		query_str.append(") ");
		query_str.append("GROUP BY NAME ORDER BY SUM_SALES DESC");
		
		SQLQuery query = session.createSQLQuery(query_str.toString());
		query.setInteger(0, qt_days);
		query.setResultTransformer(new ProdRankingRT());
		
		List<ProdRanking> list = query.list();
		return list;
	}
}
