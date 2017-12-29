package mtm2017.fsoapp.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mtm2017.fsoapp.model.ClientRanking;
import mtm2017.fsoapp.model.ClientRankingRT;
import mtm2017.fsoapp.model.Costumer;

@Repository
@Transactional
public class CostumerDAOImpl implements CostumerDAO
{
	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sf)
	{
		this.sessionFactory = sf;
	}

	@Override
	@Transactional
	public Costumer addCostumer(Costumer c)
	{
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(c);
		return c;
	}

	@Override
	@Transactional
	public void updateCostumer(Costumer c)
	{
		Session session = this.sessionFactory.getCurrentSession();		
		session.update(c);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Costumer> listAllCostumers()
	{
		Session session = this.sessionFactory.getCurrentSession();
		List<Costumer> costumersList = session.createCriteria(Costumer.class).list();
		return costumersList;
	}

	@Override
	@Transactional
	public Costumer getCostumer(Costumer c)
	{
		Session session = this.sessionFactory.getCurrentSession();		
		Costumer costumer = (Costumer) session.get(Costumer.class, c.getCID());
		return costumer;
	}

	@Override
	@Transactional
	public void removeCostumer(int CID)
	{
		Session session = this.sessionFactory.getCurrentSession();
		Costumer c = (Costumer) session.load(Costumer.class, new Integer(CID));
		if(null != c){
			session.delete(c);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ClientRanking> getClientRanking(int qt_days) {

		Session session = this.sessionFactory.getCurrentSession();		
		
		StringBuilder query_str = new StringBuilder();
		query_str.append("SELECT CLIENT, SUM(TOTAL) AS SUM_TOTAL FROM");
		query_str.append("(");
		query_str.append("  SELECT Z02351.B02351.CID, TOTAL, CLIENT ");
		query_str.append("  FROM Z02351.B02351, Z02351.A02351");
		query_str.append("  WHERE Z02351.B02351.CID = Z02351.A02351.CID");
		query_str.append("  AND ORDERDATE >= (CURRENT_DATE - ? DAYS)");
		query_str.append(")");
		query_str.append("GROUP BY CLIENT ORDER BY SUM_TOTAL DESC");
		
		SQLQuery query = session.createSQLQuery(query_str.toString());
		query.setInteger(0, qt_days);
		query.setResultTransformer(new ClientRankingRT());
		
		List<ClientRanking> list = query.list();
		return list;
	}
	
	
	
	
	
	
	
	
	
}
