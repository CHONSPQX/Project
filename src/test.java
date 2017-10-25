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
        //创建目录  
        String dirName = "F:/temp1";  
        Director.createDir(dirName);  
        //创建文件  
        String fileName = dirName + "/temp2/tempFile.txt";  
        Director.createFile(fileName);  
    }  
}
