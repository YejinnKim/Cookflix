package content;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecipeDAO {
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
		String sql = "SELECT no FROM recipe ORDER BY no DESC";
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
	
	public int write(String title, String category, String group, String file) {
		connect();
		
		String sql = "INSERT INTO recipe VALUES(?,?,?,?,?,?)";
		
		int bno = getNext();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, file);
			pstmt.setString(3, title);
			pstmt.setString(4, category);
			pstmt.setString(5, group);
			pstmt.setInt(6, 0);
			pstmt.executeUpdate();
			return 1;
		}	catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Recipe> getList(){
		
		connect();
		String sql = "SELECT * FROM recipe ORDER BY no DESC";	
		ArrayList<Recipe> list = new ArrayList<Recipe>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setNo(rs.getInt(1));
				recipe.setImage(rs.getString(2));
				recipe.setTitle(rs.getString(3));
				recipe.setContent(rs.getString(4));
				recipe.setCategory(rs.getString(5));
				recipe.setView(rs.getInt(6));
				list.add(recipe);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Recipe> filterList(String category){
		
		connect();
		String sql = "SELECT * FROM recipe WHERE category LIKE ? ORDER BY no DESC";
		ArrayList<Recipe> list = new ArrayList<Recipe>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+category+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setNo(rs.getInt(1));
				recipe.setImage(rs.getString(2));
				recipe.setTitle(rs.getString(3));
				recipe.setContent(rs.getString(4));
				recipe.setCategory(rs.getString(5));
				recipe.setView(rs.getInt(6));
				list.add(recipe);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Recipe> searchList(String word){
		
		connect();
		String sql = "SELECT * FROM recipe WHERE title LIKE ? ORDER BY no DESC";
		ArrayList<Recipe> list = new ArrayList<Recipe>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+word+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setNo(rs.getInt(1));
				recipe.setImage(rs.getString(2));
				recipe.setTitle(rs.getString(3));
				recipe.setContent(rs.getString(4));
				recipe.setCategory(rs.getString(5));
				recipe.setView(rs.getInt(6));
				list.add(recipe);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		connect();
		
		String sql = "SELECT * FROM recipe WHERE no < ? ";
		
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
	
	public Recipe getrecipe(int no) {
		connect();
		
		String sql = "SELECT * FROM recipe WHERE no = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setNo(rs.getInt(1));
				recipe.setImage(rs.getString(2));
				recipe.setTitle(rs.getString(3));
				recipe.setContent(rs.getString(4));
				recipe.setCategory(rs.getString(5));
				recipe.setView(rs.getInt(6));
				return recipe;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	return null;
	}

	public int Update(int no,String title, String content) {
		connect();
		
		String sql = "UPDATE recipe SET title = ?, content = ? WHERE no = ?";
		
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
		String sql = "DELETE FROM recipe WHERE no= ?";
		
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
	      String sql = "UPDATE recipe SET view = view +1 WHERE no =?";
	      
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
	
	public ArrayList<Recipe> getRank(){
		
		connect();
		String sql = "SELECT * FROM recipe ORDER BY view DESC";	
		ArrayList<Recipe> list = new ArrayList<Recipe>();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recipe recipe = new Recipe();
				recipe.setNo(rs.getInt(1));
				recipe.setImage(rs.getString(2));
				recipe.setTitle(rs.getString(3));
				recipe.setContent(rs.getString(4));
				recipe.setCategory(rs.getString(5));
				recipe.setView(rs.getInt(6));
				list.add(recipe);
				if (list.size()==5)
					break;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}

