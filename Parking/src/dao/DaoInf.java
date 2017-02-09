package dao;

import java.util.List;
import basic.Pojo.Parking;
import basic.Pojo.Users;

public interface DaoInf {

	public List<Parking> getParkings();
	public int insertUser(Users u1);
	public Parking inserPark(Parking p1);
	public int insertImage(int uid, String path);	
	public Users getUser(String username, String password);
}
