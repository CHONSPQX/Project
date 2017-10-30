/**
 * 
 */
package Action;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import User.User;
import WeFile.Director;

/**
 * @author Administrator
 *
 */
public class UserAction extends ActionSupport{
   private Database database;
   private User user;
   private String path;//
   private String SharedFilePath;//用户现在查看的分享文件的绝对路径
   private ConnectionToCommentTable conn;
   private String context;//用户评论的内容

public String getSharedFilePath() {
	return SharedFilePath;
}

public void setSharedFilePath(String sharedFilePath) {
	SharedFilePath = sharedFilePath;
}

public UserAction()
   {
     database =new Database();
     database.ConnectMysql();
     conn = new ConnectionToCommentTable();
     conn.ConnectMysql();
   }
    
public String UserComment()
{
	try
	{
		String userid = "admin3";
		String mysql = "INSERT INTO shared(userID,context,time) VALUES(?,?,?);";
		PreparedStatement ps = conn.conn.prepareStatement(mysql);
		ps.setString(1, userid);
		ps.setString(2, "感觉这篇文章写的很好");
		ps.setTimestamp(3, new Timestamp(new Date().getTime()));
		int result = ps.executeUpdate();
		if(result>0)
		{
			return "comment_success";
		}
		else return "comment_filed";
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return "comment_filed";
}

public static void main(String args[])
{
	UserAction ua = new UserAction();
	ua.UserComment();
}

public String getContext() {
	return context;
}

public void setContext(String context) {
	this.context = context;
}

public String UserCreate() {
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
        {
        	String dirName = user.getUserID() + "/";
        	System.out.println(dirName);
        	if(Director.createDir(dirName))
        		return "createok";
        	else return "createnotok";
        	
        }
        else
            return "createnotok";
    } catch (Exception e) {
        e.printStackTrace();
    }
    return "createnotok";
}
  public String UserLogin() {
	  System.out.println(user.getUserID());
	  try{
        String insql = "select Password from User where UserID = ?";
        PreparedStatement ps = database.conn.prepareStatement(insql);
        ps.setString(1, user.getUserID());
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
        	if(rs.getString(1).equals(user.getPassword()))
        	{
        		ServletActionContext.getRequest().getSession().setAttribute("userID", user.getUserID());
        		return "loginok";
        	}
        		
        }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
        return "loginnotok";
}
  public String createDir()
  {
	  if(Director.createDir(path))
  		return "createDirok";
  	else return "createDirnotok";
  }
  
  
  public String UserCheckFile()
  {
	  System.out.print("1111");
	  String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
	  
	  ArrayList<String> all = Director.checkFile(id, "");
	  ServletActionContext.getRequest().setAttribute("AllFiles", all);
	  return "checkFileok";
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
  
 
  
  public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
     
}
