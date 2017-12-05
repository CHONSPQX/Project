package Comment;

import java.util.Date;

public class Comment {
	private int Number;
	private String Owner;
	private String Message;
	private Date commentTime;
	
	
	public Date getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}
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

