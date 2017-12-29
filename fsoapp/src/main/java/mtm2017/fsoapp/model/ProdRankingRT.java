package mtm2017.fsoapp.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.transform.ResultTransformer;

public class ProdRankingRT implements ResultTransformer {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public List transformList(List arg0) {
        List<ProdRanking> prodRanking = new ArrayList<ProdRanking>();
        for (Object prodRank : arg0) {
            prodRanking.add((ProdRanking) prodRank);
        }
        return prodRanking;
	}

	@Override
	public Object transformTuple(Object[] arg0, String[] arg1) {
        ProdRanking prodRank = new ProdRanking();        
        prodRank.setName((String) arg0[0]);
        prodRank.setSum_sales((BigDecimal) arg0[1]);
        return prodRank;
	}

}
