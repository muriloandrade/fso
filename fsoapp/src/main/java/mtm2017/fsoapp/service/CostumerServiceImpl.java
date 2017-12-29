package mtm2017.fsoapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mtm2017.fsoapp.dao.CostumerDAO;
import mtm2017.fsoapp.dao.OrderDAO;
import mtm2017.fsoapp.model.ClientRanking;
import mtm2017.fsoapp.model.Costumer;
import mtm2017.fsoapp.model.Order;

@Service
@Transactional
public class CostumerServiceImpl implements CostumerService {
	@Autowired
	private CostumerDAO costumerDAO;

	public void setCostumerDAO(CostumerDAO costumerDAO) {
		this.costumerDAO = costumerDAO;
	}

	@Override
	@Transactional
	public Costumer addCostumer(Costumer c) {
		return this.costumerDAO.addCostumer(c);
	}

	@Override
	@Transactional
	public void updateCostumer(Costumer c) {
		this.costumerDAO.updateCostumer(c);

	}

	@Override
	@Transactional
	public List<Costumer> listAllCostumers() {
		return this.costumerDAO.listAllCostumers();
	}

	@Override
	@Transactional
	public Costumer getCostumer(Costumer c) {
		return this.costumerDAO.getCostumer(c);
	}

	@Override
	@Transactional
	public void removeCostumer(int CID) {
		this.costumerDAO.removeCostumer(CID);

	}

	@Override
	public List<ClientRanking> getClientRanking(int qt_days) {
		return this.costumerDAO.getClientRanking(qt_days);
	}

}
