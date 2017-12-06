package com.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹� ���� ����");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("����̹� ���� ����");
		}
		
		Connection con = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hk";
		String pw = "hk";
		
		try {
			con = DriverManager.getConnection(url,id,pw);
			con.setAutoCommit(false);
			System.out.println("���� ���� ����");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("���� ���� ����");
		}
		
		return con;
	}
	
	public static void Close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.println("Connection close error");
			e.printStackTrace();
		}
		
	}
	
	//PreparedStatement�� Statement�� Ȯ�� ��Ų���̶� Statement�� �����ϸ� ���� ����ȴ�.
	public static void Close(Statement stmt) {
		try {
			stmt.close();
		} catch (SQLException e) {
			System.out.println("Statement close error");
			e.printStackTrace();
		}
	}
	
	public static void Close(ResultSet rs) {
		try {
			rs.close();
		} catch (SQLException e) {
			System.out.println("ResultSet close error");
			e.printStackTrace();
		}
	}
	
	public static void Commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			System.out.println("Commit error");
			e.printStackTrace();
		}
	}

	public static void Rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			System.out.println("Rollback error");
			e.printStackTrace();
		}
	}
}
