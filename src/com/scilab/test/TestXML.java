package com.scilab.test;

import java.io.File;
import java.util.Map;

import org.dom4j.DocumentException;

import com.scilab.manager.NodesManager;
import com.scilab.manager.SciNode;

public class TestXML {
	public static void main(String[] args) throws DocumentException {
		Map<Integer,SciNode> nodesMap=NodesManager.getAllNodes();
		System.out.println(nodesMap.get(1).getMainFrequence());
		System.out.println(nodesMap.get(0).getIPAddress());
		System.out.println(NodesManager.getHostIP());
		if(NodesManager.getHostIP()=="")
			System.out.println("hahaha");
		System.out.println(new File(Thread.currentThread().getContextClassLoader().getResource("").getFile()).getParent()+File.separator+"NodesManager.xml");
		
	}
}
