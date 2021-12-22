package content;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class myrecipeDAO {
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
	
	
	public String getDate() {
		connect();
		String sql = "SELECT NOW()";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		connect();
		String sql = "SELECT no FROM myrecipe ORDER BY no DESC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1 ;
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String title, String username, String content, String file) {
		connect();
		
		String sql = "INSERT INTO myrecipe VALUES(?,?,?,?,?,?,?)";
		
		int bno = getNext();
		String bdate = getDate();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, file);
			pstmt.setString(3, title);
			pstmt.setString(4, username);
			pstmt.setString(5, bdate);
			pstmt.setString(6, content);
			pstmt.setInt(7, 0);
			pstmt.executeUpdate();
			return 1;
		}	catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<myrecipe> getList(int pageNumber){
		
		connect();
		
		String sql = "SELECT * FROM myrecipe WHERE no < ? ORDER BY no DESC LIMIT 10";
		
		ArrayList<myrecipe> list = new ArrayList<myrecipe>();
		
		int bno = getNext();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				myrecipe myrecipe = new myrecipe();
				myrecipe.setNo(rs.getInt(1));
				myrecipe.setImage(rs.getString(2));
				myrecipe.setTitle(rs.getString(3));
				myrecipe.setUsername(rs.getString(4));
				myrecipe.setDate(rs.getString(5));
				myrecipe.setContent(rs.getString(6));
				myrecipe.setView(rs.getInt(7));
				list.add(myrecipe);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		connect();
		
		String sql = "SELECT * FROM myrecipe WHERE no < ? ";
		
		int bno = getNext();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	return false;
	}
	
	public myrecipe getmyrecipe(int no) {
		connect();
		
		String sql = "SELECT * FROM myrecipe WHERE no = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				myrecipe myrecipe = new myrecipe();
				myrecipe.setNo(rs.getInt(1));
				myrecipe.setImage(rs.getString(2));
				myrecipe.setTitle(rs.getString(3));
				myrecipe.setUsername(rs.getString(4));
				myrecipe.setDate(rs.getString(5));
				myrecipe.setContent(rs.getString(6));
				myrecipe.setView(rs.getInt(7));
				return myrecipe;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	return null;
	}

	public int Update(int no,String title, String content) {
		connect();
		
		String sql = "UPDATE myrecipe SET title = ?, content = ? WHERE no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, no);
			pstmt.executeUpdate();
			return 1;
		}	catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int no) {
		connect();
		String sql = "DELETE FROM myrecipe WHERE no= ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return -1;					
	}
	
	public void updateview(int no) {
	      connect();
	      String sql = "UPDATE myrecipe SET view = view +1 WHERE no =?";
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         disconnect();
	      }
	 }
	
	public ArrayList<myrecipe> getRank(){
		
		connect();
		String sql = "SELECT * FROM myrecipe WHERE no NOT IN (1) ORDER BY view DESC";	
		ArrayList<myrecipe> list = new ArrayList<myrecipe>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				myrecipe myrecipe = new myrecipe();
				myrecipe.setNo(rs.getInt(1));
				myrecipe.setImage(rs.getString(2));
				myrecipe.setTitle(rs.getString(3));
				myrecipe.setUsername(rs.getString(3));
				myrecipe.setDate(rs.getString(3));
				myrecipe.setContent(rs.getString(6));
				myrecipe.setView(rs.getInt(7));
				list.add(myrecipe);
				if (list.size()==5)
					break;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}

