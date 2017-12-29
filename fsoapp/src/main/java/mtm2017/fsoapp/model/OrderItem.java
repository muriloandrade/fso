package mtm2017.fsoapp.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Z02351.D02351")
public class OrderItem implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "OIID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer OIID;

	@LazyCollection(LazyCollectionOption.TRUE)
	@ManyToOne
	@JoinColumn(name = "OID")
	@JsonIgnore
	private Order order;

	@LazyCollection(LazyCollectionOption.TRUE)
	@ManyToOne
	@JoinColumn(name = "Sku")
	@JsonIgnore
	private Product product;

	private Integer quant = 0;
	private BigDecimal price = new BigDecimal(0.0);

	public Integer getOIID()
	{
		return OIID;
	}

	public void setOOID(Integer OIID)
	{
		this.OIID = OIID;
	}

	public Order getOrder()
	{
		return order;
	}

	public void setOrder(Order order)
	{
		this.order = order;
	}

	public Product getProduct()
	{
		return product;
	}

	public void setProduct(Product product)
	{
		this.product = product;
	}

	public Integer getQuant()
	{
		return quant;
	}

	public void setQuant(Integer quant)
	{
		this.quant = quant;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	

}