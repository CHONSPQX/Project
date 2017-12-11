package Action;

import User.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class AjaxUserProfile extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;//

	public String SetUserProfile() {
		String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		user.setUserID(id);
		Database database = new Database();
		database.ConnectMysql();
		if(user.getBirthDate()==null)
			user.setBirthDate(new Date(0,0,0));
		String presql = "update project.user set Name='" + user.getName() + "', Sex='" + user.getSex() + "',Message='"
				+ user.getMessage() + "',Address='" + user.getAddress() + "',BirthDate='" + user.getBirthDate()
				+ "',UserEmail='" + user.getUserEmail() + "' where UserID='" + user.getUserID() + "';";
		System.out.println(presql);
		try {
			String insql1 = "select UserID from project.user where UserEmail='" + user.getUserEmail() + "'";
			PreparedStatement ps1 = database.conn.prepareStatement(insql1);
			ResultSet rs1 = ps1.executeQuery();
			if (rs1.next()) {
				if(!rs1.getString(1).equals(id))
				{
					database.CutConnection();
					System.out.println("1024");
					return ERROR;
				}	
			}
			PreparedStatement sql = database.conn.prepareStatement(presql);
			int rs = sql.executeUpdate();
			if (rs > 0) {
				database.CutConnection(database.conn);
				return SUCCESS;
			} else {
				database.CutConnection(database.conn);
				return ERROR;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			database.CutConnection(database.conn);
			return ERROR;
		}
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}