package com.scilab.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_task")
public class TaskInfo {
	private Long taskId;
	private Long userId;
	private String taskName;
	private String taskContent;
	private String resultFolder;
	private Date saveTime;
	/**
	 * 0δ��ɣ�1���
	 */
	private String taskStatue;
	private int NodeID;

	@Id
	@Column(name = "taskId", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	@Column(nullable = false)
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Column(length = 100, nullable = false)
	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	@Lob
	@Column(nullable = false, columnDefinition = "blob")
	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	@Column(length = 10, nullable = false)
	public String getTaskStatue() {
		return taskStatue;
	}

	public void setTaskStatue(String taskStatue) {
		this.taskStatue = taskStatue;
	}

	@Column(length = 500, nullable = false)
	public String getResultFolder() {
		return resultFolder;
	}

	public void setResultFolder(String resultFolder) {
		this.resultFolder = resultFolder;
	}

	@Column(nullable = false)
	public Date getSaveTime() {
		return saveTime;
	}

	public void setSaveTime(Date saveTime) {
		this.saveTime = saveTime;
	}
	@Column(nullable=false)
	public int getNodeID() {
		return NodeID;
	}

	public void setNodeID(int nodeID) {
		NodeID = nodeID;
	}


}
