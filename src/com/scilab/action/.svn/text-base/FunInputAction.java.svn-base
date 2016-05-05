package com.scilab.action;

import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.scilab.action.BaseAction;
import com.scilab.dao.IBaseDao;
import com.scilab.dao.impl.BaseDao;
import com.scilab.pojo.FunctionInfo;
import com.scilab.pojo.UserInfo;



public class FunInputAction extends BaseAction {
	private IBaseDao dao = new BaseDao();
	private FunctionInfo functionInfo;
	private String msg;
	private String Username;
	private UserInfo user;
	
	public String getUsername() {
		return Username;
	}



	

	public FunctionInfo getFunctionInfo() {
		return functionInfo;
	}

	public void setFunctionInfo(FunctionInfo functionInfo) {
		this.functionInfo = functionInfo;
	}

	public String Input() {
		functionInfo.setFunStatue(0);
		Date saveTime = new Date();
		functionInfo.setSaveTime(saveTime);
		
		long uid;
		HttpServletRequest request = ServletActionContext.getRequest();			
		HttpSession sess=request.getSession();
		user=(UserInfo)sess.getAttribute("user");
		if (user == null) {
			UserInfo userinfo_tmp = new UserInfo();
			userinfo_tmp.setUserId((long) new Random().nextInt(10000) + 10000);//创建用户ID大于10000的session以区别注册用户
			System.out.println(userinfo_tmp.getUserId());
			userinfo_tmp.setUserName("usertmp");
			getSession().setAttribute("usertmp", userinfo_tmp);
			uid = userinfo_tmp.getUserId();

		} else {
			uid = user.getUserId();
		}
		if(uid>10000){
			msg="Ooops! You CANNOT publish your function AS A VISITOR! Please regist!";
			return "Inputsucc";
		}else{
		functionInfo.setUserId(uid);
		
		Username=user.getUserName();
		
		String regEx1="function"; 
		String regEx2="endfunction";
		    
		    Pattern p1=Pattern.compile(regEx1);
		    Matcher m1=p1.matcher(functionInfo.getFunContent());
	        boolean result1=m1.find();
	        
	        Pattern p2=Pattern.compile(regEx2);
		    Matcher m2=p2.matcher(functionInfo.getFunContent());
	        boolean result2=m2.find();
	        if(result1 || result2){
		boolean valid = true;
		if (functionInfo.getFunName() == null
				|| functionInfo.getFunName().equals(""))
			valid = false;
		if (functionInfo.getFunContent() == null
				|| functionInfo.getFunContent().equals(""))
			valid = false;
		if (functionInfo.getFunExample() == null
				|| functionInfo.getFunExample().equals(""))
			valid = false;
		if (functionInfo.getFunHelp() == null
				|| functionInfo.getFunHelp().equals(""))
			valid = false;
		
		   if (valid) {
			boolean b = dao.saveObj(functionInfo);

			if (b) {
				msg = "Congratulations!! "+Username +"“" +functionInfo.getFunName() + "” uploaded successfully! "
						+ " Operation time : " + functionInfo.getSaveTime();
			} else {
				msg = " Ooops!! “" + functionInfo.getFunName()
						+ "”upload Failed! Please try later! " + " Error time: "
						+ functionInfo.getSaveTime();
			}
		} else {
			msg = "Ouch~ some of your blanks are still empty ! Please fullfill them !";
		}
	        }else{
				msg="It's a pity !! But your function is not in a propre form !! (Have 'function' and 'endfunction' at least..)";
			}
		return "Inputsucc";
	}
	}
	

	public String getMsg() {
		return msg;
	}

}