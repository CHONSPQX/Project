/**
 * 
 */
package Article;

/**
 * @author Administrator
 *
 */
public class Txtfile 
{
  public String filename;
  public String context;
  public String date; 
 
  public Txtfile() {
    // TODO Auto-generated constructor stub
 
    filename=new String();
    context=new String();
    date=new String();
  }


  /**
   * @return the filename
   */
  public String getFilename() {
    return filename;
  }


  /**
   * @param filename the filename to set
   */
  public void setFilename(String filename) {
    this.filename = filename;
  }


  /**
   * @return the context
   */
  public String getContext() {
    return context;
  }


  /**
   * @param context the context to set
   */
  public void setContext(String context) {
    this.context = context;
  }


  /**
   * @return the date
   */
  public String getDate() {
    return date;
  }


  /**
   * @param date the date to set
   */
  public void setDate(String date) {
    this.date = date;
  }
  
  
}