package com.scilab.action;

import java.io.*;
import java.util.*;

import com.scilab.dao.impl.TaskDao;
import com.scilab.manager.ScilabTaskHost;
import com.scilab.manager.ScilabTaskHostService;
import com.scilab.manager.Task;
import com.scilab.pojo.TaskInfo;
import com.scilab.pojo.UserInfo;

/**
 * action 获取结果，查询状态，保存任务
 * 
 * @author wangadong
 * @version 1.0
 * @see ScilabTaskHost
 * 
 * 
 */
public class CheckTask extends BaseAction {
	private String taskname;// 任务名，与页面对应
	private String resultFolder;// 任务结果保存路径
	private String taskStatue;// 任务状态
	private UserInfo userinfo;// 用户信息
	private TaskDao dao = new TaskDao();// 任务信息与数据库接口
	private Long userId;// 用户ID
	private String resultContent;// scilab代码，与页面代码对应
	private File file;
	private String imgPath;// 结果图片保存相对地址
	private String nodeName;
	private String nodeIP;

	/**
	 * 获取结果<br>
	 * 从结果文档中读取结果并存为字符串在页面显示
	 * 
	 * 
	 * @return String 页面跳转字段
	 */
	@SuppressWarnings("deprecation")
	public String getResult() {
		imgPath = null;
		// 获取当前用户session，并得到用户ID
		userinfo = (UserInfo) getSession().getAttribute("user");
		if (userinfo == null) {
			userinfo = (UserInfo) getSession().getAttribute("usertmp");
		}
		userId = userinfo.getUserId();
		System.out.println(userId + taskname);
		if (ScilabTaskHostService.isExist(userId + taskname)) {
			resultFolder = ScilabTaskHostService.getResult(userId + taskname);// 根据任务查询ID获取结果保存路径
			nodeName=ScilabTaskHostService.getTaskByQueryId(userId + taskname).getNodeName();
			nodeIP=ScilabTaskHostService.getTaskByQueryId(userId + taskname).getNodesIp();
		} else
			return "resultFail";// 若不存在此任务则跳转到错误页面
		// 若存在图像，则提取图像保存路径
		if (new File(getRequest().getRealPath("/") + "ScilabResult/" + userId
				+ "/" + taskname + "/" + "figure0.png").exists()) {
			System.out.println(getRequest().getRealPath("/") + "ScilabResult/"
					+ userId + "/" + taskname + "/" + "figure0.png");
			imgPath = "ScilabResult/" + userId + "/" + taskname + "/"
					+ "figure0.png";
		} else
			imgPath = null;
		// 从结果文档中读取字符流并保存为字符串格式
		if (resultFolder != null) {
			try {
				file = new File(resultFolder);
				InputStreamReader isr = new InputStreamReader(
						new FileInputStream(file), "UTF-8");
				BufferedReader br = new BufferedReader(isr);
				String line = null;
				StringBuffer result = new StringBuffer();
				while ((line = br.readLine()) != null) {
					result.append(line);
					result.append("<br>");// 添加页面换行符
				}
				resultContent = result.toString();
				System.out.println(resultContent);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				return "resultFail";//结果文件不存在，跳转查询失败页面
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "resultSucc";
		}
		return "resultFail";
	}

	/**
	 * 获取当前任务状态
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getStatue() throws IOException {
		// 获取任务查询ID
		userinfo = (UserInfo) getSession().getAttribute("user");
		if (userinfo == null) {
			userinfo = (UserInfo) getSession().getAttribute("usertmp");
		}
		userId = userinfo.getUserId();
		System.out.println(userId + taskname);
		// Ajax
		getResponse().setContentType("text/html; charset=utf-8");
		getResponse().setHeader("Cache-Control", "no-cache"); // 不定义缓存
		getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = getResponse().getWriter();
		taskStatue=ScilabTaskHostService.getTaskStatue(userId + taskname);// 获取任务状态
		out.write(taskStatue);
		out.close();// 输出状态内容
		System.out.println(taskStatue);
		return null;
	}

	/**
	 * 保存任务到数据库
	 * 
	 * @return null 调用ajax，不进行页面跳转
	 * @throws IOException
	 */
	public String saveTask() throws IOException {
		//获取任务查询ID
		userinfo = (UserInfo) getSession().getAttribute("user");
		if (userinfo == null) {
			userinfo = (UserInfo) getSession().getAttribute("usertmp");
		}
		userId = userinfo.getUserId();
		String saveStatue;
		//userID<10000为注册用户
		if (userId < 10000) {
			System.out.println(userId + taskname);
			saveStatue = "Unable to save !";
			// 判断该用户的该任务名是否存在
			if (ScilabTaskHost.getInstance().getTaskMap().containsKey(
					userId + taskname)) {
				Task task = ScilabTaskHostService.getTaskByQueryId(userId
						+ taskname);
				//将当前任务保存成数据库POJO类
				TaskInfo taskinfo = dao.isExist(task.getTaskName(), userId);
				if (taskinfo == null) {
					taskinfo = new TaskInfo();
				}
				taskinfo.setTaskName(task.getTaskName());
				taskinfo.setUserId(userId);
				taskinfo.setTaskStatue(task.getStatue());
				taskinfo.setTaskContent(task.getContent());
				taskinfo.setResultFolder(task.getResultFolder());
				taskinfo.setSaveTime(new Date());
				taskinfo.setNodeID(task.getNodesId());//执行任务的节点ID
				TaskDao dao = new TaskDao();//建立数据库连接
				//保存任务到数据库
				if (dao.saveOrUpdateTask(taskinfo)) {
					saveStatue = "Task saved successfully !";
				}
			}
		} else {
			saveStatue = "Ooops! You can't save the task as a visitor!";//若用户ID>10000,则为游客访问，不允许保存任务
		}
		//Ajax
		getResponse().setContentType("text/html; charset=utf-8");
		getResponse().setHeader("Cache-Control", "no-cache"); // 不定义缓存
		getResponse().setCharacterEncoding("utf-8");
		PrintWriter out = getResponse().getWriter();
		out.write(saveStatue);
		out.close();
		return null;//Ajax输出，不进行页面跳转
	}

	public String getTaskStatue() {
		return taskStatue;
	}

	public void setTaskStatue(String taskStatue) {
		this.taskStatue = taskStatue;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getResultContent() {
		return resultContent;
	}

	public void setResultContent(String resultContent) {
		this.resultContent = resultContent;
	}

	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}

	public String getResultFolder() {
		return resultFolder;
	}

	public void setResultFolder(String resultFolder) {
		this.resultFolder = resultFolder;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		nodeName = nodeName;
	}

	public void setNodeIP(String nodeIP) {
		this.nodeIP = nodeIP;
	}

	public String getNodeIP() {
		return nodeIP;
	}
}
