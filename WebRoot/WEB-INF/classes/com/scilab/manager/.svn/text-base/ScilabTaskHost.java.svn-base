package com.scilab.manager;

import java.util.*;

/**
 * ScilabTaskHost.java Discription: Scilab任务管理器 负责任务的提交，保存，更新，查询等
 * singleton模式，全局唯一存在
 * 
 * @author wangadong
 * @version 1.0
 */
public class ScilabTaskHost {
	private static final ScilabTaskHost _INSTANCE = new ScilabTaskHost();// Singleton模式，实例初始化
	private static LinkedList<Task> TaskList;// 任务队列，FIFO法则
	private static HashMap<String, Task> TaskMap;

	/**
	 * 构造函数 初始化任务排除列表TaskList，保存任务信息的TaskMap 启动任务监视器线程及计算节点返回的结果文件的网络传输服务
	 */
	private ScilabTaskHost() {
		TaskList = new LinkedList<Task>();
		TaskMap = new HashMap<String, Task>();
		System.out.println("LIST AND MAP CREATE SUCCESSFULLLY!");
		new Thread(new Scheduler()).start();// 启动监视器线程
		new Thread(new SocketServer()).start();// 启动网络文件传输服务
	}

	/**
	 * 获取任务管理器实例
	 * 
	 * @return ScilabTaskHost:任务管理器实例
	 */
	public synchronized static ScilabTaskHost getInstance() {
		return _INSTANCE;
	}

	/**
	 * 返回任务列表
	 * 
	 * @return TaskList
	 */
	public LinkedList<Task> getTaskList() {
		return TaskList;
	}

	/**
	 * 添加及更新任务MAP信息
	 * 
	 * @param task
	 *            要添加或更新的任务
	 * @return boolean 是否添加或更新成功
	 */
	public boolean setTaskMap(Task task) {
		if (TaskMap.containsValue(task)) {
			TaskMap.put(task.getTaskQueryId(), task);// 以任务的查询ID为Key，任务为Value保存到TaskMap中
			System.out.println("update statue!");
		} else {
			TaskMap.put(task.getTaskQueryId(), task);
			System.out.println("this task is over and saved!");
		}
		return true;
	}

	/**
	 * 将提交任务到任务列表
	 * 
	 * @param taskname
	 *            任务名
	 * @param content
	 *            任务的scilab代码
	 * @param userId
	 *            用户ID
	 * @param resultFolder
	 *            任务保存路径
	 * @return boolean 任务是否提交成功
	 */
	public synchronized boolean submitTask(String taskname, String content,
			long userId, String resultFolder) {
		Task tasktmp = new Task(taskname, content, userId, resultFolder);// 构造新任务
		if (ScilabTaskHostService.setTaskMap(tasktmp)) {
			System.out.println("set task map success!");
		}
		return TaskList.add(tasktmp);// 将任务加入任务列表
	}

	/**
	 * 根据任务查询ID删除TaskMap中保存的任务信息
	 * 
	 * @param taskQueryId
	 * @return boolean 任务是否删除成功
	 */
	public boolean deleteTask(String taskQueryId) {
		if (TaskMap.containsKey(taskQueryId)) {
			TaskMap.remove(taskQueryId);
			return true;
		}

		return false;
	}

	/**
	 * 从TaskMap中根据任务查询ID获取任务
	 * 
	 * @param taskQueryId
	 *            任务查询ID(用户ID+任务名)
	 * @return 返回查询到的任务,如果不存在则返回null
	 */
	public Task getTaskByQueryId(String taskQueryId) {
		if (TaskMap.containsKey(taskQueryId)) {
			System.out.println("Get the task \"" + taskQueryId + "\""
					+ "successfully");
			return TaskMap.get(taskQueryId);
		} else {
			System.out.println(taskQueryId + " is not saved..");
		}
		return null;

	}

	/**
	 * 获取任务状态
	 * 
	 * @param taskQueryId
	 *            任务查询ID(用户ID+任务名)
	 * @return String 任务状态
	 */
	public String getTaskStatue(String taskQueryId) {
		System.out.println("people want to get the statue of task "
				+ taskQueryId);
		if (TaskMap.containsKey(taskQueryId)) {
			System.out.println("people want to get the statue of task "
					+ taskQueryId);
			return TaskMap.get(taskQueryId).getStatue();
		}
		return "TASKERROR ";
	}

	/**
	 * 获取任务结果
	 * 
	 * @param taskQueryId
	 *            任务查询ID(用户ID+任务名)
	 * @return String 任务结果保存路径
	 */
	public String getResult(String taskQueryId) {
		System.out.println("taskmap arrive");
		if (TaskMap.get(taskQueryId) != null)
			return TaskMap.get(taskQueryId).getResultFolder();
		return null;
	}

	/**
	 * 返回TaskMap
	 * 
	 * @return TaskMap
	 */
	public HashMap<String, Task> getTaskMap() {
		return TaskMap;
	}

	/**
	 * 判断任务是否存在
	 * 
	 * @param taskQueryId
	 * @return boolean 存在返回true,否则返回false
	 */
	public boolean isExist(String taskQueryId) {
		return TaskMap.containsKey(taskQueryId);
	}

}
