


import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Item
{
	private String email;
	private int id;
	private String name;
	private String ad1;
	private String ad2;
	private String city;
	private String state;
	private String country;
	
	@XmlElement
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	private String zip;
	
	@XmlElement
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	
	
	@XmlElement
	public String getZip() {
		return zip;
	}


	public void setZip(String zip) {
		this.zip = zip;
	}

	private String phone;

	@XmlElement
	public String getName() {
		return name;
	}

	
	public void setName(String name) {
		this.name = name;
	}

	@XmlElement
	public String getAd1() {
		return ad1;
	}

	
	public void setAd1(String ad1) {
		this.ad1 = ad1;
	}

	@XmlElement
	public String getAd2() {
		return ad2;
	}

	
	public void setAd2(String ad2) {
		this.ad2 = ad2;
	}
	@XmlElement
	public String getCity() {
		return city;
	}

	
	public void setCity(String city) {
		this.city = city;
	}
	@XmlElement
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	@XmlElement
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	@XmlElement
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
