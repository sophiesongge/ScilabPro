package com.scilab.manager;

import java.io.File;
import java.rmi.RemoteException;

import org.apache.axis2.AxisFault;
import client.DistributedServiceStub;

/**
 * Scilab任务<br>
 * 实现Runnable接口，可由Scheduler类中的执行器执行
 * 
 * @author wangadong
 * 
 */
public class Task implements Runnable {
	private static int nodesId = 0;// 初始化节点ID
	String statue = "QUEUEING";
	private String taskName;// 任务名
	private String nodesIp;// 节点服务IP地址
	private String hostIP;// 主机IP地址
	private String nodeName;
	private String content;// scilab代码
	private String taskQueryId;// 任务查询ID
	private String resultFolder;// 任务结果保存路径

	/**
	 * 任务构造函数
	 * 
	 * @param taskname
	 *            任务名
	 * @param content
	 *            scilab代码
	 * @param userId
	 *            用户ID
	 * @param resultFolder
	 *            结果保存路径
	 */
	public Task(String taskname, String content, long userId,
			String resultFolder) {
		this.taskName = taskname;
		this.content = content;
		this.taskQueryId = userId + taskname;
		this.resultFolder = resultFolder;
		System.out.println("Create Task-" + taskname + " belong to " + userId);
	}

	/**
	 * 任务保存路径的创建及任务的提交<br>
	 * 将任务代码提交给节点计算服务(由axis2实现的Webservice)
	 */
	public void run() {

		try {
			File myFilePath = new File(resultFolder).getParentFile();
			if (!myFilePath.exists()) {
				myFilePath.mkdirs();
				System.out.println("成功创建" + resultFolder);
			} else {
				if (deleteFile(myFilePath))
					System.out.println("删除成功");
				;
				if (!myFilePath.exists())
					System.out.println("成功更新");
				myFilePath.mkdirs();
			}// 创建保存路径的文件夹
			String str = "C:/ScilabDistribution/tomcat6.0/webapps";
			String submitFolder = str
					+ resultFolder.split("webapps")[1];
			DistributedServiceStub stub = new DistributedServiceStub(
					"http://"
							+ nodesIp
							+ ":8080/axis2/services/DistributedService.DistributedServiceHttpSoap12Endpoint/");// 创建axis服务的
			DistributedServiceStub.SubmitTask host = new DistributedServiceStub.SubmitTask();
			host.setCodes(content.replaceAll("\n", "NewLineChar"));// 由于服务中命令行参数的传递会使换行符丢失，因此先将代码中的换行符用“NewLineChar”代替，再传入后再恢复，以解决命令行参数的问题

			host.setSavePath(submitFolder);
			host.setHostIP(hostIP);
			stub.submitTask(host);// 执行计算服务中的submitTask方法
			// System.out.println(content + resultFolder);
		} catch (AxisFault e) {
			e.printStackTrace();
			System.out.println("服务节点" + getNodesId() + "Connection Error");
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		System.out.println(Thread.currentThread().toString() + "execute Task-"
				+ taskName + " is " + "completed ");
	}

	public void setStatue(String statue) {
		this.statue = statue;
	}

	public String getStatue() {
		return this.statue;
	}

	public String getResultFolder() {
		return this.resultFolder;
	}

	public String getNodesIp() {
		return nodesIp;
	}

	public void setNodesIp(String nodesIp) {
		this.nodesIp = nodesIp;
	}

	public String getHostIP() {
		return hostIP;
	}

	public void setHostIP(String hostIP) {
		this.hostIP = hostIP;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTaskQueryId() {
		return this.taskQueryId;
	}

	/**
	 * 删除多级文件夹及其内容，用于结果文件的更新
	 * 
	 * @param f
	 *            文件或文件夹的路径
	 * @return
	 */
	public boolean deleteFile(File f) {
		if (f.exists()) {
			if (f.isFile())
				return f.delete();
			else if (f.isDirectory()) {
				File[] files = f.listFiles();
				for (int i = 0; i < files.length; i++) {
					if (!deleteFile(files[i]))
						return false;
				}
				return f.delete();
			} else
				return false;
		} else
			return true;
	}

	public void setNodesId(int nodesId) {
		Task.nodesId = nodesId;
	}

	public int getNodesId() {
		return nodesId;
	}

	public String getNodeName() {
		return this.nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}
}