package Action;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Article.Article;
import User.User;
import WeFile.Director;

/**
 * @author Administrator
 *
 */
public class UserAction extends ActionSupport {
	private Database database;
	private User user=new User();
	private String path;//
	private String SharedFilePath;// 用户现在查看的分享文件的绝对路径
	private CommentDatabase conn;
	private FileDatabase fconn;
	private String context;// 用户评论的内容
	private String confirmword;
	private ClassDatabase cconn;
	
	public String getSharedFilePath() {
		return SharedFilePath;
	}

	public void setSharedFilePath(String sharedFilePath) {
		SharedFilePath = sharedFilePath;
	}

	public UserAction() {
		database = new Database();
		database.ConnectMysql();
		conn = new CommentDatabase();
		conn.ConnectMysql();
		fconn = new FileDatabase();
		fconn.ConnectMysql();
		cconn = new ClassDatabase();
		cconn.ConnectMysql();
	}

	public String UserComment() {
		try {
			String userid = "admin3";
			String mysql = "INSERT INTO shared(userID,context,time) VALUES(?,?,?);";
			PreparedStatement ps = conn.conn.prepareStatement(mysql);
			ps.setString(1, userid);
			ps.setString(2, "感觉这篇文章写的很好");
			ps.setTimestamp(3, new Timestamp(new Date().getTime()));
			int result = ps.executeUpdate();
			if (result > 0) {
				return "comment_success";
			} else
				return "comment_failed";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "comment_failed";
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getUserProfile()
	{
		String id=(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		User user=new User();
		String sql="select Name,Sex,BirthDate,Message,UserEmail,Address from project.user where UserID='"+id+"';";
		PreparedStatement presql;
		try {
			presql = database.conn.prepareStatement(sql);
			ResultSet rs=presql.executeQuery();
			if(rs.next())
			{
				user.setName(rs.getString(1));
				user.setSex(rs.getInt(2));
				user.setBirthDate(rs.getDate(3));
				user.setMessage(rs.getString(4));
				user.setUserEmail(rs.getString(5));
				user.setAddress(rs.getString(6));
				//System.out.println(user.getName()+" "+user.getSex());
				ServletActionContext.getRequest().setAttribute("user_profile", user);
				return "get_user_profile_success";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "get_user_profile_failed";
		}
		return "get_user_profile_failed";
	}
	
	public String UserCreate() {
		if (confirmword.equals(user.getPassword()))
			try {
				String insql = "insert into User(UserID,Password,Name,Sex,BirthDate,Message,UserEmail) values(?,?,?,?,?,?,?)";
				PreparedStatement ps = database.conn.prepareStatement(insql);
				ps.setString(1, user.getUserID());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getName());
				ps.setInt(4, user.getSex());
				ps.setDate(5, user.getBirthDate());
				ps.setString(6, user.getMessage());
				ps.setString(7, user.getUserEmail());
				System.out.println(user.getUserEmail());
				int result = ps.executeUpdate();
				if (result > 0) {
					String dirName = user.getUserID() + "/";
					System.out.println(dirName);
					if (Director.createDir(dirName)) {
						createUserTable();
						createClassTable();
						ClassifierSearcher.CreateIndex(user.getUserID());
						return "create_user_success";
					} else {
						return "create_user_failed";
					}

				} else
					return "create_user_success";
			} catch (Exception e) {
				e.printStackTrace();
			}
		return "create_user_failed";
	}

	public String UserLogout() {
		
		if ((String) ServletActionContext.getRequest().getSession().getAttribute("userID") == null)
			return "logout_failed";
		ServletActionContext.getRequest().getSession().removeAttribute("userID");
		System.out.println((String) ServletActionContext.getRequest().getSession().getAttribute("testmessage"));
		ServletActionContext.getRequest().getSession().invalidate();
		System.out.println((String) ServletActionContext.getRequest().getSession().getAttribute("userID"));
		System.out.println((String) ServletActionContext.getRequest().getSession().getAttribute("testmessage"));
		return "logout_success";
	}

	public String UserLogin() {
		try {
			String regEx1 = "([\\w\\-\\.]+)@([0-9a-zA-Z\\-]+)(\\.[a-zA-Z]{2,4}){1,2}";
			Pattern p1 = Pattern.compile(regEx1);
			Matcher m1 = p1.matcher(user.getUserID());
			boolean b = m1.matches();
			System.out.println(user.getUserID());
			System.out.println(user.getPassword());
			String insql;
			if (!b) {
				insql = "select Password from User where UserID = ?";
			} else {
				insql = "select Password from User where UserEmail = ?";
			}
			PreparedStatement ps = database.conn.prepareStatement(insql);
			ps.setString(1, user.getUserID());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(user.getPassword())) {
					if (!b)
					{
						ServletActionContext.getRequest().getSession().setAttribute("userID", user.getUserID());
						ServletActionContext.getRequest().getSession().setAttribute("testmessage", "404");
						System.out.println((String) ServletActionContext.getRequest().getSession().getAttribute("userID"));
						System.out.println("login_success");
					}
					else
						ServletActionContext.getRequest().getSession().setAttribute("userEmail", user.getUserID());
					return "login_success";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login_failed";
	}

	public String createDir() {
		if (Director.createDir(path))
			return "createDirok";
		else
			return "createDirnotok";
	}

	public String UserCheckFiles() {
		String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		System.out.println(id);
		ArrayList<String> all = Director.checkFile(id, "");
		for (String s : all)
			System.out.println(s);
		ServletActionContext.getRequest().setAttribute("AllFiles", all); 
		return "check_file_success";
	}
	
	public String UserCheckFile() {
		String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
	    try{
		String sql="select title, label1, label2, label3, keyword,time, path,owner from `"+id+"`";
		//System.out.println(sql);
	    PreparedStatement psql=fconn.conn.prepareStatement(sql);
	    ResultSet rs=psql.executeQuery();
		ArrayList<Article> results=new ArrayList<>();
		while(rs.next())
		{
			Article article = new Article();
			article.setTitle(rs.getString(1));
			article.setLabel1(rs.getString(2));
			article.setLabel2(rs.getString(3));
			article.setLabel3(rs.getString(4));
			article.setKeyword(rs.getString(5));
			article.setDateTime(rs.getString(6));
			article.setLocation(rs.getString(7));
			article.setOwner(rs.getString(8));
		    results.add(article);
		}
		//System.out.println(results.size());
		ServletActionContext.getRequest().setAttribute("AllFiles", results); 
		return "check_file_success";
	    }
	    catch (Exception e) {
			// TODO: handle exception
	    	return "chech_file_failed";
		}
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
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

	/**
	 * @return the confirmword
	 */
	public String getConfirmword() {
		return confirmword;
	}

	/**
	 * @param confirmword
	 *            the confirmword to set
	 */
	public void setConfirmword(String confirmword) {
		this.confirmword = confirmword;
	}
	
	public boolean createUserTable()
	{
		String ID = user.getUserID();
		System.out.println("now ID = " +ID);
		String presql = "SHOW TABLES LIKE \'" + ID+"\';";
		String mysql="CREATE TABLE `filerecord`.`"+ID+ "` (\r\n" + 
				"  `title` VARCHAR(100) NOT NULL,\r\n" + 
				"  `keyword` VARCHAR(100) NULL,\r\n" + 
				"  `label1` VARCHAR(100) NULL,\r\n" + 
				"  `label2` VARCHAR(100) NULL,\r\n" + 
				"  `label3` VARCHAR(100) NULL,\r\n" + 
				"  `path` VARCHAR(100) NOT NULL,\r\n" + 
				"  `time` DATE NULL,\r\n" + 
				"  `owner` VARCHAR(100) NOT NULL,\r\n" + 
				"  `layer` VARCHAR(10) NULL DEFAULT 0,\r\n" +
				"  PRIMARY KEY (`title`))\r\n" + 
				"ENGINE = InnoDB;\r\n" + 
				"";
		try {
			PreparedStatement ps1 = fconn.conn.prepareStatement(presql);
			int rs = ps1.executeUpdate();//如果表已经存在了，返回-1，否则返回0
			if(rs == -1)
			{
				presql = "DROP TABLE `" + ID + "`;";
				PreparedStatement ps2 = fconn.conn.prepareStatement(presql);
				ps2.executeUpdate();
			}
			PreparedStatement ps3 = fconn.conn.prepareStatement(mysql);
			rs = ps3.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean createClassTable()
	{
		String ID = user.getUserID();
		String presql = "SHOW TABLES LIKE \'" + ID+"\';";
		String mysql="CREATE TABLE `classification`.`"+ID+"` (\r\n" + 
				"  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,\r\n" + 
				"  `firstclass` VARCHAR(45) NULL,\r\n" + 
				"  `secondclass` VARCHAR(45) NULL,\r\n" + 
				"  `thirdclass` VARCHAR(45) NULL,\r\n" + 
				"  `sum` INT NULL DEFAULT 1,\r\n" +
				"  PRIMARY KEY (`id`))\r\n" + 
				"ENGINE = InnoDB;";
		try {
			System.out.println(presql);
			PreparedStatement ps1 = cconn.conn.prepareStatement(presql);
			int rs = ps1.executeUpdate();//如果表已经存在了，返回-1，否则返回0
			if(rs == -1)
			{
				presql = "DROP TABLE `" + ID + "`;";
				PreparedStatement ps2 = cconn.conn.prepareStatement(presql);
				ps2.executeUpdate();
			}
			PreparedStatement ps3 = cconn.conn.prepareStatement(mysql);
			rs = ps3.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<String> getallUser()
	{
		ArrayList<String> all = new ArrayList<String>();
		String sp = "Select userID from user";
		String a;
		try {
			PreparedStatement ps = database.conn.prepareStatement(sp);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				a = rs.getString(1);
				all.add(a);
			}
			return all;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return all;
	}
	
	public void updateUserTable(String user)
	{
		String path = "//work/"+user;
		File file = new File(path);
		File[] array = file.listFiles();
		for(int i=0;i<array.length;i++)
		{
			if(array[i].isFile())
			{
				try
				{
					String insql = "insert into `"+user+"`(title,path,time,owner) values(?,?,?,?)";
					PreparedStatement ps = fconn.conn.prepareStatement(insql);
					ps.setString(1, array[i].getName());
					String st = array[i].getPath();
					st = st.replace("\\", "/");
		            if(st.contains("/work/"))
		            {    
		              st =st.substring(st.lastIndexOf("/work/")+8, st.length());  
		            }
					ps.setString(2, st);
					ps.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
					ps.setString(4, user);
					int result = ps.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		}
	}
	public static void main(String args[])
	{
		UserAction ua = new UserAction();
		ua.updateUserTable("00001111");
	}
}
