package Action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport
{
	private int searchmode;
	public int getSearchmode() {
		return searchmode;
	}


	public void setSearchmode(int searchmode) {
		this.searchmode = searchmode;
	}


	private String CheckedFile;


	public String getCheckedFile() {
		return CheckedFile;
	}


	public void setCheckedFile(String checkedFile) {
		CheckedFile = checkedFile;
	}


	public String SearchFile()
    {
        System.out.println(CheckedFile);
        ClassifierSearcher fr=new ClassifierSearcher();
        fr.Search(CheckedFile);
        fr.SearchShared(CheckedFile);
       //if(flag1||flag2)
        //{
        return "SearchFile_success";
        //}
        //else
            //return "SearchFile_failed";
    }

}
