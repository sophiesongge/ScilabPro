package com.scilab.manager;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Map;
import org.dom4j.DocumentException;
/**
 * 任务调度器<br>
 * 实现了任务根据节点优先值进行分配<br>
 * Singleton模式
 * 
 * @author wangadong
 * @version 1.0
 * @see Scheduler
 * @see NodesManager
 */
public class TaskDispatcher extends Thread {
	private static final TaskDispatcher _INSTANCE = new TaskDispatcher();//定义全局唯一实例
	private static Map<Integer, SciNode> nodesMap;//定义节点信息Map
	private static LinkedList<SciNode> nodelist = new LinkedList<SciNode>();//节点列表，用于节点排序
/**
 * 返回全局唯一实例
 * @return 任务调度器实例
 */
	public synchronized static TaskDispatcher getInstance() {
		return _INSTANCE;
	}
/**
 * 任务调度器构造函数<br>
 * 初始化节点信息
 */
	public TaskDispatcher() {
		try {
			nodesMap = NodesManager.getAllNodes();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
/**
 * 提交任务后，此节点任务数加1
 * @param NodeId 节点ID
 */
	public void addTaskToNode(int NodeId) {
		if (nodesMap.containsKey(NodeId)) {
			SciNode tmpNode = nodesMap.get(NodeId);
			tmpNode.plusTaskCnt();
			nodesMap.put(NodeId, tmpNode);
		}
	}
/**
 * 任务完成后，此节点任务数减1
 * @param NodeId 节点ID
 */
	public void minusTaskToNode(int NodeId) {
		if (nodesMap.containsKey(NodeId)) {
			SciNode tmpNode = nodesMap.get(NodeId);
			System.out.println(tmpNode.getTaskNumCnt());
			tmpNode.minusTaskCnt();
			System.out.println(tmpNode.getTaskNumCnt());
			nodesMap.put(NodeId, tmpNode);
		}
	}
/**
 * 获取当前最优节点
 * @return SciNode 节点
 */
	public SciNode getCurrentNode() {
		// if (nodelist.isEmpty()) {
		Collection<SciNode> list = nodesMap.values();
		System.out.println(list);
		nodelist.addAll(list);
		Collections.sort(nodelist);
		// }
		return nodelist.pop();

	}

	@Override
	public void run() {
		super.run();
	}

}
