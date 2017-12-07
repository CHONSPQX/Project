package Article;

public class Article {
	private String Location;
	private String DateTime;
	private String Owner;
	private String Label1;
	private String Label2;
	private String Label3;
	private String Keyword;
	private String Title;
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		this.Title = title;
	}
	public String getLabel1() {
		return Label1;
	}
	public void setLabel1(String label1) {
		Label1 = label1;
	}
	public String getLabel2() {
		return Label2;
	}
	public void setLabel2(String label2) {
		Label2 = label2;
	}
	public String getLabel3() {
		return Label3;
	}
	public void setLabel3(String label3) {
		Label3 = label3;
	}
	public String getKeyword() {
		return Keyword;
	}
	public void setKeyword(String keyword) {
		Keyword = keyword;
	}
	public String getDateTime() {
		return DateTime;
	}

	public void setLocation(String location){
		Location = location;
	}
	public void setDateTime(String dateTime){
		DateTime = dateTime;
	}
	public void setOwner(String owner){
		Owner = owner;
	}
	public String getLocation(){
		return Location;
	}
	public String getDateTIME(){
		return DateTime;
	}
	public String getOwner(){
		return Owner;
	}

}
