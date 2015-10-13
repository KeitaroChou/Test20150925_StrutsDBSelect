package idv.people.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class PeopleSelectAll {
	
	public String execute() {
		
		Configuration cf = new Configuration();
		cf = cf.configure();
		SessionFactory factory = cf.buildSessionFactory();
		Session session = factory.openSession();
		
		People p = null;
		
		for (int i = 1; i <= 10000; i++) {
			p = (People) session.get(People.class, i);
			System.out.println(p.getUid() + ",\t" + p.getName() + ",\t" + p.getSex() + ",\t" + p.getOld());
		}
		
		// 記得關閉資源
		session.close();
		factory.close();
		
		return "success";
		
	}
	
}
