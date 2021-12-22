package content;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAO {
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
	
	public int getNext() {
		connect();
		String sql = "SELECT no FROM cart ORDER BY no DESC";
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
	
	public int add(String userid, int recipeid, String recipetitle, String image) {
		connect();
		String sql = "INSERT INTO cart VALUES(?,?,?,?,?)";
		
		int bno = getNext();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, userid);
			pstmt.setInt(3, recipeid);
			pstmt.setString(4, recipetitle);
			pstmt.setString(5, image);
			pstmt.executeUpdate();
			return 1;
		}	catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Cart> getList(String id){
		connect();
		String sql = "SELECT * FROM cart WHERE userID LIKE ? ORDER BY no DESC";	
		ArrayList<Cart> list = new ArrayList<Cart>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setNo(rs.getInt(1));
				cart.setUserID(rs.getString(2));
				cart.setRecipeID(rs.getInt(3));
				cart.setRecipeTitle(rs.getString(4));
				cart.setImage(rs.getString(5));
				list.add(cart);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int no) {
		connect();
		String sql = "DELETE FROM cart WHERE no= ?";
		
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
	
}

