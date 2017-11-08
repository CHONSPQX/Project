package Action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport
{
	int target;
	String CheckedFile;
	
	
	public int getTarget() {
		return target;
	}


	public void setTarget(int target) {
		this.target = target;
	}


	public String getCheckedFile() {
		return CheckedFile;
	}


	public void setCheckedFile(String checkedFile) {
		CheckedFile = checkedFile;
	}


	public String SearchFile()
	{
		System.out.println(target);
		if(target==0)
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
