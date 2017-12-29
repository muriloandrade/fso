package mtm2017.fsoapp.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Z02351.C02351")
public class Product implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "SKU")
	private String SKU;	
	
	private BigDecimal price;
	private BigDecimal cost;
	private BigDecimal codb;
	private String dunit;
	private String name;
	

	public String getSKU()
	{
		return SKU;
	}

	public void setSKU(String sKU)
	{
		SKU = sKU;
	}

	public BigDecimal getPrice()
	{
		return price;
	}

	public void setPrice(BigDecimal price)
	{
		this.price = price;
	}

	public BigDecimal getCost()
	{
		return cost;
	}

	public void setCost(BigDecimal cost)
	{
		this.cost = cost;
	}

	public BigDecimal getCodb()
	{
		return codb;
	}

	public void setCodb(BigDecimal codb)
	{
		this.codb = codb;
	}

	public String getDunit()
	{
		return dunit;
	}

	public void setDunit(String dunit)
	{
		this.dunit = dunit;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}
	
	public void setAllUppercase()
	{		
		if (this.SKU != null) setSKU(this.SKU.toUpperCase());
		if (this.dunit != null) setDunit(this.dunit.toUpperCase());
		if (this.name != null) setName(this.name.toUpperCase());
	}
}