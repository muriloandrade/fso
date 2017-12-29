package mtm2017.fsoapp.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;

@Entity
public class ProdRanking implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String name;
	private BigDecimal sum_sales;
	private Float ratio;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
