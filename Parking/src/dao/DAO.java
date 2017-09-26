package dao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import basic.ControlerPack.HibernateUtilities;
import basic.Pojo.Parking;
import basic.Pojo.Users;

public class DAO implements DaoInf {
	
	private static SessionFactory sessionFactory = HibernateUtilities.getsSessionFactory();
	private JdbcTemplate template;
	private Session session;
	

	@Override
	public List<Parking> getFilteredParkings(float lat, float lng) {
		List<Parking> a1 = new ArrayList<>();
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
//			SELECT * FROM paidparking.parking where (LATITUDE >(18.4575324-0.02) and LATITUDE <(18.4575324+0.02))and(LONGITUDE >(73.86774639999999-0.02) and LONGITUDE <(73.86774639999999+0.02)) ORDER BY ABS(LONGITUDE - 73.86774639999999) LIMIT 1;
			org.hibernate.Query queryResult = this.session.createQuery("FROM Parking where latitude >= :lat1 AND latitude <= :lat2 AND longitude >= :lng1 AND longitude <= :lng2 ORDER BY ABS(LONGITUDE - :lng)");
//			queryResult.setFloat("lat", lat);
			queryResult.setFloat("lng", lng);
			queryResult.setFloat("lat1", (float) (lat-0.02));
			queryResult.setFloat("lat2", (float) (lat+0.02));
			queryResult.setFloat("lng1", (float) (lng-0.02));
			queryResult.setFloat("lng2", (float) (lng+0.02));
			a1 = (List<Parking>) queryResult.list(); 
//			a1.forEach(System.out::println);
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;		
	}

	
	@Override
	public Parking getParking(int id) {
		Parking p = null;
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			p = (Parking) this.session.get(Parking.class, id); 
			return p;
		} catch (Exception e) {
			this.exceptional();
			System.err.println("e= "+e);			
		} finally {
			this.closeSession();			
		}
		return p;
	}

	@Override
	public Users getUser(int id) {
		Users u = null;
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			u = (Users) this.session.get(Users.class, id);
			return u;
		} catch (Exception e) {
			this.exceptional();
			System.err.println("e= "+e);
		} finally {
			this.closeSession();			
		}		
		return u;
	}
	
	@Override
	public boolean uploadImg(int id, String path) {
		Parking p = getParking(id);
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			if(p!=null){
				p.setImage(path);
				this.session.update(p);
				return true;
			}			
		} catch (Exception e) {
			this.exceptional();
			System.err.println("e= "+e);			
		} finally {
			this.closeSession();			
		}
		return false;
	}
	
	@Override
	public Serializable saveParking(Parking p) {
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			return this.session.save(p);
		} catch (Exception e) {
			this.exceptional();
			System.err.println("e= "+e);
		} finally {
			this.closeSession();			
		}
		return 0;
	}
	
	@Override
	public Users validateUser(String username, String password) {
		try {		
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			String queryString = "from Users where username = :username and password = :pass";
			org.hibernate.Query query = this.session.createQuery(queryString);
			query.setString("username", username);
			query.setString("pass", password);
			Object queryResult = query.uniqueResult();
			return ((Users)queryResult);
		} catch (Exception e) {
			this.exceptional();
			System.err.println("e= "+e);
			return new Users();
		} finally {
			this.closeSession();
		}		
	}

	
	@Override
	public boolean saveUser(Users u) {
		try {
			if (validateUser(u.getUsername(), u.getPassword())==null) {
				this.session = sessionFactory.openSession();
				this.session.beginTransaction();
				this.session.save(u);
				return true;
			}
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();			
		}
		return false;
	}
	
	
	@Override
	public List<Users> spaceOwners() {
		List<Users> a1 = new ArrayList<>();
		List<Integer> uids = getParkings().stream().map(Parking::getUserId).distinct().collect(Collectors.toList());
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			uids.forEach(id->a1.add((Users) this.session.get(Users.class, id)));
//			a1.forEach(System.out::println);
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;		
	}
	
	
	@Override
	public List<Parking> showParkings(int id) {
		List<Parking> a1 = new ArrayList<>();
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			org.hibernate.Query queryResult = this.session.createQuery("FROM Parking WHERE userid = :userId");
			queryResult.setInteger("userId", id);
			a1 = (List<Parking>) queryResult.list(); 
//			a1.forEach(System.out::println);
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;		
	}

	@Override
	public List<Parking> getParkings() {
		List<Parking> a1 = new ArrayList<>();
		try {
			this.session = sessionFactory.openSession();
			this.session.beginTransaction();
			org.hibernate.Query queryResult = this.session.createQuery("FROM Parking");
			a1 = (List<Parking>) queryResult.list(); 
//			a1.forEach(System.out::println);
		} catch (Exception e) {
			this.exceptional();
			System.err.println(e);
		} finally {
			this.closeSession();
		}		
		return a1;		
	}

	public void closeSession(){
		if(this.session.isConnected()){
			this.session.getTransaction().commit();
			this.session.close();
			System.out.println("Session closed..");
		}else{
			System.out.println("Session already Disabled..");
		}
		
	}
	
	public void exceptional(){
		if(this.session.isConnected()){
			this.session.getTransaction().commit();
			this.session.close();
			sessionFactory.close();
			System.out.println("Hibernate Session & SessionFactory closed..");
		} else {
			sessionFactory.close();
//			HibernateUtilities.getsSessionFactory().close();
			System.out.println("Hibernate SessionFactory closed..");
		}
	}

	
	@Override
	public int insertImage(int uid, String path) {
		try {
			String sql = "UPDATE parking.parkspace SET image='"+path+"' WHERE id='"+uid+"';";
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
	public int insertUser(Users u1) {
		String sql = "INSERT INTO `parking`.`users` (`fname`, `lname`, `gender`, `username`, `password`, `dob`, `latitude`, `longitude`, `area`, `city`, `state`, `country`, `pincode`, `usertype`) VALUES "
				+ "('"+u1.getFname()+"', '"+u1.getLname()+"', '"+u1.getGender()+"', '"+u1.getUsername()+"', '"+u1.getPassword()+"', '"+u1.getDob()
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
			u1.setLname(rs.getString("lname"));
			u1.setGender(rs.getString("gender"));
			u1.setUsername(rs.getString("username"));
			u1.setPassword(rs.getString("password"));
			u1.setDob(rs.getString("dob"));
			u1.setLatitude(rs.getFloat("latitude"));
			u1.setLongitude(rs.getFloat("longitude"));
			u1.setArea(rs.getString("area"));
			u1.setCity(rs.getString("city"));			
			u1.setState(rs.getString("state"));
			u1.setCountry(rs.getString("country"));
			u1.setPincode(rs.getInt("pincode"));
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
			p1.setPincode(rs.getInt("pincode"));
			p1.setLatitude(rs.getFloat("latitude"));
			p1.setLongitude(rs.getFloat("longitude"));
			p1.setImage(rs.getString("image"));
			return p1;
		}		
	}

	public JdbcTemplate getTemplate() {
		return template;
	}

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

	public DAO() {
		System.out.println("DAO");
	}







	
	
}

