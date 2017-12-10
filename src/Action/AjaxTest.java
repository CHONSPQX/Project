/**
 * 
 */
package Action;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;  
  



public class AjaxTest extends ActionSupport{ 
  
 /* public String excute()
  {
    List<User> list = new ArrayList<User>(); 
    User u1=new User();
    u1.age="1";
    u1.name="u1";
    list.add(u1); 
    User u2=new User();
    u2.age="2";
    u2.name="u2";
    list.add(u2);  
  JSONArray jsonArray = JSONArray.fromObject(list);  
  HttpServletResponse response = (HttpServletResponse) ActionContext.getContext().get(ServletActionContext.HTTP_RESPONSE);  
  response.setCharacterEncoding("UTF-8");   
  try {
    System.out.println(jsonArray.toString());
    response.getWriter().print(jsonArray);
    return SUCCESS;
  } catch (IOException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
    return SUCCESS;
  }  
  }*/
    private static final long serialVersionUID = 1L;  
      
    private Map<String,Object> dataMap;  
    private int num; 
    public String updateContext() {  
        // dataMap中的数据将会被Struts2转换成JSON字符串，所以这里要先清空其中的数据  
        String sql="select * from project.publictext limit ?,3";
        Database database=new Database();
        database.ConnectMysql();
        try {
          PreparedStatement psql=database.conn.prepareStatement(sql);
          psql.setInt(1, num*3);
          System.out.println(psql);
          ResultSet res=psql.executeQuery();
          int count=0;
          dataMap = new HashMap<String, Object>(); 
          while(res.next())
          {
            count++;
            String filename=res.getString(1);
            System.out.println(filename);
            String filecontext=readFile(filename);
            System.out.println(filecontext);
            String owner=res.getString(2);
            System.out.println(owner);
            String date=res.getTimestamp(3).toString();
            System.err.println(date);
            dataMap.put("title"+count, filename); 
            dataMap.put("context"+count, filecontext); 
            dataMap.put("footer"+count, date);
            dataMap.put("owner"+count, owner);
          }
        } catch (Exception e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
        }
       /* dataMap = new HashMap<String, Object>();  
        dataMap.put("title1", num); 
        dataMap.put("context1", num); 
        dataMap.put("footer1", new Date().toString());
        dataMap.put("title2", num); 
        dataMap.put("context2", num); 
        dataMap.put("footer2", new Date().toString()); 
        dataMap.put("title3", num); 
        dataMap.put("context3", num); 
        dataMap.put("footer3", new Date().toString()); */
        // 返回结果  
        return SUCCESS;  
    }  
    
    public String readFile(String filepath)
    {
      InputStream is;
      String file=new String();
      try {
        is = new FileInputStream("/work/"+filepath);
        String line; // 用来保存每行读取的内容
        StringBuffer buffer=new StringBuffer();
        int linenum=0;
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        line = reader.readLine(); // 读取第一行
        while (line != null&&linenum<6) { // 如果 line 为空说明读完了
            buffer.append(line); // 将读到的内容添加到 buffer 中
            buffer.append("\n"); // 添加换行符
            line = reader.readLine(); // 读取下一行
            linenum++;
        }
        reader.close();
        is.close();
        file=buffer.toString();
        return file;
      } catch (Exception e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        return file;
      }
      
    }
  
    public Map<String, Object> getDataMap() {  
        return dataMap;  
    }  
  
    //设置key属性不作为json的内容返回  
    @JSON(serialize=false)  
    public int getNum() {  
        return num;  
    } 
    
    public void setNum(int num)
    {
      this.num=num;
    }
    
}  