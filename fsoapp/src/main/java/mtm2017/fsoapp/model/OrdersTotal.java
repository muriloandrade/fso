package mtm2017.fsoapp.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;

@Entity
public class OrdersTotal implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private BigDecimal total_sales;
	private Integer quant_orders;
	private BigDecimal average;
	
	public BigDecimal getTotal_sales() {
		return total_sales;
	}
	public void setTotal_sales(BigDecimal total_sales) {
		this.total_sales = total_sales;
	}
	public Integer getQuant_orders() {
		return quant_orders;
	}
	public void setQuant_orders(Integer quant_orders) {
		this.quant_orders = quant_orders;
	}
	public BigDecimal getAverage() {
		return average;
	}
	public void setAverage(BigDecimal average) {
		this.average = average;
	}


}
