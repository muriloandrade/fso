package mtm2017.fsoapp.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.transform.ResultTransformer;

public class ClientRankingRT implements ResultTransformer {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public List transformList(List arg0) {
        List<ClientRanking> clientRanking = new ArrayList<ClientRanking>();
        for (Object clientRank : arg0) {
            clientRanking.add((ClientRanking) clientRank);
        }
        return clientRanking;
	}

	@Override
	public Object transformTuple(Object[] arg0, String[] arg1) {
        ClientRanking clientRank = new ClientRanking();        
        clientRank.setClient((String) arg0[0]);
        clientRank.setSum_sales((BigDecimal) arg0[1]);
        return clientRank;
	}

}
