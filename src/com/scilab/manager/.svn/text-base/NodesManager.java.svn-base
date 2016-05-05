package com.scilab.manager;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 从NodesManager.xml文件中读取节点及服务器的配置信息并返回 此类用到了dom4j来实现xml到java的转化
 * 
 * @author wangadong
 * @version 1.0
 * 
 */
public class NodesManager {
	static Map<Integer, SciNode> nodesMap = new HashMap<Integer, SciNode>();// 保存从xml配置文件中提取的节点信息

	/**
	 * 返回所有节点信息
	 * 
	 * @return Map<Integer,SciNode>
	 * @throws DocumentException
	 */
	public static Map<Integer, SciNode> getAllNodes() throws DocumentException {
		SAXReader reader = new SAXReader();
		Document document = reader.read(Thread.currentThread()
				.getContextClassLoader().getResource("")
				+ File.separator+"NodesManager.xml");
		Element nodesinfo = document.getRootElement().element("NodesInfo");
		for (Iterator<?> it = nodesinfo.elementIterator(); it.hasNext();) {

			Element element = (Element) it.next();
			SciNode node = new SciNode(Integer.parseInt(element.attribute("ID")
					.getValue()), element.attribute("NodeName").getValue(),
					element.attribute("IPAddress").getValue(),element.attribute("HostIP").getValue(), Integer
							.parseInt(element.attribute("CpuCoreNum")
									.getValue()), Float.parseFloat(element
							.attribute("MainFrequence").getValue()));
			nodesMap.put(node.getID(), node);
		}
		return nodesMap;
	}

	/**
	 * 返回配置文件中的服务器信息
	 * 
	 * @return String：服务器IP地址
	 * @throws DocumentException
	 */
	public static String getHostIP() throws DocumentException {
		SAXReader reader = new SAXReader();
		Document document = reader.read(Thread.currentThread()
				.getContextClassLoader().getResource("")
				+ File.separator+"NodesManager.xml");
		String HostIP = document.getRootElement().element("HostIP")
				.attributeValue("IPAddress");
		return HostIP;
	}

	public static int getNodesNum() {
		return nodesMap.size();
	}
}
