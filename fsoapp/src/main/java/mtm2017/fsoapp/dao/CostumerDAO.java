package mtm2017.fsoapp.dao;

import java.util.List;

import mtm2017.fsoapp.model.ClientRanking;
import mtm2017.fsoapp.model.Costumer;

public interface CostumerDAO
{
	public Costumer addCostumer(Costumer c);

	public void updateCostumer(Costumer c);
	
	public List<Costumer> listAllCostumers();

	public Costumer getCostumer(Costumer c);

	public void removeCostumer(int CID);	

	public List<ClientRanking> getClientRanking(int qt_days);
}
