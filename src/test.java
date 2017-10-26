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
        
		String dirName = "amind2/";
    	//Director.createDir(dirName);
        //Director.deleteDir(dirName);
    	Director.renameFile("123.txt","345.txt");
    	Director.renameDir("123/","345/");
		/* 
        String dirName = "F:/temp1";  
        Director.createDir(dirName);  
        
        String fileName = dirName + "/temp2/tempFile.txt";  
        Director.createFile(fileName);  */
    }  
}
