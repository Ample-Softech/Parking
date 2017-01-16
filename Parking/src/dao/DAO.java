package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import basic.Pojo.Parking;

public class DAO implements DaoInf {

	JdbcTemplate template;
	
	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	@Override
	public List<Parking> getParkings() {
		return template.query("SELECT * FROM parkspace;", new ParkMapping());
	}

	public class ParkMapping implements RowMapper<Parking>{

		@Override
		public Parking mapRow(ResultSet rs, int rn) throws SQLException {
			Parking p1= new Parking();
			p1.setId(rs.getInt("id"));
			p1.setArea(rs.getString("area"));
			p1.setCity(rs.getString("city"));
			p1.setState(rs.getString("state"));
			p1.setCountry(rs.getString("country"));
			p1.setPincode(rs.getString("pincode"));
			p1.setLat(rs.getString("lat"));
			p1.setLng(rs.getString("lng"));
			p1.setDelflag(rs.getString("delflag"));
			p1.setImage(rs.getString("image"));
			return p1;
		}
		
		
	}
	
}
