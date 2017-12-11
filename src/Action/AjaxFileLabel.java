package Action;
import User.User;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Article.Article;

public class AjaxFileLabel extends ActionSupport {
  /**
	 * 
	 */
private static final long serialVersionUID = 1L;
  private Article article;
  
  public Article getArticle() {
	return article;
}

public void setArticle(Article article) {
	this.article = article;
}

public String SetFileLabel()
  {
	ClassficationAction cfa = new ClassficationAction();
	cfa.setFirstclass(article.getLabel1());
	cfa.setSecondclass(article.getLabel2());
	cfa.setThirdclass(article.getLabel3());
	cfa.setFilename(article.getTitle());
	cfa.setclass();
	String id = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
	FileDatabase database=new FileDatabase();
	  database.ConnectMysql();
	  String presql = "update filerecord.`"+id+"` set keyword='"+article.getKeyword()+"' where title='" +article.getTitle()+"';";
	  System.out.println(presql);
	  try {
		PreparedStatement sql=database.conn.prepareStatement(presql);
		int rs=sql.executeUpdate();
		if(rs>0)
		{
			database.CutConnection(database.conn);
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return ERROR;
	}
  }
  
}