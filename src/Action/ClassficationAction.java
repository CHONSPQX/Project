package Action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import Article.Article;
import User.User;

public class ClassficationAction extends ActionSupport
{
	private Database database;
	private User user = new User();
	private String path;//
	private String SharedFilePath;// 用户现在查看的分享文件的绝对路径
	private CommentDatabase conn;
	private FileDatabase fconn;
	private String context;// 用户评论的内容
	private String confirmword;
	private String firstclass;
	private String newfirstclass;
	private String secondclass;
	private String newsecondclass;
	private String thirdclass;
	private String newthirdclass;
	private String filename;
	private ClassDatabase cconn;
	
	
	
	public String getNewfirstclass() {
		return newfirstclass;
	}

	public void setNewfirstclass(String newfirstclass) {
		this.newfirstclass = newfirstclass;
	}

	public String getNewsecondclass() {
		return newsecondclass;
	}

	public void setNewsecondclass(String newsecondclass) {
		this.newsecondclass = newsecondclass;
	}

	public String getNewthirdclass() {
		return newthirdclass;
	}

	public void setNewthirdclass(String newthirdclass) {
		this.newthirdclass = newthirdclass;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFirstclass() {
		return firstclass;
	}

	public void setFirstclass(String firstclass) {
		this.firstclass = firstclass;
	}

	public String getSecondclass() {
		return secondclass;
	}

	public void setSecondclass(String secondclass) {
		this.secondclass = secondclass;
	}

	public String getThirdclass() {
		return thirdclass;
	}

	public void setThirdclass(String thirdclass) {
		this.thirdclass = thirdclass;
	}

	public ClassficationAction()
	{
		database = new Database();
		database.ConnectMysql();
		conn = new CommentDatabase();
		conn.ConnectMysql();
		fconn = new FileDatabase();
		fconn.ConnectMysql();
		cconn = new ClassDatabase();
		cconn.ConnectMysql();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getSharedFilePath() {
		return SharedFilePath;
	}

	public void setSharedFilePath(String sharedFilePath) {
		SharedFilePath = sharedFilePath;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getConfirmword() {
		return confirmword;
	}

	public void setConfirmword(String confirmword) {
		this.confirmword = confirmword;
	}
	
	public String changeclass()//用于用户输入类别时设置类别。
	{
		String uid = "admin30";
		//String uid = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		if(secondclass == null)
		{
			try
			{
				String sql2 = "insert into `"+uid+"` (firstclass) values (?)";
				PreparedStatement ps2 = cconn.conn.prepareStatement(sql2);
				ps2.setString(1, firstclass);
				ps2.executeUpdate();
				String sql3 = "update `"+uid+"` set label1='"+firstclass+"',layer='1' where title='"+filename+"'";
				PreparedStatement ps3 = fconn.conn.prepareStatement(sql3);
				ps3.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if(thirdclass == null)
		{
			String sql1 = "select path from `"+uid+"` where label1 ='"+firstclass+"' and label2='"+secondclass+"' and title = '"+filename+"'";
			try
			{
				String sql2 = "insert into `"+uid+"` (firstclass,secondclass) values (?,?)";
				PreparedStatement ps2 = cconn.conn.prepareStatement(sql2);
				ps2.setString(1, firstclass);
				ps2.setString(2, secondclass);
				ps2.executeUpdate();
				String sql3 = "update `"+uid+"` set label1='"+firstclass+"',label2='"+secondclass+"',layer='2' where title='"+filename+"'";
				PreparedStatement ps3 = fconn.conn.prepareStatement(sql3);
				ps3.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			String sql1 = "select path from `"+uid+"` where label1 ='"+firstclass+"' and label2='"+secondclass+"' and label3='"+thirdclass+"' and title = '" +filename+"'";
			try
			{
				PreparedStatement ps1 = fconn.conn.prepareStatement(sql1);
				ResultSet rs = ps1.executeQuery();
				if(!rs.next())
				{
					String sql2 = "insert into `"+uid+"` (firstclass,secondclass,thirdclass) values (?,?,?)";
					PreparedStatement ps2 = cconn.conn.prepareStatement(sql2);
					ps2.setString(1, firstclass);
					ps2.setString(2, secondclass);
					ps2.setString(3, thirdclass);
					ps2.executeUpdate();
					String sql3 = "update `"+uid+"` set label1='"+firstclass+"',label2='"+secondclass+"',label3='"+thirdclass+"',layer='3' where title='"+filename+"'";
					PreparedStatement ps3 = fconn.conn.prepareStatement(sql3);
					ps3.executeUpdate();
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return "setclass_success";
	}
	
	public String checkFilebyClass1()
	{
		//String uid = "admin30";
		String uid = (String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
		String sql1 = "select firstclass from `"+uid+"`";
		String sql2 = "select title,keyword from `"+uid+"` where layer='0'";
		PreparedStatement ps1;
		PreparedStatement ps2;
		ArrayList<String> allfirstclass = new ArrayList<String>();
		//ArrayList<String> allfiles = new ArrayList<String>();
		ArrayList<Article> allfiles = new ArrayList<Article>();
		try {
			ps1 = cconn.conn.prepareStatement(sql1);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next())
			{
				String s = rs1.getString(1);
				if((s!=null)&&(!allfirstclass.contains(s)))
				{
					allfirstclass.add(s);
					System.out.println(s);
				}
			}
			ServletActionContext.getRequest().setAttribute("AllFirstClass", allfirstclass);
			ps2 = fconn.conn.prepareStatement(sql2);
			ResultSet rs2 = ps2.executeQuery();
			int k = 1;
			while(rs2.next())
			{
				String s = rs2.getString(1);
				String s1 = rs2.getString(2);
				if((s!=null))
				{
					Article a = new Article();
					a.setTitle(s);
					a.setKeyword(s1);
					System.out.println("标题："+s+" 关键字："+s1);				
					allfiles.add(a);
				}
				System.out.println(k++);
			}
			ServletActionContext.getRequest().setAttribute("AllFiles", allfiles);
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			cconn.CutConnection(cconn.conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "check_class1_success";
	}
	public String checkFilebyClass2()
	{
		//String uid = "admin30";
		String uid = (String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
		String sql1 = "select secondclass from `"+uid+"` where firstclass='"+firstclass+"'";
		String sql2 = "select title,keyword,label1 from `"+uid+"` where label1='"+firstclass+"' and layer='1'";
		PreparedStatement ps1;
		PreparedStatement ps2;
		ArrayList<String> allsecondclass = new ArrayList<String>();
		//ArrayList<String> allfiles = new ArrayList<String>();
		ArrayList<Article> allfiles = new ArrayList<Article>();
		try {
			ps1 = cconn.conn.prepareStatement(sql1);
			ResultSet rs1 = ps1.executeQuery();
			int a = 0;
			while(rs1.next())
			{
				a++;
				String s = rs1.getString(1);
				if((!s.equals(""))&&(!allsecondclass.contains(s)))
				{
					allsecondclass.add(s);
					System.out.println(s);
				}
			}
			System.out.println(a+" "+allsecondclass.size());
			ServletActionContext.getRequest().setAttribute("AllSecondClass", allsecondclass);
			ps2 = fconn.conn.prepareStatement(sql2);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next())
			{
				String s = rs2.getString(1);
				String s1 = rs2.getString(2);
				String s2 = rs2.getString(3);
				if((s!=null)&&(s1!=null))
				{
					Article a1 = new Article();
					a1.setTitle(s);
					a1.setKeyword(s1);
					a1.setLabel1(firstclass);
					System.out.println("标题："+s+" 关键字："+s1+" l1: "+s2);
					allfiles.add(a1);
				}
			}
			ServletActionContext.getRequest().setAttribute("AllFiles", allfiles);
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			cconn.CutConnection(cconn.conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("label1", firstclass);
		return "check_class2_success";
	}
	public String checkFilebyClass3()
	{
		//String uid = "admin30";
		String uid = (String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
		String sql1 = "select thirdclass from `"+uid+"` where firstclass='"+firstclass+"' and secondclass='"+secondclass+"'";
		String sql2 = "select title,keyword from `"+uid+"` where label1='"+firstclass+"'and label2='"+secondclass+"' and layer='2'";
		PreparedStatement ps1;
		PreparedStatement ps2;
		ArrayList<String> allthirdclass = new ArrayList<String>();
		//ArrayList<String> allfiles = new ArrayList<String>();
		ArrayList<Article> allfiles = new ArrayList<Article>();
		try {
			ps1 = cconn.conn.prepareStatement(sql1);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next())
			{
				String s = rs1.getString(1);
				if((!s.equals(""))&&(!allthirdclass.contains(s)))
				{
					System.out.println(s);
					allthirdclass.add(s);
				}
			}
			ServletActionContext.getRequest().setAttribute("AllThirdClass", allthirdclass);
			ps2 = fconn.conn.prepareStatement(sql2);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next())
			{
				String s = rs2.getString(1);
				String s1 = rs2.getString(2);
				if((s!=null)&&(s1!=null))
				{
					Article article = new Article();
					article.setTitle(s);
					article.setKeyword(s1);
					article.setLabel1(firstclass);
					article.setLabel2(secondclass);
					System.out.println(s);
					allfiles.add(article);
				}
			}
			ServletActionContext.getRequest().setAttribute("AllFiles", allfiles);
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			cconn.CutConnection(cconn.conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ServletActionContext.getRequest().setAttribute("label1", firstclass);
		ServletActionContext.getRequest().setAttribute("label2", secondclass);
		return "check_class3_success";
	}
	public static void main(String args[])
	{
		ClassficationAction cfa = new ClassficationAction();
		cfa.firstclass = "sha";
		cfa.secondclass = "erbi";
		cfa.thirdclass = "yuth";
		cfa.checkFilebyClass4();
	}
	public String checkFilebyClass4()
	{
		//String uid = "admin30";
		String uid = (String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
		String sql2 = "select title,keyword from `"+uid+"` where label1='"+firstclass+"'and label2='"+secondclass+"' and label3='"+thirdclass+ "'and layer='3'";
		PreparedStatement ps2;
		//ArrayList<String> allfiles = new ArrayList<String>();
		ArrayList<Article> allfiles = new ArrayList<Article>();
		try {
			ps2 = fconn.conn.prepareStatement(sql2);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next())
			{
				String s = rs2.getString(1);
				String s1 = rs2.getString(2);
				if((s!=null)&&(s1!=null))
				{
					Article article = new Article();
					article.setTitle(s);
					article.setKeyword(s1);
					article.setLabel1(firstclass);
					article.setLabel2(secondclass);
					article.setLabel3(thirdclass);
					System.out.println(s);
					allfiles.add(article);
				}
			}
			//System.out.println("2");
			ServletActionContext.getRequest().setAttribute("AllFiles", allfiles);
			database.CutConnection(database.conn);
			conn.CutConnection(conn.conn);
			fconn.CutConnection(fconn.conn);
			cconn.CutConnection(cconn.conn);
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		return "check_class4_success";
	}
	public boolean setclass()
	{
		//String uid = "admin30";
		String uid = (String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		String oldfirstclass="";
		String oldsecondclass="";
		String oldthirdclass="";
		String mysql1 = "select label1,label2,label3 from `"+uid+"` where title = '"+filename+"'";
		try
		{
			PreparedStatement ps1 = fconn.conn.prepareStatement(mysql1);
			ResultSet rs1 = ps1.executeQuery();
			if(rs1.next())
			{
				oldfirstclass = rs1.getString(1);
				oldsecondclass = rs1.getString(2);
				oldthirdclass = rs1.getString(3);
			}
			String mysql = "update `"+uid+"` set sum = sum - 1 where firstclass='"+oldfirstclass+"' and secondclass='"+oldsecondclass+"' and thirdclass='"+oldthirdclass+"'";
			String mysql2 = "delete from `"+uid+"` where sum=0 and firstclass='"+oldfirstclass+"' and secondclass='"+oldsecondclass+"' and thirdclass='"+oldthirdclass+"'";
			PreparedStatement ps = cconn.conn.prepareStatement(mysql);
			int rs = ps.executeUpdate();
			PreparedStatement ps2 = cconn.conn.prepareStatement(mysql2);
			int rs2 = ps2.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if((firstclass == null)||(firstclass.equals("")))
		{
			firstclass="";
			secondclass="";
			thirdclass="";
			String sql1 = "update `"+uid+"` set layer = '0',label1='',label2='',label3='' where title='"+filename+"'";
			try
			{
				PreparedStatement ps1 = fconn.conn.prepareStatement(sql1);
				int rs1 = ps1.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else if((secondclass == null)||(secondclass.equals("")))
		{
			secondclass="";
			thirdclass="";
			String sql1 = "update `"+uid+"` set layer = '1',label1='"+firstclass+"',label2='',label3='' where title='"+filename+"'";
			try
			{
				PreparedStatement ps1 = fconn.conn.prepareStatement(sql1);
				int rs1 = ps1.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	    else if((thirdclass == null)||(thirdclass.equals("")))
		{
			thirdclass="";
			String sql1 = "update `"+uid+"` set layer = '2',label1='"+firstclass+"',label2='"+secondclass+"',label3='' where title='"+filename+"'";
			try
			{
				PreparedStatement ps1 = fconn.conn.prepareStatement(sql1);
				int rs1 = ps1.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}		
		}
		else
		{
			
			String sql1 = "update `"+uid+"` set layer = '3',label1='"+firstclass+"',label2='"+secondclass+"',label3='"+thirdclass+"' where title='"+filename+"'";
			System.out.println(sql1);
			try
			{
				PreparedStatement ps1 = fconn.conn.prepareStatement(sql1);
				int rs1 = ps1.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		if((firstclass!=null)&&(!firstclass.equals("")))
		{
			try
			{
				String sql0 = "select id from `"+uid+"` where firstclass='"+firstclass+"' and secondclass='"+secondclass+"' and thirdclass='"+thirdclass+"'";
				PreparedStatement ps0 = cconn.conn.prepareStatement(sql0);
				ResultSet rs0 = ps0.executeQuery();
				if(rs0.next())
				{
					String sql1 = "update `"+uid+"` set sum = sum + 1 where firstclass='"+firstclass+"' and secondclass='"+secondclass+"' and thirdclass='"+thirdclass+"'";
					System.out.println(sql1);
					PreparedStatement ps1 = cconn.conn.prepareStatement(sql1);
					int rs1 = ps1.executeUpdate();
				}
				else
				{
					String sql2 = "insert into `"+uid+"` (firstclass,secondclass,thirdclass) values(?,?,?)";
					PreparedStatement ps2 = cconn.conn.prepareStatement(sql2);
					ps2.setString(1, firstclass);
					ps2.setString(2, secondclass);
					ps2.setString(3, thirdclass);
					int rs1 = ps2.executeUpdate();
				}
				database.CutConnection(database.conn);
				conn.CutConnection(conn.conn);
				fconn.CutConnection(fconn.conn);
				cconn.CutConnection(cconn.conn);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return true;
	}
}
