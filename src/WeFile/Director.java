package WeFile;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class Director {  
    public static String prePath = "F:/work/";
    public static boolean createFile(String destFileName) {  
        File file = new File(prePath + destFileName);  
        if(file.exists()) {  
            return false;  
        }  
        if (destFileName.endsWith(File.separator)) {  
            return false;  
        }  
        if(!file.getParentFile().exists()) {  
            if(!file.getParentFile().mkdirs()) {  
                return false;  
            }  
        }  
        try {  
            if (file.createNewFile()) {  
                return true;  
            } else {  
                return false;  
            }  
        } catch (IOException e) {  
            e.printStackTrace();  
            return false;  
        }  
    }  
  
    public static boolean createDir(String destDirName) {  
        File dir = new File( prePath + destDirName);  
        if (dir.exists()) {  
            return false;  
        }  
        if (!destDirName.endsWith(File.separator)) {  
            destDirName = destDirName + File.separator;  
        }  
        if (dir.mkdirs()) {  
            return true;  
        } else {  
            return false;  
        }  
    }  
    
    public static boolean deleteFile(String destFileName){     
      File file = new File(prePath+destFileName);     
      if(file.isFile() && file.exists()){     
          file.delete();     
          System.out.println("删除单个文件"+prePath+destFileName+"成功！");     
          return true;     
      }else{     
          System.out.println("删除单个文件"+prePath+destFileName+"失败！");     
          return false;     
      }     
  }   
    
    public static boolean deleteDir(String destDirName){     
      //如果destDriName不以文件分隔符结尾，自动添加文件分隔符     
      if(!destDirName.endsWith(File.separator)){     
        destDirName = destDirName+File.separator;     
      }     
      File dirFile = new File(prePath+destDirName);     
      //如果destDriName对应的文件不存在，或者不是一个目录，则退出     
      if(!dirFile.exists() || !dirFile.isDirectory()){     
          System.out.println("删除目录失败"+prePath+destDirName+"目录不存在！");     
          return false;     
      }     
      boolean flag = true;     
      //删除文件夹下的所有文件(包括子目录)     
      File[] files = dirFile.listFiles();     
      for(int i=0;i<files.length;i++){     
          //删除子文件     
          if(files[i].isFile()){     
              flag = deleteFile(destDirName+files[i].getName());     
              if(!flag){     
                  break;     
              }     
          }     
          //删除子目录     
          else{     
              flag = deleteDir(destDirName+files[i].getName());     
              if(!flag){     
                  break;     
              }     
          }     
      }           
      if(!flag){     
          System.out.println("删除目录失败");     
          return false;     
      }           
      //删除当前目录     
      if(dirFile.delete()){     
          System.out.println("删除目录"+prePath+destDirName+"成功！");     
          return true;     
      }else{     
          System.out.println("删除目录"+prePath+destDirName+"失败！");     
          return false;     
      }     
  }     
    
    public static boolean renameDir(String oldDirName,String newDirName)
    {
      File oldName = new File(prePath+oldDirName);
      File newName = new File(prePath+newDirName);
      boolean flag=oldName.renameTo(newName);
      if(flag) {
          System.out.println("文件夹重命名成功");
      } else {
          System.out.println("文件夹重命名失败");
      }
      return flag;
    }
    
    public static boolean renameFile(String oldFileName,String newFileName)
    {
      File oldName = new File(prePath+oldFileName);
      File newName = new File(prePath+newFileName);
      boolean flag=oldName.renameTo(newName);
      if(flag) {
          System.out.println("文件重命名成功");
      } else {
          System.out.println("文件重命名失败");
      }
      return flag;
    }
    
    public static String readFile(String destFilename)
    {
      try {
      File file = new File(prePath+destFilename);
      System.out.println(destFilename);
      InputStreamReader reader = new InputStreamReader(new FileInputStream(file));
      BufferedReader br = new BufferedReader(reader);
      StringBuilder line = new StringBuilder();
      String str = "";
      while((str=br.readLine())!=null)
      {
          line.append(str);
      }
      br.close();
      return line.toString();
      }
      catch(Exception e)
      {
        e.printStackTrace();
        return null;
      }
    }
    
    public static boolean saveFile(String destFilename,String context)
    {
      try {
      File file = new File(prePath + "/" + destFilename);
      BufferedWriter out = new BufferedWriter(new FileWriter(file));
      out.write(context);
      out.flush();
      out.close();
      return true;
      } catch(Exception e)
      {
        e.printStackTrace();
        return false;
      }
    }
    public static String createTempFile(String prefix, String suffix, String dirName) {  
        File tempFile = null;  
        if (dirName == null) {  
            try{  
                tempFile = File.createTempFile(prefix, suffix);  
                return tempFile.getCanonicalPath();  
            } catch (IOException e) {  
                e.printStackTrace();  
                return null;  
            }  
        } else {  
            File dir = new File(dirName);  
            if (!dir.exists()) {  
                if (!Director.createDir(dirName)) {  
                    return null;  
                }  
            }  
            try {  
                tempFile = File.createTempFile(prefix, suffix, dir);  
                return tempFile.getCanonicalPath();  
            } catch (IOException e) {  
                e.printStackTrace();   
                return null;  
            }  
        }  
    }
    
    public static ArrayList<String> checkFile(String userId , String path)
    {
    	File dir = new File( prePath +userId + "/" +path);
        String[] strs = dir.list();
        ArrayList<String> all = new ArrayList<String>();
        for(String s : strs)
        	all.add(s);
        return all;
    }
}
