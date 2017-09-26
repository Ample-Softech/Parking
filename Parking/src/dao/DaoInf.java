package dao;

import java.io.Serializable;
import java.util.List;
import basic.Pojo.Parking;
import basic.Pojo.Users;

public interface DaoInf {

	public List<Parking> getParkings();
	public int insertUser(Users u1);
	public Parking inserPark(Parking p1);
	public int insertImage(int uid, String path);	
	public Users getUser(String username, String password);
	public List<Users> spaceOwners();
	public List<Parking> showParkings(int uid);
	public boolean saveUser(Users u);
	public Users validateUser(String username, String password);
	public Serializable saveParking(Parking p);
	public boolean uploadImg(int id, String path);
	public Parking getParking(int id);
	public Users getUser(int id);
	public List<Parking> getFilteredParkings(float lat, float lng);
	
	
}
