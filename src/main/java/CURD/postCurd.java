package CURD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import UserEntity.UserPost; 

public class postCurd {
	
	private Connection conn;
	public postCurd(Connection conn) {
		super();
		this.conn = conn;
		
	}

	/*-- 1. Create a sequence for auto-increment ID
	CREATE SEQUENCE enotes_seq START WITH 1 INCREMENT BY 1 NOCYCLE;
	
	-- 2. Create the enotes table
	CREATE TABLE enotes (
	    id NUMBER PRIMARY KEY,                          
	    title VARCHAR2(255 CHAR) NOT NULL,               
	    content CLOB,                                    
	    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,       
	    userId VARCHAR2(50),                             
	    
	    
	    CONSTRAINT fk_user
	        FOREIGN KEY (userId)
	        REFERENCES users(email)
	        ON DELETE CASCADE
	);
	
	-- 3. Create a trigger to auto-increment the ID
	CREATE OR REPLACE TRIGGER enotes_trigger
	BEFORE INSERT ON enotes
	FOR EACH ROW
	DECLARE
	    next_id NUMBER;
	BEGIN
	    -- Fetch the next value from the sequence
	    SELECT enotes_seq.NEXTVAL INTO next_id FROM dual;
	    
	    -- Assign the sequence value to the ID column
	    :NEW.id := next_id;
	END;
	/
	 */
	public boolean AddNotes(String title,String content,String UserEmail) {
		boolean f=false;
		try {
			String qry="insert into enotes(title,content,userId) values(?,?,?)";
			
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, UserEmail);
			
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public List<UserPost> getData(String email){
	
		List<UserPost> list=new ArrayList<UserPost>();
		UserPost up=null;
		try {
			
			String qry="select * from enotes where userId=? ";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				up=new UserPost();
				up.setId(rs.getInt(1));
				up.setTitle(rs.getString(2));
				up.setContent(rs.getString(3));
				up.setPdate(rs.getTimestamp(4));
				list.add(up);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public UserPost getDataByNotesId(int id) {
		UserPost p=null;
		try {
			String qry="Select * from enotes where id=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				p=new UserPost();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public boolean UpdateData(int id,String title,String content) {
		boolean p=false;
		try {
			String qry="Update enotes set title=?,content=?,created_at = CURRENT_TIMESTAMP  where id=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, id);
			int i=ps.executeUpdate();
			
			if(i==1)
			{
				p=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	public boolean DeleteNotes(int id) {
		boolean f=false;
		try {
			String qry="delete from enotes where id=?";
			PreparedStatement ps=conn.prepareStatement(qry);
			ps.setInt(1, id);
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
