import Action.AjaxTest;
import Action.FileAction;
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
        
		//String dirName = "amind2/";
    	//Director.createDir(dirName);
       //Director.deleteDir(dirName);
    	//Director.renameFile("123.txt","345.txt");
    	//Director.renameDir("123/","345/");
		/* 
        String dirName = "F:/temp1";  
        Director.createDir(dirName);  
        
        String fileName = dirName + "/temp2/tempFile.txt";  
        Director.createFile(fileName);  */
    	//FileAction fc=new FileAction();
    	//fc.setFilename("11224.html");
    	//String message=fc.showDetail();
    	//System.out.println(message);
	  //Action.AjaxAction aj=new Action.AjaxAction();
	 // aj.setCommentcontext("good");
	  //aj.setFilename("admin/11224.html");
	  //String string=aj.sendComment();
	  //System.out.println(string);
	  AjaxTest ajaxTest=new AjaxTest();
	  ajaxTest.setNum(3);
	  ajaxTest.updateContext();
    }
}
