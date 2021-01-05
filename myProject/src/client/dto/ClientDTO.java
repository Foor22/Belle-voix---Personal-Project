package client.dto;

import java.util.Date;

public class ClientDTO {
	private String userid;
	private String passwd;
	private String name;
	private String hp;
	private String email;
	private String address;
	private Date join_date;
	//getter,setter
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	//toString()
	@Override
	public String toString() {
		return "ClientDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", hp=" + hp + ", email="
				+ email + ", address=" + address + ", join_date=" + join_date + "]";
	}
	//생성자
	public ClientDTO() {
		
	}
}