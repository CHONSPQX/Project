/**
 * 
 */
package Action;
import Article.Txtfile;
import Comment.Comment;
import WeFile.Director;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.channels.FileChannel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;  
import java.util.HashMap;  
import java.util.List;  


import org.apache.struts2.ServletActionContext;
import org.apache.tomcat.dbcp.dbcp.DbcpException;

import com.opensymphony.xwork2.ActionSupport;



/**
 * @author Administrator
 *
 */
public class AjaxAction extends ActionSupport {
  private String path;//
  private String filename;
  private String filerename;
  private String context;
  private boolean flag;
  private String commentcontext;
  private String newpassword;
  private String oldpassword;
  private FileDatabase fconn;
  //private List<Txtfile> txtfiles;
  //private JSONArray text;
  
  
  public AjaxAction()
  {
	  fconn = new FileDatabase();
	  fconn.ConnectMysql();
  }
  
  /**
   * @return the commentcontext
   */
  public String getCommentcontext() {
    return commentcontext;
  }


  public String getNewpassword() {
	return newpassword;
}


public void setNewpassword(String newpassword) {
	this.newpassword = newpassword;
}


public String getOldpassword() {
	return oldpassword;
}


public void setOldpassword(String oldpassword) {
	this.oldpassword = oldpassword;
}


/**
   * @param commentcontext the commentcontext to set
   */
  public void setCommentcontext(String commentcontext) {
    this.commentcontext = commentcontext;
  }

  private int pagenum;
  
  public  String createPublicFileByCopy()//将作者的文件复制到公共文件池里。/
  {
    String path1 = (String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
    File de = new File("F:/work/shared/" + path1 + "/" + filename);
    if(de.exists())
    {
      de.delete();
    }
      FileChannel input = null;
      FileChannel output = null;
      System.out.println(path1);
      path = "shared/" + path1;
      boolean flag = Director.createFile(path + "/" + filename);
      System.out.println(flag);
      if(flag)
      {
          File source = new File("F:/work/" + path1 + "/" + filename);
          File dest = new File("F:/work/shared/" + path1 + "/" + filename);
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
              } catch (IOException e) {
                  e.printStackTrace();
              }   
          }
      }
      return path + "/" + filename;
  }
  public void createTable()
  {
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
      System.out.println(mysql);
      CommentDatabase commentDatabase=new CommentDatabase();
      commentDatabase.ConnectMysql();
      try {
          PreparedStatement ps1 = commentDatabase.conn.prepareStatement(presql);
          int rs = ps1.executeUpdate();//如果表已经存在了，返回-1，否则返回0
          if(rs == -1)
          {
              presql = "DROP TABLE " + ID + ";";
              PreparedStatement ps2 = commentDatabase.conn.prepareStatement(presql);
              ps2.executeUpdate();
          }
          PreparedStatement ps3 = commentDatabase.conn.prepareStatement(mysql);
          ps3.executeUpdate();
      } catch (SQLException e) {
          e.printStackTrace();
      }
  }
  public String shareFile()//分享文件
  {
      String newpath = createPublicFileByCopy();//newpath是共享文件在共享池里的绝对路径。
      System.out.println(newpath);
      try
      {
          String userID=(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
          String mysql = "insert into publictext(Location,Owner,Time) values(?,?,?);";
          Database database=new Database();
          database.ConnectMysql();
          PreparedStatement ps = database.conn.prepareStatement(mysql);
          ps.setString(1, newpath);
          ps.setString(2,userID);
          ps.setTimestamp(3, new Timestamp(new Date().getTime()));
          int result = ps.executeUpdate();
          System.out.println(result);
          if(result>0)
          {
              this.createTable();
              FullTextRetrieval.AddPublicIndex(userID, filename);
              return SUCCESS;
          }
          else return SUCCESS;
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return SUCCESS;
  }

  public String saveFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    System.out.println(context);
     boolean flag=Director.saveFile(path + "/" + filename, context);
     ServletActionContext.getRequest().setAttribute("saveFileFlag", flag);
     this.flag=flag;
     System.out.println(flag);
     FullTextRetrieval.AddIndex(path, filename);
     if(flag)
       return SUCCESS;
       return SUCCESS;  
  }
  
  public String createFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (path.equals(""))
      path = "user";
    boolean flag = Director.createFile(path + "/" + filename);
    FullTextRetrieval.AddIndex(path, filename);
    create_file();
    return SUCCESS;
  }
  
  public String renameFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    boolean flag = Director.renameFile(path + "/" + filename,
        path + "/" + filerename);
    rename_file();
    return SUCCESS;
  }
  
  public String deleteFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    boolean flag = Director.deleteFile(path + "/" + filename);
    delete_file();
    return SUCCESS;
  }
  
  public String updateContext(){
    List<Txtfile> txtfiles=new ArrayList<Txtfile>();
    Txtfile file1=new Txtfile();
    Txtfile file2=new Txtfile();
    Txtfile file3=new Txtfile();
    file1.filename="file1";
    file1.context="hello";
    file1.date="2017";
    System.out.println(file1);
    file2.filename="file2";
    file2.context="world";
    file2.date="11";
    System.out.println(file2);
    file3.filename="file3";
    file3.context="!";
    file3.date="1";
    System.out.println(file3);
    txtfiles.add(file1);
    txtfiles.add(file2);
    txtfiles.add(file3);
    //text=JSONArray.fromObject(txtfiles);
    this.flag=true;
    //System.out.println(text.toString(3));
    return "txtfiles";
  }

  public String sendComment() {
    String location=filename;
    Database db = new Database();
    db.ConnectMysql();
    String presql = "select * from project.publictext where Location='" + location + "';";
    System.out.println(presql);
    String userid = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    //System.out.println(userid);
    try{
      PreparedStatement ps1 = db.conn.prepareStatement(presql);
      ResultSet rs = ps1.executeQuery();
    if (rs.next()) {
      location = location.substring(0, location.indexOf("."));
      //System.out.println(location);
      String mysql = "insert into `comment`.`"+location+"` (userID,context,time) values(?,?,?);";
      CommentDatabase cdb=new CommentDatabase();
      cdb.ConnectMysql();
      PreparedStatement ps = cdb.conn.prepareStatement(mysql);
      ps.setString(1, userid);
      ps.setString(2, commentcontext);
      ps.setTimestamp(3, new Timestamp(new Date().getTime()));
      //System.out.println(ps);
      ps.executeUpdate();
      //System.out.println(SUCCESS);
    }
    return SUCCESS;
   }catch (Exception e) {
    e.printStackTrace();
    return SUCCESS;
   }
  
  }
  /**
   * 
   * @return
   */

  public String changePassword()
  {
	  String id = (String) ServletActionContext.getRequest().getSession()
		        .getAttribute("userID");
	  Database database=new Database();
	  database.ConnectMysql();
	  String presql = "update user set Password='"+newpassword+"' where UserID='" + id + "' and Password='"+oldpassword+"';";
	  System.out.println(presql);
	  try{
	  PreparedStatement ps1 = database.conn.prepareStatement(presql);
      int rs = ps1.executeUpdate();
	  }
	  catch (Exception e) {
		// TODO: handle exception
		  System.out.println("failed");
		  return "failed";
	}
	    return "success";
  }
  
  
  public String UserCheckFile() {
    String id = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (id.equals(""))
      id = "user";
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    return "checkFileok";
  }

  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

  

  /**
   * @return the filename
   */
  public String getFilename() {
    return filename;
  }

  /**
   * @param filename
   *          the filename to set
   */
  public void setFilename(String filename) {
    // this.filename = Tool.Toutf(filename);
    this.filename = filename;
  }


  /**
   * @return the filerename
   */
  public String getFilerename() {
    return filerename;
  }

  /**
   * @param filerename
   *          the filerename to set
   */
  public void setFilerename(String filerename) {
    // this.filerename = Tool.Toutf(filerename);
    this.filerename = filerename;
  }

  /**
   * @return the context
   */
  public String getContext() {
    return context;
  }

  /**
   * @param context
   *          the context to set
   */
  public void setContext(String context) {
    this.context = context;
  }
  
  /**
   * @return the flag
   */
  public boolean getFlag() {
    return flag;
  }

  /**
   * @param flag the flag to set
   */
  public void setFlag(boolean flag) {
    this.flag = flag;
  }

  /**
   * @return the pagenum
   */
  public int getPagenum() {
    return pagenum;
  }

  /**
   * @param pagenum the pagenum to set
   */
  public void setPagenum(int pagenum) {
    this.pagenum = pagenum;
  }

  /**
   * @return the txtfiles
   */
  //public List<Txtfile> getTxtfiles() {
  //  return txtfiles;
 // }


  /**
   * @param txtfiles the txtfiles to set
   */
 // public void setTxtfiles(List<Txtfile> txtfiles) {
 //   this.txtfiles = txtfiles;
 // }
  
  public void rename_file()
  {
	  try
	  {
		  String id = "00001111";
		  //String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		  String ss = new java.sql.Date(new java.util.Date().getTime()).toString();
		  String sql = "update `"+id+"` set title='"+filerename+"', time= '"+ss+ "',path='"+id+"/"+filerename +"' where title='"+filename+"'";
		  //String sql = "update `"+id+"` set title='"+filerename+"', time= '"+ss+ "' where title='"+filename+"'";
		  PreparedStatement ps = fconn.conn.prepareStatement(sql);
		  ps.executeUpdate();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  } 
  }
  public void create_file()
  {
	  try
	  {
		  String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		  String insql = "insert into `"+id+"`(title,path,time,owner) values(?,?,?,?)";
		  PreparedStatement ps = fconn.conn.prepareStatement(insql);
		  ps.setString(1, filename);
		  String st = id+"/"+filename;
		  ps.setString(2, st);
		  ps.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
		  ps.setString(4, id);
		  ps.executeUpdate();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }
  public void delete_file()
  {
	  try
	  {
		  String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		  String insql = "delete from `"+id+"`where title = '"+filename+"'";
		  PreparedStatement ps = fconn.conn.prepareStatement(insql);
		  ps.executeUpdate();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }
  public static void main(String args[])
  {
	  AjaxAction aa = new AjaxAction();
	  aa.filename = "ggggg.html";
	  aa.filerename = "88888.html";
	  aa.rename_file();
  }

}