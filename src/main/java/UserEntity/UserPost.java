    package UserEntity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UserPost {
	private int id;
	private String title;
	private String content;
	private Date pdate;
	private Users user;
	
	public String getFormattedPdate() {
	    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm a"); // 12-hour format with AM/PM
	    return sdf.format(pdate);
	}
	
	public UserPost(int id, String title, String content, Date pdate, Users user) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.pdate = pdate;
		this.user = user;
	}
	public UserPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	
}
