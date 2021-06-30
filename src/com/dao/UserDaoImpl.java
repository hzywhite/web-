package com.dao;
 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import com.entity.User;
import com.util.DBconn;
 
public class UserDaoImpl implements UserDao{

	//用户注册
  	public boolean register(User user) {
  		boolean flag = false;
  		DBconn.init();
  		int i = DBconn.addUpdDel("insert into users(name,IDNum,phone,password) " +
  				"values('"+user.getName()+"','"+user.getIDNum()+"','"+user.getPhone()+"','"+user.getPassword()+"')");
  		if(i>0){
  			flag = true;
  		}
  		System.out.println("register:flag="+flag);
  		DBconn.closeConn();
  		return flag;
  	}
  	
	//用户登陆
    public boolean login(String phone, String pwd) {
		boolean flag = false;
		try {
			DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from users where phone='"+phone+"' and password='"+pwd+"'");
			while(rs.next()){
                if(rs.getString("phone").equals(phone) && rs.getString("password").equals(pwd)){
                    flag = true;
                }
            }
			System.out.println("login:flag="+flag);
			DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
    //管理员登陆
    public boolean managerLogin(String managerID, String pwd) {
		boolean flag = false;
		try {
			DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from managers where managerID='"+managerID+"' and password='"+pwd+"'");
			while(rs.next()){
                if(rs.getString("managerID").equals(managerID) && rs.getString("password").equals(pwd)){
                    flag = true;
                }
            }
			System.out.println("login:flag="+flag);
			DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	//用户信息更新
	public boolean update(User user) {
		boolean flag = false;
        DBconn.init();
        String sql ="update users set name ='"+user.getName()
                +"' , IDNum ='"+user.getIDNum()
                +"' , password ='"+user.getPassword()+"' where phone = "+user.getPhone();
        int i =DBconn.addUpdDel(sql);
        if(i>0){
            flag = true;
        }
        System.out.println("update:flag="+flag);
        DBconn.closeConn();
        return flag;
	}
	
  	//查询用户
	public List<User> getUserAll() {
		List<User> list = new ArrayList<User>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from users");
			while(rs.next()){
				User user = new User();
				user.setIDNum(rs.getString("IDNum"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setPassword(rs.getString("password"));
				list.add(user);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//删除用户
  	public boolean delete(String phone) {
  		boolean flag = false;
  		DBconn.init();
  		String sql = "delete from users where phone="+phone;
  		int i =DBconn.addUpdDel(sql);
  		if(i>0){
  			flag = true;
  		}
  		System.out.println("delete:flag="+flag);
  		DBconn.closeConn();
  		return flag;
  	}
    
}