package org.iii.web.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;






import javax.inject.Inject;
//import javax.inject.Inject;
import javax.sql.DataSource;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("LoginRepository")
@Transactional
public class LoginRepository {

	private JdbcTemplate jdbcTemplate;

	@Inject	
	public void init(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List selectallUsers() {
		String sql = "SELECT * FROM users";
		List<Map<String, Object>> list = this.jdbcTemplate.queryForList(sql);
		HashMap<Integer,String> topicMap = new HashMap<Integer,String>();			
		return list;

	}
	
	public String selectUser(String username){
		String sql = "SELECT username FROM users WHERE username =?" ; 
		String accountName = this.jdbcTemplate.queryForObject(sql,String.class,username); 
		return accountName ; 

	}
	
	public List selectUserall(String username){
		String sql = "SELECT * FROM users WHERE username =?" ; 
		List map = this.jdbcTemplate.queryForList(sql,username);		
		return map ; 

	}
	
	public String selectEmail(String username){
		String sql = "SELECT email FROM users WHERE username =?" ; 
		String email = this.jdbcTemplate.queryForObject(sql,String.class,username); 
		return email; 

	}
	
	public int insertUser(String username, String password, String email, String enabled)
	{ 
		String sql = "INSERT INTO users(username,password,email,enabled) VALUE(?,md5(?),?,?) ";
		int updateCount = jdbcTemplate.update(sql,
				new Object[] { username, password, email, enabled });
		return updateCount;

	}
	
	public void deleteUser(String username){
		String sql = "DELETE FROM users WHERE username =?" ; 
		this.jdbcTemplate.update(sql,username);	

	}
	public String selectUserfilenum(String username){
		String sql = "SELECT COUNT(pid) FROM publication WHERE username =?" ; 
		String userallfilenum = this.jdbcTemplate.queryForObject(sql,String.class,username); 
		return userallfilenum ; 

	}
	public List selectUserlist(){
		String sql = "SELECT u.*,COUNT(p.pid) as allc,Count(p.file) as fc,MAX(p.uploadTime) as lasttime FROM `users` as u left join publication as p on u.username = p.username group by u.username" ; 
		List map = this.jdbcTemplate.queryForList(sql);		
		return map ; 

	}
	public String userlogincheck(String username){
		String sql = "SELECT logined FROM users WHERE username =?" ; 
		String userlogincheck = this.jdbcTemplate.queryForObject(sql,String.class,username); 
		return userlogincheck ; 

	}
	public int updatetUser(String unitaddress,String unitname,String unitphone,String unitresponse,String uniturl,String unityear,String username)
	{ 
		String sql = "UPDATE users SET gName = ?,reponse = ?,address=?,year = ?,phone = ?,url = ?,logined=? WHERE username = ?;";
		int updateCount = jdbcTemplate.update(sql,
				new Object[] { unitname, unitresponse, unitaddress, unityear,unitphone,uniturl,"1",username });
		return updateCount;

	}
	//-----------------------------
	
}
