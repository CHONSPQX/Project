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
	private CommentDatabase conn;
	private FileDatabase fconn;
	private String filerename; //为文件重命名时的新文件名。
	
	public String getFilerename() {
		return filerename;
	}

	public void setFilerename(String filerename) {
		this.filerename = filerename;
	}

	public PublicTextAction()
	{
	    database =new Database();
	    database.ConnectMysql();
	    conn = new CommentDatabase();
	    conn.ConnectMysql();
	    fconn = new FileDatabase();
	    fconn.ConnectMysql();
	}
	protected boolean SearchPublicFile(String filename)
	{
		  String AbsoultPath = "/work/shared";
		  File file = new File(AbsoultPath);
		  ArrayList<String> all = new ArrayList<String>();
		  ArrayList<String> All = new ArrayList<String>();
		  CheckAbsoultPath(file, all);
		  int i;
		  for(i = 0;i<all.size();i++)
		  {
			  if(all.get(i).contains(filename))
				  All.add(all.get(i));
		  }
		  for(i = 0;i<All.size();i++)
		  {
			  System.out.println(All.get(i));
		  }
		  if(!All.isEmpty())
		  {
			  ServletActionContext.getRequest().setAttribute("allSearchedPublicFiles", All);
			  database.CutConnection(database.conn);
				conn.CutConnection(conn.conn);
				fconn.CutConnection(fconn.conn);
			  return true;
		  }
		  database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
		  return false;
	} 
	  private void CheckAbsoultPath(File file, ArrayList<String> all)//传递过来的是引用！！
	  {
		  File[] files = file.listFiles();
		  for(File f : files)
		  {
			  if(f.isDirectory())
				  CheckAbsoultPath(f,all);
			  else
			  {
			    String string = f.getPath();
			    string = string.replace("\\", "/");
	            if(string.contains("/work/"))
	            {    
	              string =string.substring(string.lastIndexOf("/work/")+6, string.length());  
	            }
	            all.add(string);
			  }
		  }
	  }
	public String CheckFile()
	{
		//String id = "admin";
		String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		ArrayList<String> all = new ArrayList<String>();
		getFile("/work/shared/"+id,all);
		ServletActionContext.getRequest().setAttribute("AllPublicFiles", all);
		return "check_publicfile_success";
	}
	public void getFile(String path,ArrayList<String>all)//传进的是绝对路径,获取该文件或者该文件夹下的所有文件
	{
		File dir = new File(path);
		if(dir.exists())
		{
			if(dir.isFile())
			{
				all.add(dir.getName());
			}
			else
			{
				String[] strs = dir.list();
				for(String s : strs)
				{
					getFile(path+"/"+s,all);
				}  	
			}
		}
	}
	public static void main(String args[])
	{
	  PublicTextAction pAction = new PublicTextAction();
	  String path = "/work/yangfan";
	  ArrayList<String>all = new ArrayList<String>();
	  pAction.getFile(path,all);
	  for(int i = 0;i<all.size();i++)
		  System.out.println(all.get(i));
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
		//System.out.println(path1);
		if (path1.equals(""))
			path1 = "user";
		path = "shared/" + path1;
		boolean flag = Director.createFile(path + "/" + filename);
		//System.out.println(flag);
		if(flag)
		{
			File source = new File("/work/" + path1 + "/" + filename);
			File dest = new File("/work/shared/" + path1 + "/" + filename);
			try {
				input = new FileInputStream(source).getChannel();
				output = new FileOutputStream(dest).getChannel();
				output.transferFrom(input, 0, input.size());
				return ("shared/" + path1 + "/" + filename);
			} catch (IOException e) {
				e.printStackTrace();
			}
			finally
			{
				try {
					input.close();
					output.close();
					database.CutConnection(database.conn);
					conn.CutConnection(conn.conn);
					fconn.CutConnection(fconn.conn);
				} catch (IOException e) {
					e.printStackTrace();
				}	
			}
		}
		database.CutConnection(database.conn);
		conn.CutConnection(conn.conn);
		fconn.CutConnection(fconn.conn);
		return null;
	}
	public String sharePublicText()//分享文件
	{
		String newpath = createPublicFileByCopy();//newpath是共享文件在共享池里的绝对路径。
		System.out.println(newpath);
		try
		{
			String mysql = "insert into publictext(Location,Owner,Time) values(?,?,?);";
			PreparedStatement ps = database.conn.prepareStatement(mysql);
			ps.setString(1, newpath);
			ps.setString(2, (String) ServletActionContext.getRequest().getSession().getAttribute("userID"));
			ps.setTimestamp(3, new Timestamp(new Date().getTime()));
			int result = ps.executeUpdate();
			System.out.println(result);
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			if(result>0)
			{
				this.createTable();
				return "share_file_success";
			}
			else return "share_file_failed";
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		database.CutConnection(database.conn);
		conn.CutConnection(conn.conn);
		fconn.CutConnection(fconn.conn);
		return "share_file_failed";
	}
	
	public void createTable()
	{
		//String ID = "shared/admin/";
		String ID = "shared/"+(String)ServletActionContext.getRequest().getSession().getAttribute("userID")+"/";
		int pos=filename.indexOf(".");
		String file="";
		if(pos>0)
		  file=filename.substring(0,filename.indexOf("."));
		else
		  file=filename;
		ID = ID + file;
		String presql = "SHOW TABLES LIKE \'" + ID+"\';";
		String mysql="CREATE TABLE `comment`.`"+ID+"` (`ID` INT NOT NULL AUTO_INCREMENT,`userID` VARCHAR(16) NULL,`context` VARCHAR(140) NULL,`time` DATETIME NULL,PRIMARY KEY (`ID`));";
		//System.out.println(mysql);
		//CREATE TABLE `comment`.`ness/aaaaaa` (
		//`ID` INT NOT NULL AUTO_INCREMENT,
		// `userID` VARCHAR(16) NULL,
		// `context` VARCHAR(140) NULL,
		// `time` DATETIME NULL,
		//  PRIMARY KEY (`ID`));
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
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			return "check_comment_success";
		} catch (SQLException e) {
			e.printStackTrace();
			return "check_comment_failed";
		}	
	}
	
	public String delete_publicFile()
	{
		//String uid = "admin";
		String uid = (String)ServletActionContext.getRequest().getSession().getAttribute("userID");
		String path = "/work/shared/"+uid+"/"+filename;
		filename = filename.substring(0,filename.indexOf(".html"));
		File file = new File(path);
		file.delete();
		String presql = "SHOW TABLES LIKE 'shared/"+uid+"/"+filename+"'";
		String mysql = "drop table `shared/"+uid+"/"+filename+"`";
		String sql2 = "Delete from publictext where location='shared/"+uid+"/"+filename+".html'";
		PreparedStatement ps;
		try {
			PreparedStatement ps1 = conn.conn.prepareStatement(presql);
			int rs = ps1.executeUpdate();
			System.out.println("rs = " + rs);
			if(rs==-1)
			{
				ps = conn.conn.prepareStatement(mysql);
				int ts = ps.executeUpdate();
			}
			PreparedStatement ps2 = database.conn.prepareStatement(sql2);
			ps2.executeUpdate();
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			return SUCCESS;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		database.CutConnection(database.conn);
		conn.CutConnection(conn.conn);
		fconn.CutConnection(fconn.conn);
		return SUCCESS;
	}
	public String create_publicFile()
	{
		//String uid = "admin";
		String uid = (String)ServletActionContext.getRequest().getSession().getAttribute("userID");
		String path = "shared/"+uid+"/"+filename;
		boolean flag = Director.createFile(path);//在shared文件夹里新建文件
		try {
			String sql2 = "Delete from publictext where location='shared/"+uid+"/"+filename+"'";
			PreparedStatement ps2 = database.conn.prepareStatement(sql2);
			ps2.executeUpdate();
			String mysql = "insert into publictext(Location,Owner,Time) values(?,?,?);";
			PreparedStatement ps = database.conn.prepareStatement(mysql);
			ps.setString(1, path);
			ps.setString(2, uid);
			ps.setTimestamp(3, new Timestamp(new Date().getTime()));
			int result = ps.executeUpdate();
			createTable();
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			return SUCCESS;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		database.CutConnection(database.conn);
		conn.CutConnection(conn.conn);
		fconn.CutConnection(fconn.conn);
		return SUCCESS;
	}
	public String rename_publicFile()
	{
		String uid = (String)ServletActionContext.getRequest().getSession().getAttribute("userID");
		String path = "shared/"+uid+"/"+filename;
		String newpath = "shared/"+uid+"/"+filerename;
		System.out.println("77777"+filename+"  "+filerename);
		Director.renameFile(path, newpath);
		try
		{
			String ss = new Timestamp(new Date().getTime()).toString();
			String sql1 = "update publictext set location='"+newpath+"', time= '"+ss+"' where location='"+path+"'";
			PreparedStatement ps = database.conn.prepareStatement(sql1);
			ps.executeUpdate();
			filename = filename.substring(0,filename.indexOf(".html"));
			filerename = filerename.substring(0,filerename.indexOf(".html"));
			String sql2 = "alter table `shared/"+uid+"/"+filename+"` rename `shared/"+uid+"/"+filerename+"`";
			PreparedStatement ps2 = conn.conn.prepareStatement(sql2);
			ps2.executeUpdate();
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			return SUCCESS;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		database.CutConnection(database.conn);
		conn.CutConnection(conn.conn);
		fconn.CutConnection(fconn.conn);
		return SUCCESS;
	}
}
