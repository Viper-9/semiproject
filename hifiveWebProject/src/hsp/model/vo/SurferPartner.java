package hsp.model.vo;

import java.sql.Date;

public class SurferPartner implements java.io.Serializable {
	private static final long serialVersionUID = 8L;
	
	private String user_id;
	private Date start_date;
	private Date end_Date;
	private String city;
	private String role;
	private String process;
	
	public SurferPartner() {}
	
	public SurferPartner(String user_id, Date start_date, Date end_Date, String city, String role, String process) {
		super();
		this.user_id = user_id;
		this.start_date = start_date;
		this.end_Date = end_Date;
		this.city = city;
		this.role = role;
		this.process = process;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(Date end_Date) {
		this.end_Date = end_Date;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
