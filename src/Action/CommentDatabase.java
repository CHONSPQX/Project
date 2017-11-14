package Action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Administrator
 *
 */
public class CommentDatabase {
  String drivename="com.mysql.jdbc.Driver";
  String url="jdbc:mysql://localhost/comment?useSSL=false";
  String user="root";
  String password="123456";
  Connection conn;
  ResultSet rs=null;

  public Connection ConnectMysql()
  {//连接数据库
       try{
          Class.forName(drivename);
          conn = (Connection) DriverManager.getConnection(url, user, password);
          if (!conn.isClosed()) {
              System.out.println("Succeeded connecting to the comment!");
          }else {
              System.out.println("Falled connecting to the comment!");
          }
      }catch(Exception ex){
              ex.printStackTrace();
          }
       return conn;
  }

  public void CutConnection(Connection conn) throws SQLException
  {
       try{
          if(rs!=null);
          if(conn!=null);
       }catch(Exception e){
       e.printStackTrace();
       }finally{
      rs.close();
      conn.close();
       }
  }
}
