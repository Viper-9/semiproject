package hsp.model.vo;

import java.sql.Date;

public class Host implements java.io.Serializable {
	private static final long serialVersionUID = 9L;
	
	private String user_id;
	private int user_num; // 수용 인원
	private String p_gender;
	private String check1;
	private String check2;
	private String content;
	private String process;
	private Date start_date;
	private Date end_date;
	private String image1;
	private String image2;
	private String image3;
	
	public Host() {}
	
	public Host(String user_id, int user_num, String p_gender, String check1, String check2, String content,
			String process, Date start_date, Date end_date) {
		super();
		this.user_id = user_id;
		this.user_num = user_num;
		this.p_gender = p_gender;
		this.check1 = check1;
		this.check2 = check2;
		this.content = content;
		this.process = process;
		this.start_date = start_date;
		this.end_date = end_date;
	}
	
	public Host(String user_id, int user_num, String p_gender, String check1, String check2, String content,
			String process, Date start_date, Date end_date, String image1, String image2, String image3) {
		super();
		this.user_id = user_id;
		this.user_num = user_num;
		this.p_gender = p_gender;
		this.check1 = check1;
		this.check2 = check2;
		this.content = content;
		this.process = process;
		this.start_date = start_date;
		this.end_date = end_date;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public String getCheck1() {
		return check1;
	}

	public void setCheck1(String check1) {
		this.check1 = check1;
	}

	public String getCheck2() {
		return check2;
	}

	public void setCheck2(String check2) {
		this.check2 = check2;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString(){
		return this.user_id + ", " + this.user_num + ", " + this.p_gender + ", " + this.check1
				 + ", " + this.check2 + ", " + this.content + ", " + this.p_gender + ", " + this.start_date 
				 + ", " + this.p_gender + ", " + this.image1 + ", " + this.image2 + ", " + this.image3;
	}

}
