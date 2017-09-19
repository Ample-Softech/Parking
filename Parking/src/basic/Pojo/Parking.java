package basic.Pojo;

import java.io.Serializable;
import java.util.Arrays;

public class Parking implements Serializable, Cloneable {

	private int id, userId, pincode;
	private float latitude, longitude;
	private String area, city, state, country, image;
//	private String [] features;   
	
	
	public int getId() {
		return id;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	
	public Parking() {
		super();
		this.id = 0;
		this.userId = 0;
		this.area = null;
		this.city = null;
		this.state = null;
		this.country = null;
		this.pincode = 0;
		this.latitude = 0.0f;
		this.longitude = 0.0f;
		this.image = null;
//		this.features = null;	
	}
	
	public Parking(int id, int userId, int pincode, float latitude, float longitude, String area, String city,
			String state, String country, String image) {
		super();
		this.id = id;
		this.userId = userId;
		this.pincode = pincode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.area = area;
		this.city = city;
		this.state = state;
		this.country = country;
		this.image = image;
	}
	@Override
	public String toString() {
		return "Parking [id=" + id + ", userId=" + userId + ", area=" + area + ", city=" + city + ", state=" + state
				+ ", country=" + country + ", pincode=" + pincode + ", latitude=" + latitude + ", longitude="
				+ longitude + ", image=" + image  + "]";
	}

	public Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((area == null) ? 0 : area.hashCode());
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + ((country == null) ? 0 : country.hashCode());
		result = prime * result + id;
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + Float.floatToIntBits(latitude);
		result = prime * result + Float.floatToIntBits(longitude);
		result = prime * result + pincode;
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + userId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Parking other = (Parking) obj;
		if (area == null) {
			if (other.area != null)
				return false;
		} else if (!area.equals(other.area))
			return false;
		if (city == null) {
			if (other.city != null)
				return false;
		} else if (!city.equals(other.city))
			return false;
		if (country == null) {
			if (other.country != null)
				return false;
		} else if (!country.equals(other.country))
			return false;
		if (id != other.id)
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (Float.floatToIntBits(latitude) != Float.floatToIntBits(other.latitude))
			return false;
		if (Float.floatToIntBits(longitude) != Float.floatToIntBits(other.longitude))
			return false;
		if (pincode != other.pincode)
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	
	
	
}