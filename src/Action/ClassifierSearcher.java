package Action;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import Article.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Lucene.Lucene;
import Lucene.NewDocument;

public class ClassifierSearcher extends ActionSupport{
	String text;
	String indexPath;
	String dataPath;
	String addPath;
	int count;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	//按时间进行查找
	public String TimeClassifier()throws Exception{
		try{
			String userID=(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
			String indexPath = "F:/work/index/" +userID; 
			HashMap<NewDocument, Integer> result = new Lucene().FieldSearch("time",text, indexPath);
			ArrayList<Article> results = new ArrayList<>();
			Iterator iter = result.entrySet().iterator();
			
			FileDatabase fconn = new FileDatabase();
			fconn.ConnectMysql();
			while(iter.hasNext()){
				HashMap.Entry entry =  (HashMap.Entry) iter.next();
				NewDocument key = (NewDocument) entry.getKey();
				String path = key.getPath();
				path=path.substring(path.lastIndexOf("F:/work/"+userID)+userID.length()+10);
				
				String name = key.getName();
				String mysql = "select title, label1, label2, label3, keyword,time, path,owner from `"+userID+"` where title='"+name+"'";
			    PreparedStatement ps =fconn.conn.prepareStatement(mysql);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{		
					Article article = new Article();
					article.setTitle(rs.getString(1));
					article.setLabel1(rs.getString(2));
					article.setLabel2(rs.getString(3));
					article.setLabel3(rs.getString(4));
					article.setKeyword(rs.getString(5));
					article.setDateTime(rs.getString(6));
					article.setLocation(rs.getString(7));
					article.setOwner(rs.getString(8));
				    results.add(article);
				}
			}
			  ServletActionContext.getRequest().setAttribute("Classifier", results);
			  System.out.println(result.size());
			return "search_private_success";
		}
		 catch (Exception e) {
		      // TODO: handle exception
		      return "search_private_failed";
		    }
	}
	//按题目进行查找
	public String TitleClassifier()throws Exception{
		try{
			System.out.println(count+"  "+text);
			String userID = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
			String indexPath = "F:/work/index/"+userID;
			HashMap<NewDocument, Integer> result = new Lucene().FieldSearch("name", text,indexPath);
			ArrayList<Article> results = new ArrayList<>();
			Iterator iter = result.entrySet().iterator();
			
			 FileDatabase fconn = new FileDatabase();
			fconn.ConnectMysql();
			while(iter.hasNext()){
				HashMap .Entry entry = (HashMap.Entry) iter.next();
				NewDocument key = (NewDocument) entry.getKey();
				String path = key.getPath();
				
				String name = key.getName();
				String mysql = "select title, label1, label2, label3, keyword,time, path,owner from `"+userID+"` where title='"+name+"'";			    
				PreparedStatement ps =fconn.conn.prepareStatement(mysql);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					
					Article article = new Article();
					article.setTitle(rs.getString(1));
					article.setLabel1(rs.getString(2));
					article.setLabel2(rs.getString(3));
					article.setLabel3(rs.getString(4));
					article.setKeyword(rs.getString(5));
					article.setDateTime(rs.getString(6));
					article.setLocation(rs.getString(7));
					article.setOwner(rs.getString(8));
				    results.add(article);
				}
			}
			ServletActionContext.getRequest().setAttribute("Classifier",results);
			return "search_private_success";
		}
		   catch (Exception e) {
			      // TODO: handle exception
			   e.printStackTrace();
			      return "search_private_failed";
			    }
	}
	//按关键字进行查找
	
	public String KeywordClassifier()throws Exception{
		try{
		     FileDatabase fconn = new FileDatabase();
			 ArrayList<Article> results = new ArrayList<>();
		     fconn.ConnectMysql();
			 String userID = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
			 String mysql = "select title, label1, label2, label3, keyword,time, path,owner from `"+userID+"` where keyword='"+text+"'";	
		     PreparedStatement ps =fconn.conn.prepareStatement(mysql);
		     ResultSet rs = ps.executeQuery();
		     while(rs.next())
		     {
		    		Article article = new Article();
					article.setTitle(rs.getString(1));
					article.setLabel1(rs.getString(2));
					article.setLabel2(rs.getString(3));
					article.setLabel3(rs.getString(4));
					article.setKeyword(rs.getString(5));
					article.setDateTime(rs.getString(6));
					article.setLocation(rs.getString(7));
					article.setOwner(rs.getString(8));
				    results.add(article);
		     }
		    ServletActionContext.getRequest().setAttribute("Classifier",results);
			return "search_private_success";
		}
		catch (Exception e) {
		      // TODO: handle exception
		      return "search_private_failed";
		    }
	}
	//综上进行查找
	public String ClassifierSearch()throws Exception{
		String ret = new String();
		if(count==0)
			ret = KeywordClassifier();
		else if(count==1)
			ret = TitleClassifier();
		else if(count==2)
			ret = TimeClassifier();
		else if(count==3)
			ret=Search();
		else
			ret = "search_private_failed";
		System.out.println(ret);
		return ret;
	}
	
	
	//增加用户索引
	public static String AddIndex(String userID,String fileName){
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
	//创建用户索引
	 public String CreateIndex() throws IOException{
			dataPath ="F:/work/" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
			indexPath = "F:/work/index" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
			if(new Lucene().CreateIndex(dataPath, indexPath))
				return "success";
			return "fail";
	}
	 //增加用户共享索引
	 public static String AddPublicIndex(String userID,String fileName){
	        try {
	          String addPath ="F:/work/shared/" +userID+"/"+fileName;
	          String indexPath = "F:/work/index/shared";
	          if(new Lucene().AddIndex(addPath, indexPath))
	              return "success";
	          return "fail";
	        }
	        catch (Exception e) {
	          // TODO: handle exception
	          return "fail";
	        }
	  }
	 //创建共享索引
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
	
	 public static String CreateIndex(String userID){
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
	//添加索引
	 public String AddIndex(String fileName) throws IOException{
			//dataPath ="F:/work/" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
			//indexPath = "F:/work/index" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
			if(new Lucene().AddIndex(addPath, indexPath))
				return "success";
			return "fail";
	}
	 //用户查找
	 public String Search(){
		    try {
		      String userID=(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		    String indexPath = "F:/work/index/" +userID; 
		      HashMap< NewDocument, Integer> result = new Lucene().Search(text,  indexPath);
		      ArrayList<Article> results = new ArrayList<>();
		      Iterator iter = result.entrySet().iterator();
		      
		      FileDatabase fconn = new FileDatabase();
		      fconn.ConnectMysql();
		      while(iter.hasNext()){
		    	  HashMap .Entry entry = (HashMap.Entry) iter.next();
					NewDocument key = (NewDocument) entry.getKey();
					String path = key.getPath();
					
					String name = key.getName();
					String mysql = "select title, label1, label2, label3, keyword,time, path,owner from `"+userID+"` where title='"+name+"'";			    
					PreparedStatement ps =fconn.conn.prepareStatement(mysql);
					ResultSet rs = ps.executeQuery();
					while(rs.next())
					{
						Article article = new Article();
						article.setTitle(rs.getString(1));
						article.setLabel1(rs.getString(2));
						article.setLabel2(rs.getString(3));
						article.setLabel3(rs.getString(4));
						article.setKeyword(rs.getString(5));
						article.setDateTime(rs.getString(6));
						article.setLocation(rs.getString(7));
						article.setOwner(rs.getString(8));
					    results.add(article);
					}
		      }
		      ServletActionContext.getRequest().setAttribute("Classifier", results);
		      return "search_private_success";  
		    }
		    catch (Exception e) {
		      // TODO: handle exception
		      return "search_private_failed";
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
	 //共享查找
	 public String SearchShared(){
		    try { 
		      String indexPath = "F:/work/index/shared";
		      HashMap< NewDocument, Integer> result = new Lucene().Search(text,  indexPath);
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