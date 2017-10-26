package Comment;

public class Comment {
	private int Number;
	private String Owner;
	private String Message;
	
	public void setOwner(String owner){
		Owner = owner;
	}
	public void setNumber(int number){
		Number = number;
	}
	public void setMessage(String message){
		Message = message;
	}
	public String getOwner(){
		return Owner;
	}
	public int getNumber(){
		return Number;
	}
	public String getMessage(){
		return Message;
	}
}

