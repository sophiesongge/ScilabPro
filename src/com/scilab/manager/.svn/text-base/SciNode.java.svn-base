package com.scilab.manager;

import org.apache.commons.lang.Validate;

/**
 * Description: 分布式节点服务器的信息类
 * 
 * @author wangadong
 * 
 */
public class SciNode implements Comparable<SciNode> {
	private int ID;// 节点ID
	private String NodeName;// 节点服务器名
	private String IPAddress;// IP地址
	private int CpuCoreNum;// 节点服务器CPU核心数
	private volatile int TaskNumCnt;// 节点正在运行任务数
	private float MainFrequence;// 节点服务器CPU主频
	private float NodePriorityValue;// 节点调度优先值
	private String HostIP;//与节点对应的主服务器地址

	/**
	 * 节点信息构造函数
	 * 
	 * @param ID
	 *            节点ID
	 * @param NodeName
	 *            节点服务器名
	 * @param IPAddress
	 *            IP地址
	 * @param CpuCoreNum
	 *            节点服务器CPU核心数
	 * @param MainFrequence
	 *            节点服务器CPU主频
	 */
	public SciNode(int ID, String NodeName, String IPAddress,String HostIP, int CpuCoreNum,
			float MainFrequence) {
		this.ID = ID;
		this.NodeName = NodeName;
		this.IPAddress = IPAddress;
		this.HostIP=HostIP;
		this.CpuCoreNum = CpuCoreNum;
		this.MainFrequence = MainFrequence;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getNodeName() {
		return NodeName;
	}

	public void setNodeName(String nodeName) {
		NodeName = nodeName;
	}

	public String getIPAddress() {
		return IPAddress;
	}

	public void setIPAddress(String iPAddress) {
		IPAddress = iPAddress;
	}

	public int getCpuCoreNum() {
		return CpuCoreNum;
	}

	public void setCpuCoreNum(int cpuCoreNum) {
		CpuCoreNum = cpuCoreNum;
	}

	public int getTaskNumCnt() {
		return TaskNumCnt;
	}

	public void plusTaskCnt() {
		TaskNumCnt++;
	}

	public void minusTaskCnt() {
		if (TaskNumCnt != 0)
			TaskNumCnt--;
	}

	public void setTaskNumCnt(int taskNumCnt) {
		TaskNumCnt = taskNumCnt;
	}

	/**
	 * 获取节点优先值<br>
	 * 优先值计算公式为NodePriorityValue = CpuCoreNum * MainFrequence / TaskNumCnt
	 * 即优先分配任务到任务较少的节点，若任务数相同则分配给运算能力较强的节点
	 * 
	 * @return float 节点当优先值
	 */
	public float getNodePriorityValue() {
		if (TaskNumCnt != 0)
			NodePriorityValue = CpuCoreNum * MainFrequence / TaskNumCnt;
		else
			NodePriorityValue = CpuCoreNum * MainFrequence / (float) 0.5;// 避免出现无穷大
		return NodePriorityValue;
	}

	public void setNodePriorityValue(long nodePriorityValue) {
		NodePriorityValue = nodePriorityValue;
	}

	public void setMainFrequence(float mainFrequence) {
		MainFrequence = mainFrequence;
	}

	public float getMainFrequence() {
		return MainFrequence;
	}

	public String getHostIP() {
		return HostIP;
	}

	public void setHostIP(String hostIP) {
		HostIP = hostIP;
	}

	/**
	 * 实现Comparable接口
	 */
	public int compareTo(SciNode o) {
		float arg0 = this.getNodePriorityValue();
		float arg1 = o.getNodePriorityValue();
		if (arg0 > arg1) {
			return -1;
		} else if (arg0 == arg1) {
			return 0;
		} else {
			return 1;
		}

	}
}