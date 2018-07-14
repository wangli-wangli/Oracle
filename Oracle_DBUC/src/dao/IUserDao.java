//20163623 王莉

package dao;

import java.util.List;


import model.User;

public interface IUserDao {
	public void add(User user);//增
	public void delete(int id);//删
	public void update(User user);//改
	public User load(int id);//查
	List<User> load_users();
	User load_username(String username);

}
