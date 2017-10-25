/**
 * 
 */
package Action;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import User.User;
import WeFile.Director;

/**
 * @author Administrator
 *
 */
public class FileAction extends ActionSupport{
   private String path;//
   private String dirname;
   private String filename;
   
  public String createDir()
  {
    path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    boolean flag=Director.createDir(path+"/"+dirname);
    String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if(flag)
      return "create_dir_success";
    else
      return "create_dir_failed";
  }
  
  public String deleteDir()
  {
      if(Director.createDir(path))
        return "createDirok";
    else return "createDirnotok";
  }
  
  public String renameDir()
  {
      if(Director.createDir(path))
        return "createDirok";
    else return "createDirnotok";
  }
  
  public String createFile()
  {
    path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    boolean flag=Director.createFile(path+"/"+filename);
    String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if(flag)
      return "create_file_success";
    else
      return "create_file_failed";
  }
  public String deleteFile()
  {
      if(Director.createDir(path))
        return "createDirok";
    else return "createDirnotok";
  }
  public String renameFile()
  {
      if(Director.createDir(path))
        return "createDirok";
    else return "createDirnotok";
  }
  
  
  public String UserCheckFile()
  {
      String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
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
     * @param dirname the dirname to set
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
     * @param filename the filename to set
     */
    public void setFilename(String filename) {
      this.filename = filename;
    }
     
}
