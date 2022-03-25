package com.javalec.quiz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.quiz.dto.QDto;

public class QDao {

	DataSource dataSource;
	
	public QDao() {
		try {
			Context context =  new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/quiz");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<QDto> list() {
		ArrayList<QDto> QDtos = new ArrayList<QDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "select * from adbook";
			ps = conn.prepareStatement(query);
			//ps.setString(0, query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int seq = rs.getInt(1);
				String name = rs.getString(2);
				String tel = rs.getString(3);
				String address = rs.getString(4);
				String email = rs.getString(5);
				String rel = rs.getString(6);
			
			QDto QDto = new QDto(seq,name,tel,address,email,rel);
			QDtos.add(QDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			
		}
		
		return QDtos;
	}
	
	public QDto content_view(int seq) {
		QDto dto = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "select * from adbook where seq = ?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, seq);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString(2);
				String tel = rs.getString(3);
				String address = rs.getString(4);
				String email = rs.getString(5);
				String rel = rs.getString(6);
				
				dto = new QDto(seq,name,tel,address,email,rel);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			
		}
		
		return dto;
		
		
	}
	
	public void update(int seq,String name, String tel, String address, String email, String rel) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "update adbook set name = ?, tel = ?, address = ? , email = ? , rel = ? where seq = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, tel);
			ps.setString(3, address);
			ps.setString(4, email);
			ps.setString(5, rel);
			ps.setInt(6, seq);
			
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
	}
	
	public void delete(int seq) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "delete from adbook where seq = ?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, seq);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
	}
	
	public void write(String name,String tel,String address,String email,String rel) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "insert into adbook (name,tel,address,email,rel) values (?,?,?,?,?)";
			
			ps = conn.prepareStatement(query);
			ps.setString(1,name);
			ps.setString(2,tel);
			ps.setString(3,address);
			ps.setString(4,email);
			ps.setString(5,rel);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
		
	}
	
	public ArrayList<QDto> search(String sel,String words) {
		ArrayList<QDto> QDtos = new ArrayList<QDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		words = (words ==null) ? "":words;
		
		try {
			conn = dataSource.getConnection();
			String query = "select * from adbook where " + sel + " like '%" +words+"%'";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
					
			while(rs.next()) {
				
				System.out.println(rs.getString(2));
				int seq = rs.getInt(1);
				String name = rs.getString(2);
				String tel = rs.getString(3);
				String address = rs.getString(4);
				String email = rs.getString(5);
				String rel = rs.getString(6);
			
			QDto QDto = new QDto(seq,name,tel,address,email,rel);
			QDtos.add(QDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			
		}
		
		return QDtos;
		
	}
}
