// 為了不讓 SessionFactory 有重複宣告，造成大量佔取資源的情況
// 所以將之唯一化，確保記憶體中的 SessionFactory 只有一個

package idv.people.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

final public class PeopleSessionFactory {

	private static SessionFactory sessionFactory = null;
	
	private PeopleSessionFactory() {
		
	}

	static {
		// 相等於
		// Configuration cf = new Configuration();
		// cf = cf.configure();
		// SessionFactory factory = cf.buildSessionFactory();
		sessionFactory = new Configuration().configure().buildSessionFactory();
	}
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
}
