package Article;

public class Article {
	private String Location;
	private String DateTime;
	private String Owner;
	
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
