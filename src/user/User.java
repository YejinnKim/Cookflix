package user;

// 데이터 베이스 필드명하고 다르면 교환해주세요 

public class User {
	
	private String userID;  //유저 아이디    
	private String userPassword; // 유저 비밀번호
	private String userName; // 유저 닉네임
	private String userEmail; // 유저 이메일
	// 더 필요한거 있으면 추가.
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}