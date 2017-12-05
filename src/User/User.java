package User;

import java.sql.Date;

public class User {
	private String UserID;
	private String Password;
	private String Name;
	private int Sex;
	private Date BirthDate;
	private String Message;
	private String UserEmail;
	private String Address;
	
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public void setBirthDate(Date birthDate) {
		BirthDate = birthDate;
	}
	public String getUserEmail() {
		return UserEmail;
	}
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
	public void setUserID(String userID){
		UserID = userID;
	}
	public void setPassword(String password){
		Password = password;
	}
	public void setName(String name){
		Name = name;
	}
	public void setSex(int sex){
		Sex = sex;
	}
	public void setBirthDate(String birthDate){
		BirthDate = Date.valueOf(birthDate);;
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
	public int getSex(){
		return Sex;
	}
	public Date getBirthDate(){
		return BirthDate ;
	}
	public String getMessage(){
		return Message;
	}
	
}
