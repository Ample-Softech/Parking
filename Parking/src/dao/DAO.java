package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import basic.Pojo.Parking;
import basic.Pojo.Users;

public class DAO implements DaoInf {

	JdbcTemplate template;

	@Override
	public int insertImage(int uid, String path) {
		try {
			String sql = "UPDATE `parking`.`parkspace` SET `image`='"+path+"' WHERE `id`='"+uid+"';";
			return template.update(sql);			
		} catch (Exception e) {
			return 0;
		}		
	}
	
	@Override
	public Parking inserPark(Parking p1) {
		try {
			String q = "INSERT INTO `parking`.`parkspace` (`area`, `city`, `state`, `country`, `pincode`, `latitude`, `longitude`, `userid`)"
					+ " VALUES ('"+p1.getArea()+"', '"+p1.getCity()+"', '"+p1.getState()+"', '"+p1.getCountry()
					+"', '"+p1.getPincode()+"', '"+p1.getLatitude()+"', '"+p1.getLongitude()+"', '"+p1.getUserId()+"');";
			if (template.update(q)==1) {
				String sql = "SELECT * FROM parking.parkspace where `area`=? and `pincode`=? and `userid`=?;";
				Parking p2 = template.queryForObject(sql, new Object[]{p1.getArea(), p1.getPincode(), p1.getUserId()}, new ParkMapping());
				return p2;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}		
	}

	@Override
	public List<Parking> getParkings() {
		return template.query("SELECT * FROM parkspace;", new ParkMapping());
	}

	@Override
	public int insertUser(Users u1) {
		String sql = "INSERT INTO `parking`.`users` (`fname`, `mname`, `lname`, `gender`, `username`, `password`, `dob`, `latitude`, `longitude`, `area`, `city`, `state`, `country`, `pincode`, `usertype`) VALUES "
				+ "('"+u1.getFname()+"', '"+u1.getMname()+"', '"+u1.getLname()+"', '"+u1.getGender()+"', '"+u1.getUsername()+"', '"+u1.getPassword()+"', '"+u1.getDob()
				+"', '"+u1.getLatitude()+"', '"+u1.getLongitude()+"', '"+u1.getArea()+"', '"+u1.getCity()+"', '"+u1.getState()+"', '"+u1.getCountry()+"','"+u1.getPincode()+"','"+u1.getUsertype()+"');";
		return template.update(sql);
	}
	
	@Override
	public Users getUser(String username, String password) {
		try {
			String q = "SELECT * FROM parking.users where `username`=? and `password`=?;";
			return template.queryForObject(q, new Object[]{username, password}, new UserMapping());			
		} catch (Exception e) {
			return null;
		}
	}
	
	public class UserMapping implements RowMapper<Users>{
		@Override
		public Users mapRow(ResultSet rs, int rn) throws SQLException {
			Users u1 = new Users();
			u1.setId(rs.getInt("id"));
			u1.setFname(rs.getString("fname"));
			u1.setMname(rs.getString("mname"));
			u1.setLname(rs.getString("lname"));
			u1.setGender(rs.getString("gender"));
			u1.setUsername(rs.getString("username"));
			u1.setPassword(rs.getString("password"));
			u1.setDob(rs.getString("dob"));
			u1.setLatitude(rs.getString("latitude"));
			u1.setLongitude(rs.getString("longitude"));
			u1.setArea(rs.getString("area"));
			u1.setCity(rs.getString("city"));			
			u1.setState(rs.getString("state"));
			u1.setCountry(rs.getString("country"));
			u1.setPincode(rs.getString("pincode"));
			u1.setUsertype(rs.getString("usertype"));
			return u1;
		}
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
			p1.setLatitude(rs.getString("latitude"));
			p1.setLongitude(rs.getString("longitude"));
//			p1.setImage(rs.getString("image"));
			return p1;
		}		
	}

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}


}
