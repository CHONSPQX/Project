package Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import Lucene.Lucene;
import Lucene.NewDocument;
public class FullTextRetrieval extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String text;//检索内容
	String indexPath;
	String dataPath;
	String addPath;
	public String getAddPath() {
		return addPath;
	}
	public void setAddPath(String addPath) {
		this.addPath = addPath;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIndexPath() {
		return indexPath;
	}
	public void setIndexPath(String indexPath) {
		this.indexPath = indexPath;
	}
	public String getDataPath() {
		return dataPath;
	}
	public void setDataPath(String dataPath) {
		this.dataPath = dataPath;
	}
	 public String CreateIndex(String userID){
	    try {
	     String dataPath ="F:/work/" +userID; 
	     String indexPath = "F:/work/index/" +userID; 
	      if(new Lucene().CreateIndex(dataPath, indexPath))
	          return "success";
	      return "fail";
	    }
	    catch (Exception e) {
	      // TODO: handle exception
	      return "fail";
	    }
	  }
	  public String AddIndex(String userID,String fileName){
	    try {
	      String addPath ="F:/work/" +userID+"/"+fileName;
	      String indexPath = "F:/work/index/" +userID; 
	      if(new Lucene().AddIndex(addPath, indexPath))
	          return "success";
	      return "fail";
	    }
	    catch (Exception e) {
	      // TODO: handle exception
	      return "fail";
	    }
	  }
	  public String CreateSharedIndex(){
	    try {
	      String dataPath = "F:/work/shared";
	      String indexPath = "F:/work/index/shared";
	      if(new Lucene().CreateShareIndex(dataPath, indexPath))
	          return "success";
	      return "fail";
	    }
	    catch (Exception e) {
	      // TODO: handle exception
	      return "fail";
	    }
	  }
	  public String Search(String input){
	    try {
	      String userID=(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
	    String indexPath = "F:/work/index/" +userID; 
	      HashMap< NewDocument, Integer> result = new Lucene().Search(input,  indexPath);
	      ArrayList<String> results = new ArrayList<>();
	      Iterator iter = result.entrySet().iterator();
	      while(iter.hasNext()){
	          HashMap.Entry  entry = (HashMap.Entry) iter.next();
	          NewDocument key = (NewDocument) entry.getKey();
	          String path=key.getPath();
	          path=path.substring(path.lastIndexOf("F:/work/"+userID)+userID.length()+10);
	          if(!results.contains(path))
	          results.add(path);
	          System.out.println(path);
	      }
	      ServletActionContext.getRequest().setAttribute("allSearchedMyFiles", results);
	      return "success";  
	    }
	    catch (Exception e) {
	      // TODO: handle exception
	      return "fail";
	    }
	  }
	  public String SearchShared(String input){
	    try { 
	      String indexPath = "F:/work/index/shared";
	      HashMap< NewDocument, Integer> result = new Lucene().Search(input,  indexPath);
	      ArrayList<String> results = new ArrayList<>();
	      Iterator iter = result.entrySet().iterator();
	      while(iter.hasNext()){
	          HashMap.Entry  entry = (HashMap.Entry) iter.next();
	          NewDocument key = (NewDocument) entry.getKey();
	          String path=key.getPath();
	          path=path.substring(path.lastIndexOf("F:/work/shared/")+9);
	          path=path.replace("\\", "/");
	          if(!results.contains(path))
	          results.add(path);
	          System.out.println(path);
	      }
	      ServletActionContext.getRequest().setAttribute("allSearchedPublicFiles", results);
	      return "success";
	    }
	    catch (Exception e) {
	      // TODO: handle exception
	      return "fail";
	    }         
	  }

}
