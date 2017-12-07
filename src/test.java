import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.struts2.ServletActionContext;

import Action.AjaxTest;
import Action.FileAction;
import Lucene.Lucene;
import Lucene.NewDocument;
import WeFile.Director;

/**
 * 
 */


/**
 * @author Administrator
 *
 */
public class test {

	public static void main(String[] args) {  
        //String a=CreateIndex("admin");
        //String b=CreateIndex("yangfan");
        //String c=CreateIndex("zhouxiong");
        //String d=CreateSharedIndex();
        //Search("阿里巴巴", "yangfan");
        //SearchShared("双十一");
		String name;
		try {
			//name = java.net.URLEncoder.encode("小米", "ISO-8859-1");
			//System.out.println(name);
			//System.out.println(java.net.URLDecoder.decode(name, "UTF-8"));
			String defaultCharsetName=Charset.defaultCharset().displayName();   
	        System.out.println("defaultCharsetName:"+defaultCharsetName); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
  public static String CreateSharedIndex(){
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
  public  static String Search(String input,String userID){
    try {
    String indexPath = "F:/work/index/" +userID; 
      HashMap< NewDocument, Integer> result = new Lucene().Search(input,  indexPath);
      ArrayList<String> results = new ArrayList<>();
      Iterator iter = result.entrySet().iterator();
      while(iter.hasNext()){
          HashMap.Entry  entry = (HashMap.Entry) iter.next();
          NewDocument key = (NewDocument) entry.getKey();
          String path=key.getPath();
          path=path.substring(path.lastIndexOf("F:/work/"+userID)+userID.length()+10);
          results.add(path);
          System.out.println(path);
      }
      //ServletActionContext.getRequest().setAttribute("allResult", results);
      return "success";  
    }
    catch (Exception e) {
      // TODO: handle exception
      return "fail";
    }
  }
  public  static String SearchShared(String input){
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
          results.add(key.getPath());
          System.out.println(path);
      }
      //ServletActionContext.getRequest().setAttribute("allResult", results);
      return "success";
    }
    catch (Exception e) {
      // TODO: handle exception
      return "fail";
    }         
  }
}
