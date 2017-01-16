package services;

import java.util.List;
import basic.Pojo.Parking;
import dao.DAO;

public class Services implements ServicesInf {

	DAO dao = new DAO();
	
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

}
