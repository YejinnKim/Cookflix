package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;




public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	void connect() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/cookflixdb?useUnicode=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost:3306/cookflixdb?useUnicode=true&characterEncoding=utf8";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword))
					return 1; //로그인 성공
				else 
					return 0; // 비밀번호 불일치
			}
			return -1; //아이디 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터 베이스 오류
	}
	
	// 회원 가입 
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	//유저 등록 정보
	public ArrayList<User> getUserList(){
		connect();
		
		ArrayList<User> list = new ArrayList<User>();
		String SQL = "SELECT * FROM USER";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setUserID(rs.getString("userID"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserEmail(rs.getString("userEmail"));
				list.add(user);
			}
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	//유저 등록 정보 수정
	public boolean updateDB(User user) {
		connect();
		
		String sql ="update USER set userID=?, userPassword=?, userName=?, userEmail=? where userID=?";		
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserEmail());
			pstmt.setString(5,user.getUserID());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	// 유저 등록 삭제
	public boolean deleteDB(String userID) {
		connect();
		String sql1 ="SET FOREIGN_KEY_CHECKS=0";
		String sql ="delete from USER where userID=?";
		
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public User getDB(String userID) {
		connect();
		
		String sql = "select * from USER where userID=?";
		User user = new User();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			user.setUserID(rs.getString("userID"));
			user.setUserPassword(rs.getString("userPassword"));
			user.setUserName(rs.getString("userName"));
			user.setUserEmail(rs.getString("userEmail"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return user;
	}
	
	// 회원가입 ID 중복 확인
	public int checkID(String userID) {
		connect();
		int checkcon = 0;
		String sql = "select userID from USER where userID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
            if(rs.next()) {
            	checkcon = 1;
            }
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return checkcon;
	}
	public int checkName(String userName) {
		connect();
		int checkcon = 0;
		String sql = "select userName from USER where userName = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			rs = pstmt.executeQuery();
            if(rs.next()) {
            	checkcon = 1;
            }
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return checkcon;
	}
}