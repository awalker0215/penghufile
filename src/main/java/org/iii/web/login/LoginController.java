package org.iii.web.login;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class LoginController {
	@Resource(name = "LoginService")
	LoginService loginService;

	/*@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	            else
	            {
	            	String username = userDetail.getUsername();
	    			String useremail = loginService.getUserEmail(username);
	    			model.addObject("useremail", useremail);
	            }
	        }
		}

		model.setViewName("govdetail");
		return model;

	}*/
	//-----------------------------------
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("../../index");
		
		return model;
	}
	@RequestMapping(value = "/govdetail", method = RequestMethod.GET)
	public ModelAndView govdetailPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		String uname = "";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	            	String username = userDetail.getUsername();
	            	if(((String) request.getParameter("uname"))==null)
	            	{
	            		username = userDetail.getUsername();
	            	}
	            	else
	            	{
	            		username = (String) request.getParameter("uname");
	            	}
	            	uname = username;
	    			List userinfo = loginService.getUserinfo(username);
	    			model.addObject("userinfo", userinfo);
	    			//filenum
	    			String selectUserfilenum = loginService.selectUserfilenum(username);
	    			model.addObject("selectUserfilenum", selectUserfilenum);
	            }
	            else
	            {
	            	String username = userDetail.getUsername();
	            	uname = username;
	    			List userinfo = loginService.getUserinfo(username);
	    			model.addObject("userinfo", userinfo);
	    			//filenum
	    			String selectUserfilenum = loginService.selectUserfilenum(username);
	    			model.addObject("selectUserfilenum", selectUserfilenum);
	            }
	        }
		}
		
		if(loginService.userlogincheck(uname).equals("1"))
		{
			model.setViewName("govdetail");
		}
		else
		{
			model.clear();
			model.setViewName("unitSetting");
		}
		
		return model;
	}
	@RequestMapping(value = "/filedetail", method = RequestMethod.GET)
	public ModelAndView filedetailPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("filedetail");
		
		return model;
	}
	/*@RequestMapping(value = "/filelist", method = RequestMethod.GET)
	public ModelAndView filelistPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("filelistWithGovdetail");
		
		return model;
	}*/
	@RequestMapping(value = "/inventory", method = RequestMethod.GET)//filelist
	public ModelAndView inventoryPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("inventory");
		
		return model;
	}
	@RequestMapping(value = "/government", method = RequestMethod.GET)//govlist
	public ModelAndView governmentPage() {
		
		ModelAndView model = new ModelAndView();
		List userlist= loginService.selectUserlist();
		model.addObject("userlist", userlist);
		model.setViewName("unit");
		
		return model;
	}
	@RequestMapping(value = "/governmentsetting", method = RequestMethod.GET)
	public ModelAndView governmentsettingPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("unitSetting");
		
		return model;
	}
	@RequestMapping(value = "/fileupload", method = RequestMethod.GET)
	public ModelAndView fileuploadPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("upload");
		
		return model;
	}
	//----------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		
		String username = (String) request.getParameter("check_radio");
		loginService.deleteUser(username);
		
		System.out.println("delete "+username);
		
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	        }
			
		}
		
		model.setViewName("hello");
		
		return model;

	}
	
	@RequestMapping(value = "/helloworld2", method = RequestMethod.GET)
	public ModelAndView helloworldPage() {
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("helloworld3");
		
		return model;
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public ModelAndView commonPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();

		model.setViewName("insert");
		
		return model;

	}
	@RequestMapping(value = "/updategov", method = RequestMethod.POST)
	public ModelAndView updategovPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		
		String unitname = (String) request.getParameter("unitname");
		String unityear = (String) request.getParameter("unityear");
		String unitphone = (String) request.getParameter("unitphone");
		String unitresponse = (String) request.getParameter("unitresponse");
		String unitaddress = (String) request.getParameter("unitaddress");
		String uniturl = (String) request.getParameter("uniturl");
		//loginService.insertUser(username,password,email,"1");
		System.out.println(unitaddress+","+unitname+","+unitphone+","+unitresponse+","+uniturl+","+unityear);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {	           
	            String username = userDetail.getUsername();
	            loginService.updatetUser(unitaddress, unitname, unitphone, unitresponse, uniturl, unityear, username);
	        }
		}
		
		RedirectView redirectView = new RedirectView("/govdetail");
		model.setView(redirectView);
		//model.setViewName("unitSetting");
		return model;
		
	}
	@RequestMapping(value = "/insertpage", method = RequestMethod.POST)
	public ModelAndView insertPage(HttpServletRequest request,
			HttpServletResponse response) {
		
		ModelAndView model = new ModelAndView();
		
		String username = (String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		String email = (String) request.getParameter("email");
		loginService.insertUser(username,password,email,"1");
		System.out.println("insert a user");
		
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!!!");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			for (GrantedAuthority authority : userDetail.getAuthorities()) {
	            if (authority.getAuthority().equals("ROLE_ADMIN"))
	            {
	    			List alluserinfo = loginService.getallUserinfo();
	    			model.addObject("alluserinfo", alluserinfo);
	            }
	        }
		}
		
		model.setViewName("hello");
		
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!!");

		model.setViewName("admin");
		
		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "7");
		}

		if (logout != null) {
			model.addObject("msg", "7");
		}

		model.setViewName("login");
		return model;

	}
	
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;

	}
	//-----------upload------------------
	@RequestMapping(value = "/uploadpage", method = RequestMethod.POST)
	public ModelAndView uploadPage(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("file") MultipartFile file) {
		
		ModelAndView model = new ModelAndView();
		System.out.println("uploaded");
		if (!file.isEmpty()) {
            try {
                // 文件存放服务端的位置
                String rootPath = "d:/tmp";
                File dir = new File(rootPath + File.separator + "tmpFiles");
                if (!dir.exists())
                    dir.mkdirs();
                // 写文件到服务器
                File serverFile = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
                file.transferTo(serverFile);
               // return "You successfully uploaded file=" +  file.getOriginalFilename();
            } catch (Exception e) {
                //return "You failed to upload " +  file.getOriginalFilename() + " => " + e.getMessage();
            }
        } else {
            //return "You failed to upload " +  file.getOriginalFilename() + " because the file was empty.";
        }
		
		
		RedirectView redirectView = new RedirectView("/inventory");
		model.setView(redirectView);
		
		return model;

	}
}