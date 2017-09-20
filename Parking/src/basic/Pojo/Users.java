package basic.Pojo;

import java.io.Serializable;

public class Users implements Serializable, Cloneable
{
	private int id, pincode;
	float latitude, longitude;
	private String fname, mname, lname, gender, username, password, dob, area, state, city, country, usertype;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
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
		this.latitude = 0.0f;
		this.longitude = 0.0f;
		this.area = null;
		this.state = null;
		this.city = null;
		this.country = null;
		this.pincode = 0;
		this.usertype = null;
		
	}
	
	public Users(int id, int pincode, float latitude, float longitude, String fname, String mname, String lname,
			String gender, String username, String password, String dob, String area, String state, String city,
			String country, String usertype) {
		super();
		this.id = id;
		this.pincode = pincode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.fname = fname;
		this.mname = mname;
		this.lname = lname;
		this.gender = gender;
		this.username = username;
		this.password = password;
		this.dob = dob;
		this.area = area;
		this.state = state;
		this.city = city;
		this.country = country;
		this.usertype = usertype;
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", pincode=" + pincode + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", fname=" + fname + ", mname=" + mname + ", lname=" + lname + ", gender=" + gender + ", username="
				+ username + ", password=" + password + ", dob=" + dob + ", area=" + area + ", state=" + state
				+ ", city=" + city + ", country=" + country + ", usertype=" + usertype + "]";
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
		result = prime * result + ((dob == null) ? 0 : dob.hashCode());
		result = prime * result + ((fname == null) ? 0 : fname.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + id;
		result = prime * result + Float.floatToIntBits(latitude);
		result = prime * result + ((lname == null) ? 0 : lname.hashCode());
		result = prime * result + Float.floatToIntBits(longitude);
		result = prime * result + ((mname == null) ? 0 : mname.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + pincode;
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		result = prime * result + ((usertype == null) ? 0 : usertype.hashCode());
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
		Users other = (Users) obj;
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
		if (dob == null) {
			if (other.dob != null)
				return false;
		} else if (!dob.equals(other.dob))
			return false;
		if (fname == null) {
			if (other.fname != null)
				return false;
		} else if (!fname.equals(other.fname))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (id != other.id)
			return false;
		if (Float.floatToIntBits(latitude) != Float.floatToIntBits(other.latitude))
			return false;
		if (lname == null) {
			if (other.lname != null)
				return false;
		} else if (!lname.equals(other.lname))
			return false;
		if (Float.floatToIntBits(longitude) != Float.floatToIntBits(other.longitude))
			return false;
		if (mname == null) {
			if (other.mname != null)
				return false;
		} else if (!mname.equals(other.mname))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (pincode != other.pincode)
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		if (usertype == null) {
			if (other.usertype != null)
				return false;
		} else if (!usertype.equals(other.usertype))
			return false;
		return true;
	}
		
}
