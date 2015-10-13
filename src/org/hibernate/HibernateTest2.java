package org.hibernate;

import java.util.ArrayList;
import java.util.List;

import idv.people.model.*;
import idv.people.util.PeopleSessionFactory;

public class HibernateTest2 {
	
	
	
	public static void main(String[] args) {
		
		List<People> peopleList = new ArrayList<People>();
		
		// 1=1 是為了防堵 where 後面直接接 and
		String sql = "from People where 1=1";
		int uid = 0;
		String name = "";
		String sex = "male";
		int old = 80;
		
		if (uid != 0) {
			sql += " and uid=" + uid;
		}

		if (name != "") {
			sql += " and name='" + name + "'";
		}

		if (sex != "") {
			sql += " and sex='" + sex + "'";
		}
		
		if (old != 0) {
			sql += " and old=" + old;
		}
		System.out.println(sql);
		Session session = PeopleSessionFactory.getSessionFactory().openSession();
		peopleList = session.createQuery(sql).list();
		
		for (People people : peopleList) {
			System.out.println(people.getUid() + ",\t" + people.getName() + ",\t" + people.getSex() + ",\t" + people.getOld());
		}
		
		session.close();

	}

}
