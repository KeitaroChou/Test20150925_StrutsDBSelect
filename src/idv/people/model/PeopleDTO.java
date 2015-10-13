package idv.people.model;

import idv.people.util.PeopleSessionFactory;

import java.io.FileInputStream;
import java.sql.Blob;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class PeopleDTO {

	private int uid;
	private String name;
	private String sex;
	private int old;
	private String photoUrl;
	private List<People> peopleList = new ArrayList<People>();

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getOld() {
		return old;
	}

	public void setOld(int old) {
		this.old = old;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public List<People> getPeopleList() {
		return peopleList;
	}

	public void setPeopleList(List<People> peoplelist) {
		this.peopleList = peoplelist;
	}

	// 搜尋所有資料
	public String selectAll() {
		
		Session session = PeopleSessionFactory.getSessionFactory().openSession();
		this.peopleList = session.createQuery("from People").list();
		
		session.close();
		return "selectAllSuccess";
		
	}
	
	// 多條件搜尋
	public String requirementSelect() {
		
		// 1=1 是為了防堵 where 後面直接接 and
		String sql = "from People where 1=1";
		
		if (this.uid != 0) {
			sql += " and uid=" + this.uid;
		}
		
		if (!this.name.equals("")) {
			sql += " and name='" + this.name + "'";
		}

		if (!this.sex.equals("")) {
			sql += " and sex='" + this.sex + "'";
		}
		
		if (old != 0) {
			sql += " and old=" + this.old;
		}
		
		// 避免無輸入資料，卻輸出所有資料
		if (sql == "from People where 1=1") {
			sql = "";
		}
		
		Session session = PeopleSessionFactory.getSessionFactory().openSession();
		this.peopleList = session.createQuery(sql).list();
//		System.out.println("name=" + this.name);
//		System.out.println("sex=" + this.sex);
//		System.out.println("sql=" + sql);
		
		session.close();
		return "requirementSelectSuccess";
		
	}
	
	// 依 uid 搜尋資料
	public String uidSelect() {

		Session session = null;
		
		try {
			
			session = PeopleSessionFactory.getSessionFactory().openSession();
			
			People p = (People) session.get(People.class, this.uid);
			this.uid = p.getUid();
			this.name = p.getName();
			this.sex = p.getSex();
			this.old = p.getOld();
			
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}

		return "uidSelectSuccess";
		
	}
	
	// 依 name 搜尋資料
		public String nameSelect() {

			Session session = PeopleSessionFactory.getSessionFactory().openSession();
			this.peopleList = session.createQuery("from People where name='" + this.name + "'").list();
			
			session.close();

			return "nameSelectSuccess";
			
		}
	
	// 新增
	public String addPeople() throws Exception {

		Session session = PeopleSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		People people = new People();
		people.setName(this.name);
		people.setSex(this.sex);
		people.setOld(this.old);
		// 產生現在時間
		Date publishingTime = new Date();
		people.setPublishingTime(publishingTime);
		// 上傳圖片
//		FileInputStream photoin = new FileInputStream("C:\\fakepath\02.jpg");
//		Blob photo = Hibernate.createBlob(photoin);
//		people.setPhoto(photo);
		
		session.saveOrUpdate(people);
		transaction.commit();

//		photoin.close();
		session.close();
		return "addPeopleSuccess";
	}
	
	// 修改
	public String updatePeople() {
		
		Session session = PeopleSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		// 先取得要修改的資料行，再進行修改
		// load 利用主鍵資料，獲取相對資料行內容（返回型態為 Object ）
		People people = (People) session.load(People.class, this.uid);	// 執行這行會產生 SELECT 的語句
		people.setName(this.name);	// 執行這行會產生 UPDATE 的語句
		people.setSex(this.sex);
		people.setOld(this.old);
		transaction.commit();

		session.close();
		return "updatePeopleSuccess";
		
	}
	
	// 刪除
	public String deletePeople() {
		
		Session session = PeopleSessionFactory.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		People people =(People) session.load(People.class, this.uid);
		session.delete(people);
		transaction.commit();
		
		session.close();
		return "deletePeopleSuccess";
	}

}
