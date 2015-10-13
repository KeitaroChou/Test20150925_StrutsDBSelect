package idv.people.login;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.sun.org.apache.regexp.internal.recompile;

public class LoginCheck {

	private String user;
	private String pwd;
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String excute() {
		
//		List<LoginUser> loginUsers = new ArrayList<LoginUser>();
//		
//		Configuration configuration = new Configuration();
//		configuration = configuration.configure();
//		SessionFactory sessionFactory = configuration.buildSessionFactory();
//		Session session = sessionFactory.openSession();
//		ResultSet resultSet;
//		
//		if (user != null || pwd != null) {
//			
//			resultSet = (ResultSet) session.createQuery("from LoginUser where user='" + this.user + "' and pwd='" + this.pwd + "'");
//			session.close();
//			sessionFactory.close();
//			
//			for (LoginUser loginUser : loginUsers) {
//				System.out.println("user : " + loginUser.getUser() + "\npwd : " + loginUser.getPwd());
//			}
//			
//		}
		
		
		// JDBC ==============================================================
		
		Connection connection;
		PreparedStatement ps;
		ResultSet resultSet;
		String setReturn = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://klaus-macbook-air.local:3306/test?"
							+ "user=klaus&password=klaus580925&useUnicode=true&characterEncoding=utf-8");
			
			ps = connection.prepareStatement("SELECT * FROM TestLoginUser WHERE user=? and pwd=?");
			ps.setString(1, this.user);
			ps.setString(2, this.pwd);
			System.out.println(ps);
			
			resultSet = ps.executeQuery();
			
			if (resultSet.next()) {
				LoginUser loginUser = new LoginUser();
				loginUser.setUser(resultSet.getString(1))
				;
				resultSet.close();
				ps.close();
				connection.close();
				setReturn = "loginSuccess";
			} else {
				resultSet.close();
				ps.close();
				connection.close();
				setReturn = "loginFail";
			}
			
			System.out.println(setReturn);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return setReturn;

		// ===================================================================
		
	}
	
}
