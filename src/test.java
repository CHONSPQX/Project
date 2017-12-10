import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import Action.UserAction;
import Lucene.Lucene;
import Lucene.NewDocument;

/**
 * 
 */


/**
 * @author Administrator
 *
 */
public class test {

	public static void main(String[] args) {  
        UserAction ua = new UserAction();
        ArrayList<String> all = ua.getallUser();
		for(int i= 0;i<all.size();i++)
		{
			
			ua.getUser().setUserID(all.get(i)); 
			ua.createUserTable();
			ua.updateUserTable(all.get(i));
			ua.createClassTable();
		}
    }
  public static String CreateIndex(String userID){
    try {
     String dataPath ="/work/" +userID; 
     String indexPath = "/work/index/" +userID; 
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
      String addPath ="/work/" +userID+"/"+fileName;
      String indexPath = "/work/index/" +userID; 
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
      String dataPath = "/work/shared";
      String indexPath = "/work/index/shared";
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
    String indexPath = "/work/index/" +userID; 
      HashMap< NewDocument, Integer> result = new Lucene().Search(input,  indexPath);
      ArrayList<String> results = new ArrayList<>();
      Iterator iter = result.entrySet().iterator();
      while(iter.hasNext()){
          HashMap.Entry  entry = (HashMap.Entry) iter.next();
          NewDocument key = (NewDocument) entry.getKey();
          String path=key.getPath();
          path=path.substring(path.lastIndexOf("/work/"+userID)+userID.length()+10);
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
      String indexPath = "/work/index/shared";
      HashMap< NewDocument, Integer> result = new Lucene().Search(input,  indexPath);
      ArrayList<String> results = new ArrayList<>();
      Iterator iter = result.entrySet().iterator();
      while(iter.hasNext()){
          HashMap.Entry  entry = (HashMap.Entry) iter.next();
          NewDocument key = (NewDocument) entry.getKey();
          String path=key.getPath();
          path=path.substring(path.lastIndexOf("/work/shared/")+9);
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
