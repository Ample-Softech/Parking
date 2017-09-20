package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import basic.Pojo.*;
import dao.*;

public class Services implements ServicesInf {

	@Autowired
	DAO dao;
	
	public Services() {
		System.out.println("Services");
	}

	public DAO getDao() {
		return dao;
	}

	public void setDao(DAO dao) {
		this.dao = dao;
	}

	@Override
	public List<Parking> getParkings() {
		return dao.getParkings();
	}

	@Override
	public int insertUser(Users u1) {
		return dao.insertUser(u1);
	}

	@Override
	public Users getUser(String username, String password) {
		return dao.getUser(username, password);
	}

	@Override
	public Parking inserPark(Parking p1) {
		return dao.inserPark(p1);
	}

	@Override
	public int insertImage(int uid, String path) {
		return dao.insertImage(uid, path);
	}

	@Override
	public List<Users> spaceOwners() {
		return this.dao.spaceOwners();
	}

	@Override
	public List<Parking> showParkings(int id) {
		return this.dao.showParkings(id);
	}

}
