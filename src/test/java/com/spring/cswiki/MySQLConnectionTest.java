package com.spring.cswiki;

import java.sql.*;
import org.junit.Test;

public class MySQLConnectionTest {
	static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	static final String URL = "jdbc:mysql://localhost:3306/spring?characterEncoding=UTF-8&amp";
	static final String USERNAME = "root";
	static final String PASSWORD = "3304";
	
	@Test
	public void getMySQLConnectionTest() {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			System.out.println("MYSQL Connection TEST START");
			Class.forName(DRIVER);
			
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.createStatement();
			
			String sql = "SELECT SUBJECT, CONTENT, NAME FROM BOARD";
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String boardSubject = rs.getString("SUBJECT");
				String boardContent = rs.getString("CONTENT");
				String boardWriter = rs.getString("NAME");
				
				System.out.print("boardSubject : " + boardSubject + ", ");
				System.out.print("boardContent : " + boardContent + ", ");
				System.out.print("boardWriter : " + boardWriter + ", ");
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch(SQLException e){
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!= null) {
					stmt.close();
				}
			}catch (SQLException e) {
				e.printStackTrace();
			}try {
				if(conn!=null) {
					conn.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("SQL 테스트를 종료합니다.");
	}
}
