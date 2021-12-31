package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.ContactModel;

public class ContactDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public ContactModel getContactModel(String fullname,String phone,String email,String address) {
		String query = "SELECT * FROM englishcenter.contact WHERE contact.fullname = ? AND contact.phone = ? AND contact.email =? AND contact.address=?;";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, fullname);
			ps.setString(2, phone);
			ps.setString(2, email);
			ps.setString(2, email);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new ContactModel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public void insertContactModel(String fullname,String phone,String email,String address,String message) {
		String query = "INSERT INTO `englishcenter`.`contact` (`fullname`, `phone`, `email`, `address`, `message`) VALUES (?, ?, ?, ?, ?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setString(1, fullname);
			ps.setString(2, phone);
			ps.setString(3, email);
			ps.setString(4, address);
			ps.setString(5, message);
			ps.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
}
