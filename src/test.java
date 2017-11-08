import java.io.File;
/**
 * @author Administrator
 *
 */
public class test {
	
	public static void showDirectory(File file)
	{
		File[] files = file.listFiles();
		for(File a : files)
		{
			System.out.println(a.getAbsolutePath());
			if(a.isDirectory())
			{
				showDirectory(a);
			}
		}
	}
	    
	public static void main(String[] args) 
	{
	    File file = new File("F:\\work\\admin3");
	    showDirectory(file);
	}

}
