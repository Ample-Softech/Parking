package basic.ControlerPack;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.service.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtilities {

	private static ServiceRegistry serviceRegistry;
	private static SessionFactory sessionFactory;

	static {

		try {
			Configuration configuration = new Configuration().configure("hibernate.cfg.xml");

			serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();

			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
			System.out.println("session factory..");

		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("Problem creating session factory" + e);
		}
	}

	public static SessionFactory getsSessionFactory() {
		return sessionFactory;
	}
	
}