package mtm2017.fsoapp.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.transform.ResultTransformer;

public class OrdersTotalRT implements ResultTransformer {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public List transformList(List arg0) {
        List<OrdersTotal> ordersTotals = new ArrayList<OrdersTotal>();
        for (Object ordersTotal : arg0) {
        	ordersTotals.add((OrdersTotal) ordersTotal);
        }
        return ordersTotals;
	}

	@Override
	public Object transformTuple(Object[] arg0, String[] arg1) {
        OrdersTotal ot = new OrdersTotal();
        ot.setTotal_sales((BigDecimal) arg0[0]);
        ot.setQuant_orders((Integer) arg0[1]);
        ot.setAverage((BigDecimal) arg0[2]);
        
        return ot;
	}

}
