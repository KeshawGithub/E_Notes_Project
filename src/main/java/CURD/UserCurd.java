package CURD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import UserEntity.Users;




public class UserCurd {
	private Connection conn;

	public UserCurd(Connection conn) {
		super();
		this.conn = conn;
		
	}
//	create table users(name varchar2(50) not null, email varchar2(50) primary key, password varchar2(20) not null);
	public boolean register(Users u) {
	    boolean isSuccess = false;
	

	    String qry = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";
	    
	    // Ensure conn is not null
	    if (conn == null) {
	        System.err.println("Database connection is not established.");
	        return false;
	    }

	    try (PreparedStatement ps = conn.prepareStatement(qry)) {
	        ps.setString(1, u.getName());
	        ps.setString(2, u.getEmail());
	        ps.setString(3, u.getPassword());

	        // Execute the update and check if one row is inserted
	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected == 1) {
	            isSuccess = true;
	        }
	    } catch (SQLException e) {
	        System.err.println("Error during user registration: " + e.getMessage());
	        e.printStackTrace(); // Optional: Keep or remove in production
	    }

	    return isSuccess;
	}
	
	
	
	public Users login(String email, String password) {
		Users u = null;
		try {
			String qry = "SELECT name, email, password FROM users WHERE email = ? AND password = ?";
	        PreparedStatement ps = conn.prepareStatement(qry);
	        ps.setString(1, email);
	        ps.setString(2, password);
	        
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	        	
	            u = new Users();// changed to `if` as only one record is expected
	            u.setName(rs.getString("name"));  // Using column names is more readable
	            u.setEmail(rs.getString("email"));
	            u.setPassword(rs.getString("password"));
	        }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}

}
