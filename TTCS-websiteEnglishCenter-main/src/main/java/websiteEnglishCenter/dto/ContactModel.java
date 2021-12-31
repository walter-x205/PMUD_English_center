package websiteEnglishCenter.dto;

public class ContactModel {
	private int idContact;
	private String fullname;
	private String email;
	private String phone;
	private String address;
	private String message;
	public int getIdContact() {
		return idContact;
	}
	public void setIdContact(int idContact) {
		this.idContact = idContact;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public ContactModel() {
		super();
	}
	public ContactModel(int idContact, String fullname, String email, String phone, String address, String message) {
		super();
		this.idContact = idContact;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.message = message;
	}
	@Override
	public String toString() {
		return "ContactModel [idContact=" + idContact + ", fullname=" + fullname + ", email=" + email + ", phone="
				+ phone + ", address=" + address + ", message=" + message + "]";
	}
	
}
