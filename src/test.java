import java.sql.Date;

import java.util.GregorianCalendar;

import User.*;

/**
 * 
 */

/**
 * @author Administrator
 *
 */
public class test {
   public static void main(String args[])
   {
     User user=new User();
     user.setUserID("123456749");
     user.setPassword("12346789");
     @SuppressWarnings("deprecation")
     Date  sqldate = new Date(2017,12,12);
     user.setBirthDate(sqldate);
     user.setName("rtyui");
     user.setMessage("45218");
     Action.UserAction ui=new Action.UserAction();
     ui.setUser(user);
     ui.UserCreate();
     
   }
}
