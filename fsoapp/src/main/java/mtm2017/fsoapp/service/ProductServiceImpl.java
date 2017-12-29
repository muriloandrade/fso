package mtm2017.fsoapp.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mtm2017.fsoapp.dao.ProductDAO;
import mtm2017.fsoapp.model.ProdRanking;
import mtm2017.fsoapp.model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	@Transactional
	public Product addProduct(Product p) {
		return this.productDAO.addProduct(p);
	}

	@Override
	@Transactional
	public void updateProduct(Product p, String old_sku) {
		this.productDAO.updateProduct(p, old_sku);
	}

	@Override
	@Transactional
	public List<Product> listAllProducts() {
		return this.productDAO.listAllProducts();
	}

	@Override
	@Transactional
	public Product getProduct(Product p) {
		return this.productDAO.getProduct(p);
	}

	@Override
	@Transactional
	public void removeProduct(String SKU) {
		this.productDAO.removeProduct(SKU);
	}

	@Override
	public List<ProdRanking> getProdRanking(int qt_days) {
		
		return this.productDAO.getProdRanking(qt_days);
	}
}
