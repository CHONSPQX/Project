package User;

public class User {
	private String UserID;
	private String Password;
	private String Name;
	private String Sex;
	private String BirthDate;
	private String Message;
	
	public void setUserID(String userID){
		UserID = userID;
	}
	public void setPassword(String password){
		Password = password;
	}
	public void setName(String name){
		Name = name;
	}
	public void setSex(String sex){
		Sex = sex;
	}
	public void setBirthDate(String birthDate){
		BirthDate = birthDate;
	}
	public void setMessage(String message){
		Message = message;
	}
	
	public String getUserID(){
		return UserID;
	}
	public String getPassword(){
		return Password;
	}
	public String getName(){
		return Name;
	}
	public String getSex(){
		return Sex;
	}
	public String getBirthDate(){
		return BirthDate ;
	}
	public String getMessage(){
		return Message;
	}
	
}
