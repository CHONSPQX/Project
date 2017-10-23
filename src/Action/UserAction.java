/**
 * 
 */
package Action;
import java.sql.PreparedStatement;
import com.opensymphony.xwork2.ActionSupport;
import User.*;

/**
 * @author Administrator
 *
 */
public class UserAction{
   Database database;
   User user;
   
   
   public UserAction()
   {
     database =new Database();
     database.ConnectMysql();
   }
    
  public boolean UserCreate() {
    try {
        String insql = "insert into User(UserID,Password,Name,Sex,BirthDate,Message) values(?,?,?,?,?,?)";
        
        PreparedStatement ps = database.conn.prepareStatement(insql);
        
        ps.setString(1, user.getUserID());
        ps.setString(2, user.getPassword());
        ps.setString(3, user.getName());
        ps.setInt(4, user.getSex());
        ps.setDate(5, user.getBirthDate());
        ps.setString(6, user.getMessage());
        int result = ps.executeUpdate();
        if (result > 0)
            return true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
  
  /**
   * @return the user
   */
  public User getUser() {
    return user;
  }
  /**
   * @param user the user to set
   */
  public void setUser(User user) {
    this.user = user;
  }
   
   
}
