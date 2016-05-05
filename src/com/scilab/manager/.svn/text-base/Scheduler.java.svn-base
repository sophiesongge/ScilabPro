package com.scilab.manager;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.dom4j.DocumentException;

import com.scilab.util.LinuxLocalIP;

/**
 * Scheduler.java Description: 任务监视器<br>
 * 任务提交后执行任务列表中的任务<br>
 * 对任务根据调度器所分配的服务节点进行设置<br>
 * 然后执行任务的run方法，提交到节点服务器进行计算
 * 
 * @author wangadong
 * @version 1.0
 */
public class Scheduler implements Runnable {
	final ExecutorService exec;// 声明任务执行器
	private Task currentTask;
	private String hostIP;// 主机IP地址

	/**
	 * Scheduler构造函数<br>
	 * 无参数<br>
	 * 初始化主机IP地址及任务执行器
	 * 
	 */
	public Scheduler() {
		exec = Executors.newSingleThreadExecutor();// 定义单线程任务执行器
		System.out.println("Executor Started");
		try {
			if (System.getProperty("os.name").equals("Linux"))
				hostIP = LinuxLocalIP.getLocalIP();// 获取Linux主机IP
			else
				hostIP = NodesManager.getHostIP();// 从节点管理器中获取主机ip地址
			if (hostIP.length() < 7) {

				hostIP = InetAddress.getLocalHost().getHostAddress().toString();// 若xml中未设置主机IP则自动获取
			}

		} catch (DocumentException e) {

		} catch (UnknownHostException e) {
			System.out
					.println("Please check your Host IPAddress configuration");
			e.printStackTrace();
		}
	}

	public void run() {

		while (!exec.isShutdown()) {

			while (!ScilabTaskHost.getInstance().getTaskList().isEmpty()) {
				currentTask = (Task) ScilabTaskHost.getInstance().getTaskList()
						.pop();// 如果任务列表不为空则从任务列表中弹出一个最先提交的任务

				if (currentTask != null) {
					SciNode currentNode = TaskDispatcher.getInstance()
							.getCurrentNode();// 任务调度器返回一个当前可用的计算节点
					currentTask.setNodesId(currentNode.getID());
					currentTask.setNodesIp(currentNode.getIPAddress());
					currentTask.setNodeName(currentNode.getNodeName());
					currentTask.setHostIP(currentNode.getHostIP());// 设置任务节点信息
					exec.execute(currentTask);// 提交当前任务到计算节点服务
					TaskDispatcher.getInstance().addTaskToNode(
							currentNode.getID());// 当前节点任务数加1
					currentTask.setStatue("SUBMITTED");
					ScilabTaskHostService.setTaskMap(currentTask);// 更新任务状态到已提交
					System.out.println("任务节点号" + currentTask.getNodesId());
					System.out.println("nodeiP" + currentTask.getNodesIp());
					System.out.println("currentNodesTaskNum:"
							+ currentNode.getTaskNumCnt());
				}
				System.out.println(currentTask.getStatue());
				currentTask = null;
			}
		}
	}
}
