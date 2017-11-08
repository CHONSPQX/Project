/**
 * 
 */
package Action;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Comment.Comment;
import WeFile.Director;

/**
 * @author Administrator
 *
 */
public class FileAction extends ActionSupport {
  private String path;//
  private String dirname;
  private String filename;
  private String dirrename;
  private String filerename;
  private String context;

  public String createDir() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (path.equals(""))
      path = "user";
    boolean flag = Director.createDir(path + "/" + dirname);
    String id = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if (flag)
      return "create_dir_success";
    else
      return "create_dir_failed";
  }

  public String deleteDir() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (path.equals(""))
      path = "user";
    boolean flag = Director.deleteDir(path + "/" + dirname);
    String id = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if (flag)
      return "delete_dir_success";
    else
      return "delete_dir_failed";
  }

  public String renameDir() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (path.equals(""))
      path = "user";
    boolean flag = Director.renameDir(path + "/" + dirname,
        path + "/" + dirrename);
    String id = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if (flag)
      return "rename_dir_success";
    else
      return "rename_dir_failed";
  }

  public String createFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (path.equals(""))
      path = "user";
    boolean flag = Director.createFile(path + "/" + filename);
    String id = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if (flag)
      return "create_file_success";
    else
      return "create_file_failed";
  }
  public String deleteFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (path.equals(""))
      path = "user";
    boolean flag = Director.deleteFile(path + "/" + filename);
    String id = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if (flag)
      return "delete_file_success";
    else
      return "delete_file_failed";
  }
  public String renameFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    if (path.equals(""))
      path = "user";
    boolean flag = Director.renameFile(path + "/" + filename,
        path + "/" + filerename);
    String id = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if (flag)
      return "rename_file_success";
    else
      return "rename_file_failed";
  }

  public String WriteFile() {
    try {
      path = (String) ServletActionContext.getRequest().getSession()
          .getAttribute("userID");
      File file = new File(path + "/" + filename);
      file.createNewFile();
      BufferedWriter out = new BufferedWriter(new FileWriter(file));
      out.write(context);
      out.flush();
      out.close();
      return "write_file_success";
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "write_file_failed";
  }

  /**
   * 
   * @return
   */
  public String ReadFile() {

    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    String context = Director.readFile(path + "/" + filename);
    ServletActionContext.getRequest().setAttribute("readContext", context);
    ServletActionContext.getRequest().setAttribute("filename", filename);
    // readContext为输入到前台的文件的内容
    if (context != null)
      return "read_file_success";
    else
      return "read_file_failed";
  }

  public String showDetail() {

    path = "admin";
    String location = "shared/" + path + "/" + filename;
    String context = Director.readFile(path + "/" + filename);
    ServletActionContext.getRequest().setAttribute("readContext", context);
    ServletActionContext.getRequest().setAttribute("filename", location);
    Database db = new Database();
    db.ConnectMysql();
    // location = location.replace(".txt", "");
    String presql = "select * from lab7.publictext where Location='" + location
        + "';";
    System.out.println(presql);
    try {
      PreparedStatement ps1 = db.conn.prepareStatement(presql);
      ResultSet rs = ps1.executeQuery();// 如果表已经存在了，返回-1，否则返回0
      if (rs.next()) {
        location = location.substring(0, location.indexOf("."));
        System.out.println(location);
        String mysql = "SELECT ID,userID,context,time FROM `comment`.`" + location+"`;";
        System.out.println(mysql);
        ArrayList<Comment> all = new ArrayList<Comment>();
        CommentDatabase cdb=new CommentDatabase();
        cdb.ConnectMysql();
        PreparedStatement ps = cdb.conn.prepareStatement(mysql);
        ResultSet res = ps.executeQuery();
        while (res.next()) {
          Comment co = new Comment();
          co.setNumber(res.getInt(1));
          co.setOwner(res.getString(2));
          co.setMessage(res.getString(3));
          co.setCommentTime(res.getDate(4));
          all.add(co);
          System.out.println(res.getInt(1) + "  " + res.getString(2) + "  "
              + res.getString(3) + "  " + res.getDate(4) + '\n');
        }
        ServletActionContext.getRequest().setAttribute("commentTable", all);
      }
      if (context != null)
        return "show_filedetail_success";
      else
        return "show_filedetail_failed";

    } catch (SQLException e) {
      e.printStackTrace();
      if (context != null)
        return "show_filedetail_success";
      else
        return "show_filedetail_failed";
    }
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
  /*
   * 搜索用户自己的文件
   */
  protected String SearchMyselfFile(String filename)
  {
	  /*path = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
	  if (path.equals(""))
		  path = "user";
	  String AbsoultPath = "F:\\work\\" + path;*/
	  String AbsoultPath = "F:\\work\\admin3";
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
		  ServletActionContext.getRequest().setAttribute("allSearchedFiles", All);
		  return "search_MyselfFile_success";
	  }
	  return "search_MyselfFile_filed";
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
			  all.add(f.getAbsolutePath());
		  }
	  }
  }
  public static void main(String args[])
  {
	  
  }
  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }

  /**
   * @return the dirname
   */
  public String getDirname() {
    return dirname;
  }

  /**
   * @param dirname
   *          the dirname to set
   */
  public void setDirname(String dirname) {
    this.dirname = dirname;
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
   * @return the dirrename
   */
  public String getDirrename() {
    return dirrename;
  }

  /**
   * @param dirrename
   *          the dirrename to set
   */
  public void setDirrename(String dirrename) {
    // this.dirrename = Tool.Toutf(dirrename);
    this.dirrename = dirrename;
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

}
