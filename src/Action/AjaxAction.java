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
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import WeFile.Director;

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


}
