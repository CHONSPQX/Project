package Action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.struts2.ServletActionContext;

import User.User;

public class ClassficationAction 
{
	private Database database;
	private User user = new User();
	private String path;//
	private String SharedFilePath;// 用户现在查看的分享文件的绝对路径
	private CommentDatabase conn;
	private FileDatabase fconn;
	private String context;// 用户评论的内容
	private String confirmword;
	private String firstclass;
	private String secondclass;
	private String thirdclass;
	private String filename;
	private ClassDatabase cconn;
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFirstclass() {
		return firstclass;
	}

	public void setFirstclass(String firstclass) {
		this.firstclass = firstclass;
	}

	public String getSecondclass() {
		return secondclass;
	}

	public void setSecondclass(String secondclass) {
		this.secondclass = secondclass;
	}

	public String getThirdclass() {
		return thirdclass;
	}

	public void setThirdclass(String thirdclass) {
		this.thirdclass = thirdclass;
	}

	public ClassficationAction()
	{
		database = new Database();
		database.ConnectMysql();
		conn = new CommentDatabase();
		conn.ConnectMysql();
		fconn = new FileDatabase();
		fconn.ConnectMysql();
		cconn = new ClassDatabase();
		cconn.ConnectMysql();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getSharedFilePath() {
		return SharedFilePath;
	}

	public void setSharedFilePath(String sharedFilePath) {
		SharedFilePath = sharedFilePath;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getConfirmword() {
		return confirmword;
	}

	public void setConfirmword(String confirmword) {
		this.confirmword = confirmword;
	}
	
	public String setclass()//用于用户输入类别时设置类别。
	{
		String uid = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		if(secondclass == null)
		{
			String sql1 = "select id from `"+uid+"` where firstclass ='"+firstclass+"'";
			try
			{
				PreparedStatement ps1 = cconn.conn.prepareStatement(sql1);
				ResultSet rs = ps1.executeQuery();
				if(!rs.next())
				{
					String sql2 = "insert into `"+uid+"` firstclass values ?";
					PreparedStatement ps2 = cconn.conn.prepareStatement(sql2);
					ps2.setString(1, firstclass);
					ps2.executeUpdate();
					String sql3 = "insert into `"+uid+"` (firstclass,layer) values (?,?)";
					PreparedStatement ps3 = fconn.conn.prepareStatement(sql3);
					ps3.setString(1, firstclass);
					ps3.setString(2, "1");
					ps3.executeUpdate();
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if(thirdclass == null)
		{
			String sql1 = "select id from `"+uid+"` where firstclass ='"+firstclass+"' and secondclass='"+secondclass+"'";
			try
			{
				PreparedStatement ps1 = cconn.conn.prepareStatement(sql1);
				ResultSet rs = ps1.executeQuery();
				if(!rs.next())
				{
					String sql2 = "insert into `"+uid+"` (firstclass,secondclass) values (?,?)";
					PreparedStatement ps2 = cconn.conn.prepareStatement(sql2);
					ps2.setString(1, firstclass);
					ps2.setString(2, secondclass);
					ps2.executeUpdate();
					String sql3 = "insert into `"+uid+"` (firstclass,secondclass,layer) values (?,?,?)";
					PreparedStatement ps3 = fconn.conn.prepareStatement(sql3);
					ps3.setString(1, firstclass);
					ps3.setString(2, secondclass);
					ps3.setString(3, "1");
					ps3.executeUpdate();
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			String sql1 = "select id from `"+uid+"` where firstclass ='"+firstclass+"' and secondclass='"+secondclass+"'";
			try
			{
				PreparedStatement ps1 = cconn.conn.prepareStatement(sql1);
				ResultSet rs = ps1.executeQuery();
				if(!rs.next())
				{
					String sql2 = "insert into `"+uid+"` (firstclass,secondclass) values (?,?)";
					PreparedStatement ps2 = cconn.conn.prepareStatement(sql2);
					ps2.setString(1, firstclass);
					ps2.setString(2, secondclass);
					ps2.executeUpdate();
					String sql3 = "insert into `"+uid+"` (firstclass,secondclass,layer) values (?,?,?)";
					PreparedStatement ps3 = fconn.conn.prepareStatement(sql3);
					ps3.setString(1, firstclass);
					ps3.setString(2, secondclass);
					ps3.setString(3, "1");
					ps3.executeUpdate();
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return "";
	}
	
}
