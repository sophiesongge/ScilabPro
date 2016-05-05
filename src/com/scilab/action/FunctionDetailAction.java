package com.scilab.action;

//import java.util.Date;
import java.util.List;

//import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.apache.struts2.ServletActionContext;
//import org.hibernate.HibernateException;
//import org.hibernate.exception.DataException;

import com.scilab.dao.IBaseDao;
import com.scilab.dao.impl.BaseDao;

import com.scilab.pojo.*;


/**
 * @author steve
 *
 */
public class FunctionDetailAction extends BaseAction {

	private  IBaseDao dao = new BaseDao();
    
	
        	
        public String getAllFunctions()//throws HibernateException
        {  
        	HttpSession sess=getSession();
        	UserInfo userInfo=(UserInfo)sess.getAttribute("user");
        	System.out.println(userInfo.getUserName()+userInfo.getPassword()+"......");
        	long userid=userInfo.getUserId();
        	List list=dao.getAllItems("from FunctionInfo f where f.userId="+userid);
        	getRequest().setAttribute("list", list);
        	return "funList";
        	}
        
        public String getDetail()//throws HibernateException
        {  
        	String str_id = getRequest().getParameter("id");
        	Long id = Long.parseLong(str_id);
        	FunctionInfo functionInfo = (FunctionInfo)dao.findById(FunctionInfo.class, id);
        	Long userId=functionInfo.getUserId();
        	UserInfo userInfo = (UserInfo)dao.findById(UserInfo.class, userId);
        	getRequest().setAttribute("functionInfo", functionInfo);
        	getRequest().setAttribute("userInfo", userInfo);
        	return "funDetail";
        	}
        public String deleteById()
        {
        	String str_id = getRequest().getParameter("id");
        	Long id = Long.parseLong(str_id);
        	FunctionInfo functionInfo = (FunctionInfo)dao.findById(FunctionInfo.class, id);
        	boolean b=dao.deleObj(functionInfo);
        	return this.getAllFunctions();
        	
        }
        
        public String getReleasedFunList()
        {
        	List list=dao.getAllItems("from FunctionInfo f where f.funStatue="+1);
        	getRequest().setAttribute("list", list);
        	return "allfunList";
        }
        public String getReleasedFunDetail()
        {
        	String str_id = getRequest().getParameter("id");
        	Long id = Long.parseLong(str_id);
        	FunctionInfo functionInfo = (FunctionInfo)dao.findById(FunctionInfo.class, id);
        	Long userId=functionInfo.getUserId();
        	UserInfo userInfo = (UserInfo)dao.findById(UserInfo.class, userId);
        	getRequest().setAttribute("functionInfo", functionInfo);
        	getRequest().setAttribute("userInfo", userInfo);
        	return "funDetail";
        }
      
      /*  public static List getAllFunctionRealeased()
        {
        	return dao.getAllItems("from FunctionInfo f where f.funStatue=1");
        	
        }
        public static FunctionInfo getFunInfoById(long id1){
        	functionInfo=(FunctionInfo)dao.findById(FunctionInfo.class,id1); 
        	return functionInfo;      	
        	
        }
        public static UserInfo getUserInfoById(long id2){
        	userInfo=(UserInfo)dao.findById(UserInfo.class, id2);
        	return userInfo;
        }
        //测试方法
   /*     public static void main(String[]args){
        	List list=FunctionDetailAction.getAllFunctions();
        	if(!list.isEmpty()){
        		FunctionInfo finfo=(FunctionInfo)list.get(0);
        		System.out.println(finfo.getFunName());
        	}
        }
}
       
        String funname;
        String funcontent;
        String funhelp;
        String funexemple;
        Date savetime;
        String funstatue; 
        List list=FunctionDetailAction.getAllFunctions();
        public String execute(){
        	for(int i=0;i<list.size();i++)
           {        	    
        	    FunctionInfo finfo=(FunctionInfo)list.get(i);
        	    funname=finfo.getFunName();
        	    funcontent=finfo.getFunContent();
        	    funhelp=finfo.getFunHelp();
        	    funexemple=finfo.getFunExample();  
        	    savetime=finfo.getSaveTime();
        	 
        	   int m=finfo.getFunStatue();
        	   if(m==0)
        		    funstatue="未发布";
        		   else  {funstatue="已发布"; }  
             }
			return "success";  
        }
          
            
            public String getfunname(){
        		return funname;
        	};
        	 public String getfuncontent(){
         		return funcontent;
         	}; 
         	public String getfunhelp(){
        		return funhelp;
        	}; 
        	public String getfunexemple(){
        		return funexemple;
        	};
        	public Date getsavetime(){
        		return savetime;
        	}; 
           


        */
}