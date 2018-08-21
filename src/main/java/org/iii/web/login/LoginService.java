package org.iii.web.login;

import java.util.List;

import javax.inject.Inject;

import org.iii.web.login.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
//import javax.inject.Inject;
import org.springframework.stereotype.Service;

@Service("LoginService")
public class LoginService {
	
	@Inject
	private LoginRepository loginRepository;
	
	public String getUserName(String username) {
		
		try{
			String accountName = loginRepository.selectUser(username);
			return accountName;
			
		}
		catch(Exception e){
			System.out.print(e);
			return "error from LoginService";
		}
		
	}
	
	public String getUserEmail(String username) {
		
		try{
			String email = loginRepository.selectEmail(username);
			return email;
			
		}
		catch(Exception e){
			System.out.print(e);
			return "error from LoginService";
		}
		
	}

	public List getallUserinfo() {

			List alluserinfo = loginRepository.selectallUsers();
			return alluserinfo;
		
	}
	
	public int insertUser(String username, String password, String email, String enabled) {

		int updateCount = loginRepository.insertUser(username, password, email, enabled);
		return updateCount;
	
	}
	
	public void deleteUser(String username) {

		loginRepository.deleteUser(username);
	
	}
	//-----------------------------------
	public List getUserinfo(String username) {

		List userallinfo = loginRepository.selectUserall(username);
		return userallinfo;
	
	}
	public List selectUserlist() {

		List userlist = loginRepository.selectUserlist();
		return userlist;
	
	}
	public String selectUserfilenum(String username) {

		String userallfilenum = loginRepository.selectUserfilenum(username);
		return userallfilenum;
	}
	public String userlogincheck(String username) {

		String userlogincheck = loginRepository.userlogincheck(username);
		return userlogincheck;
	}
	public int updatetUser(String unitaddress,String unitname,String unitphone,String unitresponse,String uniturl,String unityear,String username) {

		int updateCount = loginRepository.updatetUser(unitaddress, unitname, unitphone, unitresponse, uniturl, unityear, username);
		return updateCount;
	
	}
}
