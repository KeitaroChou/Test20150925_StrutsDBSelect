package org.hibernate;

import java.util.Date;
import java.io.FileInputStream;
import java.sql.Blob;
import idv.people.model.People;
import idv.people.util.PeopleSessionFactory;

public class klaustest {

	public static void main(String[] args) throws Exception {
		
		Session session = PeopleSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		People people = new People();
		people.setName("陳懂懂");
		people.setSex("male");
		people.setOld(23);
		// 產生現在時間
		Date publishingTime = new Date();
		people.setPublishingTime(publishingTime);
		// 上傳圖片
		FileInputStream photoin = new FileInputStream("/Users/klaus/Downloads/02.jpg");
		Blob photo = Hibernate.createBlob(photoin);
		people.setPhoto(photo);
		
		session.saveOrUpdate(people);
		transaction.commit();

		session.close();

	}

}
