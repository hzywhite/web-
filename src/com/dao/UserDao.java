package com.dao;
 
import java.util.List;
import com.entity.User;
 
public interface UserDao {
	
	//�û�ע��
	public boolean register(User user);
	
	//�û���½
	public boolean login(String name,String pwd);
	
	//�û���Ϣ����
	public boolean update(User user);
	
	//��ѯ�û�
	public List<User> getUserAll();
	
	//ɾ���û�
	public boolean delete(String phone);
	
}
