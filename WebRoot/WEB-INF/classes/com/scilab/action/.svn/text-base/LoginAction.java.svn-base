package com.scilab.action;

import java.io.IOException; 
import java.io.PrintWriter;

import com.scilab.dao.UserDao;
import com.scilab.dao.impl.UserDaoImpl;
import com.scilab.pojo.UserInfo;

public class LoginAction extends BaseAction {
	
	private UserDao dao = new UserDaoImpl();
	
	private UserInfo user;
	
	public String login(){
		getSession().removeAttribute("user");
		try{UserInfo uinfo = dao.login(user.getUserName(), user.getPassword());
		if(uinfo!=null){
			getSession().setAttribute("user", uinfo);
		}
		}catch(Exception e){
			e.printStackTrace();
			}
		//getRequest().put("message", message);
		return "Loginsucc";
		
	}
	
        public String pass() throws IOException{	
		getSession().getAttribute("user");
		String param = getRequest().getParameter("param");
		System.out.println(param);
		param = new String(param.getBytes("iso-8859-1"), "utf-8");
		//return isLogin();
		getResponse().setContentType("text/html; charset=utf-8"); 
		getResponse().setHeader("Cache-Control", "no-cache"); //不定义缓存
		getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = getResponse().getWriter();
		out.write("这是AJAX返回的内容！");
		out.close();
		System.out.println("good");
		return null;
	}


	public UserInfo getUser() {
		return user;
	}


	public void setUser(UserInfo user) {
		this.user = user;
	}


}
