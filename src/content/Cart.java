package content;

public class Cart {
	
	private int no = 0;
	private String userID = null;
	private int recipeID = 0;
	private String recipeTitle = null;
	private String image = null;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getRecipeID() {
		return recipeID;
	}
	public void setRecipeID(int recipeID) {
		this.recipeID = recipeID;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

}
