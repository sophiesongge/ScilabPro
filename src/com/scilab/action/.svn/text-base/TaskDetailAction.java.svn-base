package com.scilab.action;

import java.util.List;
import javax.servlet.http.HttpSession;
import com.scilab.dao.IBaseDao;
import com.scilab.dao.impl.BaseDao;
import com.scilab.pojo.*;

public class TaskDetailAction extends BaseAction{

	private  IBaseDao dao = new BaseDao();
	
	public String getAllTask()//throws HibernateException
    {  
    	HttpSession sess=getSession();
    	UserInfo userInfo=(UserInfo)sess.getAttribute("user");
    	long userid=userInfo.getUserId();
    	List list=dao.getAllItems("from TaskInfo f where f.userId="+userid);
    	getRequest().setAttribute("list", list);
    	return "taskList";
    	}
    
    public String getDetail()//throws HibernateException
    {  
    	String str_id = getRequest().getParameter("id");
    	Long id = Long.parseLong(str_id);
    	TaskInfo taskInfo = (TaskInfo)dao.findById(TaskInfo.class, id);
    	getRequest().setAttribute("taskInfo", taskInfo);
    	return "taskDetail";
	}
    
    public String deleteById()
    {
    	String str_id = getRequest().getParameter("id");
    	Long id = Long.parseLong(str_id);
    	TaskInfo taskInfo = (TaskInfo)dao.findById(TaskInfo.class, id);
    	boolean b=dao.deleObj(taskInfo);
    	return this.getAllTask();
    	
    }
	
}
