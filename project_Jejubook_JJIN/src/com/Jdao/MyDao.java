package com.Jdao;

import static com.common.JDBCTemplate.Close;
import static com.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.common.JDBCTemplate;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;
import com.Jdto.MyDto;

public class MyDao extends JDBCTemplate {
	
	public int userInsert(MyDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "insert into jejuuserdb values(?,?,?,?,?,'Y','member',sysdate)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getName());
			pstm.setString(2, dto.getEmailorphone());
			pstm.setString(3, dto.getPassword());
			pstm.setString(4, dto.getBirth());
			pstm.setInt(5, dto.getGender());
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				Commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			Rollback(con);
			e.printStackTrace();
		} finally {
			Close(pstm);
			Close(con);
		}
		
		return res;
	}
	
	public boolean userInsertCheck(String chkId) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		boolean res = true;
		MyDto dto = new MyDto();
		String sql = "select * from jejuuserdb where emailorphone=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, chkId);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setEmailorphone(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setGender(rs.getInt(5));
				dto.setEnabled(rs.getString(6));
				dto.setRole(rs.getString(7));
				dto.setUserdate(rs.getString(8));
			}
			
			if(dto.getEmailorphone() != null) {
				res = false;
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			Rollback(con);
			e.printStackTrace();
		} finally {
			Close(rs);
			Close(pstm);
			Close(con);
		}
		
		
		return res;
	}
	
	public MyDto checking(String chkId, String chkPassword) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		String sql = "select * from jejuuserdb where emailorphone=? and password=? and enabled=?";
		ResultSet rs = null;
		MyDto res = new MyDto();
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, chkId);
			pstm.setString(2, chkPassword);
			pstm.setString(3, "Y");
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				res.setName(rs.getString(1));
				res.setEmailorphone(rs.getString(2));
				res.setPassword(rs.getString(3));
				res.setBirth(rs.getString(4));
				res.setGender(rs.getInt(5));
				res.setEnabled(rs.getString(6));
				res.setRole(rs.getString(7));
				res.setUserdate(rs.getString(8));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			Close(rs);
			Close(pstm);
			Close(con);
		}
		
		return res;
	}
	
	public List<MyDto> selectAll() {
		
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		List<MyDto> list = new ArrayList<MyDto>();
		String sql = "select * from jejuuserdb";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MyDto dto = new MyDto();
				
				dto.setName(rs.getString(1));
				dto.setEmailorphone(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setGender(rs.getInt(5));
				dto.setEnabled(rs.getString(6));
				dto.setRole(rs.getString(7));
				dto.setUserdate(rs.getString(8));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			Close(rs);
			Close(stmt);
			Close(con);
		}
		
		return list;
	}
	
	public MyDto selectOne(String id) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String sql = "select * from jejuuserdb where emailorphone=?";
		MyDto dto = new MyDto();
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setEmailorphone(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setGender(rs.getInt(5));
				dto.setEnabled(rs.getString(6));
				dto.setRole(rs.getString(7));
				dto.setUserdate(rs.getString(8));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			Close(rs);
			Close(con);
		}
		
		return dto;
	}
	
	public int adUserUpdate(String idUpdate, String birthUpdate, int genderUpdate, String enabledUpdate, String roleUpdate) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		String sql = "update jejuuserdb set birth=?, gender=?, enabled=?, role=? where emailorphone=?";
		int res = 0;
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, birthUpdate);
			pstm.setInt(2, genderUpdate);
			pstm.setString(3, enabledUpdate);
			pstm.setString(4, roleUpdate);
			pstm.setString(5, idUpdate);
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				Commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			Rollback(con);
			e.printStackTrace();
		} finally {
			Close(pstm);
			Close(con);
		}
		return res;
	}
	
	public List<MyDto> search(String selOne, String searchT) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MyDto> list = new ArrayList<>();
		String sql = "";
		String except = "";
		
		if(selOne.equals("name")) {
			sql = "select * from jejuuserdb where name= ?";
		}else if(selOne.equals("id")) {
			sql = "select * from jejuuserdb where emailorphone like ?";
		}else if(selOne.equals("birth")) {
			sql = "select * from jejuuserdb where birth like ?";
		}else if(selOne.equals("gender")) {
			if(searchT.equals("남")) {
				except = "2";
			}else if(searchT.equals("여")) {
				except = "1";
			}
			sql = "select * from jejuuserdb where gender like ?";
		}else if(selOne.equals("enabled")) {
			if(searchT.equals("회원")) {
				except = "Y";
			}else if(searchT.equals("비회원")) {
				except = "N";
			}
			sql = "select * from jejuuserdb where enabled like ?";
		}else if(selOne.equals("role")) {
			sql = "select * from jejuuserdb where role like ?";
		}
		System.out.println(except);
		try {
			pstm = con.prepareStatement(sql);
			
			if(selOne.equals("name")) {
				pstm.setString(1, searchT);
			}else if(selOne.equals("gender") || selOne.equals("enabled")) {
				pstm.setString(1, "%" + except + "%");
			}else {
				pstm.setString(1, "%" + searchT + "%");
			}
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				MyDto dto = new MyDto();
				
				dto.setName(rs.getString(1));
				dto.setEmailorphone(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setGender(rs.getInt(5));
				dto.setEnabled(rs.getString(6));
				dto.setRole(rs.getString(7));
				dto.setUserdate(rs.getString(8));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			Rollback(con);
			e.printStackTrace();
		} finally {
			Close(rs);
			Close(pstm);
			Close(con);
		}
		
		return list;
	}
	
	public int deleteOne(String id) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = "delete from jejuuserdb where emailorphone=?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				Commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			Rollback(con);
			e.printStackTrace();
		} finally {
			Close(pstm);
			Close(con);
		}
		
		return res;
	}
	
	public List<MyDto> page(int pageNum) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MyDto> list = new ArrayList<MyDto>();
		String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT * FROM jejuuserdb order by ROWNUM desc) A WHERE ROWNUM <= ?*5) WHERE RNUM >= ?*5-4";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, pageNum);
			pstm.setInt(2, pageNum);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				MyDto dto = new MyDto();
				
				dto.setName(rs.getString(1));
				dto.setEmailorphone(rs.getString(2));
				dto.setPassword(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setGender(rs.getInt(5));
				dto.setEnabled(rs.getString(6));
				dto.setRole(rs.getString(7));
				dto.setUserdate(rs.getString(8));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			Close(rs);
			Close(pstm);
			Close(con);
		}
		
		return list;
	}
	
}
