package basic.Pojo;

import java.io.Serializable;

public class Users implements Serializable, Cloneable
{
	private int id;
	private String fname, mname, lname, gender, username, password, dob, latitude, longitude, area, state, city, country, pincode, usertype;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
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
	
	@Override
	public String toString() {
		return "Users [id=" + id + ", fname=" + fname + ", mname=" + mname + ", lname=" + lname + ", gender=" + gender
				+ ", username=" + username + ", password=" + password + ", dob=" + dob + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", area=" + area + ", state=" + state + ", city=" + city + ", country="
				+ country + ", pincode=" + pincode + ", usertype=" + usertype + "]";
	}
	public Users(int id, String fname, String mname, String lname, String gender, String username, String password,
			String dob, String latitude, String longitude, String area, String state, String city, String country,
			String pincode, String usertype) {
		super();
		this.id = id;
		this.fname = fname;
		this.mname = mname;
		this.lname = lname;
		this.gender = gender;
		this.username = username;
		this.password = password;
		this.dob = dob;
		this.latitude = latitude;
		this.longitude = longitude;
		this.area = area;
		this.state = state;
		this.city = city;
		this.country = country;
		this.pincode = pincode;
		this.usertype = usertype;
	} 
	
	public Users(){
		super();
		this.id = 0;
		this.fname = null;
		this.mname = null;
		this.lname = null;
		this.gender = null;
		this.username = null;
		this.password = null;
		this.dob = null;
		this.latitude = null;
		this.longitude = null;
		this.area = null;
		this.state = null;
		this.city = null;
		this.country = null;
		this.pincode = null;
		this.usertype = null;
		
	}
	
	public Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
	
		
}
