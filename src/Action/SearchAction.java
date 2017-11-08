package Action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport
{
	int searchTarget;
	String CheckedFile;
	
	


	public int getSearchTarget() {
		return searchTarget;
	}


	public void setSearchTarget(int searchTarget) {
		this.searchTarget = searchTarget;
	}


	public String getCheckedFile() {
		return CheckedFile;
	}


	public void setCheckedFile(String checkedFile) {
		CheckedFile = checkedFile;
	}


	public String SearchFile()
	{
		System.out.println(searchTarget);
		if(searchTarget==0)
		{
			FileAction fa = new FileAction();
			return fa.SearchMyselfFile(CheckedFile);
		}
		else
		{
			PublicTextAction pa = new PublicTextAction();
			return pa.SearchPublicFile(CheckedFile);
		}
	}
}
