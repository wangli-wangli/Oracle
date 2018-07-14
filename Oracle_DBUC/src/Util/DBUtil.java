//20163623 王莉
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class DBUtil {
	    //创建数据库连接
	    public static Connection getConnection() {
	    	// 数据库驱动类
		     String dbDriver = "oracle.jdbc.driver.OracleDriver";
		    // 连接数据库url
		   String dbURL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		    // 连接数据库用户名
		    String dbUser = "SCOTT";
		    // 连接数据库密码
		   String dbPwd = "tiger";
		    // 获取数据库连接方法, 返回Connection对象
		     Connection con = null;
		    //数据执行语句
		    Statement stat = null;
		    String sql = null;
		    ResultSet rs = null;
	        try {
	// 加载数据库驱动
	            Class.forName(dbDriver);
	            con = DriverManager.getConnection(dbURL, dbUser, dbPwd);
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        return con;

		
	}
	

	public static void close(Connection connection ) {
		try {
			if (connection != null) {
				connection.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement preparedStatement ) {
		try {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void close(ResultSet resultSet ) {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
