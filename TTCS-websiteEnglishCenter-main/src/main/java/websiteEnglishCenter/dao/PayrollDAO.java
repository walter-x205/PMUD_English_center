package websiteEnglishCenter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import websiteEnglishCenter.connectDB.ConnectDatabase;
import websiteEnglishCenter.dto.Payroll;
import websiteEnglishCenter.dto.SalaryUnit;

public class PayrollDAO {
	Connection connection = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	public List<SalaryUnit> getSalaryUnit() {
		String query = "SELECT * FROM englishcenter.salaryunit;";
		List<SalaryUnit> salaryUnit = new ArrayList<SalaryUnit>();
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				salaryUnit.add(new SalaryUnit(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return salaryUnit;
	}
//	public List<Payroll> getPayrollByTeacherID(int idTeacher ,int month) {
//		String query = "SELECT * FROM englishcenter.payroll where idteacher =? and month=?;";
//		List<Payroll> payrolls =null;
//		try {
//			connection = new ConnectDatabase().getConnection();
//			ps = connection.prepareStatement(query);
//			ps.setInt(1, idTeacher);
//			ps.setInt(2, month);
//			rs = ps.executeQuery();
//			while (rs.next()) {
//				payrolls.add(new Payroll(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return payrolls;
//	}
	public void insertNewPayrolls(int idteacher,int idclass,int salaryUnit,int numberOfTeaching,int totalMoney) {
		String query = "INSERT INTO `englishcenter`.`payroll` (`idteacher`, `idclass`, `idsalary`, `numberOfTeaching`, `totalMoney`) VALUES (?, ?, ?, ?, ?);";
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idteacher);
			ps.setInt(2, idclass);
			ps.setInt(3, salaryUnit);
			ps.setInt(4, numberOfTeaching);
			ps.setInt(5, totalMoney);
			try {
				ps.executeUpdate();
				System.out.println("okla");
			} catch (Exception e) {
				System.out.println("sai cmnr");
			}
			
			
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	public List<Payroll> getPayrolls(int idTeacher,int curmonth){
		String query = "SELECT attendance.idteacher,schedule.idclass ,COUNT(DISTINCT attendance.lesson),salary.salary\r\n"
				+ "FROM englishcenter.attendance,englishcenter.schedule, ( SELECT class.idclass,course.idcourse,salaryunit.salary\r\n"
				+ "FROM englishcenter.class,englishcenter.course,englishcenter.salaryunit\r\n"
				+ "WHERE class.idcourse= course.idcourse and course.idcourse=salaryunit.idcourse ) salary\r\n"
				+ "WHERE attendance.idschedule=schedule.idschedule and attendance.idteacher=? and salary.idclass = schedule.idclass and month(attendance.date)=?\r\n"
				+ "GROUP BY schedule.idclass;";
		List<Payroll> payrollList = new ArrayList<Payroll>();
		try {
			connection = new ConnectDatabase().getConnection();
			ps = connection.prepareStatement(query);
			ps.setInt(1, idTeacher);
			ps.setInt(2, curmonth);
			rs = ps.executeQuery();
			while (rs.next()) {
				payrollList.add(new Payroll(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return payrollList;
	}
	public static void main(String[] args) {
		PayrollDAO aDao = new PayrollDAO();
//		aDao.insertNewPayrolls(3, 51, 2, 3,  5);
//		List<SalaryUnit> salaryUnitList = aDao.getSalaryUnit();
//		for (SalaryUnit salaryUnit : salaryUnitList) {
//			
//			System.out.println(salaryUnit.getIdCourse());
//		}
//		List<Payroll> payrolls = aDao.getPayrolls(3, 9);
//		System.out.println(payrolls.toString());
//		for (Payroll payroll : payrolls) {
//			System.out.println(payroll.getIdsalaryUnit());
//		}
	}
}
