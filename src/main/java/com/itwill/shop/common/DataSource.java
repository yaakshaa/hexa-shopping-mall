package com.itwill.shop.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataSource {

	private String driverClass = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "shp"; 
	private String password = "shp"; 

	public DataSource() throws Exception {
		Class.forName(driverClass);
	}

	public Connection getConnection() throws Exception {
		return DriverManager.getConnection(url, user, password);
	}
}
