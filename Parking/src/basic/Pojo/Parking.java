package basic.Pojo;

import java.io.Serializable;
import java.util.Arrays;

public class Parking implements Serializable, Cloneable {

	private int id, userId;
	private String area, city, state, country, pincode, latitude, longitude, image;
	private String [] features;   
	
	public int getId() {
		return id;
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
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String[] getFeatures() {
		return features;
	}
	public void setFeatures(String[] features) {
		this.features = features;
	}

	public Parking(int id, int userId, String area, String city, String state, String country, String pincode,
			String latitude, String longitude, String image, String[] features) {
		super();
		this.id = id;
		this.userId = userId;
		this.area = area;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pincode = pincode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.image = image;
		this.features = features;
	}
	
	public Parking() {
		super();
		this.id = 0;
		this.userId = 0;
		this.area = null;
		this.city = null;
		this.state = null;
		this.country = null;
		this.pincode = null;
		this.latitude = null;
		this.longitude = null;
		this.image = null;
		this.features = null;
		
	}
	@Override
	public String toString() {
		return "Parking [id=" + id + ", userId=" + userId + ", area=" + area + ", city=" + city + ", state=" + state
				+ ", country=" + country + ", pincode=" + pincode + ", latitude=" + latitude + ", longitude="
				+ longitude + ", image=" + image + ", features=" + Arrays.toString(features) + "]";
	}

	public Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
	
}