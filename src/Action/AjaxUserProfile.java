package Action;
import User.User;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class AjaxUserProfile extends ActionSupport {
  /**
	 * 
	 */
private static final long serialVersionUID = 1L;
private User user;//
  
  public String SetUserProfile()
  {
	  String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
	  user.setUserID(id);
	  Database database=new Database();
	  database.ConnectMysql();
	  String presql = "update project.user set Name='"+user.getName()+"', Sex='"+user.getSex()+"',Message='"+user.getMessage()+
			  "',Address='"+user.getAddress()+"',BirthDate='"+user.getBirthDate()+"',UserEmail='"+user.getUserEmail()+"' where UserID='" + user.getUserID() +"';";
	  System.out.println(presql);
	  try {
		PreparedStatement sql=database.conn.prepareStatement(presql);
		int rs=sql.executeUpdate();
		if(rs>0)
			return SUCCESS;
		else
			return ERROR;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
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