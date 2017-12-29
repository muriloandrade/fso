package mtm2017.fsoapp.service;

import java.util.List;

import mtm2017.fsoapp.model.ProdRanking;
import mtm2017.fsoapp.model.Product;

public interface ProductService
{
	public Product addProduct(Product p);

	public void updateProduct(Product p, String old_sku);
	
	public List<Product> listAllProducts();

	public Product getProduct(Product p);

	public void removeProduct(String SKU);
	
	public List<ProdRanking> getProdRanking(int qt_days);

}
