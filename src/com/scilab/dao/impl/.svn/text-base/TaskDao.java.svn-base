package com.scilab.dao.impl;

import java.util.*;

import org.hibernate.Session;
import com.scilab.hibernate.HibernateSessionFactory;
import com.scilab.manager.Task;
import com.scilab.pojo.TaskInfo;
/**
 * 任务持久化接口
 * @author wangadong
 * @version 1.0
 * @see TaskAction
 */
public class TaskDao extends BaseDao {
	public boolean saveOrUpdateTask(TaskInfo taskinfo) {
		if (saveOrUpdateObj(taskinfo)) {
			return true;
		} else
			return false;
	}

	public HashMap<String, Task> getAllTaskFromDB() {
		HashMap<String, Task> map =new HashMap<String, Task>();
		List tasklist = getAllItems("from TaskInfo task");
		Iterator it = tasklist.iterator();
		while (it.hasNext()) {
			TaskInfo taskinfo = (TaskInfo) it.next();
			Task task = new Task(taskinfo.getTaskName(), taskinfo
					.getTaskContent(), taskinfo.getUserId(),taskinfo.getResultFolder());
			map.put(task.getTaskQueryId(), task);
		}
		return map;

	}
	public boolean deleteAllMyTaskIdFromDB(long userId){
		List tasklist=getAllItems("from TaskInfo task where task.userId="+userId);
		Iterator it=tasklist.iterator();
		while(it.hasNext()){
			TaskInfo taskinfo=(TaskInfo)it.next();
			deleObj((TaskInfo)taskinfo);
		}
		
		if(getAllItems("from TaskInfo task where task.userId="+userId).isEmpty())
			return true;
		else return false;
		
	}
	
	/**
	 * 判断某一用户的某一任务名是否存在
	 * @param taskName 任务名
	 * @param userId 用户ID
	 * @return 如果存在返回TaskInfo对象，否则返回null
	 */
	public TaskInfo isExist(String taskName, long userId){
		String hql = "from TaskInfo where taskName=? and userId=?";
		List list = this.findByHql(hql, new Object[]{taskName, userId});
		if(list.size()!=0){
			return (TaskInfo)list.get(0);
		}
		return null;
	}

	/*public static void main(String[] args) {
		TaskInfo taskinfo=new TaskInfo();
		taskinfo.setTaskName("taskName");
		taskinfo.setUserId((long)1);
		taskinfo.setTaskStatue(0);
		taskinfo.setTaskContent("dflksjlkdjf;alkdjf;alkjd");
		taskinfo.setResultFolder("dkjflkdsjfldksjf");
		taskinfo.setSaveTime(new Date());
		TaskDao dao=new TaskDao();
		dao.saveOrUpdateTask(taskinfo);
		HashMap map=new TaskDao().getAllTaskFromDB();
		System.out.println(map.isEmpty());
		System.out.println(dao.deleteAllMyTaskIdFromDB((long)1));
	}
*/
}
