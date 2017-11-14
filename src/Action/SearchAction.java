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
        System.out.println(CheckedFile);
        FileAction fa = new FileAction();
        PublicTextAction pa = new PublicTextAction();
        boolean flag1 = pa.SearchPublicFile(CheckedFile);
        boolean flag2 = fa.SearchMyselfFile(CheckedFile);
        
        if(flag1||flag2)
        {
            return "SearchFile_success";
        }
        else
            return "SearchFile_failed";
    }

}
