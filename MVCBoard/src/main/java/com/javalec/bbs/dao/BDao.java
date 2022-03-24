package com.javalec.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.bbs.dto.BDto;

public class BDao {

	DataSource dataSource;
	
	public BDao() {
		try {
			Context context = new InitialContext();
			
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mvc");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 전체 검색
	public ArrayList<BDto> list(){
		ArrayList<BDto> dtos = new ArrayList<BDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select bid, bName, bTitle, bContent, bDate from mvc_board";
			
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int bid = resultSet.getInt("bid");
				String bName = resultSet.getString("bName");
				String bTitle = resultSet.getString("bTitle");
				String bContent = resultSet.getString("bContent");
				Timestamp bDate = resultSet.getTimestamp("bDate");
				
				BDto dto = new BDto(bid, bName, bTitle, bContent, bDate);
				dtos.add(dto);
			}
			
			
		
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				//안하면 쓰레기가 데이터 베이스 쪽 메모리 에 쌓임 
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return dtos;
	} // list
	
	
	public void write(String bName,String bTitle, String bContent) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into mvc_board (bName,bTitle,bContent,bDate) values (?,?,?,now())";
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			
			preparedStatement.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				//안하면 쓰레기가 데이터 베이스 쪽 메모리 에 쌓임 
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}//write
	
	
	public BDto contentView(String sbid) {
		BDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
			
			try {
				connection = dataSource.getConnection();
				String query = "select * from mvc_board where bid = ?";
				
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1,Integer.parseInt(sbid));
				resultSet = preparedStatement.executeQuery();
				
				if(resultSet.next()) {
					int bid = resultSet.getInt("bid");
					String bName = resultSet.getString("bName");
					String bTitle = resultSet.getString("bTitle");
					String bContent = resultSet.getString("bContent");
					Timestamp bDate = resultSet.getTimestamp("bDate");
					
					dto = new BDto(bid, bName, bTitle, bContent, bDate);
				}
				
				
			
				
			}catch (Exception e) {
				e.printStackTrace();
			
			}finally {
				try {
					if(resultSet != null) resultSet.close();
					if(preparedStatement != null) preparedStatement.close();
					if(connection != null) connection.close();
					//안하면 쓰레기가 데이터 베이스 쪽 메모리 에 쌓임 
				}catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			return dto;
		
	}//contentview
	
	public void modify(String bid, String bName,String bTitle, String bContent) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "Update mvc_board set bName = ?,bTitle = ?,bContent = ?,bDate = now() where bid = ?";
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, bName);
			preparedStatement.setString(2, bTitle);
			preparedStatement.setString(3, bContent);
			preparedStatement.setString(4, bid);
			
			preparedStatement.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				//안하면 쓰레기가 데이터 베이스 쪽 메모리 에 쌓임 
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	public void delete(String bid) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "delete from mvc_board where bid = ?";
			
			preparedStatement = connection.prepareStatement(query);
			//preparedStatement.setInt(1,Integer.parseInt( bid));
			preparedStatement.setString(1, bid);
			
			preparedStatement.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
				//안하면 쓰레기가 데이터 베이스 쪽 메모리 에 쌓임 
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	
}
