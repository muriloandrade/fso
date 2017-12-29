package mtm2017.fsoapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Z02351.A02351")
public class Costumer implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "CID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer CID;

	private String client;
	private String street;
	private String city;
	private String state;
	private String card;
	private String mo;
	private String yr;
	private String pan;

	@LazyCollection(LazyCollectionOption.TRUE)
	@OneToMany(mappedBy = "costumer")
	@JsonIgnore
	private List<Order> ordersList;

	public Integer getCID()
	{
		return CID;
	}

	public void setCID(Integer CID)
	{
		this.CID = CID;
	}

	public String getClient()
	{
		return client;
	}

	public void setClient(String client)
	{
		this.client = client;
	}

	public String getStreet()
	{
		return street;
	}

	public void setStreet(String street)
	{
		this.street = street;
	}

	public String getCity()
	{
		return city;
	}

	public void setCity(String city)
	{
		this.city = city;
	}

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

	public String getCard()
	{
		return card;
	}

	public void setCard(String card)
	{
		this.card = card;
	}

	public String getMo()
	{
		return mo;
	}

	public void setMo(String mo)
	{
		this.mo = mo;
	}

	public String getYr()
	{
		return yr;
	}

	public void setYr(String yr)
	{
		this.yr = yr;
	}

	public String getPan()
	{
		return pan;
	}

	public void setPan(String pan)
	{
		this.pan = pan;
	}

	public List<Order> getOrdersList() {
		return ordersList;
	}

	public void setOrdersList(List<Order> ordersList) {
		this.ordersList = ordersList;
	}
	
	public void setAllUppercase()
	{		
		if (this.client != null) setClient(this.client.toUpperCase());
		if (this.street != null) setStreet(this.street.toUpperCase());
		if (this.city != null) setCity(this.city.toUpperCase());
		if (this.state != null) setState(this.state.toUpperCase());
		if (this.card != null) setCard(this.card.toUpperCase());
		if (this.pan != null) setPan(this.pan.toUpperCase());
	}
}