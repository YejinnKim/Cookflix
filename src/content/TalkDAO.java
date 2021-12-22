package content;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TalkDAO {
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
		String sql = "SELECT no FROM talk ORDER BY no DESC";
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
	
	public int write(String title, String username, String content) {
		connect();
		
		String sql = "INSERT INTO talk VALUES(?,?,?,?,?,?,?)";
		
		int bno = getNext();
		String bdate = getDate();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, "");
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
	
	public ArrayList<Talk> getList(int pageNumber){
		
		connect();
		
		String sql = "SELECT * FROM talk WHERE no < ? ORDER BY no DESC LIMIT 10";
		
		ArrayList<Talk> list = new ArrayList<Talk>();
		
		int bno = getNext();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Talk talk = new Talk();
				talk.setNo(rs.getInt(1));
				talk.setImage(rs.getString(2));
				talk.setTitle(rs.getString(3));
				talk.setUsername(rs.getString(4));
				talk.setDate(rs.getString(5));
				talk.setContent(rs.getString(6));
				talk.setView(rs.getInt(7));
				list.add(talk);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		connect();
		
		String sql = "SELECT * FROM talk WHERE no < ? ";
		
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
	
	public Talk gettalk(int no) {
		connect();
		
		String sql = "SELECT * FROM talk WHERE no = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Talk talk = new Talk();
				talk.setNo(rs.getInt(1));
				talk.setImage(rs.getString(2));
				talk.setTitle(rs.getString(3));
				talk.setUsername(rs.getString(4));
				talk.setDate(rs.getString(5));
				talk.setContent(rs.getString(6));
				talk.setView(rs.getInt(7));
				return talk;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	return null;
	}

	public int Update(int no,String title, String content) {
		connect();
		
		String sql = "UPDATE talk SET title = ?, content = ? WHERE no = ?";
		
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
		String sql = "DELETE FROM talk WHERE no= ?";
		
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
	      String sql = "UPDATE talk SET view = view +1 WHERE no =?";
	      
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
	
}

