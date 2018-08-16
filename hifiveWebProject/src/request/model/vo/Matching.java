package request.model.vo;

import java.sql.Date;

public class Matching implements java.io.Serializable {
	private static final long serialVersionUID = 11L;
	
	private int matching_no;
	private String user1;
	private String user2;
	private String type;
	private Date matching_Date;
	
	public Matching(){}

	public Matching(int matching_no, String user1, String user2, String type, Date matching_Date) {
		super();
		this.matching_no = matching_no;
		this.user1 = user1;
		this.user2 = user2;
		this.type = type;
		this.matching_Date = matching_Date;
	}

	public int getMatching_no() {
		return matching_no;
	}

	public void setMatching_no(int matching_no) {
		this.matching_no = matching_no;
	}

	public String getUser1() {
		return user1;
	}

	public void setUser1(String user1) {
		this.user1 = user1;
	}

	public String getUser2() {
		return user2;
	}

	public void setUser2(String user2) {
		this.user2 = user2;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getMatching_Date() {
		return matching_Date;
	}

	public void setMatching_Date(Date matching_Date) {
		this.matching_Date = matching_Date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Matching [matching_no=" + matching_no + ", user1=" + user1 + ", user2=" + user2 + ", type=" + type
				+ ", matching_Date=" + matching_Date + "]";
	}

}
