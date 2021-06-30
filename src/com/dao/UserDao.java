package com.dao;
 
import java.util.List;
import com.entity.User;
 
public interface UserDao {
	
	//用户注册
	public boolean register(User user);
	
	//用户登陆
	public boolean login(String name,String pwd);
	
	//用户信息更新
	public boolean update(User user);
	
	//查询用户
	public List<User> getUserAll();
	
	//删除用户
	public boolean delete(String phone);
	
}
