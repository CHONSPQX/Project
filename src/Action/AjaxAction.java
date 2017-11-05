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
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;  
import java.util.HashMap;  
import java.util.List;  


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;



/**
 * @author Administrator
 *
 */
public class AjaxAction extends ActionSupport {
  private String path;//
  private String dirname;
  private String filename;
  private String dirrename;
  private String filerename;
  private String context;
  private boolean flag;
  private String commentcontext;
  //private List<Txtfile> txtfiles;
  //private JSONArray text;
  

  /**
   * @return the text
   */
 // public JSONArray getText() {
 //   return text;
 // }


  /**
   * @return the commentcontext
   */
  public String getCommentcontext() {
    return commentcontext;
  }


  /**
   * @param commentcontext the commentcontext to set
   */
  public void setCommentcontext(String commentcontext) {
    this.commentcontext = commentcontext;
  }

  /**
   * @param text the text to set
   */
 // public void setText(JSONArray text) {
 //   this.text = text;
 // }


  private int pagenum;

  public String saveFile() {
    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    System.out.println(context);
     boolean flag=Director.saveFile(path + "/" + filename, context);
     ServletActionContext.getRequest().setAttribute("saveFileFlag", flag);
     this.flag=flag;
     System.out.println(flag);
     if(flag)
       return SUCCESS;
     
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
    String presql = "select * from lab7.publictext where Location='" + location
        + "';";
    System.out.println(presql);
   // String userid="00001111";
    String userid = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    System.out.println(userid);
    try{
      PreparedStatement ps1 = db.conn.prepareStatement(presql);
      ResultSet rs = ps1.executeQuery();
    if (rs.next()) {
      location = location.substring(0, location.indexOf("."));
      System.out.println(location);
      String mysql = "insert into `comment`.`"+location+"` (userID,context,time) values(?,?,?);";
      CommentDatabase cdb=new CommentDatabase();
      cdb.ConnectMysql();
      PreparedStatement ps = cdb.conn.prepareStatement(mysql);
      ps.setString(1, userid);
      ps.setString(2, commentcontext);
      ps.setTimestamp(3, new Timestamp(new Date().getTime()));
      System.out.println(ps);
      ps.executeUpdate();
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
  public String ReadFile() {

    path = (String) ServletActionContext.getRequest().getSession()
        .getAttribute("userID");
    String context = Director.readFile(path + "/" + filename);
    ServletActionContext.getRequest().setAttribute("readContext", context);
    // readContext为输入到前台的文件的内容
    if (context != null)
      return "read_file_success";
    else
      return "read_file_failed";
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

}