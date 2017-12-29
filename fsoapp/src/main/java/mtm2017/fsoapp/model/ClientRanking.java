package mtm2017.fsoapp.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class ClientRanking implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String client;
	private BigDecimal sum_sales;
	private Float ratio;
	
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public BigDecimal getSum_sales() {
		return sum_sales;
	}
	public void setSum_sales(BigDecimal sum_sales) {
		this.sum_sales = sum_sales;
	}
	public Float getRatio() {
		return ratio;
	}
	public void setRatio(Float ratio) {
		this.ratio = ratio;
	}

}
