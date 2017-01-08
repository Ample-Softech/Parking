package basic.Pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Demo implements Serializable {
	private String lat;
	private String lng;
	private String searchPlace;
	
	public String getSearchPlace() {
		return searchPlace;
	}
	public void setSearchPlace(String searchPlace) {
		this.searchPlace = searchPlace;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
}
