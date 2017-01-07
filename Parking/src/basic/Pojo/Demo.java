package basic.Pojo;

import java.io.Serializable;

public class Demo implements Serializable {
	private String lat;
	private String lng;

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
