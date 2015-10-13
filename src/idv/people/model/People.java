package idv.people.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

// Serializable → 序列化，為了可以在網路程式和文件中相互傳輸
public class People implements Serializable {

	// serialVersionUID 序列ＩＤ
	private static final long serialVersionUID = 1L;
	private int uid;
	private String pwd;
	private String name;
	private String sex;
	private int old;
	private Date publishingTime;
	private Blob photo;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public Date getPublishingTime() {
		return publishingTime;
	}
	public void setPublishingTime(Date publishingTime) {
		this.publishingTime = publishingTime;
	}
	public Blob getPhoto() {
		return photo;
	}
	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	
}
