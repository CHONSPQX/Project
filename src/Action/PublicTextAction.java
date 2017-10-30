package Action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Comment.Comment;
import PublicText.PublicText;
import WeFile.Director;

public class PublicTextAction extends ActionSupport
{
	private PublicText publictext;
	private String path;
	private String filename;
	private Database database;
	private ConnectionToCommentTable conn;
	
	public PublicTextAction()
	{
	     database =new Database();
	     database.ConnectMysql();
	     conn = new ConnectionToCommentTable();
	     conn.ConnectMysql();
	}

	public PublicText getPublictext() {
		return publictext;
	}

	public void setPublictext(PublicText publictext) {
		this.publictext = publictext;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public  String createPublicFileByCopy()//将作者的文件复制到公共文件池里。/
	{
		FileChannel input = null;
		FileChannel output = null;
		String path1 = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		System.out.println(path1);
		if (path1.equals(""))
			path1 = "user";
		path = "shared/" + path1;
		boolean flag = Director.createFile(path + "/" + filename);
		if(flag)
		{
			File source = new File("F:/work/" + path1 + "/" + filename);
			File dest = new File("F:/work/shared/" + path1 + "/" + filename);
			try {
				input = new FileInputStream(source).getChannel();
				output = new FileOutputStream(dest).getChannel();
				output.transferFrom(input, 0, input.size());
				return ("F:/work/shared/" + path1 + "/" + filename);
			} catch (IOException e) {
				e.printStackTrace();
			}
			finally
			{
				try {
					input.close();
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
				}	
			}
		}
		return null;
	}
	public String sharePublixText()//分享文件
	{
		String newpath = createPublicFileByCopy();//newpath是共享文件在共享池里的绝对路径。
		try
		{
			String mysql = "insert into publictext(Location,Owner,Time) values(?,?,?)";
			PreparedStatement ps = conn.conn.prepareStatement(mysql);
			ps.setString(1, newpath);
			ps.setString(2, (String) ServletActionContext.getRequest().getSession().getAttribute("userID"));
			ps.setTimestamp(3, new Timestamp(new Date().getTime()));
			int result = ps.executeUpdate();
			if(result>0)
			{
				this.createTable();
				return "shareFile_success";
			}
			else return "shareFile_filed";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "shareFile_filed";
	}
	
	public void createTable()
	{
		String ID = "shared/"+(String)ServletActionContext.getRequest().getSession().getAttribute("userID")+"/";
		String newfile = filename;
		ID = ID + filename.replace(".txt", "");
		String presql = "SHOW TABLES LIKE \'" + ID+"\';";
		String mysql = "CREATE TABLE "+ID+" (ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, userID VARCHAR(16), context VARCHAR(140), time DATETIME);";
		try {
			PreparedStatement ps1 = conn.conn.prepareStatement(presql);
			int rs = ps1.executeUpdate();//如果表已经存在了，返回-1，否则返回0
			if(rs == -1)
			{
				presql = "DROP TABLE " + ID + ";";
				PreparedStatement ps2 = conn.conn.prepareStatement(presql);
				ps2.executeUpdate();
			}
			PreparedStatement ps3 = conn.conn.prepareStatement(mysql);
			ps3.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String checkComment()
	{
		String fileId = "shared/"+(String)ServletActionContext.getRequest().getSession().getAttribute("userID")+"/";
		String newfile = filename;
		fileId = fileId + filename.replace(".txt", "");
		String mysql = "SELECT ID,userID,context,time FROM "+fileId;
		try {
			ArrayList<Comment> all = new ArrayList<Comment>();
			PreparedStatement ps = conn.conn.prepareStatement(mysql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				Comment co = new Comment();
				co.setNumber(rs.getInt(1));
				co.setOwner(rs.getString(2));
				co.setMessage(rs.getString(3));
				co.setCommentTime(rs.getDate(4));
				all.add(co);
				//System.out.println(""+rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+"  "+rs.getDate(4));
			}
			ServletActionContext.getRequest().setAttribute("commentTable", all);
			return "checkComment_success";
		} catch (SQLException e) {
			e.printStackTrace();
			return "checkComment_fail";
		}	
	}
	public static void main(String args[])
	{
		PublicTextAction p = new PublicTextAction();
		p.checkComment();
	}
}
