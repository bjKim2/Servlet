package com.javalec.oneline.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.oneline.dto.ODto;

public class ODao {
	DataSource dataSource = null;
	
	public ODao() {
		try {
			
			
			Context context = new InitialContext();
			
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/mvc");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	public ArrayList<ODto> list() {
		ArrayList<ODto> ODtos = new ArrayList<ODto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try{
			conn = dataSource.getConnection();
			String query = "select * from oneline";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int seq = rs.getInt(1);
				String name = rs.getString(2);
				String title= rs.getString(3);
				Timestamp date = rs.getTimestamp(4);
				
				ODto odto = new ODto(seq,name,title,date);
				
				ODtos.add(odto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		return ODtos;
	}
	
	public void del(int seq) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		
		try {
			conn = dataSource.getConnection();
			String query = "delete from oneline where seq = ?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, seq);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
	}
	
	public void write(String name, String title) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "insert into oneline (name,title,date) values (?,?,now())";
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, title);
			
			ps.executeUpdate();
			
			
		}  catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	public ODto update_view(int seq) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ODto odto = null;
		
		
		try {
			conn = dataSource.getConnection();
			String query = "select * from oneline where seq = ?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, seq);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString(2);
				String title = rs.getString(3);
				Timestamp date = rs.getTimestamp(4);
				
				odto = new ODto(seq, name, title, date);
			}
			
		}  catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return odto;
		
	}
	
	public void update(int seq,String name,String title) {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();
			String query = "update oneline set name = ?, title = ? where seq = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setInt(3, seq);
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
}
