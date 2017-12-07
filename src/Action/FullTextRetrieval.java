package Action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import Lucene.Lucene;
import Lucene.NewDocument;
public class FullTextRetrieval extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String text;//检索内容
	String indexPath;
	String dataPath;
	String addPath;
	public String getAddPath() {
		return addPath;
	}
	public void setAddPath(String addPath) {
		this.addPath = addPath;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIndexPath() {
		return indexPath;
	}
	public void setIndexPath(String indexPath) {
		this.indexPath = indexPath;
	}
	public String getDataPath() {
		return dataPath;
	}
	public void setDataPath(String dataPath) {
		this.dataPath = dataPath;
	}
	public String CreateIndex() throws IOException{
		dataPath ="F:/work/" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
		indexPath = "F:/work/index" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
		if(new Lucene().CreateIndex(dataPath, indexPath))
			return "success";
		return "fail";
	}
	public String AddIndex(String fileName) throws IOException{
		//dataPath ="F:/work/" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID");
		//indexPath = "F:/work/index" +(String) ServletActionContext.getRequest().getSession().getAttribute("userID"); 
		if(new Lucene().AddIndex(addPath, indexPath))
			return "success";
		return "fail";
	}
	
	public String CreateSharedIndex()throws IOException{
		dataPath = "F:/work/shared";
		indexPath = "F:/work/index/shared";
		if(new Lucene().CreateShareIndex(dataPath, indexPath))
			return "success";
		return "fail";
	}
	
	public String Search()throws Exception{
		HashMap< NewDocument, Integer> result = new Lucene().Search(text,  indexPath);
		ArrayList<String> results = new ArrayList<>();
		ArrayList<String> times = new ArrayList<>();
		ArrayList<Float> scores = new ArrayList<>();
		ArrayList<Integer> searchTimes = new ArrayList<>();
		Iterator iter = result.entrySet().iterator();
		while(iter.hasNext()){
			HashMap.Entry  entry = (HashMap.Entry) iter.next();
			NewDocument key = (NewDocument) entry.getKey();
			results.add(key.getPath() );
			times.add(key.getTime());
			scores.add(key.getScore());
			searchTimes.add((Integer) entry.getValue());
		}
		ServletActionContext.getRequest().setAttribute("allTime", times);
		ServletActionContext.getRequest().setAttribute("allScore", scores);
		ServletActionContext.getRequest().setAttribute("allSearchTime", searchTimes);
		ServletActionContext.getRequest().setAttribute("allResult", results);
		return "success";	
	}
	
	public String SearchShared()throws Exception{
		indexPath = "F:/work/index/shared";
		HashMap< NewDocument, Integer> result = new Lucene().Search(text,  indexPath);
		ArrayList<String> results = new ArrayList<>();
		ArrayList<String> times = new ArrayList<>();
		ArrayList<Float> scores = new ArrayList<>();
		ArrayList<Integer> searchTimes = new ArrayList<>();
		Iterator iter = result.entrySet().iterator();
		while(iter.hasNext()){
			HashMap.Entry  entry = (HashMap.Entry) iter.next();
			NewDocument key = (NewDocument) entry.getKey();
			results.add(key.getPath() );
			times.add(key.getTime());
			scores.add(key.getScore());
			searchTimes.add((Integer) entry.getValue());
		}
		ServletActionContext.getRequest().setAttribute("allTime", times);
		ServletActionContext.getRequest().setAttribute("allScore", scores);
		ServletActionContext.getRequest().setAttribute("allSearchTime", searchTimes);
		ServletActionContext.getRequest().setAttribute("allResult", results);
		return "success";
			
	}

}
