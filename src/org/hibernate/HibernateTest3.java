package org.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.cfg.Configuration;

import idv.people.login.LoginUser;

public class HibernateTest3 {

	public static void main(String[] args) {
		
		List<LoginUser> loginUsers = new ArrayList<LoginUser>();
		
		Configuration cf = new Configuration();
		cf = cf.configure();
		SessionFactory factory = cf.buildSessionFactory();
		Session session = factory.openSession();

		loginUsers = session.createQuery("from LoginUser").list();
		
		for (LoginUser loginUser : loginUsers) {
			System.out.println(loginUser.getUid() + ",\t" + loginUser.getUser() + ",\t" + loginUser.getPwd());
		}
		
		session.close();
		factory.close();
		
	}

}
