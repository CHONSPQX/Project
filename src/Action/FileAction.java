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
public class FileAction extends ActionSupport{
   private String path;//
   private String dirname;
   private String filename;
   private String dirrename;
   private String filerename;
   private String context;//用户写入文件的内容
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
    path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    boolean flag=Director.deleteDir(path+"/"+dirname);
    String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if(flag)
      return "delete_dir_success";
    else
      return "delete_dir_failed";
  }
  
  public String renameDir()
  {
    path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    boolean flag=Director.renameDir(path+"/"+dirname,path+"/"+dirrename);
    String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if(flag)
      return "rename_dir_success";
    else
      return "rename_dir_failed";
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
    path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    boolean flag=Director.deleteFile(path+"/"+filename);
    String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if(flag)
      return "delete_file_success";
    else
      return "delete_file_failed";
  }
  public String renameFile()
  {
    path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    boolean flag=Director.renameFile(path+"/"+filename,path+"/"+filerename);
    String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
    ArrayList<String> all = Director.checkFile(id, "");
    ServletActionContext.getRequest().setAttribute("AllFiles", all);
    if(flag)
      return "rename_file_success";
    else
      return "rename_file_failed";
  }
  
  
  public String UserCheckFile()
  {
      String id=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
      ArrayList<String> all = Director.checkFile(id, "");
      ServletActionContext.getRequest().setAttribute("AllFiles", all);
      return "checkFileok";
  }
 
  /**
   * context 是用户写入的文件的内容
   * @return
   */
  public String WriteFile()
  {
	  try
	  {
		  path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
		  File file = new File(path + "/" + filename);
		  file.createNewFile();
		  BufferedWriter out = new BufferedWriter(new FileWriter(file));
		  out.write(context);
		  out.flush();
		  out.close();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
 	  return "write_file_success";
  }
  
  /**
   * 
   * @return
   */
  public String ReadFile()
  {
	  try
	  {
		  path=(String)ServletActionContext.getRequest().getSession().getAttribute("userID");
		  File file = new File(path + "/" + filename);
		  InputStreamReader reader = new InputStreamReader(new FileInputStream(file));
		  BufferedReader br = new BufferedReader(reader);
		  StringBuilder line = new StringBuilder();
		  String str = "";
		  while((str=br.readLine())!=null)
		  {
			  line.append(str);
		  }
		  ServletActionContext.getRequest().setAttribute("readContext", line.toString());
		  //readContext为输入到前台的文件的内容
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return "read_file_success";
  }
  
  public String getPath() {
        return path;
    }
  
    public String getContext() {
	return context;
}

public void setContext(String context) {
	this.context = context;
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

    /**
     * @return the dirrename
     */
    public String getDirrename() {
      return dirrename;
    }

    /**
     * @param dirrename the dirrename to set
     */
    public void setDirrename(String dirrename) {
      this.dirrename = dirrename;
    }

    /**
     * @return the filerename
     */
    public String getFilerename() {
      return filerename;
    }

    /**
     * @param filerename the filerename to set
     */
    public void setFilerename(String filerename) {
      this.filerename = filerename;
    }
     
}
