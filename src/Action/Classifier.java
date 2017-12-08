package Action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Lucene.Lucene;
import Lucene.NewDocument;

public class Classifier extends ActionSupport{
	String text;
	String indexPath;
	String dataPath;
	String addPath;
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
	public String getAddPath() {
		return addPath;
	}
	public void setAddPath(String addPath) {
		this.addPath = addPath;
	}
	
	public static String TimeClassifier(String input)throws Exception{
		try{
			String userID=(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
			String indexPath = "F:/work/index/" +userID; 
			HashMap<NewDocument, Integer> result = new Lucene().FieldSearch("time",input, indexPath);
			ArrayList<String> results = new ArrayList<>();
			Iterator iter = result.entrySet().iterator();
			while(iter.hasNext()){
				HashMap.Entry entry =  (HashMap.Entry) iter.next();
				NewDocument key = (NewDocument) entry.getKey();
				String path = key.getPath();
				 path=path.substring(path.lastIndexOf("F:/work/"+userID)+userID.length()+10);
		          if(!results.contains(path))
		          results.add(path);
		          System.out.println(path);
		          
			}
			  ServletActionContext.getRequest().setAttribute("TIME", results);
			return "success";
		}
		 catch (Exception e) {
		      // TODO: handle exception
		      return "fail";
		    }
	}

	public static String TitleClassifier(String input)throws Exception{
		try{
			String userID = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
			String indexPath = "F:/work/index/"+userID;
			HashMap<NewDocument, Integer> result = new Lucene().FieldSearch("name", input,indexPath);
			ArrayList<String> results = new ArrayList<>();
			Iterator iter = result.entrySet().iterator();
			while(iter.hasNext()){
				HashMap .Entry entry = (HashMap.Entry) iter.next();
				NewDocument key = (NewDocument) entry.getKey();
				String path = key.getPath();
				path = path.substring(path.lastIndexOf("F:/work/"+userID)+userID.length()+10);
				if(!result.containsKey(path))
					results.add(path);
			}
			ServletActionContext.getRequest().setAttribute("Title",results);
			return "success";
		}
		   catch (Exception e) {
			      // TODO: handle exception
			      return "fail";
			    }
	}

	public static String KeywordClassifier(String input)throws Exception{
		try{
		     FileDatabase fconn = new FileDatabase();
			 ArrayList<String> results = new ArrayList<>();
		     fconn.ConnectMysql();
			 String userID = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		     String mysql = "select title from `"+userID+"` where keyword='"+input+"'";
		     PreparedStatement ps =fconn.conn.prepareStatement(mysql);
		     ResultSet rs = ps.executeQuery();
		     while(rs.next())
		     {
		    	 String title = rs.getString(1);
		    	 results.add(title);
		     }
		    ServletActionContext.getRequest().setAttribute("Title",results);
			return "success";
		}
		catch (Exception e) {
		      // TODO: handle exception
		      return "fail";
		    }
	}
}