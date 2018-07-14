//20163623 王莉
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletSecurityElement;

import Util.DBUtil;
import Util.UserException;

import model.User;

public class UserDaoImpl implements IUserDao{

	@Override
	public void add(User user) {//增
		//获得链接对象
				Connection connection = DBUtil.getConnection();
				//准备sql语句
				String sql;
				//创建语句传输对象
				PreparedStatement preparedStatement = null;
				ResultSet resultSet = null;
				try {
					sql="insert into T_USER(USER_ID,USER_NAME,PASSWORD) values(SCOTT.user_id.nextval,'"+user.getUsername()+"','"+user.getPassword()+"')";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					//关闭资源
					DBUtil.close(resultSet);
					DBUtil.close(preparedStatement);
					DBUtil.close(connection);
				}
				
			}

	@Override
	public void delete(int id) {//删
		Connection connection = DBUtil.getConnection();
		String sql = "delete from T_USER where USER_ID = ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		
		
	}
	

	@Override
	public void update(User user) {//改
		
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "update T_USER set USER_NAME=?,PASSWORD=? where USER_ID = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		try {
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setInt(3, user.getUser_id());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public User load(int id) {//查
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from T_USER where USER_ID = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1,id);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
			    user.setUser_id(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USER_NAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}
	
	@Override
	public User load_username(String username) {//查
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from T_USER where USER_NAME = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,username);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
			    user.setUser_id(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USER_NAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  user;
	}

	@Override
	public 	List<User> load_users() {//查询全部
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from T_USER";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<User> users = new ArrayList<User>();
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				user = new User();
			
				user.setUser_id(resultSet.getInt("USER_ID"));
				user.setUsername(resultSet.getString("USER_NAME"));
				user.setPassword(resultSet.getString("PASSWORD"));
				
				users.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  users;
	}
	
}

		
	


