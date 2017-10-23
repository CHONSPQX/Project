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
     user.setUserID("asdsad");
     user.setPassword("12346789");
     user.setBirthDate("2017-05-07");
     user.setName("rtyui");
     user.setMessage("45218");
     Action.UserAction ui=new Action.UserAction();
     ui.setUser(user);
     ui.UserCreate();
     
   }
}
